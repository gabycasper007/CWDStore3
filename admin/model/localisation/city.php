<?php
class ModelLocalisationCity extends Model {
	public function addCity($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "city SET status = '" . (int)$data['status'] . "', name = '" . $this->db->escape($data['name']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "'");
			
		$this->cache->delete('city');
	}
	
	public function editCity($city_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "city SET status = '" . (int)$data['status'] . "', name = '" . $this->db->escape($data['name']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "' WHERE city_id = '" . (int)$city_id . "'");

		$this->cache->delete('city');
	}
	
	public function deleteCity($city_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "city WHERE city_id = '" . (int)$city_id . "'");

		$this->cache->delete('city');	
	}
	
	public function getCity($city_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "city WHERE city_id = '" . (int)$city_id . "'");
		
		return $query->row;
	}
	
	public function getCitys($data = array()) {
		$sql = "SELECT *, ct.name AS city, c.name AS country, z.name AS zone FROM " 
				. DB_PREFIX . "city ct INNER JOIN " 
				. DB_PREFIX . "country c ON (ct.country_id = c.country_id) INNER JOIN " 
				. DB_PREFIX . "zone z ON (ct.zone_id = z.zone_id)";
			
		$sort_data = array(
			'c.name',
			'z.name',
			'ct.name',
			'z.code'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.name";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}		
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getCitysByCountryId($country_id) {
		$city_data = $this->cache->get('city.' . (int)$country_id);
	
		if (!$city_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "city WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY name");
	
			$city_data = $query->rows;
			
			$this->cache->set('city.' . (int)$country_id, $city_data);
		}
	
		return $city_data;
	}

	public function getCitysByZoneId($zone_id) {
		$city_data = $this->cache->get('city.' . (int)$zone_id);
	
		if (!$city_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "city WHERE zone_id = '" . (int)$zone_id . "' AND status = '1' ORDER BY name");
	
			$city_data = $query->rows;
			
			$this->cache->set('city.' . (int)$zone_id, $city_data);
		}
	
		return $city_data;
	}
	
	public function getTotalCitys() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "city");
		
		return $query->row['total'];
	}
				
	public function getTotalCitysByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "city WHERE country_id = '" . (int)$country_id . "'");
	
		return $query->row['total'];
	}

	public function getTotalCitysByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "city WHERE zone_id = '" . (int)$zone_id . "'");
	
		return $query->row['total'];
	}
}
?>