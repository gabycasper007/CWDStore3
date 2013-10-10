<?php echo $header; ?>

<div class="row-fluid account-heading">
  <h1><?php echo $heading_title; ?></h1>
  <div class="welcomePop">
    <div class="userimg"></div>
    Bine ai venit, <strong><?php echo $text_logged_s; ?></strong>
  </div>
</div>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span9 categorycontent">
  <div class="row-fluid">
<?php require($showbreadcrumbs); ?>

    <h2><?php echo $heading_title; ?></h2>

    <?php if ($logged) { ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <table class="form">
              <tr>
                <td><?php echo $entry_newsletter; ?></td>
                <td><?php if ($newsletter) { ?>
                  <input type="radio" name="newsletter" value="1" checked="checked" />
                  <?php echo $text_yes; ?>&nbsp;
                  <input type="radio" name="newsletter" value="0" />
                  <?php echo $text_no; ?>
                  <?php } else { ?>
                  <input type="radio" name="newsletter" value="1" />
                  <?php echo $text_yes; ?>&nbsp;
                  <input type="radio" name="newsletter" value="0" checked="checked" />
                  <?php echo $text_no; ?>
                  <?php } ?></td>
              </tr>
          </table>
        </div>

        <div class="buttons">
          <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
          <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
        </div>
      </form>
    <?php } ?>

    <?php echo $content_bottom; ?>
  </div>
</div>

<?php echo $footer; ?>