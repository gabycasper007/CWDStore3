<?php echo $header; ?>

<div class="row-fluid account-heading">
  <h1><?php echo $heading_title; ?></h1>
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

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <h2><?php echo $text_password; ?></h2>

      <div class="content">
        <table class="form">

          <tr>
            <td><span class="required">*</span> <?php echo $entry_password; ?></td>
            <td><input type="password" name="password" value="<?php echo $password; ?>" />
              <?php if ($error_password) { ?>
              <span class="error"><?php echo $error_password; ?></span>
              <?php } ?></td>
          </tr>
          <tr>

            <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
            <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
              <?php if ($error_confirm) { ?>
              <span class="error"><?php echo $error_confirm; ?></span>
              <?php } ?></td>
          </tr>
        </table>
      </div>

      <div class="buttons">
        <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
        <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
      </div>

    </form>

    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $footer; ?>