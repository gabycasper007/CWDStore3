<?php echo $header; ?>
<?php require($showbreadcrumbs); ?>

<div class="row-fluid">
  <?php echo $column_left; ?>
  <?php echo $column_right; ?>

  <div id="content" class="span9">
    <div class="row-fluid">
      
      <?php echo $content_top; ?>

      <h2><?php echo $heading_title; ?></h2>

      <?php if ($categories) { ?>

        <?php echo $text_index; ?>
        <?php foreach ($categories as $category) { ?>
          <a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>">
            <?php echo $category['name']; ?>
          </a>
        <?php } ?>

        <?php foreach ($categories as $category) { ?>

          <div class="manufacturer-list">
            <div class="manufacturer-heading">
              <?php echo $category['name']; ?>
              <a id="<?php echo $category['name']; ?>"></a>
            </div>

            <div class="manufacturer-content">
              <?php if ($category['manufacturer']) { ?>
                <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>

                  <ul>
                    <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>

                      <?php for (; $i < $j; $i++) { ?>

                        <?php if (isset($category['manufacturer'][$i])) { ?>
                          <li>
                            <div>
                              <?php echo $category['manufacturer'][$i]['name']; ?> 
                              <?php echo $category['manufacturer'][$i]['total'] ?>
                            </div>
                            
                            <a href="<?php echo $category['manufacturer'][$i]['href']; ?>">
                              <img src="<?php echo $category['manufacturer'][$i]['thumb']; ?>" alt="<?php echo $category['manufacturer'][$i]['name']; ?>">
                            </a>
                          </li>
                        <?php } ?>

                    <?php } ?>
                  </ul>
                <?php } ?>
              <?php } ?>
            </div>
          </div>

        <?php } ?>
      <?php }

      else { ?>
        <div class="content">
          <?php echo $text_empty; ?>
        </div>

        <div class="buttons">
          <div class="right">
            <a href="<?php echo $continue; ?>" class="button">
              <?php echo $button_continue; ?>
            </a>
          </div>
        </div>

      <?php } ?>

      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>

<?php echo $footer; ?>