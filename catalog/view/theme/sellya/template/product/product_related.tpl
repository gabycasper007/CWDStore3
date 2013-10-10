
<?php if ($products) { ?>
  <?php if($this->config->get('sellya_product_related_status')== 1) { ?>  
    <?php if($this->config->get('sellya_product_related_position')== 1) { ?>      
      <div class="desc-title">
         <h2><?php echo $tab_related; ?></h2>
      </div>

      <div class="product-grid es-carousel-wrapper asociate">  
        <div class="es-carousel">        
          <ul>

      	<?php
          $counter = 0;

          foreach ($products as $product) {

        	   if (($counter+4) %4 == 0) 
                $xclass="span-first-child";
        	   else $xclass=""; ?>

              <li class="span-related <?php echo $xclass; ?>">
                <div class="pbox">

                  <?php if ($product['thumb']) { ?>
                    <div class="image">
                      <?php if ($product['special']) { ?>
                        <span class="sale-icon">
                          <?php echo $product['discount']; ?>
                        </span>
                      <?php } ?>

                      <a href="<?php echo $product['href']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                      </a>
                      
                  <?php if ($product['rating']) { ?>
                    <div class="rating hidden-phone hidden-tablet">
                      <img src="catalog/view/theme/sellya/image/stars/stars<?php echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php echo $product['rating']; ?>.png"
                           alt="<?php echo $product['reviews']; ?>"
                      />
                    </div> 
                  <?php } ?>  
                    </div>
                  <?php }

                  else { ?>
                    <div class="image">

                      <?php if ($product['special']) { ?>
                        <span class="sale-icon">
                          <?php echo $product['discount']; ?>
                        </span>
                      <?php } ?>

                      <a href="<?php echo $product['href']; ?>">
                        <img src="catalog/view/theme/sellya/image/no_image-190x190.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                      </a>
                    </div>
                  <?php } ?>

                  <div class="description hidden-phone hidden-tablet">
                    <div class="prod-desc">
                      <?php echo $product['name']; ?>
                    </div>
                  </div>
       
                         
                  <div class="name">
                    <a href="<?php echo $product['href']; ?>">
                      <?php echo $product['name']; ?>
                    </a>
                  </div>
                    <div class="stock-status">
                    <?php echo $product['stock'];

                    if ($product['icon'] == 1) { ?>
                      <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>out-of-stock.png" alt="Out of stock">
                    <?php }

                    elseif ($product['icon'] == 2) { ?>
                      <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>limited-stock.png" alt="Stoc limitat">
                    <?php }

                    else { ?>
                      <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>in-stock.png" alt="In stoc">
                    <?php } ?>

                  </div>
                  <?php if ($product['price']) { ?>
                    <div class="price">

                      <?php if (!$product['special']) {
                        echo $product['price'];
                      }

                      else { ?>
                        <span class="price-old">
                          <?php echo $product['price']; ?>
                        </span>

                        <span class="price-new">
                          <?php echo $product['special']; ?>
                        </span>
                      <?php } ?>

                    </div>
                  <?php } ?>

                  

                  <div class="cart">
                    <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
                  </div>

                </div> <!-- // .pbox -->
              </li> <!-- // .span-related -->
              <?php $counter++; } ?>
            </ul>
            </div> 
          </div><!-- // .product-grid -->
            <?php
          }
        ?>
    <?php
  }
} ?>

<script type="text/javascript">
  $('.product-grid').elastislide({
    speed       : 450,  // animation speed
    easing      : '', // animation easing effect
    // the minimum number of items to show. When we resize the window, this will make sure minItems are always shown (unless of course minItems is higher than the total number of elements)
        minItems  : 1
      });
  //Fix to adjust on windows resize
  $(window).triggerHandler('resize.elastislide');
</script>