<div id="cart">

  <div class="heading">
    <!-- contul tau -->
    <h5><?php echo $heading_title; ?></h5>

    <!-- number of products in cart -->
    <div class="items2">
      <?php echo $text_items; ?>
    </div>
  </div>

  <div class="content">
    <div class="arroww2"><img src="catalog/view/theme/sellya/image/sagetica.png"/></div>

    <!-- daca sunt produse sau vouchere in cart -->
    <?php if ($products || $vouchers) { ?>
      <div class="mini-cart-info">
        <table>

          <!-- afiseaza produsele din cart -->
          <?php foreach ($products as $product) { ?>
            <tr>

              <!-- imagine produs -->
              <td class="image">
                <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                  </a>
                <?php } ?>
              </td>

              <!-- nume produs -->
              <td class="name">
                <a href="<?php echo $product['href']; ?>">
                  <?php echo $product['name']; ?>
                </a>

                <!-- optiuni alese pe produsul respectiv -->
                <div>
                  <?php foreach ($product['option'] as $option) { ?>
                    <div>
                      - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                    </div>
                    <?php } ?>
                </div>
              </td>

              <!-- cantitate produs -->
              <td class="quantity">
                <?php echo $product['quantity']; ?>x
              </td>

              <!-- total produs -->
              <td class="total">
                <?php echo $product['total']; ?>
              </td>

              <!-- sterge produs -->
              <td class="remove">
                <img src="catalog/view/theme/sellya/image/remove-small.png" 
                     alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" 
                     onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" 
                />
              </td>
            </tr>
          <?php } ?>

          <!-- afiseaza vouchere -->
          <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="image"></td>
              <td class="quantity">x1</td>

              <!-- nume voucher -->
              <td class="name">
                <?php echo $voucher['description']; ?>
              </td>

              <!-- total voucher -->
              <td class="total">
                <?php echo $voucher['amount']; ?>
              </td>

              <!-- sterge voucher -->
              <td class="remove">
                <img src="catalog/view/theme/sellya/image/remove-small.png" 
                     alt="<?php echo $button_remove; ?>"
                     title="<?php echo $button_remove; ?>"
                     onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');"
                />
              </td>
            </tr>
          <?php } ?>

        </table>
      </div>

      <!-- afiseaza totaluri, subtotaluri -->
      <div class="mini-cart-total">
 
          <table>
            <div class="btn-checkout">
              <a href="<?php echo $cart; ?>" class="button"><?php echo $text_checkout; ?></a>
             <div class="sbtotal">
              <?php foreach ($totals as $total) { ?>
              <tr>

                <!-- titlu total -->
                <td align="right">
                  <?php echo $total['title']; ?>
                </td>

                <!-- pret total -->
                <td align="right">
                  <?php echo $total['text']; ?>
                </td>
              </tr>
            <?php } ?>
             </div>
          </table>
      </div>

    <!-- cosul este gol -->
    <?php } else { ?>
      <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>

  </div>
</div>
