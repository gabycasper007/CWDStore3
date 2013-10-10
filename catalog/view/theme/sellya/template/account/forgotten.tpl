<?php echo $header; ?>

<div class="row-fluid account-heading">
  <h1>
    <?php echo $heading_title; ?>
  </h1>
  <div class="welcomePop">
    <div class="userimg"></div>
  </div>
</div>

<?php require($showbreadcrumbs); ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span9 categorycontent">
  <div class="row-fluid">

    <h2>
      <?php echo $heading_title; ?>
    </h2>

    <?php if ($error_warning) { ?>
      <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>    

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <p><?php echo $text_email; ?></p>
      <h2><?php echo $text_your_email; ?></h2>

      <div class="content">
        <div class="row-fluid">
          <?php // echo $entry_email; ?>
          <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" />
        </div>
      </div>

      <div class="buttons">
        <div class="left">
          <a href="<?php echo $back; ?>" class="button">
            <?php echo $button_back; ?>
          </a>
        </div>
        <div class="right">
          <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
        </div>
      </div>
    </form>

    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $footer; ?>