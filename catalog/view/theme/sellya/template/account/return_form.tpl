<?php echo $header; ?>

<div class="row-fluid account-heading">

  <h1>
    <?php echo $heading_title; ?>
  </h1>

  <?php if(isset($text_logged_s)) { ?>
    <div class="welcomePop">
      <div class="userimg"></div>
      Bine ai venit, <strong><?php echo $text_logged_s; ?></strong>
    </div>
  <?php } ?>
</div>

<?php require($showbreadcrumbs); ?>

<div class="row-fluid">
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

      <?php echo $text_description; ?>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <h2><?php echo $text_order; ?></h2>

        <div class="content custom-inputs">
          <div class="row-fluid">
            <div class="span4">
              <!-- <span class="required">*</span> <?php echo $entry_firstname; ?><br /> -->

              <input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" placeholder="* <?php echo $entry_firstname; ?>" />

              <?php if ($error_firstname) { ?>
                <span class="error"><?php echo $error_firstname; ?></span>
              <?php } ?>
              </div>
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_lastname; ?><br /> -->
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field" placeholder="* <?php echo $entry_lastname; ?>" />
                <br />

                <?php if ($error_lastname) { ?>
                  <span class="error"><?php echo $error_lastname; ?></span>
                <?php } ?>
                <br />
              </div>
              
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_email; ?><br /> -->
                <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" placeholder="* <?php echo $entry_email; ?>" />
                <br />

                <?php if ($error_email) { ?>
                  <span class="error"><?php echo $error_email; ?></span>
                <?php } ?>
                <br />
              </div>
          </div>
          <div class="row-fluid">
            <div class="span4">
              <!-- <span class="required">*</span> <?php echo $entry_telephone; ?><br /> -->
              <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" placeholder="* <?php echo $entry_telephone; ?>" />
              <br />

              <?php if ($error_telephone) { ?>
                <span class="error"><?php echo $error_telephone; ?></span>
              <?php } ?>
              <br />
            </div>

            <div class="span4">
              <!-- <span class="required">*</span> <?php echo $entry_order_id; ?><br /> -->
              <input type="text" name="order_id" value="<?php echo $order_id; ?>" class="large-field" placeholder="* <?php echo $entry_order_id; ?>" />
              <br />

              <?php if ($error_order_id) { ?>
              <span class="error"><?php echo $error_order_id; ?></span>
              <?php } ?>
              <br />
            </div>

            <div class="span4">
              <?php // echo $entry_date_ordered; ?>
              <input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="large-field date" placeholder="<?php echo $entry_date_ordered; ?>" />

            </div>
          </div>

      </div> <!-- end of content -->

        <h2>
          <?php echo $text_product; ?>
        </h2>

        <div id="return-product">

          <div class="content">
            <div class="row-fluid custom-inputs">

              <div class="row-fluid">
                <!-- <span class="required">*</span> <b><?php echo $entry_product; ?></b><br /> -->
                <input style="width:90%" type="text" name="product" value="<?php echo $product; ?>" placeholder="* <?php echo $entry_product; ?>" />

                <?php if ($error_product) { ?>
                  <span class="error"><?php echo $error_product; ?></span>
                <?php } ?>
              </div>

              <div class="row-fluid">
                <!-- <span class="required">*</span> <b><?php echo $entry_model; ?></b><br /> -->
                <input style="width:90%" type="text" name="model" value="<?php echo $model; ?>" placeholder="* <?php echo $entry_model; ?>" />

                <?php if ($error_model) { ?>
                  <span class="error"><?php echo $error_model; ?></span>
                <?php } ?>
              </div>

              <div class="row-fluid">
                <?php // echo $entry_quantity; ?>
                <input style="width:90%" type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" />
              </div>
            </div>

            <div class="return-detail">
              <div class="return-reason">
                <span class="required">*</span> <b><?php echo $entry_reason; ?></b><br />

                <table>
                  <?php foreach ($return_reasons as $return_reason) { 
                    if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
                      <tr>
                        <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /></td>
                        <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
                      </tr>
                    <?php } 

                    else { ?>
                      <tr>
                        <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /></td>
                        <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
                      </tr>
                    <?php  } ?>
                  <?php  } ?>
                </table>

                <?php if ($error_reason) { ?>
                  <span class="error"><?php echo $error_reason; ?></span>
                <?php } ?>
              </div>

              <div class="return-opened">
                <b><?php echo $entry_opened; ?></b><br />

                <?php if ($opened) { ?>
                  <input type="radio" name="opened" value="1" id="opened" checked="checked" />
                <?php } 

                else { ?>
                  <input type="radio" name="opened" value="1" id="opened" />
                <?php } ?>

                <label for="opened"><?php echo $text_yes; ?></label>

                <?php if (!$opened) { ?>
                  <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
                <?php } 

                else { ?>
                  <input type="radio" name="opened" value="0" id="unopened" />
                <?php } ?>

                <label for="unopened"><?php echo $text_no; ?></label><br /><br />
              </div>

              <b><?php echo $entry_fault_detail; ?></b><br />
              <div class="row-fluid custom-inputs">
                <textarea name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
              </div>

              <div class="return-captcha">
                <b><?php echo $entry_captcha; ?></b>
                <div class="row-fluid custom-inputs">
                  <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
                </div>

                <img src="index.php?route=account/return/captcha" alt="" />

                <?php if ($error_captcha) { ?>
                  <span class="error"><?php echo $error_captcha; ?></span>
                <?php } ?>
              </div>
            </div>
          </div>

        </div> <!-- end of return product -->

        <?php if ($text_agree) { ?>
          <div class="buttons">
            <div class="left">
              <a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
            </div>

            <div class="right">
              <?php echo $text_agree; ?>

              <?php if ($agree) { ?>
                <input type="checkbox" name="agree" value="1" checked="checked" />
              <?php } 

              else { ?>
                <input type="checkbox" name="agree" value="1" />
              <?php } ?>

              <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
            </div>
          </div>
        <?php } 

        else { ?>
          <div class="buttons">
            <div class="left">
              <a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
            </div>

            <div class="right">
              <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
            </div>
          </div>
        <?php } ?>
      </form>

      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 

<?php echo $footer; ?>