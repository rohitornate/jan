<?php
class ControllerToolRees46 extends Controller {
	private $limit = 1000;
	private $site_url = '';

	public function index() {
		if ($this->config->get('rees46_tracking_status')) {
			if (isset($this->request->get['step'])) {
				if ($this->request->get['step'] == 1) {
					$this->generateCurrencies();

					$this->response->redirect($this->url->link('tool/rees46', 'step=2', 'SSL'));
				} elseif ($this->request->get['step'] == 2) {
					$this->generateCategories();

					$this->recorder('    <offers>' . "\n", 'a');

					$this->response->redirect($this->url->link('tool/rees46', 'start=0', 'SSL'));
				}
			} elseif (isset($this->request->get['start'])) {
				if ($this->request->get['start'] != 'finish') {
					$start = $this->generateOffers($this->request->get['start']);

					$this->response->redirect($this->url->link('tool/rees46', 'start=' . $start, 'SSL'));
				} elseif ($this->request->get['start'] == 'finish') {
					$xml  = '    </offers>' . "\n";
					$xml .= '  </shop>' . "\n";
					$xml .= '</yml_catalog>';

					$this->recorder($xml, 'a');

					$this->response->redirect($this->url->link('tool/rees46/file', '', 'SSL'));
				}
			} else {
				if (is_file(DIR_DOWNLOAD . 'rees46_cron.xml')) {
					$this->response->redirect($this->url->link('tool/rees46/cron', '', 'SSL'));
				} else {
					$this->recorder('', 'w+');

					$this->generateShop();

					$this->response->redirect($this->url->link('tool/rees46', 'step=1', 'SSL'));
				}
			}
		} else {
			$this->load->language('error/not_found');

			$this->document->setTitle($this->language->get('heading_title'));

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);

			if (isset($this->request->get['route'])) {
				$url_data = $this->request->get;

				unset($url_data['_route_']);

				$route = $url_data['route'];

				unset($url_data['route']);

				$url = '';

				if ($url_data) {
					$url = '&' . urldecode(http_build_query($url_data, '', '&'));
				}

				$data['breadcrumbs'][] = array(
					'text' => $this->language->get('heading_title'),
					'href' => $this->url->link($route, $url, $this->request->server['HTTPS'])
				);
			}

			$data['heading_title'] = $this->language->get('heading_title');
			$data['text_error'] = $this->language->get('text_error');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function file() {
		if (ob_get_length()) {
			ob_clean();
		}

		$this->response->addHeader('Content-Type: application/xml; charset=UTF-8');
		$this->response->setOutput(file_get_contents(DIR_DOWNLOAD . 'rees46.xml'));
	}

	public function cron() {
		if (ob_get_length()) {
			ob_clean();
		}

		$this->response->addHeader('Content-Type: application/xml; charset=UTF-8');
		$this->response->setOutput(file_get_contents(DIR_DOWNLOAD . 'rees46_cron.xml'));
	}

	protected function generateShop() {
		if ($this->request->server['HTTPS']) {
			$this->site_url = HTTPS_SERVER;
		} else {
			$this->site_url = HTTP_SERVER;
		}

		$xml  = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
		$xml .= '<!DOCTYPE yml_catalog SYSTEM "shops.dtd">' . "\n";
		$xml .= '<yml_catalog date="' . date('Y-m-d H:i') . '">' . "\n";
		$xml .= '  <shop>' . "\n";
		$xml .= '    <name>' . $this->config->get('config_name') . '</name>' . "\n";
		$xml .= '    <company>' . $this->config->get('config_owner') . '</company>' . "\n";
		$xml .= '    <url>' . $this->site_url . '</url>' . "\n";
		$xml .= '    <platform>OpenCart</platform>' . "\n";
		$xml .= '    <version>' . VERSION . '</version>' . "\n";

		$this->recorder($xml, 'a');
	}

	protected function generateCurrencies() {
		$this->load->model('localisation/currency');

		$xml  = '    <currencies>';
		$xml .= "\n" . '      <currency id="' . $this->config->get('config_currency') . '" rate="1"/>';

		foreach ($this->model_localisation_currency->getCurrencies() as $currency) {
			if ($currency['code'] != $this->config->get('config_currency') && $currency['status'] == 1) {
				$xml .= "\n" . '      <currency id="' . $currency['code'] . '" rate="' . number_format(1 / $currency['value'], 4, '.', '') . '"/>';
			}
		}

		$xml .= "\n" . '    </currencies>' . "\n";

		$this->recorder($xml, 'a');
	}

	protected function generateCategories() {
		$this->load->model('extension/module/rees46');

		$categories = $this->model_extension_module_rees46->getAllCategories();

		if (!empty($categories)) {
			$xml = '    <categories>';

			foreach ($categories as $category) {
				if ($category['parent_id']) {
					$parent = ' parentId="' . $category['parent_id'] . '"';
				} else {
					$parent = '';
				}

				$xml .= "\n" . '      <category id="' . $category['category_id'] . '"' . $parent . '>' . $this->replacer($category['name']) . '</category>';
			}

			$xml .= "\n" . '    </categories>' . "\n";

			$this->recorder($xml, 'a');
		}
	}

	protected function generateOffers($start) {
		$this->load->model('extension/module/rees46');
		$this->load->model('tool/image');

		$products = $this->model_extension_module_rees46->getProducts($start, $this->limit);

		if (count($products) == $this->limit) {
			$start = $start + $this->limit;
		} else {
			$start = 'finish';
		}

		if (!empty($products)) {
			$xml = '';

			foreach ($products as $product) {
				if (isset($product['product_id']) && $product['quantity'] > 0) {
					if ($product['quantity'] > 10) {
						$leftovers = 'lot';
					} elseif ($product['quantity'] > 1) {
						$leftovers = 'few';
					} else {
						$leftovers = 'one';
					}

					$xml .= '      <offer id="' . $product['product_id'] . '" available="true" leftovers="' . $leftovers . '">' . "\n";
					$xml .= '        <url>' . $this->replacer($this->url->link('product/product', 'product_id=' . $product['product_id'])) . '</url>' . "\n";

					if ($product['special'] && $product['price'] > $product['special']) {
						$xml .= '        <price>' . number_format($this->currency->convert($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('rees46_xml_tax')), $this->config->get('config_currency'), $this->config->get('rees46_xml_currency')), 2, '.', '') . '</price>' . "\n";
						$xml .= '        <oldprice>' . number_format($this->currency->convert($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('rees46_xml_tax')), $this->config->get('config_currency'), $this->config->get('rees46_xml_currency')), 2, '.', '') . '</oldprice>' . "\n";
					} else {
						$xml .= '        <price>' . number_format($this->currency->convert($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('rees46_xml_tax')), $this->config->get('config_currency'), $this->config->get('rees46_xml_currency')), 2, '.', '') . '</price>' . "\n";
					}

					$xml .= '        <currencyId>' . $this->config->get('rees46_xml_currency') . '</currencyId>' . "\n";

					$categories = $this->model_extension_module_rees46->getProductCategories($product['product_id']);

					if (!empty($categories)) {
						foreach ($categories as $category) {
							$xml .= '        <categoryId>' . $category . '</categoryId>' . "\n";
						}
					}

					if ($product['image']) {
						$image = $this->model_tool_image->resize($product['image'], 600, 600);

						if (!preg_match("/https*:\/\/(www\.)*".preg_quote(preg_replace("/https*:\/\/(www\.)*/", "", $this->site_url), "/")."/", $image)) {
    						$image = $this->site_url . $image;
						}

						$xml .= '        <picture>' . $image . '</picture>' . "\n";
					}

					$xml .= '        <name>' . $this->replacer($product['name']) . '</name>' . "\n";

					if ($product['manufacturer']) {
						$xml .= '        <vendor>' . $this->replacer($product['manufacturer']) . '</vendor>' . "\n";
					}

					$xml .= '        <model>' . $this->replacer($product['model']) . '</model>' . "\n";
					$xml .= '        <description><![CDATA[' . strip_tags(htmlspecialchars_decode($product['description']), '<h3>, <ul>, <li>, <p>, <br>') . ']]></description>' . "\n";
					$xml .= '      </offer>' . "\n";
				}
			}

			$this->recorder($xml, 'a');
		}

		return $start;
	}

	protected function replacer($str) {
		return trim(str_replace('&#039;', '&apos;', htmlspecialchars(htmlspecialchars_decode($str, ENT_QUOTES), ENT_QUOTES)));
	}

	protected function recorder($xml, $mode) {
		if (!$fp = fopen(DIR_DOWNLOAD . 'rees46.xml', $mode)) {
			if ($this->config->get('rees46_log')) {
				$this->log->write('REES46 log: Could not open xml file [ERROR]');
			}
		} elseif (fwrite($fp, $xml) === false) {
			if ($this->config->get('rees46_log')) {
				$this->log->write('REES46 log: XML file not writable [ERROR]');
			}
		}

		fclose($fp);
	}
}
