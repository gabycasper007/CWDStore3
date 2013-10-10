<div class="box-acc">
 <!--  <div class="box-heading"><h2><?php echo $heading_title; ?></h2></div> -->
  <div class="box-content-acc">
  <div class="box-content-account">
    <ul>
      <?php if (!$logged) { ?>
        <li>
          <a <?php if ($current_page == 'login') { echo 'class="selected"';} ?> href="<?php echo $login; ?>"><?php echo $text_login; ?><span class="accountArrow"></span></a>
          <a <?php if ($current_page == 'register') { echo 'class="selected"';} ?> href="<?php echo $register; ?>"><?php echo $text_register; ?><span class="accountArrow"></span></a>
        </li>

        <li>
          <a <?php if ($current_page == 'forgotten') { echo 'class="selected"';} ?> href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?><span class="accountArrow"></span></a>
        </li>
      <?php } ?>

      <li><a <?php if ($current_page == 'your_account') { echo 'class="selected"';} ?> href="<?php echo $account; ?>" href="<?php echo $account; ?>"><?php echo $text_account; ?><span class="accountArrow"></span></a></li>

      <?php if ($logged) { ?>
        <li><a <?php if ($current_page == 'edit') { echo 'class="selected"';} ?> href="<?php echo $edit; ?>"><?php echo $text_edit; ?><span class="accountArrow"></span></a></li>
        <li><a <?php if ($current_page == 'password') { echo 'class="selected"';} ?> href="<?php echo $password; ?>"><?php echo $text_password; ?><span class="accountArrow"></span></a></li>
      <?php } ?>

      <li><a <?php if ($current_page == 'address') { echo 'class="selected"';} ?> href="<?php echo $address; ?>"><?php echo $text_address; ?><span class="accountArrow"></span></a></li>
      <li><a <?php if ($current_page == 'wishlist') { echo 'class="selected"';} ?> href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?><span class="accountArrow"></span></a></li>
      <li><a <?php if ($current_page == 'order') { echo 'class="selected"';} ?> href="<?php echo $order; ?>"><?php echo $text_order; ?><span class="accountArrow"></span></a></li>
      <li><a <?php if ($current_page == 'download') { echo 'class="selected"';} ?> href="<?php echo $download; ?>"><?php echo $text_download; ?><span class="accountArrow"></span></a></li>
      <li><a <?php if ($current_page == 'return') { echo 'class="selected"';} ?> href="<?php echo $return; ?>"><?php echo $text_return; ?><div class="accountArrow"></div></a></li>
      <li><a <?php if ($current_page == 'transaction') { echo 'class="selected"';} ?> href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?><span class="accountArrow"></span></a></li>
      <li><a <?php if ($current_page == 'newsletter') { echo 'class="selected"';} ?> href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?><span class="accountArrow"></span></a></li>

      <?php if ($logged) { ?>
        <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?><span class="accountArrow"></span></a></li>
      <?php } ?>
    </ul>
  </div>    
  </div>
</div>
