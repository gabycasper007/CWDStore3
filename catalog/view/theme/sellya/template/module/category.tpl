
<?php if($this->config->get('sellya_left_right_column_categories_type')== 1) { ?> <!-- opencart type menu -->
  <div class="boxMenu">

    <div class="box-heading">
      <h2><?php echo $heading_title; ?></h2>
    </div>

    <div class="boxMenuContent">
      <div class="box-category">

        <ul>
          <?php foreach ($categories as $category) { ?>

          <li>
            <a href="<?php echo $category['href']; ?>" <?php if ($category['category_id'] == $category_id) { echo 'class="active"'; }?>>
              <?php if ($category['icon_image']) { ?><img src="<?php echo $category['icon_image']; ?>" alt="<?php echo $category['name']; ?>"> <?php } ?>
              <?php echo $category['name']; ?>
            </a>

            <?php if ($category['children']) { ?>
              <ul>

                <?php foreach ($category['children'] as $child) { ?>
                  <li>
                      <a href="<?php echo $child['href']; ?>" <?php if ($child['category_id'] == $child_id) { echo 'class="active"'; } ?>>
                        <?php echo $child['name']; ?>
                      </a>
                  </li>
                <?php } ?>

              </ul>
            <?php } ?>

          </li>

          <?php } ?>
        </ul>

      </div>
    </div>
  </div>
<?php } ?>

<?php if($this->config->get('sellya_left_right_column_categories_type')== 0) { ?> <!-- accordition type menu -->
  <div class="categ">

    <div class="box-heading">
      <h2>
        <?php echo $heading_title; ?>
        <img src="catalog/view/theme/sellya/imgs/arrow-down.png" alt="arrow-down" title="arrow-down">
      </h2>
    </div>

    <div class="box-content">
      <div class="box-category">

        <ul class="accordion"  id="accordion-1">

          <?php foreach ($categories as $category) { ?>
            <li>

              <?php if ($category['category_id'] == $category_id) { ?>
                <a href="<?php echo $category['href']; ?>" class="active">

                  <?php if ($category['icon_image']) { ?>
                    <img src="<?php echo $category['icon_image']; ?>" alt="<?php echo $category['name']; ?>">
                  <?php } ?>

                  <?php echo $category['name']; ?>
                </a>

                <div class="dcjq-icon"></div>

              <?php } 
              
              else { ?>
                <a href="<?php echo $category['href']; ?>">

                  <?php if ($category['icon_image']) { ?>
                    <img src="<?php echo $category['icon_image']; ?>" alt="<?php echo $category['name']; ?>">
                  <?php } ?>

                  <?php echo $category['name']; ?>
                </a>

                <div class="dcjq-icon"></div>
              <?php } ?>

              <?php if ($category['children']) { ?>
                <ul>

                  <?php foreach ($category['children'] as $child) { ?>
                    <li>
                      
                        <a href="<?php echo $child['href']; ?>" <?php if ($child['category_id'] == $child_id) { echo 'class="active2"'; } ?>>
                          <div class="left-menu-p"><?php echo $child['name']; ?></div>
                        </a>

                    </li>
                  <?php } ?>

                </ul>
              <?php } ?>
            </li>
          <?php } ?>

        </ul>

      </div>
    </div>
  </div>

  <script type="text/javascript">
    $(document).ready(function() {
      $('#accordion-1').dcAccordion({
        disableLink: false, 
        menuClose: false,
        autoClose: true,
        autoExpand: true,   
        saveState: false
      });
    });
  </script>

<?php } ?>