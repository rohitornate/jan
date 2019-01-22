<?php
abstract class Controller {
	protected $registry;

				
	/** + OSWorX */
	public function setLastViewed() {
		$this->session->data['lastViewed'] = $_SERVER['REQUEST_URI'];
	}

	/** + OSWorX */
	public function getLastViewed() {
		if( !empty( $this->session->data['lastViewed'] ) ) {
			return $this->session->data['lastViewed'];
		}else{
			return $this->url->link('common/home');
		}
	}
        		
			

	public function __construct($registry) {
		$this->registry = $registry;
	}

	public function __get($key) {
		return $this->registry->get($key);
	}

	public function __set($key, $value) {
		$this->registry->set($key, $value);
	}
}