<?php

class ControllerextensionmodulemiddlebannerBottom extends Controller {

    private $error = array();
public function install()
{
$query = $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "middlebannerbottom (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `img` varchar(1000) NOT NULL,
  `link` longtext NOT NULL,
  `activate` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category_id` varchar(25) NOT NULL,
  `alt` varchar(100) NOT NULL,
  `sort` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1
");
}
    public function index() {
    
        $this->load->model('tool/image'); 
        $this->language->load('module/middlebannerBottom');

        $this->document->setTitle("Testimonial Managment");

        $this->load->model('setting/setting');
        $this->load->model('catalog/product');

        $data['heading_title'] = "Testimonial";

        $this->load->model('design/layout');
		$data['token'] = $this->session->data['token'];
        $data['layouts'] = $this->model_design_layout->getLayouts();

        $data['entry_layout'] = $this->language->get('entry_layout');
        $data['entry_position'] = $this->language->get('entry_position');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_content_top'] = $this->language->get('text_content_top');
        $data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $data['text_column_left'] = $this->language->get('text_column_left');
        $data['text_column_right'] = $this->language->get('text_column_right');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['button_remove'] = "Remove";
        $data['button_save'] = $this->language->get('button_save');
      //  $sql = $this->db->query("select name,category_id from oc_category_description");
       
        
        
        if (isset($this->error['warning'])) {
        	$data['error_warning'] = $this->error['warning'];
        } else {
        	$data['error_warning'] = '';
        }
        
        
        $category=$this->model_catalog_product->getAllCategoryForTesimonial();
      // print_r($category);exit;
        
        $data['sql']= $category;
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/middlebannerBottom', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('extension/module/middlebannerBottom', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $data['modules'] = array();
        //create table

     
  if (isset($this->request->post['middlebannerBottom_module'])) {
		
            $query = $this->db->query("delete FROM " . DB_PREFIX . "setting WHERE `code` = 'middlebannerBottom'");    
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `code` = 'middlebannerBottom'");
            $check = $query->rows;
            if (count($check) > 0) {
                $query = $this->db->query("update " . DB_PREFIX . "setting set `value`='" . serialize($this->request->post['middlebannerBottom_module']) . "' where `code` = 'middlebannerBottom'");
            } else {
                $query = $this->db->query("insert into " . DB_PREFIX . "setting values ('','0','middlebannerBottom','middlebannerBottom_module','" . serialize($this->request->post['middlebannerBottom_module']) . "','1')");
            }
            if ($query) {
                header("location: " . htmlspecialchars_decode($data['action'] . "&msg=update"));
            } else {
                header("Location: " . htmlspecialchars_decode($data['action'] . "&msg=updateerror"));
            }
        }

        if (isset($_POST['submit']) && isset($_POST['editUid'])) {
       // print_r('if');exit;
            $condition = array();
            if ($_FILES['middlebannerBottomImg']['name']) {
                $random_digit = time();
                $file_name = $_FILES['middlebannerBottomImg']['name'];
                $new_file_name = $random_digit . $file_name;
                move_uploaded_file($_FILES["middlebannerBottomImg"]["tmp_name"], "../image/catalog/testimonials/" . $new_file_name);
                $fileLocation = "catalog/testimonials/" . $new_file_name;

                $condition[] .="img='" . $fileLocation . "'";
            }
            $condition[] .="activate='" . addslashes($_POST['middlebannerBottomenable']) . "'";
            $condition[] .="link='" . addslashes($_POST['middlebannerBottomLink']) . "'";
            $condition[] .="title='" . addslashes($_POST['title']) . "'";
            $condition[] .="alt='" . addslashes($_POST['alt']) . "'";
            $condition[] .="category_id='" . addslashes($_POST['category_id']) . "'";
            $condition[] .="author='" . addslashes($_POST['author']) . "'"; 
            $condition[] .="sort='" . addslashes($_POST['sort']) . "'"; 
            $condition[] .="product_id='" . addslashes($_POST['product_id'][0]) . "'";
			
            $query = $this->db->query("update " . DB_PREFIX . "middlebannerbottom set " . implode(",", $condition) . " where uid='" . $_POST['editUid'] . "'");
            if ($query) {
                header("location: " . htmlspecialchars_decode($data['action'] . "&msg=successupdate1"));
            } else {
                header("Location: " . htmlspecialchars_decode($data['action'] . "&msg=errorupdate1"));
            }
        } elseif (isset($_POST['submit'])) {
     //   	print_r('else');exit;
            $random_digit = time();
            $file_name = $_FILES['middlebannerBottomImg']['name'];
            $new_file_name = $random_digit . $file_name;
            move_uploaded_file($_FILES["middlebannerBottomImg"]["tmp_name"], "../image/catalog/testimonials/" . $new_file_name);
            $fileLocation = "catalog/testimonials/" . $new_file_name;
            //~ echo "insert into " . DB_PREFIX . "middlebannerbottom (img,link,title,activate,author,category_id) values ('" . $fileLocation . "','" . addslashes($_POST['middlebannerBottomLink']) . "','" . addslashes($_POST['title']) . "','" . addslashes($_POST['middlebannerBottomenable']) . "','" . addslashes($_POST['author']) . "','" . addslashes($_POST['category_id']) . "')";
            //~ die();
            
            $query = $this->db->query("insert into " . DB_PREFIX . "middlebannerbottom (alt,img,link,title,activate,author,category_id,sort,product_id) values ('" . addslashes($_POST['alt']) . "','" . $fileLocation . "','" . addslashes($_POST['middlebannerBottomLink']) . "','" . addslashes($_POST['title']) . "','" . addslashes($_POST['middlebannerBottomenable']) . "','" . addslashes($_POST['author']) . "','" . addslashes($_POST['category_id']) . "','" . addslashes($_POST['sort']) . "','".$_POST['product_id'][0]."')");
            if ($query) {
                header("location: " . htmlspecialchars_decode($data['action'] . "&msg=success"));
            } else {
                header("Location: " . htmlspecialchars_decode($data['action'] . "&msg=error"));
            }
        }

        if (isset($_POST['delete'])) {
            if (isset($_POST['uid'])) {
                for ($i = 0; $i < count($_POST['uid']); $i++) {
                    $query = $this->db->query("delete from " . DB_PREFIX . "middlebannerbottom where uid='" . $_POST['uid'][$i] . "'");
                }
                if ($query) {
                    header("location: " . htmlspecialchars_decode($data['action'] . "&msg=delete"));
                } else {
                    header("Location: " . htmlspecialchars_decode($data['action'] . "&msg=deleteError"));
                }

            }
        } elseif (isset($_GET['edit'])) {
            $this->load->model('catalog/product');
            $query = $this->db->query("select * from " . DB_PREFIX . "middlebannerbottom where uid='" . $_GET['edit'] . "'");
	$product_info = $this->model_catalog_product->getProduct($query->row['product_id']);
                        $test = $this->db->query("select * from oc_product where status='1' and product_id='".$query->row['product_id']."'");
                      //  print_r($product_info);exit;
			if ($product_info) {
                            if($test->num_rows>0){
				$data['offer_product'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
                            }
                      
			}
            if (count($query->rows) > 0) {
				$data['EditmiddlebannerBottom'] = array();
                foreach ($query->rows as $qu) {
                    $data['EditmiddlebannerBottom'][] = array(
                        'uid' => stripslashes($qu['uid']),
                        'img' =>   $tt = $this->model_tool_image->resize($qu['img'],100,100),
                        'link' => stripslashes($qu['link']),
                        'title' => stripslashes($qu['title']),
                        'alt' => stripslashes($qu['alt']),
                        'author' => stripslashes($qu['author']),
                        'category_id' => stripslashes($qu['category_id']),
                        'sort' => stripslashes($qu['sort']),
                        'activate' => $qu['activate']
                    );
                }
            }
            
        }
         if(empty($data['EditmiddlebannerBottom'])){
			$data['EditmiddlebannerBottom'] = '';
			}
        if ($this->config->get('middlebannerBottom_module')) {
            $data['modules'] = $this->config->get('middlebannerBottom_module');
        }

        if (isset($_GET['msg'])) {
            if ($_GET['msg'] == 'success') {
                $data['msgs'] = '<div class="success">Testimonial Inserted.</div>';
            } elseif ($_GET['msg'] == 'error') {
                $data['msgs'] = '<div class="warning">Error while inserting.</div>';
            } elseif ($_GET['msg'] == 'delete') {
                $data['msgs'] = '<div class="success">Testimonial Deleted.</div>';
            } elseif ($_GET['msg'] == 'deleteError') {
                $data['msgs'] = '<div class="warning">Error while deleting.</div>';
            } elseif ($_GET['msg'] == 'update') {
                $data['msgs'] = '<div class="success">Module updated.</div>';
            } elseif ($_GET['msg'] == 'updateerror') {
                $data['msgs'] = '<div class="warning">Error while updating.</div>';
            } elseif ($_GET['msg'] == 'successCreate') {
                $data['msgs'] = '<div class="success">Module Installed Successfully.</div>';
            } elseif ($_GET['msg'] == 'errorCreate') {
                $data['msgs'] = '<div class="warning">Error while Installation.</div>';
            } elseif ($_GET['msg'] == 'successupdate1') {
                $data['msgs'] = '<div class="success">Testimonial Successfully update.</div>';
            } elseif ($_GET['msg'] == 'errorupdate1') {
                $data['msgs'] = '<div class="warning">Error while updating.</div>';
            }
        }
        $check = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `code` = 'middlebannerBottom'");
        if (count($check->rows) > 0) {
            $data['middlebannerBottomModule'] = $check->row;
            $data['middlebannerBottomModule'] = unserialize($data['middlebannerBottomModule']['value']);
            $data['module'] = $data['middlebannerBottomModule'];
        }
        $data['middlebannerBottomNew'] = array();
        $query = $this->db->query("select * from " . DB_PREFIX . "middlebannerbottom order by uid desc");
        $testimonials = array();
        if ($query->num_rows > 0) {

            foreach ($query->rows as $row) {
                if ($row['activate'] == '1') {
                    $activeornot = 'Enable';
                } else {
                    $activeornot = 'Disbale';
                }
                $tt = $this->model_tool_image->resize($row['img'],200,200);
                $data['middlebannerBottomNew'][] = array(
                    'uid' => stripslashes($row['uid']),
                    'img' => $tt,
                    'link' => stripslashes($row['link']),
                    'title' => stripslashes($row['title']),
                    'alt' => stripslashes($row['alt']),
                    'category_id' => stripslashes($row['category_id']),
                    'author' => stripslashes($row['author']),  
                    'sort' => stripslashes($row['sort']),  
                    'activate' => $activeornot
                );
            }
        }
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('module/middlebannerBottom', $data));
        
//echo '<pre>'; print_r($data['middlebannerBottomNew']); die();
       // $this->template = 'module/middlebannerBottom.tpl';
      //  $this->children = array(
      //      'common/header',
      //      'common/footer'
      //  );

      //  $this->response->setOutput($this->render());
    }

}

?>
