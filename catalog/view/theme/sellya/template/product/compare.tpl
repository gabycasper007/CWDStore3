<?php echo $header; ?>
<?php require($showbreadcrumbs); ?> 

<?php if ($success) { ?>
  <div class="success">
    <?php echo $success; ?>
    <img src="catalog/view/theme/sellya/image/close.png" alt="" class="close" />
  </div>
<?php } ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span12">
  <div class="row-fluid">

    <?php echo $content_top; ?>

    <header>
      <h1>
        <?php echo $heading_title; ?>
      </h1>
    </header>

    <?php if ($products) { ?>

      <div id="compare-content">
        <table class="compare-info table table-adjust">

          <thead>
            <tr>
              <td class="compare-product" colspan="<?php echo count($products) + 1; ?>">
                <?php echo $text_product; ?>
              </td>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>
                <?php echo $text_name; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td class="name">
                  <a href="<?php echo $products[$product['product_id']]['href']; ?>">
                    <?php echo $products[$product['product_id']]['name']; ?>
                  </a>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_image; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <div class="compareImage">
                    <?php if ($products[$product['product_id']]['thumb']) { ?>
                      <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                    <?php } ?>

                    <?php if ($products[$product['product_id']]['special']) { ?>
                      <span class="sale-icon">
                        <?php echo $products[$product['product_id']]['discount']; ?>
                      </span>
                    <?php } ?>
                  </div>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_price; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <?php if ($products[$product['product_id']]['price']) {
                    if (!$products[$product['product_id']]['special']) {
                      echo $products[$product['product_id']]['price'];
                    }

                    else { ?>
                      <span class="price-old">
                        <?php echo $products[$product['product_id']]['price']; ?>
                      </span>

                      <span class="price-new">
                        <?php echo $products[$product['product_id']]['special']; ?>
                      </span>
                    <?php } ?>
                  <?php } ?>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_model; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <?php echo $products[$product['product_id']]['model']; ?>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_manufacturer; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <?php echo $products[$product['product_id']]['manufacturer']; ?>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_availability; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <?php echo $products[$product['product_id']]['stock'];

                  if ($products[$product['product_id']]['icon'] == 1) { ?>
                      <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>out-of-stock.png" alt="Out of stock">
                    <?php }

                    elseif ($products[$product['product_id']]['icon'] == 2) { ?>
                      <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>limited-stock.png" alt="Stoc limitat">
                    <?php }

                    else { ?>
                      <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>in-stock.png" alt="In stoc">
                    <?php } ?>
                </td>
              <?php } ?>
            </tr>

            <?php if ($review_status) { ?>
              <tr>
                <td>
                  <?php echo $text_rating; ?>
                </td>

                <?php foreach ($products as $product) { ?>
                  <td>
                    <img src="catalog/view/theme/sellya/image/stars/stars<?php echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" />
                    <br />
                    <?php echo $products[$product['product_id']]['reviews']; ?>
                  </td>
                <?php } ?>
              </tr>
            <?php } ?>

            <tr>
              <td>
                <?php echo $text_summary; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td class="description">
                  <?php echo $products[$product['product_id']]['description']; ?>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_weight; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <?php echo $products[$product['product_id']]['weight']; ?>
                </td>
              <?php } ?>
            </tr>

            <tr>
              <td>
                <?php echo $text_dimension; ?>
              </td>

              <?php foreach ($products as $product) { ?>
                <td>
                  <?php echo $products[$product['product_id']]['length']; ?>
                  x
                  <?php echo $products[$product['product_id']]['width']; ?>
                  x
                  <?php echo $products[$product['product_id']]['height']; ?>
                </td>
              <?php } ?>
            </tr>
          </tbody>

          <?php foreach ($attribute_groups as $attribute_group) { ?>
            <thead>
              <tr>
                <td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>">
                  <?php echo $attribute_group['name']; ?>
                </td>
              </tr>
            </thead>

            <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
              <tbody>
                <tr>
                  <td>
                    <?php echo $attribute['name']; ?>
                  </td>

                  <?php foreach ($products as $product) { ?>
                    <td>
                      <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                          <?php echo $products[$product['product_id']]['attribute'][$key]; ?>
                      <?php } ?>
                    </td>
                  <?php } ?>

                </tr>
              </tbody>
            <?php } ?>
          <?php } ?>

          <tr>
            <td></td>
            <?php foreach ($products as $product) { ?>
              <td>
                <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button-exclusive" />
              </td>
            <?php } ?>
          </tr>

          <tr>
            <td></td>
            <?php foreach ($products as $product) { ?>
              <td class="remove">
                <a href="<?php echo $product['remove']; ?>" class="button">
                  <?php echo $button_remove; ?>
                </a>
              </td>
            <?php } ?>
          </tr>

        </table>
      </div>
    
      <div class="buttons">
        <div class="right">
          <a href="<?php echo $continue; ?>" class="button">
            <?php echo $button_continue; ?>
          </a>
        </div>
      </div>
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

<?php echo $footer; ?>