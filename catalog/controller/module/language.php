<?php  
class ControllerModuleLanguage extends Controller {

	private function fix_parse_bug ($data) { // added 
		// fix php parse_url bug when no path exists, and we have ? instead of /?
		if (strpos($data['host'],'?') ) {
			$data['host'] = explode('?',$data['host']);
			$data['query'] = $data['host'][1];
			$data['host'] = $data['host'][0];
			if(!isset($data['path'])) $data['path'] = '';
			$data['query'] = $data['query'].$data['path'];
			$data['path'] = '/';
		}
		return $data;
	}

	private function clear_link ($link) { // added
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		$lang_code = array();
		foreach($languages as $language) {
			array_push($lang_code,$language['code']);
		}
		$link = explode("/",$link);
		foreach ($link as $key => $part) {
			if (in_array($part,$lang_code) ) {
				unset($link[$key]);
			}
		}
		$link = implode("/",$link);
		if(substr($link,0,1) == '/') $link = substr($link,1);
		return $link;
	}
	private function seo_language($link,$language) { // added 
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key` LIKE 'config_language' AND `store_id` = ".$this->config->get('config_store_id')); 
		$config_lang = $query->row['value'];
		if (trim($language) == trim($config_lang)) unset($language);
		$url_data = parse_url($link);
		$url_data = $this->fix_parse_bug($url_data);
		if(isset($url_data['path']))
			$url_data['path'] = $this->clear_link($url_data['path']);
		else $url_data['path'] = '';
		if (strpos('a'.$url_data['scheme'].'a','https') ) $link = $this->config->get('config_ssl');
		else $link = $this->config->get('config_url');	
		if (isset($language) ) $link .= $language.'/';
		if (isset($url_data['path']) ) {
		$temp_path = explode('/',$url_data['path']);
		foreach ($temp_path as $key => $value) {
			if(!empty($value))
			if (strpos($link,$value)) unset($temp_path[$key]);
		}
		$url_data['path'] = implode('/',$temp_path);
		$link .= $url_data['path'];
		}
		if(substr($link,-1) == '/') $link = substr($link,0,-1);
		if (isset($url_data['query']) ) $link .= '?'.$url_data['query'];
		return $link;
	}
	
	protected function index() {
    	if (isset($this->request->post['language_code'])) {
			$this->session->data['language'] = $this->request->post['language_code'];
		
			if (isset($this->request->post['redirect'])) {
				$temp_redirect = $this->request->post['redirect'];
			} else {
				$temp_redirect = $this->url->link('common/home','','SSL');
			}
			$temp_redirect = $this->seo_language($temp_redirect,$this->session->data['language']);
			$this->redirect($temp_redirect);
    	}		
		
		$this->language->load('module/language');
		
		$this->data['text_language'] = $this->language->get('text_language');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$connection = 'SSL';
		} else {
			$connection = 'NONSSL';
		}
			
		$this->data['action'] = $this->url->link('module/language', '', $connection);
		$this->data['language_code'] = $this->session->data['language'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = array();
		
		$results = $this->model_localisation_language->getLanguages();
		
		foreach ($results as $result) {
			if ($result['status']) {
				$this->data['languages'][] = array(
					'name'  => $result['name'],
					'code'  => $result['code'],
					'image' => $result['image']
				);	
			}
		}
		if (!isset($this->request->get['route'])) {
			$this->data['redirect'] = $this->url->link('common/home');
		} else {
			$data = $this->request->get;
			
			unset($data['_route_']);
			
			$route = $data['route'];
			
			unset($data['route']);
			
			$url = '';
			
			if ($data) {
				$url = '&' . urldecode(http_build_query($data, '', '&'));
			}	
					
			$this->data['redirect'] = $this->url->link($route, $url, $connection);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/language.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/language.tpl';
		} else {
			$this->template = 'default/template/module/language.tpl';
		}
		
		$this->render();
	}
}
?>