<?php  
class ControllerProductProductImages extends Controller {
	public function index() { 
		$this->language->load('product/product');	
		$this->load->model('setting/setting');
		$this->load->model('catalog/product');
		$config_settings = $this->model_setting_setting->getSetting('config'); // access the database for the configuration options

		// Get language variables
		$this->data['text_sale'] = $this->language->get('text_sale');
		
		// Getting the current product ID
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
		$this->data['product_id'] = $product_id;

		// Getting the current product		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		$this->data['product_info'] = $product_info;

		// Getting the title of the product for displaying it in alt and title attributes of the link and image
		if (isset($product_info['u_h1']) && !empty($product_info['u_h1'] ) ) { //uuu
			$this->data['heading_title'] = trim($product_info['u_h1']);
		}
		else {
			$this->data['heading_title'] = $product_info['name'];
		}

		// Getting the normal price.
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

		// Getting the special price. If we have special price (discount), we display a sale-icon
		if ((float)$product_info['special']) {
			$this->data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			$this->data['discount'] = '-' . (int) (($product_info['price'] - $product_info['special']) * 100 / $product_info['price']) . '%';
		} else {
			$this->data['special'] = $this->data['discount'] = false;
		}
		
		// Getting the main image
		$this->load->model('tool/image');

		if ($product_info['image']) { // Get the big popup image
			$this->data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
		} else {
			$this->data['popup'] = '';
		}	
		
		if ($product_info['image']) { // Get the main thumb image
			$this->data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
		} else {
			$this->data['thumb'] = '';
		}

		// Get the thumb images
		$this->data['images'] = array();
		$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']); // access the database
		
		foreach ($results as $result) {
			$this->data['images'][] = array(
				'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
				'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
			);
		}	

		// Get the view file		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_images.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/product_images.tpl';
		} else {
			$this->template = 'default/template/product/product_images.tpl';
		}
					
		$this->response->setOutput($this->render());
  	}
}
?>