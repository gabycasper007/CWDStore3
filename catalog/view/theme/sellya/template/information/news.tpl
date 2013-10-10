<?php echo $header; ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content">
   <?php echo $content_top; ?>
   <?php require($showbreadcrumbs); ?>
    
   <h1><?php echo $heading_title; ?></h1>
   <p><?php echo $description; ?></p>
    
   <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>