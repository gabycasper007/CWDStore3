<div class="box">

  <div class="box-heading">
    <h2><?php echo $heading_title; ?></h2>
  </div>

  <div class="box-content">
    <div class="box-product">

      <?php foreach ($products as $product) { ?>
        <div class="l_column">

            <div class="image">
              <a href="<?php echo $product['href']; ?>">

                <?php if ($product['special']) { ?>
                  <div class="sale-icon">
                    <?php echo $product['discount']; ?>
                  </div>
                <?php } ?>

                <?php if ($product['thumb']) { ?>
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                <?php }

                else { ?>
                  <img src="catalog/view/theme/sellya/image/no_image-100x100.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                <?php } ?>
              </a>
            </div>

          <div class="name">
            <a href="<?php echo $product['href']; ?>">
              <?php echo $product['name']; ?>
            </a>
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
                <?php
              } ?>
            </div>
            <?php
          } ?>
          
          <?php if ($product['rating']) { ?>
            <div class="rating">
              <img src="catalog/view/theme/sellya/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
            </div>
          <?php } ?>

          <!--<div class="cart">
            <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
          </div>-->
        </div>
      <?php } ?>

    </div>
  </div>
</div>
