
<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<section id="content" class="span9 categorycontent">
  <div class="row-fluid">
    <?php echo $content_top; ?>

  <?php require($showbreadcrumbs); ?>
  
  <div class="row-fluid">
    <!-- Category Title -->
    <header class="category-name">
      <h1>
        <?php echo $heading_title; ?> <span class="produsee">produse</span>
      </h1>
      <?php if (isset($useo_heading_title2)) {?>
      <h2 class = "useo_h2">
        <?php echo $useo_heading_title2; ?>
      </h2><!-- uuu -->
      <?php } ?>
    </header>
    <!-- Category Description -->
    <?php if ($thumb || $description) { ?>
      <div class="category-info">
        <div class="row-fluid product-row">
          <?php if ($thumb) { ?>
            <div class="span3 image">
              <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" />
            </div>
          <?php } 

          if ($description) { 
            ?>
            <div class="span9">
              <h3><?php echo $text_description; ?></h3>
              <p><?php echo $description; ?></p>
            </div>
            <?php } ?>
          </div>
      </div>
    <?php } ?>
  </div>

  <!-- SUBCATEGORY IMAGES -->
  <?php if ($bool) { ?>
    <div class="row-fluid">
      <h3 class="subcategory_title">
        <?php echo $text_subcategory_title; ?>
      </h3>
      <ul class="subcategory-items">
        <?php foreach ($categories as $category) { ?>
          <?php if ( $category['thumb'] ){ ?>
              <li>
                <a href="<?php echo $category['href']; ?>" class="active">
                  <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>">
                </a>
                <div class="row-fluid">
                  <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                </div>
              </li>
             <?php } 
          } ?>
      </ul>
    </div>
  <?php } ?>

  <!-- Subcategories Style 0 -->
  <?php if($this->config->get('sellya_category_subcategories_status')== 1) { 

    if($this->config->get('sellya_category_subcategories_style')== 0) { 

      if ($categories) { ?>
        <h4>
          <?php echo $text_refine; ?>
        </h4>

        <div class="category-list">
          <?php 
            $counter = 0; 
            foreach ($categories as $category) { 

        	    if (($counter+6) %6 == 0) 
                $xclass="span-first-child";

        	    else $xclass=""; ?>

      			  <div class="span <?php echo $xclass; ?>">

        				<?php if ($category['thumb']) { ?>
          				<div class="image">
                    <a href="<?php echo $category['href']; ?>">
                      <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
                    </a>
                  </div>
                <?php } 

                else { ?>
                  <div class="image">
                    <a href="<?php echo $category['href']; ?>">
                      <img src="catalog/view/theme/sellya/image/no_image-100x100.png" alt="<?php echo $category['name']; ?>" />
                    </a>
                  </div>
        				<?php } ?>

        				<div class="name subcatname">
                  <a href="<?php echo $category['href']; ?>">
                    <?php echo $category['name']; ?>
                  </a>
                </div>

        			</div>
    	       <?php 
            $counter++; 
          } 
        ?>
      </div>
      <?php 
    } 
  } ?>

  <!-- Subcategories Style 1 -->
  <?php if($this->config->get('sellya_category_subcategories_style')== 1) { ?> 

    <?php if ($categories) { ?>

      <h4><?php echo $text_refine; ?></h4>
      <div class="category-list">

        <?php 
          if (count($categories) <= 5) { ?>
            <ul>
              <?php foreach ($categories as $category) { ?>
              <li><span></span><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
            </ul>
        <?php } 

        else { ?>
          <?php 
            for ($i = 0; $i < count($categories);) { ?>
              <ul>

                <?php $j = $i + ceil(count($categories) / 4);

                for (; $i < $j; $i++) {
                  if (isset($categories[$i])) { ?>

                    <li>
                      <span></span>
                      <a href="<?php echo $categories[$i]['href']; ?>">
                        <?php echo $categories[$i]['name']; ?>
                      </a>
                    </li>

                    <?php 
                  } 
                } ?>
              </ul>
              <?php } ?>
        <?php } ?>
      </div>

      <?php 
      } 
    } 
  } ?>

  <?php if ($products) { ?>

    <div class="row-fluid">
      <div class="product-filter">

        <div class="sort"><?php echo $text_sort; ?>
          <select onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>

              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected">
                  <?php echo $sorts['text']; ?>
                </option>

              <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>">
                  <?php echo $sorts['text']; ?>
                </option>
                
              <?php } ?>
            <?php } ?>
          </select>
        </div>

        <div class="display">
          <?php echo $text_display; ?>&nbsp;
          <a class="list">
            <img src="catalog/view/theme/sellya/image/list-view.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" />&nbsp;
          </a>

          <a class="grid">
            <img src="catalog/view/theme/sellya/image/grid-view.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>" />
          </a>
        </div> 

        <!-- <div class="product-compare">
          <a href="<?php echo $compare; ?>" id="compare-total">
            <?php echo $text_compare; ?>
          </a>
        </div>  -->

        <div class="limit"><?php echo $text_limit; ?>
          <select onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      <div class="pag-class">Pagina</div>
        <div class="pagination">
          <?php echo $pagination; ?>
        </div>
      </div>
    </div>

    <!-- PRODUCT GRID -->
    <div class="row-fluid">

      <div class="product-grid" id="grid">
        <?php $i = 0; ?>
        <?php foreach ($products as $product ) { ?>

          <?php if ($i % 3 == 0) { ?>
              <div class="row-fluid">
          <?php } ?>

            <div class="span4 single-grid">

              <!-- PRODUCT NAME -->
                <div class="name">
                  <a href="<?php echo $product['href']; ?>">
                    <?php echo $product['name']; ?>
                  </a>
                </div>
              <!-- end of product name -->

                <div class="image">
                  <a href="<?php echo $product['href']; ?>">

                    <?php if ($product['special']) { ?>
                      <div class="sale-icon">
                        <?php echo $product['discount']; ?>
                      </div>
                    <?php } ?>

                    <?php 
                    if ($product['thumb']) { ?>
                      <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>">
                    <?php }

                    else { ?>
                      <img src="catalog/view/theme/sellya/image/no_image-190x190.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>">
                    <?php } ?>
                             <!-- PRODUCT RATING -->
                <?php if ($product['rating']) { ?>
                  <div class="ratingg">
                    <img src="catalog/view/theme/sellya/image/stars/stars<?php 
                           echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                           echo $product['rating']; ?>.png" 
                         alt="<?php echo $product['reviews']; ?>" 
                    />
                  </div>

                <?php } ?>
                <!-- end of product rating -->
  
                  </a>
                </div> <!-- end of image -->

                 <div class="description">
                  <?php echo $product['description']; ?>
                </div>
       
                <!-- <div class="prod-descr">
                    <?php echo $product['shortdesc']; ?>
                  </div> -->

                <div class="stock">
                  
                  <?php echo $product['stock']; ?>
      
                  <?php 
                  if ($product['icon'] == 1) { ?>
                    <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>out-of-stock.png" alt="Out of stock">
                  <?php }
      
                  elseif ($product['icon'] == 2) { ?>
                    <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>limited-stock.png" alt="Stoc limitat">
                  <?php }
      
                  else { ?>
                    <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>in-stock.png" alt="In stoc">
      
                  <?php } ?>               
      
                  <?php //if($config_live_show_weight && $weight>0) { ?>
                    <!-- <span><?php echo $text_weight; ?></span> -->
                    <?php 
                      /*if($config_live_show_weight_decimal_place>0) {
                        $weight = number_format ( $weight , $config_live_show_weight_decimal_place , '.' , '' );
                      } 
                      else {
                        $weight = number_format ( $weight , 2 , '.' , '' );
                      } */
                    ?>
                    <!-- <a href="#" class="<?php echo $holder_baseweight ;?>"><?php echo $weight; ?> <?php echo $weight_class;?></a> -->
                  <?php //}?>
                
                </div>

                <!-- PRODUCT PRICE -->
                <?php if ($product['price']) { ?>
                  <div class="price">
      
                    <?php if (!$product['special']) { 
                      echo $product['price']; 
      
                    } else { ?>
      
                      <span class="price-old <?php echo $holder_baseprice_old; ?>">
                        <?php echo $product['price']; ?>
                      </span>
                      
                      <span class="row-fluid price-new <?php echo $holder_baseprice; ?>">
                        <?php echo $product['special']; ?>
                      </span>
      
                    <?php } ?>
      
                    <?php if ($product['tax']) { ?>
                      <br />
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
      
                  </div>
                <?php } ?>
                <!-- end of price -->

                <div class="cart">
                  <?php // echo $text_qty; ?>
                  <div class="quanti2 cosss">
                    <!-- <input type="text" id="quantimini-<?php echo $product['product_id']; ?>" name="quantity" size="2" class="input-mini" value="<?php echo $product['minimum']; ?>" /> -->
                    <input type="hidden" name="product_id-<?php echo $product['product_id']; ?>" size="2" value="<?php echo $product['product_id']; ?>" />
                    <!-- <div class="edit-cant" onclick="$('#quantimini-<?php echo $product['product_id']; ?>').val(parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())+1);"></div>
                    <div class="edit-cant2" onclick="v=parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())-1;if(v>1) rval = v; else rval = 1; $('#quantimini-<?php echo $product['product_id']; ?>').val(rval);"></div> -->
                  </div>
                  <input type="button" value="<?php echo $button_cart; ?>" class="button" onclick="adaugama('this', '<?php echo $product['product_id'] ?>');" />
                </div>

              <!-- WISHLIST & COMPARE BUTTONS -->
              <ul class="WishCom">
                <li>
                  <a onclick="addToWishList('<?php echo $product['product_id']; ?>');">
                    <?php echo $button_wishlist; ?>
                  </a>
                </li>
                <li>
                  <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">
                    <?php echo $button_compare; ?>
                  </a>
                </li>
              </ul>
              
              <!-- end of wishlist & compare buttons -->

            </div>

          <?php 
            $i = $i + 1;

            if ($i % 3 == 0) { ?>
              </div>
          <?php } ?>

        <?php } ?> <!-- end of foreach -->

        </div> <!-- end of product grid -->
      </div>
    <!-- PRODUCT LIST -->
      <div class="product-list clearfix" id="list">
        <?php 
      
          foreach ($products as $product) { ?>
      
            <div class="row-fluid list-style">
              <div class="span3 imageWishCom">
                <div class="image">
                  
                  <a href="<?php echo $product['href']; ?>">
                    <?php if ($product['special']) { ?>
                      <div class="sale-icon">
                        <?php echo $product['discount']; ?>
                      </div>
                    <?php } ?>
      
                    <?php if ($product['thumb']) { ?>
                      <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    <?php }
      
                    else { ?>
                      <img src="catalog/view/theme/sellya/image/no_image-190x190.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    <?php } ?> 
                  </a>
                </div>
      
              <!-- PRODUCT RATING -->
              <?php if ($product['rating']) { ?>
                <div class="ratingg">
                  <img src="catalog/view/theme/sellya/image/stars/stars<?php 
                         echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                         echo $product['rating']; ?>.png" 
                       alt="<?php echo $product['reviews']; ?>" 
                  />
                </div>
              <?php } ?>
              <!-- end of product rating -->
      
              <!-- WISHLIST & COMPARE BUTTONS -->
              <ul class="WishCom">
                <li>
                  <a onclick="addToWishList('<?php echo $product['product_id']; ?>');">
                    <?php echo $button_wishlist; ?>
                  </a>
                </li>
                <li>
                  <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">
                    <?php echo $button_compare; ?>
                  </a>
                </li>
              </ul>
              
              <!-- end of wishlist & compare buttons -->
      
              </div>
              <!-- end of image span3 -->
      
      
              <div class="span6">
                <!-- PRODUCT NAME -->
                  <div class="name">
                    <a href="<?php echo $product['href']; ?>">
                      <?php echo $product['name']; ?>
                    </a>
                   <!-- <div class="prod-descr">
                      <?php echo $product['shortdesc']; ?>
                    </div> -->
                  </div>
                <!-- end of product name -->
      
                <!-- DESCRIPTION -->
                <div class="description">
                  <?php echo $product['shortdesc']; ?>
                </div>
                <!-- end of product short description -->
              </div>
              
              <div class="span3 preturiRightSide">
                <!-- PRODUCT PRICE -->
                <?php if ($product['price']) { ?>
                  <div class="price">
      
                    <?php if (!$product['special']) { 
                      echo $product['price']; 
      
                    } else { ?>
      
                      <span class="row-fluid price-new <?php echo $holder_baseprice; ?>">
                        <?php echo $product['special']; ?>
                      </span>
      
                      <span class="price-old <?php echo $holder_baseprice_old; ?>">
                        <?php echo $product['price']; ?>
                      </span>
      
                    <?php } ?>
      
                    <?php if ($product['tax']) { ?>
                      <br />
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
      
                  </div>
                <?php } ?>
                <div class="stock">
                  
                  <?php echo $product['stock']; ?>
      
                  <?php 
                  if ($product['icon'] == 1) { ?>
                    <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>out-of-stock.png" alt="Out of stock">
                  <?php }
      
                  elseif ($product['icon'] == 2) { ?>
                    <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>limited-stock.png" alt="Stoc limitat">
                  <?php }
      
                  else { ?>
                    <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>in-stock.png" alt="In stoc">
      
                  <?php } ?>               
      
                  <?php //if($config_live_show_weight && $weight>0) { ?>
                    <!-- <span><?php echo $text_weight; ?></span> -->
                    <?php 
                      /*if($config_live_show_weight_decimal_place>0) {
                        $weight = number_format ( $weight , $config_live_show_weight_decimal_place , '.' , '' );
                      } 
                      else {
                        $weight = number_format ( $weight , 2 , '.' , '' );
                      } */
                    ?>
                    <!-- <a href="#" class="<?php echo $holder_baseweight ;?>"><?php echo $weight; ?> <?php echo $weight_class;?></a> -->
                  <?php //}?>
                
                </div>
                <!-- end of price -->
                
                <div class="cart">
                  <div class="quanti2 cosss">
                    <input type="text" id="quantimini-<?php echo $product['product_id']; ?>" name="quantity" size="2" class="input-mini" value="<?php echo $product['minimum']; ?>" />
                    <input type="hidden" name="product_id-<?php echo $product['product_id']; ?>" size="2" value="<?php echo $product['product_id']; ?>" />
                    <div class="edit-cant" onclick="$('#quantimini-<?php echo $product['product_id']; ?>').val(parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())+1);"></div>
                    <div class="edit-cant2" onclick="v=parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())-1;if(v>1) rval = v; else rval = 1; $('#quantimini-<?php echo $product['product_id']; ?>').val(rval);"></div>
                  </div>
                  <input type="button" value="<?php echo $button_cart; ?>" class="button" onclick="adaugama('this', '<?php echo $product['product_id'] ?>');" />
                </div>
              </div>
      
            </div>
            <?php } ?> <!-- end foreach -->
        </div> <!-- end of product list div  -->
      </div>

      <!-- PAGINATION -->
      <div class="pagination">
        <?php echo $pagination2; ?>
      </div>

    <?php } ?>

    <?php if (!$categories && !$products) { ?>
      <div class="content">
        <?php echo $text_empty; ?>
      </div>

      <div class="buttons">
        <div class="right">
          <a href="<?php echo $continue; ?>" class="button">
            <?php echo $button_continue; ?>
          </a>
        </div>
      </div>
    <?php } ?>

    <?php echo $content_bottom; ?>
  </div>
</section>
<script type="text/javascript"><!--
/*function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
	
			
			html = '<div class="span3">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="span4">';
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}	
			
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';	
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';			
				
			html += '</div>';
			html += '</div>';
			
			html += '<div class="span2">';
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price span2">' + price  + '</div>';
			}				
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '</div>';				
						
			$(element).html(html);
		});		
		
		$('.display').html('<?php echo $text_display; ?>&nbsp;<img src="catalog/view/theme/sellya/image/icon_list.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" /><a onclick="display(\'grid\');">&nbsp;<img src="catalog/view/theme/sellya/image/icon_grid.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>" /></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
            html += '<div class="pbox">';			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			html += '<div class="description hidden-phone hidden-tablet">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating hidden-phone hidden-tablet">' + rating + '</div>';
			}	
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
						
			//html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<?php echo $text_display; ?>&nbsp;<img src="catalog/view/theme/sellya/image/icon_list.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" onclick="display(\'list\');"/>&nbsp;<img src="catalog/view/theme/sellya/image/icon_grid.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>"/><a onclick="display(\'list\');">');	
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');
if (view) {
	display(view);
} else {
	display('grid');
}*/

$(document).ready(function() {
  $('a.list').on('click', function() {
      $('#list').show(500);
      $('#grid').hide();

  });
  $('a.grid').on('click', function() {
      $('#grid').show(500);
      $('#list').hide();

  });
});

function adaugama(btn, prod_id) {
  var val = $(btn).prevAll('.input-mini').val();
  addToCart(prod_id, val);
} 
//--></script> 

<?php echo $footer; ?>