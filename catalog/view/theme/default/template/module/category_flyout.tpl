<!-- <pre><?php var_dump($categories); ?></pre> -->

<div class="categ">

  <div class="box-heading">
    <h2>
      <?php echo $heading_title; ?> 
      <img src="catalog/view/theme/sellya/imgs/arrow-down.png" alt="arrow-down" title="arrow-down"></img>
      <span class="bigtotal">
        <?php echo $bigtotal; ?>
      </span>
    </h2>
  </div>

  <div class="box-content">
    <div class="box-category">

      <ul class="flyoutmenu"  id="flyoutmenu-1">

        <?php foreach ($categories as $category) { ?>
          <li>

            <?php if ($category['category_id'] == $category_id) { ?>

              <a href="<?php echo $category['href']; ?>" class="active">
                <?php if ($category['icon_image']) { ?><img src="<?php echo $category['icon_image']; ?>" alt="<?php echo $category['name']; ?>"> <?php } ?>
                <?php echo $category['name']; ?>
              </a>

            <?php } 

            else { ?>
<div class="arrow-sub"></div>
              <a href="<?php echo $category['href']; ?>">

                <?php if ($category['icon_image']) { ?>
                  <img src="<?php echo $category['icon_image']; ?>" alt="<?php echo $category['name']; ?>"> 
                <?php } ?>
                

                <?php echo $category['name']; ?> 
               <span class="totalul">
                <?php echo $category['total']; ?> 
               </span>
              </a>

            <?php } ?>

            <?php if ($category['children']) { ?>
              <ul class="children">

                <?php foreach ($category['children'] as $child) { ?>
                  <li class="child">

                      <?php if ($child['thumb']) { ?>
                        <a class="thumb-img " href="<?php echo $child['href']; ?>">
                            <img src="<?php echo $child['thumb'] ?>" alt="<?php echo $child['name']; ?>">
                        </a>
                      <?php } ?>
                    
                      <a href="<?php echo $child['href']; ?>" <?php if ($child['category_id'] == $child_id) { echo 'class="active2"'; } ?>>
                        <div class="left-menu-p">
                          <?php echo $child['name']; ?>
                        </div>
                      </a>


                      <?php if ($child['sub_children']) { ?>
                        <ul class="subkids">

                          <?php foreach ($child['sub_children'] as $kid) { ?>
                            <li class="subkid">
                              
                                <a href="<?php echo $kid['href']; ?>" <?php if ($kid['category_id'] == $sub_child_id) { echo 'class="active2"'; } ?>>
                                  <div class="left-menu-p">
                                    <div class="total2"><?php echo $kid['total']; ?></div>
                                    <span class="nume2"><?php echo $kid['name']; ?></span>
                                  </div>
                                </a>

                                
                              
                            </li>
                          <?php } ?>

                        </ul>
                      <?php } ?>
                    

                  </li>
                <?php } ?>

                  <?php if ($category['promo_image']) { ?>
                        <a class="promo_image-img " href="<?php echo $category['href']; ?>">
                            <img src="<?php echo $category['promo_image'] ?>" alt="<?php echo $category['name']; ?>">
                        </a>
                      <?php } ?>

              </ul>
            <?php } ?>



          </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>