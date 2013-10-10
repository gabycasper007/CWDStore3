<?php  
class ControllerProductProductOptions extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->language->load('product/product');	
		$this->load->model('setting/setting');

		$config_settings = $this->model_setting_setting->getSetting('config');


		if(isset($config_settings['config_live_update'])){$this->data['config_live_update'] = $config_settings['config_live_update'];}else{$this->data['config_live_update'] =0;}

		if(isset($config_settings['config_live_update_output'])){$this->data['config_live_update_output'] = $config_settings['config_live_update_output'];}else{$this->data['config_live_update_output'] =0;}

		if(isset($config_settings['config_live_update_price'])){$this->data['config_live_update_price'] = $config_settings['config_live_update_price'];}else{$this->data['config_live_update_price'] =0;}

		if(isset($config_settings['config_live_update_special_price'])){$this->data['config_live_update_special_price'] = $config_settings['config_live_update_special_price'];}else{$this->data['config_live_update_special_price'] =0;}

		if(isset($config_settings['config_live_update_price_excluding_tax'])){$this->data['config_live_update_price_excluding_tax'] = $config_settings['config_live_update_price_excluding_tax'];}else{$this->data['config_live_update_price_excluding_tax'] =0;}

		if(isset($config_settings['config_live_update_price_in_reward_points'])){$this->data['config_live_update_price_in_reward_points'] = $config_settings['config_live_update_price_in_reward_points'];}else{$this->data['config_live_update_price_in_reward_points'] =0;}

		if(isset($config_settings['config_live_update_weight'])){$this->data['config_live_update_weight'] = $config_settings['config_live_update_weight'];}else{$this->data['config_live_update_weight'] =0;}

		if(isset($config_settings['config_live_update_points'])){$this->data['config_live_update_points'] = $config_settings['config_live_update_points'];}else{$this->data['config_live_update_points'] =0;}

		if(isset($config_settings['config_live_update_price_with_qty'])){$this->data['config_live_update_price_with_qty'] = $config_settings['config_live_update_price_with_qty'];}else{$this->data['config_live_update_price_with_qty'] =0;}

		if(isset($config_settings['config_live_update_special_price_with_qty'])){$this->data['config_live_update_special_price_with_qty'] = $config_settings['config_live_update_special_price_with_qty'];}else{$this->data['config_live_update_special_price_with_qty'] =0;}

		if(isset($config_settings['config_live_update_price_excluding_tax_with_qty'])){$this->data['config_live_update_price_excluding_tax_with_qty'] = $config_settings['config_live_update_price_excluding_tax_with_qty'];}else{$this->data['config_live_update_price_excluding_tax_with_qty'] =0;}

		if(isset($config_settings['config_live_update_price_in_reward_points'])){$this->data['config_live_update_price_in_reward_points'] = $config_settings['config_live_update_price_in_reward_points'];}else{$this->data['config_live_update_price_in_reward_points'] =0;}

		if(isset($config_settings['config_live_update_weight_with_qty'])){$this->data['config_live_update_weight_with_qty'] = $config_settings['config_live_update_weight_with_qty'];}else{$this->data['config_live_update_weight_with_qty'] =0;}

		if(isset($config_settings['config_live_update_discount'])){$this->data['config_live_update_discount'] = $config_settings['config_live_update_discount'];}else{$this->data['config_live_update_discount'] =0;}

		if(isset($config_settings['config_live_show_pricevalue_with_option'])){$this->data['config_live_show_pricevalue_with_option'] = $config_settings['config_live_show_pricevalue_with_option'];}else{$this->data['config_live_show_pricevalue_with_option'] =0;}

		if(isset($config_settings['config_live_hide_prefix_of_option_value'])){$this->data['config_live_hide_prefix_of_option_value'] = $config_settings['config_live_hide_prefix_of_option_value'];}else{$this->data['config_live_hide_prefix_of_option_value'] =0;}

		if(isset($config_settings['config_live_hide_prefix_of_option_weight'])){$this->data['config_live_hide_prefix_of_option_weight'] = $config_settings['config_live_hide_prefix_of_option_weight'];}else{$this->data['config_live_hide_prefix_of_option_weight'] =0;}

		if(isset($config_settings['config_live_hide_prefix_of_option_point'])){$this->data['config_live_hide_prefix_of_option_point'] = $config_settings['config_live_hide_prefix_of_option_point'];}else{$this->data['config_live_hide_prefix_of_option_point'] =0;}

		if(isset($config_settings['config_live_show_weight'])){$this->data['config_live_show_weight'] = $config_settings['config_live_show_weight'];}else{$this->data['config_live_show_weight'] =0;}

		if(isset($config_settings['config_live_show_option_weight'])){$this->data['config_live_show_option_weight'] = $config_settings['config_live_show_option_weight'];}else{$this->data['config_live_show_option_weight'] =0;}

		if(isset($config_settings['config_live_show_option_point'])){$this->data['config_live_show_option_point'] = $config_settings['config_live_show_option_point'];}else{$this->data['config_live_show_option_point'] =0;}

		if(isset($config_settings['config_live_show_weight_decimal_place']) && $config_settings['config_live_show_weight_decimal_place']>0){$this->data['config_live_show_weight_decimal_place'] = $config_settings['config_live_show_weight_decimal_place'];}else{$this->data['config_live_show_weight_decimal_place'] = 0;}


		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		$this->data['symbolRight'] = $this->currency->getSymbolRight();
		
		if (isset($product_info['u_h1']) && !empty($product_info['u_h1'] ) ) { //uuu
			$this->data['heading_title'] = trim($product_info['u_h1']);
		}
		else {
			$this->data['heading_title'] = $product_info['name'];
		}
		if (isset($product_info['u_h2']) && !empty($product_info['u_h2'] ) ) { //uuu
			$this->data['useo_heading_title2'] = trim($product_info['u_h2']);
		}		

		$this->data['live_update_value'] = $this->language->get('live_update_value');
		$this->data['text_live_update_invalid_qty'] = $this->language->get('text_live_update_invalid_qty');
		$this->data['holder_baseprice'] = "lupd_baseprice"; 
		$this->data['holder_baseprice_old'] = "lupd_baseprice_old"; 
		$this->data['holder_taxprice'] = "lupd_taxprice";
		$this->data['holder_price_in_reward'] = "lupd_price_in_reward";
		$this->data['holder_basepoint'] = "lupd_basepoint";
		$this->data['holder_baseweight'] = "lupd_baseweight";
		$this->data['weight_class'] = "lupd_weight_class";

		
		$this->data['text_option'] = $this->language->get('text_option');
		
		$this->data['product_id'] = $this->request->get['product_id'];
		$this->data['reward'] = $product_info['reward'];
		$this->data['points'] = $product_info['points'];
		$this->data['weight'] = $product_info['weight'];
	
					
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$this->data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));

			$this->data['priceonly'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')),'','',false);				
			
			$this->data['price_norm'] = substr($this->data['price'], 0, strpos ($this->data['price'],','));
			$this->data['price_decimals'] = preg_replace("/[^0-9]+/", "", substr($this->data['price'], strpos ($this->data['price'],',')+1) );
			$this->data['price_currency'] = preg_replace("/[^a-zA-Z,]+/", "", substr($this->data['price'], strpos ($this->data['price'],',')+1) );				
		} else {
			$this->data['price'] = false;
			$this->data['priceonly'] = 0;
		}
					
		if ((float)$product_info['special']) {
			$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));

			$this->data['specialonly'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')),'','',false);

			$this->data['special_norm'] = substr($this->data['special'], 0, strpos ($this->data['special'],','));
			$this->data['special_decimals'] = preg_replace("/[^0-9]+/", "", substr($this->data['special'], strpos ($this->data['special'],',')+1) );
			$this->data['special_currency'] = preg_replace("/[^a-zA-Z,]+/", "", substr($this->data['special'], strpos ($this->data['special'],',')+1) );

		} else {
			$this->data['special'] = false;
			$this->data['specialonly'] = 0;
		}
		
		if ($this->config->get('config_tax')) {
			$this->data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			if($product_info['special']){$this->data['taxexclude'] = $product_info['special'];} else {$this->data['taxexclude'] = $product_info['price'];}
		} else {
			$this->data['tax'] = false;
			$this->data['taxexclude'] = 0;
		}
		
		$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
		
		$this->data['discounts'] = array(); 
		
		foreach ($discounts as $discount) {
			$this->data['discounts'][] = array(
				'quantity' => $discount['quantity'],
				'price_only'    => $this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')),
				'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
			);
		}
		
		$this->data['options'] = array();
		
		foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) { 
			if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
				$option_value_data = array();
				
				foreach ($option['option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
							$option_price_excl_tax_without_symbol = $this->currency->format($option_value['price'],'','',false);
							$option_price_incl_tax_without_symbol = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')),'','',false);
						} else {
							$price = false;
							$option_price_excl_tax_without_symbol = 0;
							$option_price_incl_tax_without_symbol = 0;
						}

						/*if ($option_value['price_prefix'] == '%') {
							if ((float)$product_info['special']) {
								$price = floatval($this->data['special_norm']) * intval($price) / 100 + floatval($this->data['special_norm']);
							}
							else {
								$price = number_format(floatval($this->data['price_norm']) * intval($price) / 100 + floatval($this->data['price_norm']), 3, '.', ',');
							}
						}
						elseif ($option_value['price_prefix'] == '*') {
							if ((float)$product_info['special']) {
								$price = floatval($this->data['special_norm']) * $option_value['price'];
							}
							else {
								$price = floatval($this->data['price_norm']) * $option_value['price'];
							}
						}*/
						
						$option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'o_description'           => html_entity_decode($option_value['o_description']),
							'name'                    => $option_value['name'],
							'description'             => html_entity_decode($option_value['description'], ENT_QUOTES, 'UTF-8'),
							'image'                   => $this->model_tool_image->resize($option_value['image'], 103, 103),
							'price'                   => $price,
							'option_price_incl_tax_without_symbol' => $option_price_incl_tax_without_symbol,
							'option_price_excl_tax_without_symbol' => $option_price_excl_tax_without_symbol,
							'price_prefix'            => $option_value['price_prefix'],
							
							'weight'           		  => $option_value['weight'],
							'weight_prefix'           => $option_value['weight_prefix'],
							'points'            	  => $option_value['points'],
							'points_prefix'           => $option_value['points_prefix']
						);
					}
				}
				
				$this->data['options'][] = array(
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'description'       => (isset($option['description']) ? $option['description'] : ''),
					'type'              => $option['type'],
					'option_value'      => $option_value_data,
					'required'          => $option['required']
				);					
			} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
				$this->data['options'][] = array(
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'description'       => (isset($option['description']) ? $option['description'] : ''),
					'type'              => $option['type'],
					'option_value'      => $option['option_value'],
					'required'          => $option['required']
				);						
			}
		}
						
		if ($product_info['minimum']) {
			$this->data['minimum'] = $product_info['minimum'];
		} else {
			$this->data['minimum'] = 1;
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_options.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/product_options.tpl';
		} else {
			$this->template = 'default/template/product/product_options.tpl';
		}

					
		$this->response->setOutput($this->render());
  	}
}
?>