<?php echo $header; ?>
<?php if ($error_warning) { ?>
  <div class="warning">
    <?php echo $error_warning; ?>
  </div>
<?php } ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span9 categorycontent">
  <div class="row-fluid">
    <?php echo $content_top; ?>

  <?php require($showbreadcrumbs); ?>

  <h1>
    <?php echo $heading_title; ?>
  </h1>

  <p>
    <?php echo $text_description; ?>
  </p>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

    <div class="row-fluid custom-inputs">
      <div class="span6">
        <div class="row-fluid">
        <!-- <span class="required">*</span> <?php echo $entry_to_name; ?> -->
        <input type="text" name="to_name" value="<?php echo $to_name; ?>" placeholder="* <?php echo $entry_to_name; ?>" />
          <?php if ($error_to_name) { ?>
          <span class="error"><?php echo $error_to_name; ?></span>
          <?php } ?>
        </div>
        <div class="row-fluid">
          <!-- <span class="required">*</span> <?php echo $entry_to_email; ?> -->
          <input type="text" name="to_email" value="<?php echo $to_email; ?>" placeholder="* <?php echo $entry_to_email; ?>" />
            <?php if ($error_to_email) { ?>
            <span class="error"><?php echo $error_to_email; ?></span>
            <?php } ?>
        </div>
        <div class="row-fluid">
          <!-- <span class="required">*</span> <?php echo $entry_from_name; ?> -->
          <input type="text" name="from_name" value="<?php echo $from_name; ?>" placeholder="* <?php echo $entry_from_name; ?>" />
            <?php if ($error_from_name) { ?>
            <span class="error"><?php echo $error_from_name; ?></span>
            <?php } ?>
        </div>
        <div class="row-fluid">
          <!-- <span class="required">*</span> <?php echo $entry_from_email; ?> -->
          <input type="text" name="from_email" value="<?php echo $from_email; ?>" placeholder="* <?php echo $entry_from_email; ?>" />
            <?php if ($error_from_email) { ?>
            <span class="error"><?php echo $error_from_email; ?></span>
            <?php } ?>
        </div>
        <div class="row-fluid radio-input">
          <div class="row-fluid">
            <span class="required">*</span> <?php echo $entry_theme; ?>
          </div>
            <?php foreach ($voucher_themes as $voucher_theme) { ?>
              <?php 
              if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
                <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>

              <?php } 
              else { ?>
                <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
                <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></label>
              <?php } ?>
            <?php } ?>
            <?php if ($error_theme) { ?>
            <span class="error"><?php echo $error_theme; ?></span>
            <?php } ?>
        </div>
      </div>
      
      <div class="span6">
        <div class="row-fluid">
          <?php echo $entry_message; ?>
          <textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
        </div>
        <div class="row-fluid">
          <span class="required">*</span> <?php echo $entry_amount; ?>
          <input type="text" name="amount" value="<?php echo $amount; ?>" size="5" />
            <?php if ($error_amount) { ?>
            <span class="error"><?php echo $error_amount; ?></span>
            <?php } ?>
        </div>

        <div class="row-fluid radio-input">
          <?php echo $text_agree; ?>
          <?php 
          if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
          <?php } 

          else { ?>
            <input type="checkbox" name="agree" value="1" />
          <?php } ?>
        </div>
        <div class="row-fluid">
          <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
        </div>
      </div>
        
      </div>
      
    </div> <!-- end of row fluid -->





  </form>
  <?php echo $content_bottom; ?></div></div>
<?php echo $footer; ?>