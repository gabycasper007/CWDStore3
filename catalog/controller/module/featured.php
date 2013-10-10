<?php
class ControllerModuleFeatured extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->language->load('module/featured'); 
      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_sale'] = $this->language->get('text_sale');

		$this->data['text_stock'] = $this->language->get('text_stock');			
		
		$this->data['button_cart'] = $this->language->get('button_cart');

		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			
		$this->data['button_compare'] = $this->language->get('button_compare');	
		$this->data['tipmodul'] = 'featured';
        
        $this->data['position'] = $setting['position'];
		$this->data['layout_id'] = $setting['layout_id'];
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		$this->data['products'] = array();
		$products = explode(',', $this->config->get('featured_product'));		
		if (empty($setting['limit'])) {
			$setting['limit'] = 15;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					$discount = '-' . (int) (($product_info['price'] - $product_info['special']) * 100 / $product_info['price']) . '%';
				} else {
					$special = $discount = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				if ($product_info['home_sort_order']) {
					$home_sort_order = $product_info['home_sort_order'];
				} else {
					$home_sort_order = false;
				}

				if ($product_info['quantity'] <= 0) {
					$stock = $product_info['stock_status'];
					$icon_stock = 1; 
				}
				elseif ($product_info['quantity'] <= 5 ) {
					$stock = $this->language->get('text_stock_limitat');
					$icon_stock = 2; 
				}
				elseif ($this->config->get('config_stock_display')) {
					$stock = $product_info['quantity'];
					$icon_stock = 3; 
				}
				else  {
					$stock = $this->language->get('text_instock');	
					$icon_stock = 3; 
				}


					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => utf8_substr($product_info['name'], 0, 35) . '..',
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 85) . '..',
					'shortdesc' => utf8_substr(strip_tags(html_entity_decode($product_info['shortdesc'], ENT_QUOTES, 'UTF-8')), 0, 60) . '..',
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'home_sort_order'     => $home_sort_order,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'icon'        => $icon_stock,
					'stock'		  => $stock,
					'discount'	 => $discount
				);
			}
		}
		
		$this->data['module'] = $module++; 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->children = array(
			'common/content_home_square',
			'common/content_home_square_two',
			'common/content_home_longtail',
		);

		$this->render();
	}
}
?>