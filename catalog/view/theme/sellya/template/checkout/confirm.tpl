<?php if (!isset($redirect)) { ?>
<div class="checkout-product">


  <div class="row-fluid end-checkout">
    <div class="span4 name"><?php echo $column_name; ?></div>
    <div class="span2 model"><?php echo $column_model; ?></div>
    <div class="span2 quantity"><?php echo $column_quantity; ?></div>
    <div class="span2"><?php echo $column_price; ?></div>
    <div class="span2 total"><?php echo $column_total; ?></div>
  </div>
  
  <div class="row-fluid existing-new-address">
    <?php foreach ($products as $product) { ?>
          <div class="one-row">
            <div class="span4 name">
              <a href="<?php echo $product['href']; ?>">
                <?php echo $product['name']; ?>
              </a>
              <?php foreach ($product['option'] as $option) { ?>
              &nbsp;
              <small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
              <?php } ?>
            </div>
            <div class="span2 model"><?php echo $product['model']; ?></div>
            <div class="span2 quantity"><?php echo $product['quantity']; ?></div>
            <div class="span2"><?php echo $product['price']; ?></div>
            <div class="span2 total"><?php echo $product['total']; ?></div>
           </div>
          <?php } ?>
            
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td class="name"><?php echo $voucher['description']; ?></td>
            <td class="model"></td>
            <td class="quantity">1</td>
            <td class="price"><?php echo $voucher['amount']; ?></td>
            <td class="total"><?php echo $voucher['amount']; ?></td>
          </tr>
          <?php } ?>
        </div>
        
        <div class="row-fluid">
          <div class="span12 end-total">
            <?php foreach ($totals as $total) { ?>
              <div class="name"></div>
              <div class="model"></div>
              <div class="price"></div>
              <div class="o-clasa">
                <div class="quantity"><b><?php echo $total['title']; ?>:</b></div>  
                <div class="total"><?php echo $total['text']; ?></div>
            </div>
            <?php } ?>
          </div>
        </div>



      </div>
      <div class="payment pull-right">
        <?php echo $payment; ?>

<?php } 
else { ?>
</div>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script> 
<?php } ?>