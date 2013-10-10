<?php if ($thumb || $images) { // daca produsul are imagini setate

  if($this->config->get('sellya_product_zoom_type')== 1) { // If Image zoom type: OpenCart

    if ($thumb) { ?>
        <!-- product special icon -->      
        <?php if($special){ ?>
          <span class="sale-icon">
            <?php echo $discount; ?>
          </span>
        <?php } ?>

        <!-- product main image -->
        <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
          <img  id="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
        </a>
    <?php } 

    if ($images) { ?> <!-- product thumbnail images -->
      <div class="image-additional es-carousel-wrapper">
        <div class="es-carousel">
          <ul>
            <?php foreach ($images as $image) { ?>
              <li>
                <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"> 
                  <img width="98" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                </a>
              </li>
            <?php } ?>
          </ul>
        </div>  
      </div>
    <?php }
  } 

  if($this->config->get('sellya_product_zoom_type')== 0) { // If Image zoom type: Cloud Zoom

    if ($thumb) { ?>

        <!-- product special icon -->      
        <?php if($special){ ?>
          <span class="sale-icon">
            <?php echo $discount; ?>
          </span>
        <?php } ?>

        <!-- product main image -->
        <a href="<?php echo $popup; ?>" 
           title="<?php echo $heading_title; ?>" 
           class="cloud-zoom" id='zoom1' 
           rel="adjustX: -1, adjustY:-1, tint:'#ffffff',tintOpacity:0.1, zoomWidth:364"
          >
            <img src="<?php echo $thumb; ?>" 
                title="<?php echo $heading_title; ?>" 
                alt="<?php echo $heading_title; ?>" 
                id="image" 
            />
        </a>
        <div class="zoom-b hidden-phone">
          <a id="zoom-cb" class="colorbox" href="<?php echo $popup; ?>">Zoom</a>        
        </div>

      <?php 
    } ?>

    <!-- product thumbnail images -->
    <?php if ($images) { ?>
      <div class="image-additional es-carousel-wrapper">
        <div class="es-carousel">
          <ul>

            <li>
              <a href='<?php echo $popup; ?>' 
                 title='<?php echo $heading_title; ?>' 
                 class='cloud-zoom-gallery' 
                 rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' "
              >
                <img src="<?php echo $thumb; ?>"
                     width="98" 
                     title="<?php echo $heading_title; ?>" 
                     alt = "<?php echo $heading_title; ?>"
                />
              </a>  
            </li>
            
            <?php foreach ($images as $image) { ?>
              <li>
                <a href="<?php echo $image['popup']; ?>" 
                   title="<?php echo $heading_title; ?>" 
                   class="cloud-zoom-gallery" 
                   rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' "
                >
                    <img src="<?php echo $image['thumb']; ?>" 
                         width="98" 
                         title="<?php echo $heading_title; ?>" 
                         alt="<?php echo $heading_title; ?>" 
                  />
                </a>
              </li>
            <?php } ?>
          </ul>
        </div>  
      </div>
      <?php 
    } 
  }
} ?>

<!-- no product images -->
<?php if ($thumb == '') { 

  // product special icon
  if($special){ ?>
    <span class="sale-icon">
      <?php echo $discount; ?>
    </span>
  <?php } ?> 
  
  <!-- product no-image image --> 
  <img src="catalog/view/theme/sellya/image/no_image-308x308.png" />
<?php } ?>