<section id="<?php echo $tipmodul; ?>" class="<?php echo $tipmodul; ?>">

<div class="img-modul">
  <?php if ($tipmodul == 'lichidari') { ?>
    <img src="catalog/view/theme/sellya/imgs/sale.jpg" />
  <?php }
  else { ?>
    <img src="catalog/view/theme/sellya/imgs/produse-sigilate.jpg" />
  <?php } ?>

</div>

  <h2> <!-- titlul modulului -->
    <?php echo $heading_title; ?>
  </h2>

  <div class="moduledescr">
    <?php echo $modul_description; ?>
  </div>
  <div class="deosebitehomepage">
    
		<?php foreach ($products as $product) { ?>
      <div class="produsdeosebit">
       <div class="first">
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
         
         <!-- Titlu Produs -->
         <a class="name" href="<?php echo $product['href']; ?>">
           <?php echo $product['name']; ?>
         </a> <!-- // .pbox -->
    
        <div class="prod-descr">
          <?php if ($tipmodul == 'resigilate') { ?>
            <img src="catalog/view/theme/sellya/imgs/ok.jpg" alt="resigilat" title="resigilat">
            <?php echo $product['desc_resigilate']; ?>
          <?php }

          else { ?>
            <img src="catalog/view/theme/sellya/imgs/stoc-epuizat.jpg" alt="resigilat" title="resigilat">
            <?php echo $product['shortdesc']; ?>
          <?php } ?>
        </div>  
          
        
                <!-- Afiseaza Stoc -->
       <!-- <div class="stock-ic">
                
                Stoc Icon
                <?php 
                if ($product['icon'] == 1) { ?>
                  <img src="catalog/view/theme/sellya/imgs/stoc-epuizat.jpg" alt="<?php echo $product['stock']; ?>" title="<?php echo $product['stock']; ?>">
                <?php }
                  
                elseif ($product['icon'] == 2) { ?>
                  <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>limited-stock.png" alt="<?php echo $product['stock']; ?>" title="<?php echo $product['stock']; ?>">
                <?php }
                  
                else { ?>
                  <img src="catalog/view/theme/sellya/imgs/ok.jpg" alt="<?php echo $product['stock']; ?>" title="<?php echo $product['stock']; ?>">
                  
                <?php } ?> 
              </div>
               -->       <!-- // Stoc -->
              
    </div>
    <?php 
      if ($product['special']) {  ?>
        <div class="economie">Economisesti</div>
    <?php } ?>

        <!-- Afiseaza Preturi -->
        <div class="addandprice">
        <?php if ($product['price']) { ?>
          <div class="price">
    
            <?php if (!$product['special']) {
              echo $product['price'];
            }
    
            else { ?>
              <div class="price-old">
                <?php echo $product['diferenta']; ?> <span class="discc">
                   (<?php echo $product['discount']; ?>)
                 </span>
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
        
       <!--  <div id="wishAndCompare" class="comp-wish">
          <div class="compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');">
            <?php echo $button_compare; ?>
          </div>
         
          <div class="wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');">
            <?php echo $button_wishlist; ?>
          </div> -->
        </div>
      </div>
    <?php } ?>

  </div>
</section>