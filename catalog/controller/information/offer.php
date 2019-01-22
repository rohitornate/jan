<?php
class Controllerinformationoffer extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/testimonial');
		$this->load->model('catalog/review');

		$this->document->setTitle('Special Offer');



		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => 'Home',
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Testimonial',
			'href' => $this->url->link('information/testimonial')
		);

		
		
		$this->load->model('tool/image');
		 /*$testimonials = $this->model_catalog_review->getHomePageTestimonials();
                foreach($testimonials as $testimonial){
                    $data['testimonials'][] = array(
                        'author'    =>     $testimonial['author'],
                        'city'    =>     $testimonial['city'],
                        'text'    =>     $testimonial['text'],
                    //    'image'    =>     $this->model_tool_image->resize($testimonial['image'], 331, 205),
						 'image'    =>     $testimonial['image'],
                        'date_added'    =>     $testimonial['date_added'],
                    );
                }*/

	
		$data['locations'] = array();

		$this->load->model('localisation/location');

	

		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/offer', $data));
	}


	
}
