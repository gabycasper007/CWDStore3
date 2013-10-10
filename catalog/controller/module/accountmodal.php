<?php 
	// Add to catalog/controller/common/tplFileName.php
	class ControllerModuleAccountmodal extends Controller {
	    public function index() {

	    	// get the template file
	        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/accountmodal.tpl')) {
	            $this->template = $this->config->get('config_template') . '/template/module/accountmodal.tpl';
	        } else {
	            $this->template = 'default/template/module/accountmodal.tpl';
	        }

	        $this->language->load('account/login'); // optional - get the language file
	        $this->data['logged'] = $this->customer->isLogged(); // New Addition
	        $this->data['text_logged_s'] = 
	        	sprintf(
		        	$this->language->get('text_logged_s'),
		        	$this->url->link('account/account', '', 'SSL'),
		        	$this->customer->getFirstName(),
		        	$this->url->link('account/logout', '', 'SSL')
		        ); // welcomme message and logout link

	        $this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
	        $this->data['text_logout'] = $this->language->get('text_logout');

			// optional - language variables
        	$this->data['heading_title'] = $this->language->get('heading_title');
        	$this->data['text_new_customer'] = $this->language->get('text_new_customer');
        	$this->data['text_register'] = $this->language->get('text_register');
        	$this->data['text_register_account'] = $this->language->get('text_register_account');
    		$this->data['text_returning_customer'] = $this->language->get('text_returning_customer');
    		$this->data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
        	$this->data['text_forgotten'] = $this->language->get('text_forgotten');
        	$this->data['entry_email'] = $this->language->get('entry_email');
        	$this->data['entry_password'] = $this->language->get('entry_password');
        	$this->data['button_continue'] = $this->language->get('button_continue');
    		$this->data['button_login'] = $this->language->get('button_login');
    		if (isset($this->error['warning'])) {
    			$this->data['error_warning'] = $this->error['warning'];
    		} else {
    			$this->data['error_warning'] = '';
    		}

    		$this->data['account'] = $this->url->link('account/account', '', 'SSL');


    		// Login override for admin users
			if (!empty($this->request->get['token'])) {
				$this->customer->logout();
				$this->cart->clear();
				unset($this->session->data['wishlist']);
				unset($this->session->data['shipping_address_id']);
				unset($this->session->data['shipping_country_id']);
				unset($this->session->data['shipping_zone_id']);
				unset($this->session->data['shipping_postcode']);
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_address_id']);
				unset($this->session->data['payment_country_id']);
				unset($this->session->data['payment_zone_id']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['comment']);
				unset($this->session->data['order_id']);
				unset($this->session->data['coupon']);
				unset($this->session->data['reward']);
				unset($this->session->data['voucher']);
				unset($this->session->data['vouchers']);
				
				$customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);
				
			 	if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
					// Default Addresses
					$this->load->model('account/address');
						
					$address_info = $this->model_account_address->getAddress($this->customer->getAddressId());
											
					if ($address_info) {
						if ($this->config->get('config_tax_customer') == 'shipping') {
							$this->session->data['shipping_country_id'] = $address_info['country_id'];
							$this->session->data['shipping_zone_id'] = $address_info['zone_id'];
							$this->session->data['shipping_postcode'] = $address_info['postcode'];	
						}
						
						if ($this->config->get('config_tax_customer') == 'payment') {
							$this->session->data['payment_country_id'] = $address_info['country_id'];
							$this->session->data['payment_zone_id'] = $address_info['zone_id'];
						}
					} else {
						unset($this->session->data['shipping_country_id']);	
						unset($this->session->data['shipping_zone_id']);	
						unset($this->session->data['shipping_postcode']);
						unset($this->session->data['payment_country_id']);	
						unset($this->session->data['payment_zone_id']);	
					}
										
					$this->redirect($this->url->link('account/account', '', 'SSL')); 
				}
			}	
    		
    		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
    		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
    		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
        	// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
    		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
    			$this->data['redirect'] = $this->request->post['redirect'];
    		} elseif (isset($this->session->data['redirect'])) {
          		$this->data['redirect'] = $this->session->data['redirect'];
    	  		
    			unset($this->session->data['redirect']);		  	
        	} else {
    			$this->data['redirect'] = '';
    		}
    		if (isset($this->session->data['success'])) {
        		$this->data['success'] = $this->session->data['success'];
        
    			unset($this->session->data['success']);
    		} else {
    			$this->data['success'] = '';
    		}
    		
    		if (isset($this->request->post['email'])) {
    			$this->data['email'] = $this->request->post['email'];
    		} else {
    			$this->data['email'] = '';
    		}
    		if (isset($this->request->post['password'])) {
    			$this->data['password'] = $this->request->post['password'];
    		} else {
    			$this->data['password'] = '';
    		}	        


	        $this->response->setOutput($this->render());
	    }
	  	protected function validate() {
	    	if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
	      		$this->error['warning'] = $this->language->get('error_login');
	    	}
		
			$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);
			
	    	if ($customer_info && !$customer_info['approved']) {
	      		$this->error['warning'] = $this->language->get('error_approved');
	    	}		
			
	    	if (!$this->error) {
	      		return true;
	    	} else {
	      		return false;
	    	}  	
	  	}    		
	}
?>