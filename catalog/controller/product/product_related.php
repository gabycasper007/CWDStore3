<?php  
class ControllerProductProductRelated extends Controller {
	public function index() { 
		$this->language->load('product/product');

		$this->load->model('setting/setting');

		
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		$this->data['symbolRight'] = $this->currency->getSymbolRight();
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		if (isset($product_info['u_h1']) && !empty($product_info['u_h1'] ) ) { //uuu
			$this->data['heading_title'] = trim($product_info['u_h1']);
		}
		else {
			$this->data['heading_title'] = $product_info['name'];
		}
		if (isset($product_info['u_h2']) && !empty($product_info['u_h2'] ) ) { //uuu
			$this->data['useo_heading_title2'] = trim($product_info['u_h2']);
		}		

		$this->data['text_sale'] = $this->language->get('text_sale');	
		$this->data['tab_related'] = $this->language->get('tab_related');
		$this->data['product_id'] = $this->request->get['product_id'];
		$this->data['text_stock'] = $this->language->get('text_stock');
		// Getting related products			
		$this->data['products'] = array();
		$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

		$config_related_limit = $this->config->get('config_related_limit');
		if (count($results) < $config_related_limit) {
			$results += $this->model_catalog_product->getAutoProductRelated($this->request->get['product_id'], $config_related_limit - count($results));
		}
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
			} else {
				$image = false;
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
				$option_price_excl_tax_without_symbol = 0;
				$option_price_incl_tax_without_symbol = 0;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				$discount = '-' . (int) (($result['price'] - $result['special']) * 100 / $result['price']) . '%';
			} else {
				$special = $discount = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			if ($result['quantity'] <= 0) {
				$stock = $result['stock_status'];
				$icon_stock = 1; 
			}
			elseif ($result['quantity'] <= 5 ) {
				$stock = $this->language->get('text_stock_limitat');
				$icon_stock = 2; 
			}
			elseif ($this->config->get('config_stock_display')) {
				$stock = $result['quantity'];
				$icon_stock = 3; 
			}
			else  {
				$stock = $this->language->get('text_instock');	
				$icon_stock = 3; 
			}


			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => substr($result['name'], 0, 18),
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 55) . '..',
				'shortdesc' => utf8_substr(strip_tags(html_entity_decode($result['shortdesc'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				'stock'		  => $stock,
				'icon'        => $icon_stock,
				'discount'	 => $discount
			);
		}	
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_related.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/product_related.tpl';
		} else {
			$this->template = 'default/template/product/product_related.tpl';
		}
		
		$this->response->setOutput($this->render());
  	}

}
?>