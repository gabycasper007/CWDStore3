<?php
class ControllerCommonContentLogin extends Controller {
    public function index() {

        $this->language->load('module/account');

        $this->data['text_goto'] = $this->language->get('text_goto');
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
        $this->data['text_donthaveaccount'] = $this->language->get('text_donthaveaccount');
        $this->data['text_whyhaveaccount'] = $this->language->get('text_whyhaveaccount');
        
        $this->data['logged'] = $this->customer->isLogged();
        $this->data['register'] = $this->url->link('account/register', '', 'SSL');
        $this->data['donthaveaccount'] = $this->url->link('account/register', '', 'SSL');        
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


        $this->language->load('module/fbconnect');

        if(!$this->customer->isLogged()){

            if(!isset($this->fbconnect)){           
                require_once(DIR_SYSTEM . 'vendor/facebook-sdk/facebook.php');
                $this->fbconnect = new Facebook(array(
                    'appId'  => $this->config->get('fbconnect_apikey'),
                    'secret' => $this->config->get('fbconnect_apisecret'),
                ));
            }

            $this->data['fbconnect_url'] = $this->fbconnect->getLoginUrl(
                array(
                    'scope' => 'email,user_birthday,user_location,user_hometown',
                    'redirect_uri'  => $this->url->link('account/fbconnect', '', 'SSL')
                )
            );

            if($this->config->get('fbconnect_button_' . $this->config->get('config_language_id'))){
                $this->data['fbconnect_button'] = html_entity_decode($this->config->get('fbconnect_button_' . $this->config->get('config_language_id')));
            }
            else $this->data['fbconnect_button'] = $this->language->get('heading_title');

        }   

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/content_login.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/content_login.tpl';
        } else {
            $this->template = 'default/template/common/content_login.tpl';
        }
 
        $this->render();
    }
}
?>