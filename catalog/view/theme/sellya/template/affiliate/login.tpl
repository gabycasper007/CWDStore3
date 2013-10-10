<?php echo $header; ?>

  <?php if ($success) { ?>
    <div class="success">
      <?php echo $success; ?>
    </div>
  <?php } ?>

  <?php if ($error_warning) { ?>
    <div class="warning">
      <?php echo $error_warning; ?>
    </div>
  <?php } ?>
    <?php require($showbreadcrumbs); ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div class="row-fluid">
<div id="content" class="span9">
    
    <?php echo $content_top; ?>

      <h1>
        <?php echo $heading_title; ?>
      </h1>

      <?php echo $text_description; ?>

      <div class="login-content">

        <div class="left">
          <h2><?php echo $text_new_affiliate; ?></h2>
          <div class="content"><?php echo $text_register_account; ?> <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
        </div>

        <div class="right">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <h2>
              <?php echo $text_returning_affiliate; ?>
            </h2>
            <div class="content">
              <p>
                <?php echo $text_i_am_returning_affiliate; ?>
              </p>

              <div class="row-fluid custom-inputs">
                <!-- <b><?php echo $entry_email; ?></b> -->
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" />
              </div>
              
              <div class="row-fluid custom-inputs">
                <!-- <b><?php echo $entry_password; ?></b><br /> -->
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" />
              </div>

              <a href="<?php echo $forgotten; ?>">
                <?php echo $text_forgotten; ?>
              </a>

              <div class="row-fluid">
                <input type="submit" value="<?php echo $button_login; ?>" class="button" />
              </div>
              
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
</div>
<?php echo $footer; ?>