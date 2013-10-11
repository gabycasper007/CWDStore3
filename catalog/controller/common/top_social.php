<?php
class ControllerCommonTopSocial extends Controller {
    public function index() {
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/top_social.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/top_social.tpl';
        } else {
            $this->template = 'default/template/common/top_social.tpl';
        }

        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');

        $this->render();
    }
}
?>