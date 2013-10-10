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
    <?php echo $content_top; ?>

    <h2><?php echo $heading_title; ?></h2>

    <?php if ($returns) { ?>
      <?php foreach ($returns as $return) { ?>

        <div class="return-list">

          <div class="return-id"><b><?php echo $text_return_id; ?></b> #<?php echo $return['return_id']; ?></div>

          <div class="return-status"><b><?php echo $text_status; ?></b> <?php echo $return['status']; ?></div>

          <div class="return-content">
            <div><b><?php echo $text_date_added; ?></b> <?php echo $return['date_added']; ?><br />
              <b><?php echo $text_order_id; ?></b> <?php echo $return['order_id']; ?></div>
            <div><b><?php echo $text_customer; ?></b> <?php echo $return['name']; ?></div>
            <div class="return-info"><a href="<?php echo $return['href']; ?>"><img src="catalog/view/theme/sellya/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a></div>
          </div>
        </div>

      <?php } ?>
    
    <?php } else { ?>
      <div class="content"><?php echo $text_empty; ?></div>
    <?php } ?>

    <div class="pagination"><?php echo $pagination; ?></div>

    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>

    <?php echo $content_bottom; ?>
  </div>
</div>

<?php echo $footer; ?>