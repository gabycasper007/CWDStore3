<?php
class ControllerCommonNavigationMain extends Controller {
    public function index() {
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/navigation_main.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/navigation_main.tpl';
        } else {
            $this->template = 'default/template/common/navigation_main.tpl';
        }

        // Language
        $this->language->load('common/header');
        $this->data['text_home'] = $this->language->get('text_home');
        $this->data['text_contact'] = $this->language->get('text_contact');
        $this->data['text_voucher'] = $this->language->get('text_voucher');
        $this->data['text_affiliate'] = $this->language->get('text_affiliate');
        $this->data['text_checkout'] = $this->language->get('text_checkout');
        $this->data['text_newsletter'] = $this->language->get('text_newsletter');


        // Variabiles
        $this->data['home'] = $this->url->link('common/home');
        $this->data['shopping_cart'] = $this->url->link('checkout/cart');
        $this->data['contact'] = $this->url->link('information/contact');
        $this->data['return'] = $this->url->link('account/return/insert', '', 'SSL');
        $this->data['sitemap'] = $this->url->link('information/sitemap');
        $this->data['manufacturer'] = $this->url->link('product/manufacturer');
        $this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
        $this->data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
        $this->data['special'] = $this->url->link('product/special');
        $this->data['account'] = $this->url->link('account/account', '', 'SSL');
        $this->data['register'] = $this->url->link('account/register', '', 'SSL');
        $this->data['order'] = $this->url->link('account/order', '', 'SSL');
        $this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
        $this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');  
        $this->data['marimi'] = $this->url->link('information/marimi'); 
        $this->data['name'] = $this->config->get('config_name');
        $this->data['text_items'] = sprintf($this->cart->countProducts());

        // Server
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        // Logo
        if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
            $this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $this->data['logo'] = '';
        }

        $this->load->model('catalog/information');
        $this->data['informations'] = array();
        foreach ($this->model_catalog_information->getInformations() as $result) {
            if ($result['top']) {
                $this->data['informations'][] = array(
                    'title' => $result['title'],
                    'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }
        }

        // Menu
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('catalog/manufacturer');
        $this->load->model('tool/image');

        $results = $this->model_catalog_manufacturer->getManufacturers();
        foreach ($results as $result) { 
            if ($result['image']) {
                        $image = $result['image'];
                    } else {
                        $image = 'no_image.jpg';
                    }           
            $this->data['manufacturers'][] = array(
                'name' => $result['name'],
                'image' => $this->model_tool_image->resize($image, 50, 50),
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
            );
        }
        
        $this->data['categories'] = array();
                    
        $categories = $this->model_catalog_category->getCategories(0);
        
        foreach ($categories as $category) {
            if ($category['top']) {

                $this->data['featured_menu_products'] = array();
                $results = $this->model_catalog_product->getProductFeaturedInMenu($category['category_id']);
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
                                
                    $this->data['featured_menu_products'][] = array(
                        'product_id' => $result['product_id'],
                        'thumb'      => $image,
                        'name'       => $result['name'],
                        'model'      => $result['model'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 55) . '..',
                        'shortdesc'  => utf8_substr(strip_tags(html_entity_decode($result['shortdesc'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                        'price'      => $price,
                        'special'    => $special,
                        'rating'     => $rating,
                        'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                        'href'       => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                        'cat_id'     => $category['category_id']
                    );
                }


                // Level 2
                $children_data = array();
                
                $children = $this->model_catalog_category->getCategories($category['category_id']);
                
                foreach ($children as $child) {
                    $data = array(
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );
                    
                    $product_total = $this->model_catalog_product->getTotalProducts($data);
                                    
                    $children_data[] = array(
                        'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );                      
                }
                
                // Level 1
                $this->load->model('tool/image');
                $image = empty($category['image']) ? 'no_image.jpg' : $category['image'];
                $thumb = $this->model_tool_image->resize($image, 100, 100);
                $this->data['categories'][] = array(
                    'name'     => $category['name'],
                    'id'       => $category['category_id'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'thumb'    => $thumb,   
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

        $this->children = array(
            'module/accountmodal',
        );
        $this->render();
    }
}
?>