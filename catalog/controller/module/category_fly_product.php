<?php  
class ControllerModuleCategoryFlyproduct extends Controller {
  protected function index($setting) {
    $this->language->load('module/category');
    $this->load->model('tool/image'); 
    
      $this->data['heading_title'] = $this->language->get('heading_title_product');
      $this->data['text_special'] = $this->language->get('text_special');    
      $this->data['special'] = $this->url->link('product/special');
    if (isset($this->request->get['path'])) {
      $parts = explode('_', (string)$this->request->get['path']);
    } else {
      $parts = array();
    }
    
    if (isset($parts[0])) {
      $this->data['category_id'] = $parts[0];
    } else {
      $this->data['category_id'] = 0;
    }
    
    if (isset($parts[1])) {
      $this->data['child_id'] = $parts[1];
    } else {
      $this->data['child_id'] = 0;
    }


    if (isset($parts[2])) {
      $this->data['sub_child_id'] = $parts[2];
    } else {
      $this->data['sub_child_id'] = 0;
    }
              
    $this->load->model('catalog/category');
    $this->load->model('catalog/product');
    $this->load->model('tool/image');

    $this->data['categories'] = array();
    $categories = $this->model_catalog_category->getCategories(0);
    foreach ($categories as $category) {

      $total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
      $children_data = array();
      $children = $this->model_catalog_category->getCategories($category['category_id']);

      foreach ($children as $child) {

        $data = array(
          'filter_category_id'  => $child['category_id'],
          'filter_sub_category' => true
        );
        $product_total = $this->model_catalog_product->getTotalProducts($data);
        $total += $product_total;

        $sub_children_data = array();
        $sub_children = $this->model_catalog_category->getCategories($child['category_id']);

        if ($child['image']) {
          $image = $this->model_tool_image->resize($child['image'], $this->config->get('config_image_sub_category_width'), $this->config->get('config_image_sub_category_height'));
        } else {
          $image = false;
        }

        foreach ($sub_children as $subkid) {
          $sub_data = array(
            'filter_category_id'  => $subkid['category_id'],
            'filter_sub_category' => true
          );
          $sub_product_total = $this->model_catalog_product->getTotalProducts($sub_data);
          $sub_total = $sub_product_total;

          $sub_children_data[] = array(
            'category_id' => $subkid['category_id'],
            'name'        => $subkid['name'],
            'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $subkid['category_id']),
            'total'       => ($this->config->get('config_product_count') ? ' (' . $sub_product_total . ')' : '')
          );
        }

        $children_data[] = array(
          'category_id' => $child['category_id'],
          'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
          'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
          'thumb'     => $image,
          'sub_children' => $sub_children_data
        );    
      }
      
      if ($category['icon_image']) {
        $icon_image = $this->model_tool_image->resize($category['icon_image'], $this->config->get('config_icon_image_category_width'), $this->config->get('config_icon_image_category_height'));
      } else {
        $icon_image = '';
      }

      if ($category['promo_image']) {
        $promo_image = 'image/'. $category['promo_image'];
      } else {
        $promo_image = '';
      }

      $this->data['categories'][] = array(
        'category_id' => $category['category_id'],
        'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' ' : ''),
        'children'    => $children_data,
        'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
        'icon_image'  => $icon_image,
        'promo_image' => $promo_image,
        'total'       => $total
      );  
    }
    
    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category_fly_product.tpl')) {
      $this->template = $this->config->get('config_template') . '/template/module/category_fly_product.tpl';
    } else {
      $this->template = 'default/template/module/category_fly_product.tpl';
    }
    
    $this->render();
    }
}
?>