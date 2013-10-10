<?php if ($error_warning) { ?>
  <div class="warning">
    <?php echo $error_warning; ?>
  </div>
<?php } ?>

<?php if ($payment_methods) { ?>
  <div class="row-fluid existing-new-address">
    <p>
      <?php echo $text_payment_method; ?>
    </p>
  </div>

  <table class="radio">
    <?php foreach ($payment_methods as $payment_method) { ?>
      <div class="row-fluid highlight">

        <?php 
        if ($payment_method['code'] == $code || !$code) { ?>
          <?php $code = $payment_method['code']; ?>
          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
        <?php } 

        else { ?>
          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
        <?php } ?>
        <label for="<?php echo $payment_method['code']; ?>">
          <?php echo $payment_method['title']; ?>
        </label>

      </div>
    <?php } ?>
  </table>
  <br />
<?php } ?>

<b>
  <?php echo $text_comments; ?>
</b>
<textarea name="comment" rows="8" style="width: 100%;">
  <?php echo $comment; ?>
</textarea>

<?php if ($text_agree) { ?>
  <div class="row-fluid existing-new-address">
    <?php echo $text_agree; ?>
    <?php 
    if ($agree) { ?>
      <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } 
  
    else { ?>
      <input type="checkbox" name="agree" value="1" />
    <?php } ?>
    <div class="row-fluid">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button" />
    </div>
    <?php }

    else { ?>
      <div class="buttons">
        <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button" />
      </div>
    <?php } ?>
  </div>
  
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 560,
	height: 560
});
//--></script> 