<?php echo $header; ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span12">
  <div class="row-fluid">
    
    <?php echo $content_top; ?>
    <?php require($showbreadcrumbs); ?>

    <h1><?php echo $heading_title; ?></h1>
    <div class="content">
      <?php echo $text_error; ?>
    </div>

    <div class="buttons">
      <div class="right">
        <a href="<?php echo $continue; ?>" class="button">
          <?php echo $button_continue; ?>
        </a>
      </div>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>

<?php echo $footer; ?>