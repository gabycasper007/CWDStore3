<?php echo $header; ?>

<div class="row-fluid account-heading">
  <h1><?php echo $heading_title; ?></h1>

  <script type="text/javascript">function printDiv(skrivut)
    {var dd=document.getElementById(skrivut).innerHTML,ee=document.body.innerHTML;document.body.innerHTML=dd,window.print(),document.body.innerHTML=ee}
  </script>

  <div class="welcomePop">
    <div class="userimg"></div>
    Bine ai venit, <strong><?php echo $text_logged_s; ?></strong>
  </div>
</div>

    <?php require($showbreadcrumbs); ?>

    <?php echo $column_left; ?>
    <?php echo $column_right; ?>

    <div id="content" class="span9 categorycontent">
      <div class="row-fluid">
        <div id="skrivut">

          <?php echo $content_top; ?>

          <h2><?php echo $heading_title; ?></h2>

          <table class="list">

            <thead>
              <tr>
                <td class="left" colspan="2"><?php echo $text_order_detail; ?></td>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
                  <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
                  <?php } ?>
                  <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
                  <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?>
                </td>

                <td class="left" style="width: 50%;"><?php if ($payment_method) { ?>
                  <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
                  <?php } ?>
                  <?php if ($shipping_method) { ?>
                  <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
                  <?php } ?>
                </td>
              </tr>
            </tbody>

          </table>

          <table class="list">

            <thead>
              <tr>
                <td class="left"><?php echo $text_payment_address; ?></td>

                <?php if ($shipping_address) { ?>
                  <td class="left"><?php echo $text_shipping_address; ?></td>
                <?php } ?>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td class="left"><?php echo $payment_address; ?></td>

                <?php if ($shipping_address) { ?>
                  <td class="left"><?php echo $shipping_address; ?></td>
                <?php } ?>
              </tr>
            </tbody>

          </table>

          <div class="order-i">
            <table class="list">

              <thead>
                <tr>
                  <td class="left name"><?php echo $column_name; ?></td>
                  <td class="left model"><?php echo $column_model; ?></td>
                  <td class="right quantity"><?php echo $column_quantity; ?></td>
                  <td class="right price"><?php echo $column_price; ?></td>
                  <td class="right total"><?php echo $column_total; ?></td>
                  <?php if ($products) { ?>
                  <td style="width: 1px;"></td>
                  <?php } ?>
                </tr>
              </thead>

              <tbody>
                <?php foreach ($products as $product) { ?>
                  <tr>
                    <td class="left name"><?php echo $product['name']; ?>
                      <?php foreach ($product['option'] as $option) { ?>
                        <br />
                        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                      <?php } ?>
                    </td>

                    <td class="left model"><?php echo $product['model']; ?></td>
                    <td class="right quantity"><?php echo $product['quantity']; ?></td>
                    <td class="right price"><?php echo $product['price']; ?></td>
                    <td class="right total"><?php echo $product['total']; ?></td>

                    <td class="right"><a href="<?php echo $product['return']; ?>"><img src="catalog/view/theme/sellya/image/return.png" alt="<?php echo $button_return; ?>" title="<?php echo $button_return; ?>" /></a></td>
                  </tr>
                <?php } ?>

                <?php foreach ($vouchers as $voucher) { ?>
                  <tr>
                    <td class="left name"><?php echo $voucher['description']; ?></td>
                    <td class="left model"></td>
                    <td class="right quantity">1</td>
                    <td class="right price"><?php echo $voucher['amount']; ?></td>
                    <td class="right total"><?php echo $voucher['amount']; ?></td>

                    <?php if ($products) { ?>
                      <td></td>
                    <?php } ?>
                  </tr>
                <?php } ?>

              </tbody>

              <tfoot>
                <?php foreach ($totals as $total) { ?>
                  <tr>
                    <td class="name"></td>
                    <td class="model"></td>
                    <td class="quantity"></td>
                    <td class="right price"><b><?php echo $total['title']; ?>:</b></td>

                    <td class="right total"><?php echo $total['text']; ?></td>
                    <?php if ($products) { ?>
                      <td></td>
                    <?php } ?>
                  </tr>
                <?php } ?>
              </tfoot>
            </table>
          </div>

          <?php if ($comment) { ?>
            <table class="list">
              <thead>
                <tr>
                  <td class="left"><?php echo $text_comment; ?></td>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td class="left"><?php echo $comment; ?></td>
                </tr>
              </tbody>
            </table>
          <?php } ?>

          <?php if ($histories) { ?>
          
            <h2><?php echo $text_history; ?></h2>

            <table class="list">
              <thead>
                <tr>
                  <td class="left"><?php echo $column_date_added; ?></td>
                  <td class="left"><?php echo $column_status; ?></td>
                  <td class="left"><?php echo $column_comment; ?></td>
                </tr>
              </thead>

              <tbody>
                <?php foreach ($histories as $history) { ?>
                  <tr>
                    <td class="left"><?php echo $history['date_added']; ?></td>
                    <td class="left"><?php echo $history['status']; ?></td>
                    <td class="left"><?php echo $history['comment']; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          <?php } ?>

        </div> <!-- skrivut -->
        <div class="buttons">
          <!-- <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div> -->
          <div class="right">
            <a href="javascript:printDiv('skrivut');" class="button" /><span style="color: red;"><?php echo $button_skrivut; ?></a>
            <a href="<?php echo $continue; ?>" class="button"><span style="color: red;"><?php echo $button_continue; ?> </span></a>
          </div>
        </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $footer; ?> 