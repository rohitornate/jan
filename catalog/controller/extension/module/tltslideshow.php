<?php
class ControllerExtensionModuleTltSlideshow extends Controller {
	public function index($setting) {
		static $slideshow = 0;

		if ($setting['show_title'] && isset($setting['module_description'][$this->config->get('config_language_id')]['title'])) {
			$data['title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
		} else {
			$data['title'] = '';
		}
		
		$this->load->model('tltslideshow/tltslideshow');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$theme = $this->config->get('config_theme');

		if (file_exists(DIR_TEMPLATE . $this->config->get($theme . '_directory') . '/stylesheet/tltslideshow.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get($theme . '_directory') . '/stylesheet/tltslideshow.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/tltslideshow.css');
		}

		$data['slides'] = array();

		$results = $this->model_tltslideshow_tltslideshow->getSlides($setting['slideshow_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['slides'][] = array(
					'title' 		=> $result['title'],
					'link'  		=> $result['link'],
					'textbox'		=> isset($result['textbox']) ? $result['textbox'] : '0',
					'use_html'  	=> isset($result['use_html']) ? $result['use_html'] : '1',
					'header'  		=> isset($result['header']) ? $result['header'] : '',
					'description' 	=> isset($result['description']) ? html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8') : '',
					'css'			=> $result['css'] ? $result['css'] : 'tltslide-text',
					'override'  	=> isset($result['override']) ? $result['override'] : '0',
					'background' 	=> isset($result['background']) ? $result['background'] : '#000000',
					'opacity'		=> isset($result['opacity']) ? $result['opacity'] : '0.6',
					'html'			=> html_entity_decode($result['html'], ENT_QUOTES, 'UTF-8'),
					'image' 		=> $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			} else {
				$data['slides'][] = array(
					'title' 		=> $result['title'],
					'link'  		=> $result['link'],
					'textbox'		=> isset($result['textbox']) ? $result['textbox'] : '0',
					'use_html'  	=> isset($result['use_html']) ? $result['use_html'] : '1',
					'header'  		=> isset($result['header']) ? $result['header'] : '',
					'description' 	=> isset($result['description']) ? html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8') : '',
					'css'			=> $result['css'] ? $result['css'] : 'tltslide-text',
					'override'  	=> isset($result['override']) ? $result['override'] : '0',
					'background' 	=> isset($result['background']) ? $result['background'] : '#000000',
					'opacity'		=> isset($result['opacity']) ? $result['opacity'] : '0.6',
					'html'			=> html_entity_decode($result['html'], ENT_QUOTES, 'UTF-8'),
					'image' 		=> ''
				);
			}
		}
		
		$data['show_title'] = $setting['show_title'];
		$data['width'] = $setting['width'];
		$data['height'] = $setting['height'];
		
		$options = 'items: 1, singleItem: true, ';

		if ($setting['pagination']) {
			$options .= 'pagination: true, ';
		} else {
			$options .= 'pagination: false, ';
		}

		if ($setting['auto']) {
			$options .= 'autoPlay: ' . (int)$setting['pause'] . ', ';
		} else {
			$options .= 'autoPlay: false, ';
		}
		
		if ($setting['controls']) {
			$options .= 'controls: true, navigation: true, navigationText: [\'<i class="fa fa-chevron-left fa-5x"></i>\', \'<i class="fa fa-chevron-right fa-5x"></i>\'], ';
		} else {
			$options .= 'controls: false, navigation: false, ';
		}
		
		if ($setting['auto_hover']) {
			$options .= 'stopOnHover: true';
		} else {
			$options .= 'stopOnHover: false';
		}

		if (isset($setting['additional'])) {
			if ($setting['additional']) {
				$options .= ', ' . $setting['additional'];
			}
		}
		
		$data['options'] = $options;

		$data['slideshow'] = $slideshow++;
		
		return $this->load->view('extension/module/tltslideshow', $data);
	}
}
