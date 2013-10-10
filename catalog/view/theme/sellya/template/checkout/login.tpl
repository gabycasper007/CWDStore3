<div class="row-fluid">


  <!-- <p><?php echo $text_checkout; ?></p> -->
<div class="span4">

  <h2 class="clients">
    <?php echo $text_new_customer; ?>
  </h2>

  <label for="register">
    <?php 
    if ($account == 'register') { ?>
      <input type="radio" name="account" value="register" id="register" checked="checked" />
    <?php } 

    else { ?>
      <input type="radio" name="account" value="register" id="register" />
    <?php } ?>

    <b>
      <?php echo $text_register; ?>
    </b>
  </label>

  <?php if ($guest_checkout) { ?>
    <label for="guest">
      <?php 
      if ($account == 'guest') { ?>
        <input type="radio" name="account" value="guest" id="guest" checked="checked" />
      <?php } 

      else { ?>
        <input type="radio" name="account" value="guest" id="guest" />
      <?php } ?>

      <b>
      <?php echo $text_guest; ?>
      </b>
    </label>
  <?php } ?> 

  <p>
    <?php echo $text_register_account; ?>
  </p>

  <input type="button" value="<?php echo $button_continue; ?>" id="button-account" class="button" />
</div>   
  


  <div class="span6 offset2">

    <h2 class="clients">
      <?php echo $text_returning_customer; ?>
    </h2>
    <!-- <p><?php echo $text_i_am_returning_customer; ?></p> -->
    <div class="row-fluid custom-inputs">
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" />
    </div>
    <div class="row-fluid custom-inputs">
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" />
    </div>
    <div class="row-fluid">
      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
    </div>

    <input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button" />
    
  </div>

</div>