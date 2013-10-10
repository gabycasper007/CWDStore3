<?php  
class ControllerModuleAccount extends Controller {
	protected function index() {
		$this->language->load('module/account');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
    	
		$this->data['text_register'] = $this->language->get('text_register');
    	$this->data['text_login'] = $this->language->get('text_login');
		$this->data['text_logout'] = $this->language->get('text_logout');
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_password'] = $this->language->get('text_password');
		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_return'] = $this->language->get('text_return');
		$this->data['text_transaction'] = $this->language->get('text_transaction');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
    	$this->data['login'] = $this->url->link('account/login', '', 'SSL');
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['address'] = $this->url->link('account/address', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['download'] = $this->url->link('account/download', '', 'SSL');
		$this->data['return'] = $this->url->link('account/return', '', 'SSL');
		$this->data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

		$this->data['current_page'] = '';
		if (isset($this->request->get['route'])) {

			if ($this->request->get['route'] == 'account/login') {
				$this->data['current_page'] = 'login';
			}
			if ($this->request->get['route'] == 'account/register') {
				$this->data['current_page'] = 'register';
			}
			if ($this->request->get['route'] == 'account/forgotten') {
				$this->data['current_page'] = 'forgotten';
			}

			if ($this->request->get['route'] == 'account/account') {
				$this->data['current_page'] = 'your_account';
			}

			if ($this->request->get['route'] == 'account/edit') {
				$this->data['current_page'] = 'edit';
			}

			if ($this->request->get['route'] == 'account/password') {
				$this->data['current_page'] = 'password';
			}

			if ($this->request->get['route'] == 'account/address') {
				$this->data['current_page'] = 'address';
			}

			if ($this->request->get['route'] == 'account/wishlist') {
				$this->data['current_page'] = 'wishlist';
			}

			if ($this->request->get['route'] == 'account/order') {
				$this->data['current_page'] = 'order';
			}

			if ($this->request->get['route'] == 'account/download') {
				$this->data['current_page'] = 'download';
			}

			if ($this->request->get['route'] == 'account/return') {
				$this->data['current_page'] = 'return';
			}

			if ($this->request->get['route'] == 'account/transaction') {
				$this->data['current_page'] = 'transaction';
			}

			if ($this->request->get['route'] == 'account/newsletter') {
				$this->data['current_page'] = 'newsletter';
			}

			if ($this->request->get['route'] == 'account/logout') {
				$this->data['current_page'] = 'logout';
			}
		}	  

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/account.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/account.tpl';
		} else {
			$this->template = 'default/template/module/account.tpl';
		}
		
		$this->render();
	}
}
?>