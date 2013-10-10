<?php echo $header; ?>
<?php require($showbreadcrumbs); ?>
<div class="span2">
<div class="row-fluid account-heading">
  <h1><?php echo $heading_title; ?></h1>
  <div class="welcomePop">
    <div class="userimg"></div>
    Bine ai venit, <strong><?php echo $text_logged_s; ?></strong>
  </div>
</div>


</div>





<div id="content" class="span9 categorycontent">
  <div class="row-fluid">
    <?php echo $content_top; ?>

<div class="span4">
    <h2><?php echo $text_my_account; ?></h2>

    <?php if ($success) { ?>
      <div class="success"><?php echo $success; ?></div>
    <?php } ?>

    <div class="accountblock">
      <ul>
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      </ul>
    </div>
</div>
<div class="span4">
    <h2><?php echo $text_my_orders; ?></h2>

    <div class="accountblock">
      <ul>
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>

        <?php if ($reward) { ?>
          <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
        <?php } ?>

        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      </ul>
    </div>
</div>
<div class="span4">
    <h2><?php echo $text_my_newsletter; ?></h2>
    <div class="accountblock">
      <ul>
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
    </div>
</div>
    <?php echo $content_bottom; ?>
  </div>
</div>

<?php echo $footer; ?> 