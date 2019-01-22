<?php
class ControllerTestimonialTestimonial extends Controller {
	private $error = array();
	private $moduleName 			= 'testimonial';
	private $moduleModel 			= 'model_catalog_testimonial';
	private $moduleModelPath 		= 'catalog/testimonial';
	private $modulePath 			= 'testimonial/testimonial';
	private $moduleVersion 			= '1.0';

	public function index() {
		$this->load->model($this->moduleModelPath);

		$this->getList();
	}

	public function add() {

		$this->load->model($this->moduleModelPath);

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->{$this->moduleModel}->addTestimonial($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_city'])) {
				$url .= '&filter_city=' . $this->request->get['filter_city'];
			}

			if (isset($this->request->get['filter_author'])) {
				$url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {

		$this->load->model($this->moduleModelPath);

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->{$this->moduleModel}->editTestimonial($this->request->get['testimonial_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_city'])) {
				$url .= '&filter_city=' . $this->request->get['filter_city'];
			}

			if (isset($this->request->get['filter_author'])) {
				$url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {

		$this->load->model($this->moduleModelPath);

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $testimonial_id) {
				$this->{$this->moduleModel}->deleteReview($testimonial_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_city'])) {
				$url .= '&filter_city=' . $this->request->get['filter_city'];
			}

			if (isset($this->request->get['filter_author'])) {
				$url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {

		$lang_ar = $this->load->language($this->modulePath);
		$this->load->model('tool/image');
		foreach($lang_ar as $key => $item){
			$data[$key] = $item;
		}

		$this->document->setTitle($this->language->get('heading_title'));

		

		if (isset($this->request->get['filter_author'])) {
			$filter_author = $this->request->get['filter_author'];
		} else {
			$filter_author = null;
		}
		if (isset($this->request->get['filter_city'])) {
			$filter_city = $this->request->get['filter_city'];
		} else {
			$filter_city = null;
		}
		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'date_added';
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_city'])) {
			$url .= '&filter_city=' . $this->request->get['filter_city'];
		}

		if (isset($this->request->get['filter_author'])) {
			$url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title') . ' v' . $this->moduleVersion,
			'href' => $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link($this->modulePath . '/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link($this->modulePath . '/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['action'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'], 'SSL');

		$data['reviews'] = array();

		$filter_data = array(
			'filter_city'     => $filter_city,
			'filter_author'     => $filter_author,
			'filter_status'     => $filter_status,
			'filter_date_added' => $filter_date_added,
			'sort'              => $sort,
			'order'             => $order,
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin')
		);

		$review_total = $this->{$this->moduleModel}->getTotalTestimonials($filter_data);

		$results = $this->{$this->moduleModel}->getTestimonials($filter_data);
//print_r($results);exit;
		foreach ($results as $result) {  //print_r($$result);
			
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 100, 100);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			$data['reviews'][] = array(
				'testimonial_id'  => $result['testimonial_id'],
				'author'     => $result['author'],
				'image'     => $image,
				'city'     => $result['city'],
				'text'     => $result['text'],
				'sort_order'     => $result['sort_order'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'       => $this->url->link($this->modulePath . '/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $result['testimonial_id'] . $url, 'SSL')
			);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_author'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . '&sort=author' . $url, 'SSL');
		$data['sort_city'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . '&sort=city' . $url, 'SSL');
		$data['sort_status'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_city'])) {
			$url .= '&filter_city=' . $this->request->get['filter_city'];
		}

		if (isset($this->request->get['filter_author'])) {
			$url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($review_total - $this->config->get('config_limit_admin'))) ? $review_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $review_total, ceil($review_total / $this->config->get('config_limit_admin')));

		$data['filter_city'] = $filter_city;
		$data['filter_author'] = $filter_author;
		$data['filter_status'] = $filter_status;
		$data['filter_date_added'] = $filter_date_added;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->modulePath . '_list', $data));
	}

	protected function getForm() {

		$lang_ar = $this->load->language($this->modulePath);

		foreach($lang_ar as $key => $item){
			$data[$key] = $item;
		}
		
		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['testimonial_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['author'])) {
			$data['error_author'] = $this->error['author'];
		} else {
			$data['error_author'] = '';
		}

		if (isset($this->error['text'])) {
			$data['error_text'] = $this->error['text'];
		} else {
			$data['error_text'] = '';
		}
		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}
		

		$url = '';

		if (isset($this->request->get['filter_city'])) {
			$url .= '&filter_city=' . $this->request->get['filter_city'];
		}

		if (isset($this->request->get['filter_author'])) {
			$url .= '&filter_author=' . urlencode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title') . ' v' . $this->moduleVersion,
			'href' => $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['testimonial_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_add'),
				'href' => $this->url->link($this->modulePath . '/add', 'token=' . $this->session->data['token'] . $url, 'SSL')
			);
			$data['action'] = $this->url->link($this->modulePath . '/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link($this->modulePath . '/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $this->request->get['testimonial_id'] . $url, 'SSL')
			);
			$data['action'] = $this->url->link($this->modulePath . '/edit', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $this->request->get['testimonial_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['testimonial_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$review_info = $this->{$this->moduleModel}->getReview($this->request->get['testimonial_id']);
		}

		$data['token'] = $this->session->data['token'];
		$data['entry_image'] = $this->language->get('entry_image');

		if (isset($this->request->post['author'])) {
			$data['author'] = $this->request->post['author'];
		} elseif (!empty($review_info)) {
			$data['author'] = $review_info['author'];
		} else {
			$data['author'] = '';
		}
		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (!empty($review_info)) {
			$data['city'] = $review_info['city'];
		} else {
			$data['city'] = '';
		}
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($review_info)) {
			$data['image'] = $review_info['image'];
		} else {
			$data['image'] = '';
		}
		
		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($review_info)) {
			$data['sort_order'] = $review_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}
		
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($review_info) && $review_info['image'] && is_file(DIR_IMAGE . $review_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($review_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		} elseif (!empty($review_info)) {
			$data['date_added'] = ($review_info['date_added'] != '0000-00-00') ? $review_info['date_added'] : '';
		} else {
			$data['date_added'] = date('Y-m-d');
		}

		if (isset($this->request->post['text'])) {
			$data['text'] = $this->request->post['text'];
		} elseif (!empty($review_info)) {
			$data['text'] = $review_info['text'];
		} else {
			$data['text'] = '';
		}

		

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($review_info)) {
			$data['status'] = $review_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->modulePath . '_form', $data));
	}

	protected function validateForm() {
		$this->load->language($this->modulePath);

		if (!$this->user->hasPermission('modify', $this->modulePath)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		}

		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		$this->load->language($this->modulePath);
		
		if (!$this->user->hasPermission('modify', $this->modulePath)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}