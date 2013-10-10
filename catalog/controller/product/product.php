<?php  
class ControllerProductProduct extends Controller {
	private $error = array(); 
	
	public function index() { 
		$this->session->data['last_page'] = $this->getcurrenturl();
		$this->language->load('product/product');

		$this->data['text_weight'] = $this->language->get('text_weight');
	
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		$this->data['showbreadcrumbs'] = DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/breadcrumbs.tpl';

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

		// Telephone number
		if (isset($this->request->post['config_telephone'])) {
			$this->data['config_telephone'] = $this->request->post['config_telephone'];
		} else {
			$this->data['config_telephone'] = $this->config->get('config_telephone');
		}

    	$information_info = $this->model_catalog_information->getInformation(11);
    	$this->data['deliverydescription'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

		
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


		$this->load->model('catalog/category');	
		$this->data['category_title'] = '';
		$this->data['category_description'] = '';
		
		if (isset($this->request->get['path'])) {
			$path = '';
			
			$parts = explode('_', (string)$this->request->get['path']);
			
			$category_id = (int)array_pop($parts);
				
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}
				
				$category_info = $this->model_catalog_category->getCategory($path_id);

				
				if ($category_info) {
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('product/category', 'path=' . $path),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
			
			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);
			
			$this->data['category_title'] = $category_info['name'];
			$this->data['category_description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

			if ($category_info) {			
				$url = '';
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}	
	
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}	
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}
										
				$this->data['breadcrumbs'][] = array(
					'text'      => $category_info['name'],
					'href'      => $this->url->link('product/category', 'path=' . $this->request->get['path']),
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		
		$this->load->model('catalog/manufacturer');	
		
		if (isset($this->request->get['manufacturer_id'])) {
			$this->data['breadcrumbs'][] = array( 
				'text'      => $this->language->get('text_brand'),
				'href'      => $this->url->link('product/manufacturer'),
				'separator' => $this->language->get('text_separator')
			);	
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}			
				
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);
			if ($manufacturer_info) {	
				$this->data['breadcrumbs'][] = array(
					'text'	    => $manufacturer_info['name'],
					'href'	    => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url),				
					'separator' => $this->language->get('text_separator')
				);
			}
		}
		
		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';
			
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
						
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
						
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
			
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}	
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}	
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('product/search', $url),
				'separator' => $this->language->get('text_separator')
			);	
		}
		
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;
		$this->data['symbolRight'] = $this->currency->getSymbolRight();
		
		if ($product_info) {

			if(!isset($category_info)) {
				$categories = $this->model_catalog_product->getCategoriesByProductId($this->request->get['product_id']);

				if($categories) {
					foreach($categories as $category){

						$path = $this->getPath($category['category_id']);
						$category_info = $this->model_catalog_category->getCategory($category['category_id']);

						if($path){
							$cat_path = $path;
						}
						else{
							$cat_path = $category_info['category_id'];
						}

						if($category_info) {
						    $path = '';
						    foreach (explode('_', $cat_path) as $path_id) {
								if (!$path) {
									$path = $path_id;
								} else {
									$path .= '_' . $path_id;
								}

								$category_info = $this->model_catalog_category->getCategory($path_id);

								if ($category_info) {

									$this->data['category_title'] = $category_info['name'];
									$this->data['category_description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');

									$this->data['breadcrumbs'][] = array(
									  'text'      => $category_info['name'],
									  'href'      => $this->url->link('product/category', '&path=' . $path),
									  'separator' => $this->language->get('text_separator')
									);
								}
						    }
						    break;
						}
					}
				}
			}

			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
						
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
						
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}			
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}
						
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
			
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}	
						
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
												
			$this->data['breadcrumbs'][] = array(
				'text'      => $product_info['name'],
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']),
				'separator' => $this->language->get('text_separator')
			);
			$this->data['currentLink'] = $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']);
			
			if (isset($product_info['u_title']) && !empty($product_info['u_title'] ) ) { //uuu
				$this->document->setTitle(trim($product_info['u_title']) );
			}
			else {
				$this->document->setTitle($product_info['name']);
			}
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/tabs.js');
			$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');			
			$NextProd = $this->model_catalog_product->getProduct($product_id+1);
			$PrevProd = $this->model_catalog_product->getProduct($product_id-1);
			if($NextProd) {
				$this->data['next_prod_url'] = $this->url->link('product/product', 'product_id=' . $NextProd['product_id']);
				$this->data['next_prod_name'] = $NextProd['name'];
			} else {
				$this->data['next_prod_url'] = '';
				$this->data['next_prod_name'] = '';
			}
			if($PrevProd) {
				$this->data['prev_prod_url'] = $this->url->link('product/product', 'product_id=' . $PrevProd['product_id']);
				$this->data['prev_prod_name'] = $PrevProd['name'];
			} else {
				$this->data['prev_prod_url'] = '';
				$this->data['prev_prod_name'] = '';
			}
				
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

			$this->data['text_select'] = $this->language->get('text_select');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_points'] = $this->language->get('text_points');	
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_stock'] = $this->language->get('text_stock');
			$this->data['text_product_viewed'] = $this->language->get('text_product_viewed');			
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_discount'] = $this->language->get('text_discount');
			$this->data['text_option'] = $this->language->get('text_option');
			$this->data['text_qty'] = $this->language->get('text_qty');
			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$this->data['text_or'] = $this->language->get('text_or');
			$this->data['text_write'] = $this->language->get('text_write');
			$this->data['text_note'] = $this->language->get('text_note');
			$this->data['text_share'] = $this->language->get('text_share');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_tags'] = $this->language->get('text_tags');
			$this->data['text_view'] = $this->language->get('text_view');
			$this->data['text_sale'] = $this->language->get('text_sale');	
			$this->data['text_next_product'] = $this->language->get('text_next_product');	
		    $this->data['text_previous_product'] = $this->language->get('text_previous_product');			
		    $this->data['text_description'] = $this->language->get('text_description');	

		    // Texts for livrare on product page		
		    $this->data['text_livrare'] = $this->language->get('text_livrare');			
		    $this->data['text_span_livrare'] = $this->language->get('text_span_livrare');			
		    $this->data['text_termen_livrare'] = $this->language->get('text_termen_livrare');			
		    $this->data['text_comision_livrare'] = $this->language->get('text_comision_livrare');			
			
			$this->data['entry_name'] = $this->language->get('entry_name');
			$this->data['entry_review'] = $this->language->get('entry_review');
			$this->data['entry_rating'] = $this->language->get('entry_rating');
			$this->data['entry_good'] = $this->language->get('entry_good');
			$this->data['entry_bad'] = $this->language->get('entry_bad');
			$this->data['entry_captcha'] = $this->language->get('entry_captcha');
			
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');			
			$this->data['button_upload'] = $this->language->get('button_upload');
			$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->load->model('catalog/review');
			$this->data['tab_description'] = $this->language->get('tab_description');
			$this->data['tab_attribute'] = $this->language->get('tab_attribute');
			$this->data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);
			$this->data['tab_related'] = $this->language->get('tab_related');
			
			$this->data['product_id'] = $this->request->get['product_id'];
			$this->data['manufacturer'] = $product_info['manufacturer'];
			$this->data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$this->data['model'] = $product_info['model'];
			$this->data['reward'] = $product_info['reward'];
			$this->data['points'] = $product_info['points'];
			$this->data['weight'] = $product_info['weight'];

			if ($product_info['quantity'] <= 0) {
				$this->data['stock'] = $product_info['stock_status'];
				$icon_stock = 1; 
			}
			elseif ($product_info['quantity'] <= 5 ) {
				$this->data['stock'] = $this->language->get('text_stock_limitat');
				$icon_stock = 2; 
			}
			elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $product_info['quantity'];
				$icon_stock = 3; 
			}
			else  {
				$this->data['stock'] = $this->language->get('text_instock');	
				$icon_stock = 3; 
			}

			$this->data['icon'] = $icon_stock;
			
			
			$this->load->model('tool/image');
			if ($product_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = '';
			}
			
            $manufacturer_image = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);
         
            if($manufacturer_image){
               $this->data['manufacturers_img'] = $this->model_tool_image->resize($manufacturer_image['image'], 120, 80);
            }else{
               $this->data['manufacturers_img'] = false;
            }			
			
			if ($product_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = '';
			}
			
			$this->data['images'] = array();
			
			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
			
			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}	
						
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

			// Localisation for product page
			$this->load->model('localisation/country');
		
			$this->data['countries'] = $this->model_localisation_country->getCountries();
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/shipping_address.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/shipping_address.tpl';
			} else {
				$this->template = 'default/template/checkout/shipping_address.tpl';
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
			
			$this->data['review_status'] = $this->config->get('config_review_status');
			$this->data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
		
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
										
			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
			
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
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'   	  => $image,
					'name'    	  => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 55) . '..',
					'shortdesc'   => utf8_substr(strip_tags(html_entity_decode($result['shortdesc'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'price'   	  => $price,
					'special' 	  => $special,
					'rating'      => $rating,
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	  => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}	
			
			$this->data['tags'] = array();
			
			if ($product_info['tag']) {		
				$tags = explode(',', $product_info['tag']);
				
				foreach ($tags as $tag) {
					$this->data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}
			
			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/product.tpl';
			} else {
				$this->template = 'default/template/product/product.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header',
				'product/product_images',
				'product/product_options',
				'product/product_tabs',
				'product/product_related'
			);
						
			$this->response->setOutput($this->render());
		} else {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
						
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}	
						
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}			
			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}	
					
			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}
							
			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}
					
			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}
			
			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
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
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
								
      		$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/product', $url . '&product_id=' . $product_id),
        		'separator' => $this->language->get('text_separator')
      		);			
		
      		$this->document->setTitle($this->language->get('text_error'));
      		$this->data['heading_title'] = $this->language->get('text_error');
      		$this->data['text_error'] = $this->language->get('text_error');
      		$this->data['button_continue'] = $this->language->get('button_continue');
      		//$this->data['continue'] = $this->url->link('common/home');
      		// Link to the last page visited
      		
      		if(isset($this->session->data['last_page'])){
      			$this->data['continue'] = $this->session->data['last_page'];
      		}else{
      			$this->data['continue'] = $this->url->link('common/home');
      		}	      		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
						
			$this->response->setOutput($this->render());
    	}
  	}

  	public function add() {	
		$this->language->load('checkout/cart');
        $hold = array();
        $json = array();
		
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
						
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {
		    
		    $quantity = 1;																			
			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();	
			}
			
			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
			
			if (isset($this->session->data['cart'])) {
                $hold = $this->session->data['cart'];
     		    unset($this->session->data['cart']);
                            
                if (!$option) {
		      		$keyx = (int)$product_id;
		    	} else {
		      		$keyx = (int)$product_id . ':' . base64_encode(serialize($option));
		    	}

    	        unset($this->session->data['cart'][$keyx]);
                $this->data = array();
		        $qty = '1'; 
      			$this->session->data['cart'][$keyx] = (int)$qty;
				$json['success'] = '0';
                                
				// Totals
				$this->load->model('setting/extension');
				
				$total_data = array();					
				$total = 0;
				$taxes = $this->cart->getTaxes();
				
				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$sort_order = array(); 
					
					$results = $this->model_setting_extension->getExtensions('total');
					
					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}
					
					array_multisort($sort_order, SORT_ASC, $results);
					
					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('total/' . $result['code']);
				
							$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
						}
						
						$sort_order = array(); 
					  
						foreach ($total_data as $key => $value) {
							$sort_order[$key] = $value['sort_order'];
						}
			
						array_multisort($sort_order, SORT_ASC, $total_data);			
					}
				}

				if (isset($this->session->data['cart'][$keyx])) {
	     		    unset($this->session->data['cart'][$keyx]);
	  		                               }   
                    if ($this->config->get('config_tax') == '0') {    
                        $val = array_sum($taxes);
                    	$total = $total - $val;
                    }   

	                $this->session->data['cart'] = $hold;  
					$json['total'] = sprintf($this->currency->format($total));
	                $tax = $total - array_sum($taxes);
	                $json['tax'] =  sprintf($this->currency->format($tax));

				} 
				else {
					$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
				}
			}
		$this->response->setOutput(json_encode($json));		
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
	
	protected function getPath($parent_id, $current_path = '') {
		$category_info = $this->model_catalog_category->getCategory($parent_id);
	
		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['category_id'];
			} else {
				$new_path = $category_info['category_id'] . '_' . $current_path;
			}	
		
			$path = $this->getPath($category_info['parent_id'], $new_path);
					
			if ($path) {
				return $path;
			} else {
				return $new_path;
			}
		}
	}

	public function upload() {
		$this->language->load('product/product');

		$this->data['text_weight'] = $this->language->get('text_weight');
		
		$json = array();
		
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
			
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
        		$json['error'] = $this->language->get('error_filename');
	  		}	  	
			// Allowed file extension types
			$allowed = array();
			
			$filetypes = explode("\n", $this->config->get('config_file_extension_allowed'));
			
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			
			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
       		}	
			
			// Allowed file mime types		
		    $allowed = array();
			
			$filetypes = explode("\n", $this->config->get('config_file_mime_allowed'));
			
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
							
			if (!in_array($this->request->files['file']['type'], $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}
						
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		
		if (!$json && is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
			$file = basename($filename) . '.' . md5(mt_rand());
			
			// Hide the uploaded file name so people can not link to it directly.
			$json['file'] = $this->encryption->encrypt($file);
			
			move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
						
			$json['success'] = $this->language->get('text_upload');
		}	
		
		$this->response->setOutput(json_encode($json));		
	}
}
?>