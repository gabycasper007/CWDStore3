<?php echo $header; ?>

<div class="row-fluid account-heading">
  <h1><?php echo $heading_title; ?></h1>
  <div class="welcomePop">
    <div class="userimg"></div>
    Te rugam sa te loghezi</strong>
  </div>
</div>

<?php require($showbreadcrumbs); ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span9 categorycontent">
  <div class="row-fluid">

    <h2><?php echo $heading_title; ?></h2>

    <?php if ($success) { ?>
      <div class="success"><?php echo $success; ?></div>
    <?php } ?>

    <?php if ($error_warning) { ?>
      <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>

    <div class="login-content">
      <div class="row-fluid">
        <h2>
          <?php echo $text_new_customer; ?>
        </h2>

        <div class="content">
          <p><b><?php echo $text_register; ?></b></p>
          <p><?php echo $text_register_account; ?></p>
          <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
      </div>

      <div class="row-fluid custom-inputs">
        <h2><?php echo $text_returning_customer; ?></h2>

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <div class="content">

            <p><?php echo $text_i_am_returning_customer; ?></p>
            <div class="row-fluid">
              <!-- <b><?php echo $entry_email; ?></b> -->
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" />
            </div>
            <div class="row-fluid">
              <!-- <b><?php echo $entry_password; ?></b> -->
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" />
            </div>
            
            <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
            <input type="submit" value="<?php echo $button_login; ?>" class="button" />

            <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            <?php } ?>
          </div>
        </form>

      </div>
    </div>

    <?php echo $content_bottom; ?>
  </div>
</div>

<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>