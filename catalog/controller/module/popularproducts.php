<?php
class ControllerModulePopularproducts extends Controller {
	protected function index($setting) {
		static $module = 0;		
		
		$this->language->load('module/popularproducts');
 
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_sale'] = $this->language->get('text_sale');			
				
		$this->data['button_cart'] = $this->language->get('button_cart');

		$this->data['text_stock'] = $this->language->get('text_stock');

		$this->data['button_wishlist'] = $this->language->get('button_wishlist');

	 	$this->data['button_compare'] = $this->language->get('button_compare');	

		$this->data['tipmodul'] = 'popularproducts';
		
        $this->data['position'] = $setting['position'];
		$this->data['layout_id'] = $setting['layout_id'];
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		$this->data['products'] = array();
		$results = $this->model_catalog_product->getPopularProducts($setting['limit']);
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				$discount = '-' . (int) (($result['price'] - $result['special']) * 100 / $result['price']) . '%';
			} else {
				$special = $discount = false;
			}	
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
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
				'name'    	 => utf8_substr($result['name'], 0, 43) . '..',
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 110) . '..',				
				'shortdesc' => utf8_substr(strip_tags(html_entity_decode($result['shortdesc'], ENT_QUOTES, 'UTF-8')), 0, 68) . '..',				
				'price'   	 => $price,
				'icon'        => $icon_stock,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				'stock'		  => $stock,
				'discount'	 => $discount
			);
		}
		
		$this->data['module'] = $module++; 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/popularproducts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/popularproducts.tpl';
		} else {
			$this->template = 'default/template/module/popularproducts.tpl';
		}
		$this->render();
	}
}
?>