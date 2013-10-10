<?php echo $header; ?>
  <?php if ($error_warning) { ?>
    <div class="warning">
      <?php echo $error_warning; ?>
    </div>
  <?php } ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span9">
  <div class="row-fluid">
    <?php echo $content_top; ?>

      <?php require($showbreadcrumbs); ?>

      <h1>
        <?php echo $heading_title; ?>
      </h1>

      <p><?php echo $text_account_already; ?></p>
      <p><?php echo $text_signup; ?></p>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <h2>
          <?php echo $text_your_details; ?>
        </h2>

        <div class="content custom-inputs">
          <table class="form">
            <div class="row-fluid">

              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_firstname; ?> -->
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="* <?php echo $entry_firstname; ?>" />
                
                <?php if ($error_firstname) { ?>
                  <span class="error">
                    <?php echo $error_firstname; ?>
                  </span>
                <?php } ?>
              </div>
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_lastname; ?> -->
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="* <?php echo $entry_lastname; ?>" />
                
                <?php if ($error_lastname) { ?>
                  <span class="error">
                    <?php echo $error_lastname; ?>
                  </span>
                <?php } ?>
              </div>
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_email; ?> -->
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="* <?php echo $entry_email; ?>" />

                <?php if ($error_email) { ?>
                  <span class="error">
                    <?php echo $error_email; ?>
                  </span>
                <?php } ?>
              </div>

            </div> <!-- end of row -->

            <div class="row-fluid">
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_telephone; ?> -->
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="* <?php echo $entry_telephone; ?>" />
                
                <?php if ($error_telephone) { ?>
                  <span class="error">
                    <?php echo $error_telephone; ?>
                  </span>
                <?php } ?>
              </div>
              <div class="span4">
                <?php // echo $entry_fax; ?>
                <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" />
                
              </div>
            </div> <!-- end of row -->

          </table>
        </div> <!-- end of content -->

        <h2>
          <?php echo $text_your_address; ?>
        </h2>

        <div class="content custom-inputs">
          <table class="form">
            <div class="row-fluid">
              <div class="span4">
                <?php // echo $entry_company; ?>
                <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" /> 
              </div>
              <div class="span4">
                <?php // echo $entry_website; ?>
                <input type="text" name="website" value="<?php echo $website; ?>" placeholder="<?php echo $entry_website; ?>" />
              </div>
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_address_1; ?> -->
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="* <?php echo $entry_address_1; ?>" />

                <?php if ($error_address_1) { ?>
                  <span class="error">
                    <?php echo $error_address_1; ?>
                  </span>
                <?php } ?>
              </div>
            </div> <!-- end of row -->

            <div class="row-fluid">
              <div class="span4">
                <?php // echo $entry_address_2; ?>
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" />
              </div>
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_city; ?> -->
                <input type="text" name="city" value="<?php echo $city; ?>" placeholder="* <?php echo $entry_city; ?>"/>
                
                <?php if ($error_city) { ?>
                  <span class="error">
                    <?php echo $error_city; ?>
                  </span>
                <?php } ?>
              </div>
              <div class="span4">
                <!-- <span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?> -->
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="* <?php echo $entry_postcode; ?>" />
                
                <?php if ($error_postcode) { ?>
                  <span class="error">
                    <?php echo $error_postcode; ?>
                  </span>
                <?php } ?>
              </div>
            </div> <!-- end of row -->
            
            <div class="row-fluid">
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_country; ?> -->
                <select name="country_id">
                  <option value="false">
                    <?php echo $text_select; ?>
                  </option>
                  <?php foreach ($countries as $country) { ?>
                    <?php 
                    if ($country['country_id'] == $country_id) { ?>
                      <option value="<?php echo $country['country_id']; ?>" selected="selected">
                        <?php echo $country['name']; ?>
                      </option>

                    <?php } 
                    else { ?>
                      <option value="<?php echo $country['country_id']; ?>">
                        <?php echo $country['name']; ?>
                      </option>
                    <?php } ?>
                  <?php } ?>
                </select>

                <?php if ($error_country) { ?>
                  <span class="error">
                    <?php echo $error_country; ?>
                  </span>
                <?php } ?>
              </div>
              <div class="span4">
                <!-- <span class="required">*</span> <?php echo $entry_zone; ?> -->
                <select name="zone_id"></select>

                <?php if ($error_zone) { ?>
                  <span class="error">
                    <?php echo $error_zone; ?>
                  </span>
                <?php } ?>
              </div>
            </div> <!-- end of row -->
          </table>
        </div> <!-- end of content -->

        <h2>
          <?php echo $text_payment; ?>
        </h2>
        
        <div class="content custom-inputs">
          <table class="form">
            <div class="row-fluid">
              <div class="span6 radio-input">
                  
                  <?php // echo $entry_payment; ?>

                  <div class="row-fluid">
                    <!-- Cheque payment -->
                    <?php 
                    if ($payment == 'cheque') { ?>
                      <input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
                    <?php } 

                    else { ?>
                      <input type="radio" name="payment" value="cheque" id="cheque" />
                    <?php } ?>
                    <label for="cheque">
                      <?php echo $text_cheque; ?>
                    </label>
                    <!-- Paypal payment -->
                    <?php 
                    if ($payment == 'paypal') { ?>
                      <input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
                    <?php } 

                    else { ?>
                      <input type="radio" name="payment" value="paypal" id="paypal" />
                    <?php } ?>
                    <label for="paypal">
                      <?php echo $text_paypal; ?>
                    </label>
                    <!-- Bank Payment -->
                    <?php 
                    if ($payment == 'bank') { ?>
                      <input type="radio" name="payment" value="bank" id="bank" checked="checked" />
                    <?php } 

                    else { ?>
                      <input type="radio" name="payment" value="bank" id="bank" />
                    <?php } ?>
                    <label for="bank">
                      <?php echo $text_bank; ?>
                    </label>
                  </div>

              </div>

              <div class="span6 ">
                <div class="row-fluid">
                  <!-- <?php echo $entry_tax; ?> -->
                  <input type="text" name="tax" value="<?php echo $tax; ?>" placeholder="<?php echo $entry_tax; ?>" />
                </div>
                <div class="row-fluid">
                  <div class="payment" id="payment-cheque">
                    <?php // echo $entry_cheque; ?>
                    <input type="text" name="cheque" value="<?php echo $cheque; ?>" placeholder="<?php echo $entry_cheque; ?>" />
                  </div>
                </div>
                <div class="row-fluid">
                  <div class="payment" id="payment-paypal">
                    <?php // echo $entry_paypal; ?>
                    <input type="text" name="paypal" value="<?php echo $paypal; ?>" placeholder="<?php echo $entry_paypal; ?>" />
                  </div>
                </div>
                <div class="row-fluid">
                  <div id="payment-bank" class="payment">
                    <div class="row-fluid">
                      <?php // echo $entry_bank_name; ?>
                      <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="<?php echo $entry_bank_name; ?>" />
                    </div>
                    <div class="row-fluid">
                      <?php // echo $entry_bank_branch_number; ?>
                      <input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" placeholder="<?php echo $entry_bank_branch_number; ?>" />
                    </div>
                    <div class="row-fluid">
                      <?php // echo $entry_bank_swift_code; ?>
                      <input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" placeholder="<?php echo $entry_bank_swift_code; ?>" />
                    </div>
                    <div class="row-fluid">
                      <?php // echo $entry_bank_account_name; ?>
                      <input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" placeholder="<?php echo $entry_bank_account_name; ?>" />
                    </div>
                    <div class="row-fluid">
                      <?php // echo $entry_bank_account_number; ?>
                      <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" placeholder="<?php echo $entry_bank_account_number; ?>" />
                    </div>
                  </div>
                </div>
              </div>
            </div> <!-- end of row -->

          </table>
        </div> <!-- end of content -->

        <h2>
          <?php echo $text_your_password; ?>
        </h2>

        <div class="content custom-inputs">
          <div class="row-fluid">
            <!-- <span class="required">*</span> <?php echo $entry_password; ?> -->
            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="* <?php echo $entry_password; ?>" />
            
            <?php if ($error_password) { ?>
              <span class="error">
                <?php echo $error_password; ?>
              </span>
            <?php } ?>
          </div>
          <div class="row-fluid">
            <!-- <span class="required">*</span> <?php echo $entry_confirm; ?> -->
            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="* <?php echo $entry_confirm; ?>" />
            
            <?php if ($error_confirm) { ?>
              <span class="error">
                <?php echo $error_confirm; ?>
              </span>
            <?php } ?>
          </div>
        </div> <!-- end of content -->

        <?php if ($text_agree) { ?>
        <div class="row-fluid">
          <?php 
          if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
          <?php } 
        
          else { ?>
            <input type="checkbox" name="agree" value="1" />
          <?php } ?>
        
          <?php echo $text_agree; ?>
        </div>
          
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
        
        <?php } else { ?>
        <div class="row-fluid">
          <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
        </div>
        <?php } ?>
      </form>
    <?php echo $content_bottom; ?>
  </div>
</div>

<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=affiliate/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('select[name=\'country_id\']').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	
	$('#payment-' + this.value).show();
});
$('input[name=\'payment\']:checked').trigger('change');
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