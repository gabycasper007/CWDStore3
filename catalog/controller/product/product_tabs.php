<?php  
class ControllerProductProductTabs extends Controller {
	
	public function index() { 
		$this->language->load('product/product');

		

		$this->load->model('catalog/information');		
		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$this->data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
    	}

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

    	$information_info = $this->model_catalog_information->getInformation(11);
    	$this->data['deliverydescription'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

		
		$this->load->model('setting/setting');

		
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;

		if (isset($product_info['u_h1']) && !empty($product_info['u_h1'] ) ) { //uuu
			$this->data['heading_title'] = trim($product_info['u_h1']);
		}
		else {
			$this->data['heading_title'] = $product_info['name'];
		}
		
		$this->load->model('catalog/review');
		$this->data['tab_description'] = $this->language->get('tab_description');
		$this->data['tab_attribute'] = $this->language->get('tab_attribute');
		$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
		$this->data['tab_related'] = $this->language->get('tab_related');
		
		$this->data['product_id'] = $this->request->get['product_id'];
		$this->data['review_status'] = $this->config->get('config_review_status');
		$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);

		$this->data['text_write'] = $this->language->get('text_write');
		$this->data['text_note'] = $this->language->get('text_note');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_review'] = $this->language->get('entry_review');
		$this->data['entry_rating'] = $this->language->get('entry_rating');
		$this->data['entry_good'] = $this->language->get('entry_good');
		$this->data['entry_bad'] = $this->language->get('entry_bad');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');

		$this->data['button_continue'] = $this->language->get('button_continue');
	
		$this->data['rating'] = (int)$product_info['rating'];			
		$this->data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
		$this->data['shortdesc'] = utf8_substr(html_entity_decode($product_info['shortdesc'], ENT_QUOTES, 'UTF-8'), 0, 250);
		$this->data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
		
		$this->data['products'] = array();

		for( $i=1; $i< 6; $i++) {
			$this->data['product_tabs_' . $i] = array();
		}

		$product_tabs = $this->model_catalog_product->getProductTabs($this->request->get['product_id']);

		foreach ($product_tabs as $product_tab) {

			$this->data['product_tabs_' . $product_tab['position']][] = array(
				'tab_id' 	=> $product_tab['tab_id'],
				'name'    => $product_tab['name'],
				'text'    => html_entity_decode($product_tab['text'], ENT_QUOTES, 'UTF-8')
			);

		}


    	$this->data['text_weight'] = $this->language->get('text_weight');
		
		$this->load->model('catalog/review');
		
        $this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_no_reviews'] = $this->language->get('text_no_reviews');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$this->data['reviews'] = array();
		
		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);
			
		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);
      		
		foreach ($results as $result) {
        	$this->data['reviews'][] = array(
        		'author'     => $result['author'],
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
        		'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
        		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
        	);
      	}			
			
		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();

		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_tabs.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/product_tabs.tpl';
		} else {
			$this->template = 'default/template/product/product_tabs.tpl';
		}
					
		$this->response->setOutput($this->render());
  	}

	public function review() {
    	$this->language->load('product/product');

    	$this->data['text_weight'] = $this->language->get('text_weight');
		
		$this->load->model('catalog/review');
		
        $this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_no_reviews'] = $this->language->get('text_no_reviews');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}  
		
		$this->data['reviews'] = array();
		
		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);
			
		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);
      		
		foreach ($results as $result) {
        	$this->data['reviews'][] = array(
        		'author'     => $result['author'],
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
        		'reviews'    => sprintf($this->language->get('text_reviews'), (int)$review_total),
        		'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
        	);
      	}			
			
		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/review.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/review.tpl';
		} else {
			$this->template = 'default/template/product/review.tpl';
		}
		
		$this->response->setOutput($this->render());
	}
	
	public function write() {
		$this->language->load('product/product');

		$this->data['text_weight'] = $this->language->get('text_weight');
		
		$this->load->model('catalog/review');
		
		$json = array();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}
			
			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}
	
			if (empty($this->request->post['rating'])) {
				$json['error'] = $this->language->get('error_rating');
			}
	
			if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
				$json['error'] = $this->language->get('error_captcha');
			}
				
			if (!isset($json['error'])) {
				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);
				
				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
}
?>