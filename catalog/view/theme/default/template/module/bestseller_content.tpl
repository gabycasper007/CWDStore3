<section id="bestseller" class="bestseller span">

  <h2>
    <?php echo $heading_title; ?>
  </h2>

  <?php if($this->config->get('sellya_homepage_bestseller_status')== 0) { ?>
    <div class="box-content hidden-phone">
      <div class="box-product row-fluid">

  	   <?php 
       $counter = 0; 
       foreach ($products as $product) { 
  		  if (($counter+4) %4 == 0) 
          $xclass="span-first-child";
  		  else 
          $xclass=""; 
        ?>    
        <div class="span3  <?php echo $xclass; ?>">
          <div class="pbox">

            <?php if ($product['thumb']) { ?>
              <div class="image">

                <?php if ($product['special']) { ?>
                  <span class="sale-icon">
                    <?php echo $product['discount']; ?>
                  </span>
                <?php } ?>

                <a href="<?php echo $product['href']; ?>">
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                </a>
              </div>

              <?php } else { ?>
                <div class="image">

                  <?php if ($product['special']) { ?>
                    <div class="sale-icon">
                      <?php echo $product['discount']; ?>
                    </div>
                  <?php } ?>

                  <a href="<?php echo $product['href']; ?>">
                    <img src="catalog/view/theme/sellya/image/no_image-190x190.png" 
                         title="<?php echo $product['name']; ?>" 
                         alt="<?php echo $product['name']; ?>" 
                    />
                  </a>
                </div>        
              <?php } ?>
          
              <div class="description hidden-phone hidden-tablet">
                <div class="cart">
                  <input type="button" 
                         value="<?php echo $button_cart; ?>"
                         onclick="addToCart('<?php echo $product['product_id']; ?>');"
                         class="button"
                  />
                </div>
                <div class="see_details">
                  <a type="button" class="button" href="<?php echo $product['href']; ?>"></a>
                </div>
              </div>
          
              <?php if ($product['rating']) { ?>
                <div class="rating hidden-phone hidden-tablet">
                  <img src="catalog/view/theme/sellya/image/stars/stars<?php 
                         echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                         echo $product['rating']; ?>.png" 
                       alt="<?php echo $product['reviews']; ?>" 
                  />
                </div>

              <?php } else { ?>
                <div class="rating hidden-phone hidden-tablet">
                  &nbsp;
                </div>      
              <?php } ?>           
            
              <div class="name">
                <a href="<?php echo $product['href']; ?>">
                  <?php echo $product['name']; ?>
                </a>
                <div class="prod-descr">
                  <?php echo $product['shortdesc']; ?>
                </div>                
              </div>


              <?php if ($product['price']) { ?>
                <div class="price">

                  <?php if (!$product['special']) { 
                    echo $product['price'];

                  } else { ?>
                    <span class="price-old">
                      <?php echo $product['price']; ?>
                    </span>
                    <span class="price-new">
                      <?php echo $product['special']; ?>
                    </span>
                  <?php } ?>

                </div>
              <?php } ?>

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
          <?php $counter++; 
        } ?>

      </div>
    </div>

    <div class="box-content visible-phone">
      <div class="box-product row-fluid">

    	  <?php 
          $counter = 0; 
          foreach ($products as $product) { 
      		 if (($counter+2) %2 == 0) 
            $xclass="span-first-child";
      		 else 
            $xclass=""; 
          ?>    
          
          <div class="span3  <?php echo $xclass; ?>">
            <div class="pbox">

              <?php if ($product['thumb']) { ?>
                <div class="image">

                  <?php if ($product['special']) { ?>
                    <span class="sale-icon">
                      <?php echo $product['discount']; ?>
                    </span>
                  <?php } ?>

                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                  </a>
                </div>

                <?php } else { ?>
                  <div class="image">

                    <?php if ($product['special']) { ?>
                      <span class="sale-icon">
                        <?php echo $product['discount']; ?>
                      </span>
                    <?php } ?>

                    <a href="<?php echo $product['href']; ?>">
                      <img src="catalog/view/theme/sellya/image/no_image-190x190.png" 
                           title="<?php echo $product['name']; ?>" 
                           alt="<?php echo $product['name']; ?>" 
                      />
                    </a>
                  </div>        
                <?php } ?>

                <div class="name">
                  <a href="<?php echo $product['href']; ?>">
                    <?php echo $product['name']; ?>
                  </a>
                  <div class="prod-descr">
                    <?php echo $product['shortdesc']; ?>
                  </div>                  
                </div>

                <?php if ($product['price']) { ?>
                  <div class="price">

                    <?php if (!$product['special']) { 
                      echo $product['price']; 

                    } else { ?>
                      <span class="price-old">
                        <?php echo $product['price']; ?>
                      </span>
                      <span class="price-new">
                        <?php echo $product['special']; ?>
                      </span>
                    <?php } ?>

                  </div>
              <?php } ?>
            
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
          <?php $counter++; 
        } ?>

      </div>
    </div>  

  <?php } ?> 

  <?php if($this->config->get('sellya_homepage_bestseller_status')== 1) { ?>
    <div id="carousel-bestseller-<?php echo $module; ?>" class="es-carousel-wrapper">
    	<div class="es-carousel">        
    		<ul>
          <?php foreach ($products as $product) { ?>
        		<li>
              <div class="pbox">
                <div class="name">
                  <a href="<?php echo $product['href']; ?>">
                    <?php echo $product['name']; ?>
                  </a>
                </div>
                <?php if ($product['thumb']) { ?>
                  <div class="image">

                    <?php if ($product['special']) { ?>
                      <span class="sale-icon">
                        <?php echo $product['discount']; ?>
                      </span>
                    <?php } ?>

                    <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                    </a>
                  </div>

                <?php } else { ?>
                  <div class="image">

                    <?php if ($product['special']) { ?>
                      <span class="sale-icon">
                        <?php echo $product['discount']; ?>
                      </span>
                    <?php } ?>

                    <a href="<?php echo $product['href']; ?>">
                      <img src="catalog/view/theme/sellya/image/no_image-190x190.png" 
                           title="<?php echo $product['name']; ?>" 
                           alt="<?php echo $product['name']; ?>" 
                      />
                    </a>
                  </div>    
                <?php } ?>

               
                  <div class="see_details">
                    <a type="button" class="button" href="<?php echo $product['href']; ?>"></a>
                  </div>
                </div>
                
                <?php if ($product['rating']) { ?>
                  <div class="rating hidden-phone hidden-tablet">
                    <img src="catalog/view/theme/sellya/image/stars/stars<?php 
                          echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                          echo $product['rating']; ?>.png" 
                         alt="<?php echo $product['reviews']; ?>" 
                    />
                  </div> 

                <?php } else { ?>

                  <div class="rating hidden-phone hidden-tablet">
                    &nbsp;
                  </div>      
                <?php } ?>           
                     
                <div class="descr">
                  <div class="prod-descr">
                    <?php echo $product['shortdesc']; ?>
                  </div>                  
                </div>
                <div class="stock-ic">
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
                  </div>
                <?php if ($product['price']) { ?>
                  <div class="price">

                    <?php if (!$product['special']) {
                      echo $product['price'];
                    } else { ?>

                      <div class="price-old">
                        <?php echo $product['price']; ?>
                      </div>
                      <div class="price-new">
                        <?php echo $product['special']; ?>
                      </div>
                    <?php } ?>

                  </div>
                <?php } ?>
                     <div class="description hidden-phone hidden-tablet">
                      <div class="cart">
                        <input type="button" 
                               value="<?php echo $button_cart; ?>"
                               onclick="addToCart('<?php echo $product['product_id']; ?>');"
                               class="button"
                        />
                      </div>
                       <div id="wishAndCompare" class="comp-wish">
                        
                            <div class="compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');">
                              <?php echo $button_compare; ?>
                            </div>
                           
                            <div class="wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');">
                              <?php echo $button_wishlist; ?>
                            </div>
                        </div>
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
            </li>
          <?php } ?>

    		</ul>
    	</div>
    </div>
  <?php } ?>

</section>

<script type="text/javascript">
	$('#carousel-bestseller-<?php echo $module; ?>').elastislide({
		speed       : 450,	// animation speed
		easing      : '',	// animation easing effect
		// the minimum number of items to show. When we resize the window, this will make sure minItems are always shown (unless of course minItems is higher than the total number of elements)
				minItems	: 1
			});
	//Fix to adjust on windows resize
	$(window).triggerHandler('resize.elastislide');
</script>