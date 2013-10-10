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

    <p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>

    <table class="list">
      <thead>
        <tr>
          <td class="left"><?php echo $column_date_added; ?></td>
          <td class="left"><?php echo $column_description; ?></td>
          <td class="right"><?php echo $column_amount; ?></td>
        </tr>
      </thead>

      <tbody>
        <?php if ($transactions) { ?>
          <?php foreach ($transactions  as $transaction) { ?>
            <tr>
              <td class="left"><?php echo $transaction['date_added']; ?></td>
              <td class="left"><?php echo $transaction['description']; ?></td>
              <td class="right"><?php echo $transaction['amount']; ?></td>
            </tr>
          <?php } ?>

        <?php } else { ?>
          <tr>
            <td class="center" colspan="5"><?php echo $text_empty; ?></td>
          </tr>
        <?php } ?>

      </tbody>
    </table>

    <div class="pagination"><?php echo $pagination; ?></div>

    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>

    <?php echo $content_bottom; ?>
  </div>
</div>

<?php echo $footer; ?>