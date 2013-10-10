 <section id="product-information">

  <div id="tabs" class="htabs">

    <?php if ($product_tabs_1) { ?>
      <?php foreach($product_tabs_1 as $product_tab_1) { ?>
        <a href="#tab-product-tab<?php echo $product_tab_1['tab_id'];?>"><?php echo $product_tab_1['name']; ?></a>
      <?php } ?>
    <?php } ?>

    <a href="#tab-description"><?php echo $tab_description; ?></a>

    <?php if ($product_tabs_2) { ?>
      <?php foreach($product_tabs_2 as $product_tab_2) { ?>
        <a href="#tab-product-tab<?php echo $product_tab_2['tab_id'];?>"><?php echo $product_tab_2['name']; ?></a>
      <?php } ?>
    <?php } ?>

    <?php 
      $i = 0;  
      foreach ($informations as $information) { 
        if (++$i == 7) {  ?>  
        <a href="#tab-delivery"><?php echo $information['title']; ?></a>
      <?php }
    } ?>

    <?php if ($product_tabs_3) { ?>
      <?php foreach($product_tabs_3 as $product_tab_3) { ?>
        <a href="#tab-product-tab<?php echo $product_tab_3['tab_id'];?>"><?php echo $product_tab_3['name']; ?></a>
      <?php } ?>
    <?php } ?>    

    <?php if ($attribute_groups) { ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>

    <?php if ($product_tabs_4) { ?>
      <?php foreach($product_tabs_4 as $product_tab_4) { ?>
        <a href="#tab-product-tab<?php echo $product_tab_4['tab_id'];?>"><?php echo $product_tab_4['name']; ?></a>
      <?php } ?>
    <?php } ?>

    <?php if ($review_status) { ?>
      <a href="#tab-review"><?php echo $tab_review; ?></a>
      <?php } ?>
      <?php if($this->config->get('sellya_product_custom_tab_status')== 1) { ?>
      <?php if($this->config->get('sellya_product_custom_tab_content') != '') { ?>    
      <a href="#tab-custom"><?php echo $this->config->get('sellya_product_custom_tab_title'); ?></a>
      <?php } ?>
    <?php } ?>   

    <?php if ($product_tabs_5) { ?>
      <?php foreach($product_tabs_5 as $product_tab_5) { ?>
        <a href="#tab-product-tab<?php echo $product_tab_5['tab_id'];?>"><?php echo $product_tab_5['name']; ?></a>
      <?php } ?>
    <?php } ?> 

  </div>


  <?php if ($product_tabs_1) { ?>
    <?php foreach($product_tabs_1 as $product_tab_1) { ?>
      <div id="tab-product-tab<?php echo $product_tab_1['tab_id'];?>" class="tab-content"><?php echo $product_tab_1['text']; ?></div>
    <?php } ?>
  <?php } ?>

  <div id="tab-description" class="tab-content" style="display:block">
    <article id="<?php echo $heading_title; ?>"><?php echo $description; ?></article>
  </div>

  <?php if ($product_tabs_2) { ?>
    <?php foreach($product_tabs_2 as $product_tab_2) { ?>
      <div id="tab-product-tab<?php echo $product_tab_2['tab_id'];?>" class="tab-content"><?php echo $product_tab_2['text']; ?></div>
    <?php } ?>
  <?php } ?>  
  
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content" style="display:block">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>

  <?php if ($product_tabs_3) { ?>
    <?php foreach($product_tabs_3 as $product_tab_3) { ?>
      <div id="tab-product-tab<?php echo $product_tab_3['tab_id'];?>" class="tab-content"><?php echo $product_tab_3['text']; ?></div>
    <?php } ?>
  <?php } ?>  

  <div id="tab-delivery" class="tab-content">
    <?php 
      $i = 0;  
      foreach ($informations as $information) { 
        if (++$i == 7) { 
          echo $deliverydescription;
        }
    } ?> 
  </div>

  <?php if ($product_tabs_4) { ?>
    <?php foreach($product_tabs_4 as $product_tab_4) { ?>
      <div id="tab-product-tab<?php echo $product_tab_4['tab_id'];?>" class="tab-content"><?php echo $product_tab_4['text']; ?></div>
    <?php } ?>
  <?php } ?>

  <?php if ($review_status) { ?>
    <div id="tab-review" class="tab-content" style="display:block">
      <article id="review"></article>
      <h2 id="review-title"><?php echo $text_write; ?></h2>
           
          <?php if ($reviews) {
          foreach ($reviews as $review) { ?>
                    <div class="content">
                      <div class="reviews-left">
                <b><?php echo $review['author']; ?></b>
                            <img src="catalog/view/theme/sellya/image/stars/stars<?php 
                                echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
                                echo $review['rating'] . '.png'; ?>"
                               alt="<?php echo $review['reviews']; ?>" />
                        <span class="morerev">
                          <?php echo $review['reviews'] ?>
                    </span>
                       <span>(<?php echo $review['date_added']; ?>)</span>
                      </div>
                    <div class="reviews-right">
                        <div class="review-arrow"></div>
                        <?php echo $review['text']; ?>
                      </div>
                    </div>

                  <?php } ?>

                  <div class="pagination">
                    <?php echo $pagination; ?>
                  </div>
                <?php }

                else { ?>
                  <div class="content">
                    <?php echo $text_no_reviews; ?>
            </div>
      <?php } ?>


      <b><?php echo $entry_name; ?></b><br />
      <input type="text" name="name" value="" />
      <br />
      <br />
      <b><?php echo $entry_review; ?></b>
      <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
      <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
      <br />
      <b><?php echo $entry_rating; ?></b> &nbsp;&nbsp;&nbsp;<span><?php echo $entry_bad; ?></span>&nbsp;
      <input type="radio" name="rating" value="1" />
      &nbsp;
      <input type="radio" name="rating" value="2" />
      &nbsp;
      <input type="radio" name="rating" value="3" />
      &nbsp;
      <input type="radio" name="rating" value="4" />
      &nbsp;
      <input type="radio" name="rating" value="5" />
      &nbsp; <span><?php echo $entry_good; ?></span><br />
      <br />
      <b><?php echo $entry_captcha; ?></b><br />
      <input type="text" name="captcha" value="" />
      <br /><br />
      <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
      <br />
      <div class="buttons">
        <div class="pull-right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
      </div>
    </div>
    <?php } ?>

    <?php if ($product_tabs_5) { ?>
      <?php foreach($product_tabs_5 as $product_tab_5) { ?>
        <div id="tab-product-tab<?php echo $product_tab_5['tab_id'];?>" class="tab-content"><?php echo $product_tab_5['text']; ?></div>
      <?php } ?>
    <?php } ?>    
    
    <?php if($this->config->get('sellya_product_custom_tab_status')== 1) { ?> 
    <?php if($this->config->get('sellya_product_custom_tab_content') != '') { ?>
    <div id="tab-custom" class="tab-content" style="display:block">
    <?php echo htmlspecialchars_decode($this->config->get('sellya_product_custom_tab_content')); ?>
    </div>
  <?php } ?>
<?php } ?>  
</section>  
  