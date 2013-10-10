<div class="row-fluid">
  <?php if ($error_warning) { ?>
    <div class="warning">
      <?php echo $error_warning; ?>
    </div>
  <?php } ?>
</div>
<?php if ($shipping_methods) { ?>
  <div class="row-fluid existing-new-address">
    <p>
      <?php echo $text_shipping_method; ?>
    </p>
  </div>

  <table class="radio">
    <?php foreach ($shipping_methods as $shipping_method) { ?>

      <div class="row-fluid">
        <b>
          <?php echo $shipping_method['title']; ?>
        </b>
      </div>

      <?php 
      if (!$shipping_method['error']) { ?>
        <?php foreach ($shipping_method['quote'] as $quote) { ?>

          <div class="row-fluid highlight">
            <div class="span10">
              <?php 
              if ($quote['code'] == $code || !$code) { ?>
                <?php $code = $quote['code']; ?>
                <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
              <?php } 

              else { ?>
                <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
              <?php } ?>

              <label for="<?php echo $quote['code']; ?>">
                <?php echo $quote['title']; ?>
              </label>
            </div>

            <div class="span2">
              <label for="<?php echo $quote['code']; ?>">
                <span class="pull-right"> <?php echo $quote['text']; ?> </span>
              </label>
            </div>
          </div>
        <?php } ?>

      <?php } 
      else { ?>
      <div class="row-fluid">
        <div class="error">
          <?php echo $shipping_method['error']; ?>
        </div>
      </div>
      <?php } ?>
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
<br />
<br />
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="button" />
  </div>
</div>
