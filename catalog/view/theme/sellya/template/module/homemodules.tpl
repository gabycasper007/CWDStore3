<section id="<?php echo $tipmodul; ?>" class="clearfix <?php echo $tipmodul; ?>">

  <h2> <!-- titlul modulului -->
    <?php echo $heading_title; ?>
  </h2>

  <div class="modulhomepage <?php if ( $this->config->get('sellya_homepage_bestseller_status') == 1) echo 'es-carousel-wrapper';
    else echo 'modulfaracarusel'; ?>">

  	<?php if ( $this->config->get('sellya_homepage_bestseller_status') == 1) { ?>
      <div class="es-carousel">        
    <?php } ?>

  		<ul>

        <?php foreach ($products as $product) { ?>
      		<li>
            <div class="pbox">

              <!-- Titlu Produs -->
              <a class="name" href="<?php echo $product['href']; ?>">
                <?php echo $product['name']; ?>
              </a>

              <div class="image">

                <a href="<?php echo $product['href']; ?>">

                  <!-- Rating -->
                  <?php if ($product['rating']) { ?>
                    <div class="rating">
                      <img src="catalog/view/theme/sellya/image/stars/stars<?php 
                        echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                        echo $product['rating']; ?>.png" 
                        alt="<?php echo $product['reviews']; ?>" 
                      />
                    </div> 
                   <?php } ?> 


                  <!-- Afiseaza Promo Labels -->
                    <?php if ($tipmodul == 'latest') { ?>
                      <div class="new-product">
                        nou
                      </div>
                    <?php } ?>

                    <?php if ($tipmodul == 'featured') { ?>
                      <div class="promo-icon">
                        promo
                      </div>
                    <?php } ?>
                  
                    <?php if ($product['special']) { ?>

                      <span class="sale-icon">
                        <?php echo $product['discount']; ?>
                      </span>
                    <?php } ?>
                  <!-- Promo Labels -->  

                  <?php if ($product['thumb']) { ?>
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />

                  <?php } else { ?>
                    <img src="catalog/view/theme/sellya/image/no_image-190x190.png" 
                         title="<?php echo $product['name']; ?>" 
                         alt="<?php echo $product['name']; ?>" 
                    />
                  <?php } ?>
                </a>
              </div> <!-- // .image -->  

            </div> <!-- // .pbox -->
                   
            <div class="prod-descr">
              <?php echo $product['shortdesc']; ?>
            </div>                

            <!-- Afiseaza Stoc -->
            <div class="stock-ic">
              <?php echo $product['stock']; ?>
              <!-- Stoc Icon -->
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
            <!-- // Stoc -->

            <!-- Afiseaza Preturi -->
            <?php if ($product['price']) { ?>
              <div class="price">

                <?php if (!$product['special']) {
                  echo $product['price'];
                }

                else { ?>
                  <div class="price-old">
                    <?php echo $product['price']; ?>
                  </div>
                  <div class="price-new">
                    <?php echo $product['special']; ?>
                  </div>
                <?php } ?>

              </div>
            <?php } ?>
            <!-- // Preturi -->

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
          </li>
        <?php } ?>

  		</ul>

  	<?php if ( $this->config->get('sellya_homepage_bestseller_status') == 1) { ?>
      </div> <!-- // .es-carousel -->
    <?php } ?>

  </div>
</section>