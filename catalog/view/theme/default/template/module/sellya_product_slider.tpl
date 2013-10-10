<div id="wrapMySlider">
    <section id="product-slider">
        <div id="ei-slider" class="ei-slider row">
            <ul class="ei-slider-large">

                <?php foreach ($products as $product) { ?>
            		<li>

                        <?php if ($product['thumb']) { ?>
                            <div class="image">
                                <a href="<?php echo $product['href']; ?>">
                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                </a>
                            </div>
                        <?php } ?>

                        <div class="ei-title">
                            <h2>
                                <a href="<?php echo $product['href']; ?>">
                                    <?php echo $product['name']; ?>
                                </a>
                            </h2>

                            <h3>
                                <a href="<?php echo $product['href']; ?>">
                                    <?php echo $product['description']; ?>
                                </a>
                            </h3>    

                            <?php if ($product['rating']) { ?>
                                <div class="rating">
                                  <img src="catalog/view/theme/sellya/image/stars/fullstars<?php 
                                         echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                                         echo $product['rating']; ?>.png" 
                                       alt="<?php echo $product['reviews']; ?>" 
                                  />
                                </div>
                            <?php } ?>

                            <h4>
                                <a class="slider_price" href="<?php echo $product['href']; ?>">

                                    <?php if (!$product['special']) { ?>

                                        <span class="normprice">
                                            <?php echo $product['intprice']; ?>
                                        </span>

                                        <span class="decimalPrice">
                                            <?php echo $product['decimalprice']; ?>
                                        </span>

                                        <span class="valuta">
                                            <?php echo $product['valuta']; ?>
                                        </span>

                                    <?php } else { 
                                        
                                        if ($product['special'] < $product['price']) { ?>

                                            <div class="sale-icon">
                                                <?php echo $product['discount']; ?>
                                            </div>

                                            <span class="price-old" style="font-size:16px; text-decoration:line-through">
                                                <span class="normprice">
                                                    <?php echo $product['intprice']; ?>
                                                </span>

                                                <span class="decimalPrice">
                                                    <?php echo $product['decimalprice']; ?>
                                                </span>

                                                <span class="valuta">
                                                    <?php echo $product['valuta']; ?>
                                                </span>
                                            </span>
                                        <?php }  ?>    

                                        <span class="price-new">
                                            <?php echo $product['special']; ?>
                                        </span>
                                    <?php } ?>
                                </a>

                                <a href="<?php echo $product['href']; ?>" class="slider_buy">
                                    <?php echo $text_shop_now; ?>
                                </a>
                            </h4>
                        </div>
                    </li>
                <?php } ?>    
            </ul>
            
            <ul class="ei-slider-thumbs">
                <li class="ei-slider-element">Current</li>
                
                <?php foreach ($products as $product) { ?>
            		<li>
                        <a href="#">
                           
                        </a>
                    </li>
                <?php } ?> 
            </ul>
        </div>
    </section>
</div>

<section id="midsection">
  <div class="row-fluid">
        <script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.eislideshow.js"></script>
        <script type="text/javascript">
            $(function() {
                $('#ei-slider').eislideshow({
        			animation			: 'center',
        			autoplay			: true,
        			slideshow_interval	: 3000,
        			titlesFactor		: 0
                });
            });
        </script>
