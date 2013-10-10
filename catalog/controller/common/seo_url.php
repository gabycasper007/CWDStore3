<?php
class ControllerCommonSeoUrl extends Controller {

	private $config_lang;
	private function set_config_lang () { 
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key` LIKE 'config_language' AND `store_id` = ".$this->config->get('config_store_id')); 
		if (isset($query->row['value']) ) 
			$this->config_lang = $query->row['value'];
		else 
			$this->config_lang = "en";
	}

	private function seo_language($link,$language) { 
		if (!isset($this->config_lang)) $this->set_config_lang();
		$config_lang = $this->config_lang;
		if (trim($language) == trim($config_lang)) unset($language);
		$url_data = parse_url($link);
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
			if(substr($url_data['path'],0,1) == '/') 
				$url_data['path'] = substr($url_data['path'],1);
		}
		$link .= $url_data['path'];
		//if(substr($link,-1) == '/') $link = substr($link,0,-1);
		if (isset($url_data['query']) ) $link .= '?'.$url_data['query'];
		return $link;
	}

	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);
			
			foreach ($parts as $part) {
				if (empty($part) ) continue;
				$query2 = $this->db->query("SELECT code FROM " . DB_PREFIX . "language WHERE code = '" . $this->db->escape($part) . "'");

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
				
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}
					
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}	
					
					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}
					if ($url[0] == 'news_id') {
						$this->request->get['news_id'] = $url[1];
					}
					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}
					if ($url[0] == 'route') { 
						$this->request->get['route'] = $url[1];
					}
				} else if(!$query2->num_rows ) {
					$this->request->get['route'] = 'error/not_found';	
				}
			}
			
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['news_id'])) {
				$this->request->get['route'] = 'information/news/news';	
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}
			
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));
	
		$url = ''; 
		
		$data = array();
		
		parse_str($url_info['query'], $data);
		
		foreach ($data as $key => $value) {
			if (isset($data['route'])) {

				if ($key == 'route') { 
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . $value) . "'");
					
					if ($query->num_rows) {
						$url .= '/' . $query->row['keyword'];
					}
					else if ($data['route'] == "common/home") {
						$url .= '/';
					}
					continue;
				}
					
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");
				
					if ($query->num_rows) {
						$url .= '/' . $query->row['keyword'];
						
						unset($data[$key]);
					}					
				} elseif ($key == 'path') {
					$categories = explode('_', $value);
					
					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");
					
						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
							unset($data[$key]); // added unset must go there do it as after
						}
					}
				}
			}
		}
	
		if ($url) {
			unset($data['route']);
		
			$query = '';
		
			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . $key . '=' . $value;
				}
				
				if ($query) {
					$query = '?' . trim($query, '&');
				}
			}
			$link = $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
				 }
		if (strpos($link,"index.php") ) {
			$link = explode("index.php",$link);
			$link = implode("",$link);
		}
		$link = $this->seo_language($link,$this->session->data['language']);
		return $link; //added, all returns removed, one single remains.
	}	
}
?>