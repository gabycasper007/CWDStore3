<?php echo $header; ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

  <div id="content-home" class="span9">
    <?php echo $content_top; ?>
  </div>
</div>
<div id="homeContentBottom">
  <?php echo $content_bottom; ?>
</div>

<?php //if ($this->config->get('sellya_homepage_brands_wall_status') == "1"): ?>
<!--   <section id="homepage-brands-wall">
  <div class="box-content">
    <div class="box-manufacturers-home row-fluid">

      <?php if ($manufacturers) { ?>
        <?php
        $counter = 0;
        foreach ($manufacturers as $manufacturer) { 

          if (($counter+$this->config->get('sellya_homepage_brands_wall_per_row')) %$this->config->get('sellya_homepage_brands_wall_per_row') == 0) $xclass="span-first-child";
          else $xclass=""; ?>

            <?php if($this->config->get('sellya_homepage_brands_wall_per_row') == 6) { ?>   
              <div class="span2 <?php echo $xclass; ?>">
            <?php } ?> 

            <?php if($this->config->get('sellya_homepage_brands_wall_per_row') == 4) { ?>   
              <div class="span3 <?php echo $xclass; ?>">
            <?php } ?> 

                <?php if($this->config->get('sellya_homepage_brands_wall_style') == "1") { ?>           
                  <div class="image">
                    <a href="<?php echo $manufacturer['href']; ?>">
                      <img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" />
                    </a>
                  </div>
                <?php } ?>

                <?php if($this->config->get('sellya_homepage_brands_wall_style') == "2") { ?>           
                  <div class="name_s">
                    <a href="<?php echo $manufacturer['href']; ?>">
                      <?php echo $manufacturer['name']; ?>
                    </a>
                  </div>
                <?php } ?>

                <?php if($this->config->get('sellya_homepage_brands_wall_style') == "3") { ?>           
                  <div class="image">
                    <a href="<?php echo $manufacturer['href']; ?>">
                      <img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" />
                    </a>
                  </div>

                  <div class="name">
                    <a href="<?php echo $manufacturer['href']; ?>">
                      <?php echo $manufacturer['name']; ?>
                    </a>
                  </div>
                <?php } ?>

              </div>
            <?php 
        $counter++; 
        } ?>
      <?php } ?>

    </div>
  </div>
</section> -->
<?php //endif; ?> 

<?php echo $footer; ?>