<?php echo $header; ?>
    <?php require($showbreadcrumbs); ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div id="content" class="span9">
  <div class="row-fluid">

    <?php echo $content_top; ?>

    <h1><?php echo $heading_title; ?></h1>
    <?php echo $description; ?>
    
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