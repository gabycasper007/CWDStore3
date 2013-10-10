<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span12">
	<div class="row-fluid">
		<?php echo $content_top; ?>
		
		<!-- BREADCRUMBS -->
		<?php require($showbreadcrumbs); ?>
		
		<!-- HEADING TITLE -->
		<header>
			<h1>
				<?php echo $heading_title; ?>
			</h1>
		</header>
		
		<!-- PRODUCT FILTER -->
		<?php if ($products) { ?>
		<div class="product-filter">

			<div class="display">
				<?php echo $text_display; ?>&nbsp;
				<img src="catalog/view/theme/sellya/image/icon_list.png" alt="<?php echo $text_list; ?>" title="<?php echo $text_list; ?>" />&nbsp;
				<a onclick="display('grid');">
					<img src="catalog/view/theme/sellya/image/icon_grid.png" alt="<?php echo $text_grid; ?>" title="<?php echo $text_grid; ?>" />
				</a>
			</div>

			<div class="product-compare">
				<a href="<?php echo $compare; ?>" id="compare-total">
					<?php echo $text_compare; ?>
				</a>
			</div>

			<div class="limit"><?php echo $text_limit; ?>
				<select onchange="location = this.value;">
					<?php foreach ($limits as $limits) { ?>

						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected">
							<?php echo $limits['text']; ?>
						</option>

						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>">
							<?php echo $limits['text']; ?>
						</option>
						<?php } ?>

					<?php } ?>
				</select>
			</div>

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

		</div>


		<!-- PRODUCT LIST -->
		<div class="product-list clearfix">
			<?php 

		    foreach ($products as $product) { ?>

		      <div class="row-fluid special-cls">
		        <div class="span3">
		        <?php if ($product['thumb']) { ?>
		          
		          <div class="image">
		            <?php if ($product['special']) { ?>
		              <div class="sale-icon">
		                <?php echo $product['discount']; ?>
		              </div>
		            <?php } ?>

		            <a href="<?php echo $product['href']; ?>">
		              <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
		            </a>
		          </div>

		        <?php }
		          else { ?>
		          <div class="image">
		            <?php if ($product['special']) { ?>
		              <div class="sale-icon">
		                <?php echo $product['discount']; ?>
		              </div>
		            <?php } ?>

		            <a href="<?php echo $product['href']; ?>">
		              <img src="catalog/view/theme/sellya/image/no_image-190x190.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
		            </a>
		          </div>
		        <?php } ?> 

		        <!-- WISHLIST & COMPARE BUTTONS -->
		        <div class="wishlist">
		          <a onclick="addToWishList('<?php echo $product['product_id']; ?>');">
		            <?php echo $button_wishlist; ?>
		          </a>
		        </div>

		        <div class="compare">
		          <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">
		            <?php echo $button_compare; ?>
		          </a>
		        </div>

		        <!-- PRODUCT RATING -->
		        <div class="rating">
		          <?php if ($product['rating']) { ?>
		            <div class="rating">
		              <img src="catalog/view/theme/sellya/image/stars/stars<?php 
		                     echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
		                     echo $product['rating']; ?>.png" 
		                   alt="<?php echo $product['reviews']; ?>" 
		              />
		            </div>
		          <?php } ?>
		        </div>

		        </div>

		        <!-- PRODUCT NAME -->
		        <div class="span7">

		            <div class="name">
		              <a href="<?php echo $product['href']; ?>">
		                <?php echo $product['name']; ?>
		              </a>
		             <!--  <div class="prod-descr">
		                <?php echo $product['shortdesc']; ?>
		              </div> -->
		            </div>

		          <!-- DESCRIPTION -->
		          <div class="description">
		            <?php echo $product['shortdesc']; ?>
		          </div>

		        </div>
		        
		        <!-- PRODUCT PRICE -->
		        <div class="span2">

		          <?php if ($product['price']) { ?>
		            <div class="price">

		              <?php if (!$product['special']) { 
		                echo $product['price']; 

		              } else { ?>

		                <span class="price-new <?php echo $holder_baseprice; ?>">
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
		          
		          <div class="cart of-cart">
		            <div class="quanti2">
		              <div class="edit-cant" onclick="$('#quantimini-<?php echo $product['product_id']; ?>').val(parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())+1);"></div>
		              <input type="text" id="quantimini-<?php echo $product['product_id']; ?>" name="quantity" size="2" class="input-mini" value="<?php echo $product['minimum']; ?>" />
		              <input type="hidden" name="product_id-<?php echo $product['product_id']; ?>" size="2" value="<?php echo $product['product_id']; ?>" />
		              <div class="edit-cant2" onclick="v=parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())-1;if(v>1) rval = v; else rval = 1; $('#quantimini-<?php echo $product['product_id']; ?>').val(rval);"></div>
		            </div>
		            <input type="button" value="<?php echo $button_cart; ?>" class="button" onclick="adaugama(this, <?php echo $product['product_id'] ?>);" />
		          </div>
		        </div>

		    </div>
		    <?php } ?> <!-- end foreach -->

		</div> <!-- end of product list -->


		<div class="pagination">
			<?php echo $pagination; ?>
		</div>

  		<?php } else { ?>
		<div class="content">
			<?php echo $text_empty; ?>
		</div>

		<?php }?>

		<?php echo $content_bottom; ?>
	</div>
</div>

<script type="text/javascript"><!--
/*function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
	
			
			html = '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image span2">' + image + '</div>';
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
			
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
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
//--></script> 
<?php echo $footer; ?>