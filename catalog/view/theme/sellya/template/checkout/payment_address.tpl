
<?php if ($addresses) { ?>

  <div class="row-fluid existing-new-address">
    <div class="span4">
      <input type="radio" name="payment_address" value="existing" id="payment-address-existing" checked="checked" />
      <label for="payment-address-existing">
        <?php echo $text_address_existing; ?>
      </label>
    </div>
    
    <div class="span4">
      <input type="radio" name="payment_address" value="new" id="payment-address-new" />
      <label for="payment-address-new"><?php echo $text_address_new; ?></label>
    </div>
  </div>

  <div id="payment-existing">
    <select name="address_id" size="5">

      <?php foreach ($addresses as $address) { 
          if ($address['address_id'] == $address_id) { ?>

              <option value="<?php echo $address['address_id']; ?>" selected="selected">
                <?php echo $address['firstname']; ?>
                <?php echo $address['lastname']; ?>,
                <?php echo $address['address_1']; ?>,
                <?php echo $address['city']; ?>,
                <?php echo $address['zone']; ?>,
                <?php echo $address['country']; ?>
              </option>

          <?php } else { ?>
              <option value="<?php echo $address['address_id']; ?>">
                <?php echo $address['firstname']; ?>
                <?php echo $address['lastname']; ?>,
                <?php echo $address['address_1']; ?>,
                <?php echo $address['city']; ?>,
                <?php echo $address['zone']; ?>,
                <?php echo $address['country']; ?>
              </option>
          <?php } ?>
      <?php } ?>

    </select>
  </div>

  <?php } ?>
  <div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
    <table class="form">

      <div class="row-fluid custom-inputs">
        <div class="span4">
        <!-- <td><span class="required">*</span> <?php echo $entry_firstname; ?></td> -->
        <input type="text" name="firstname" value="" class="large-field" placeholder="* <?php echo $entry_firstname; ?>" />
        </div>
        
        <div class="span4">
          <!-- <span class="required">*</span> <?php echo $entry_lastname; ?> -->
          <input type="text" name="lastname" value="" class="large-field" placeholder="*<?php echo $entry_lastname; ?>" />
        </div>
        
        <div class="span4">
          <input type="text" name="company" value="" class="large-field" placeholder="<?php echo $entry_company; ?>" />
        </div>
      </div>

      <?php /* if ($company_id_display) { ?>
      <tr>
        <td><?php if ($company_id_required) { ?>
          <span class="required">*</span>
          <?php } ?>
          <?php echo $entry_company_id; ?></td>
        <td><input type="text" name="company_id" value="" class="large-field" /></td>
      </tr>
      <?php } ?>
      <?php if ($tax_id_display) { ?>
      <tr>
        <td><?php if ($tax_id_required) { ?>
          <span class="required">*</span>
          <?php } ?>
          <?php echo $entry_tax_id; ?></td>
        <td><input type="text" name="tax_id" value="" class="large-field" /></td>
      </tr>
      <?php } */ ?>
      <div class="row-fluid custom-inputs">
        <div class="span4">
          <!-- <span class="required">*</span> <?php echo $entry_address_1; ?> -->
          <input type="text" name="address_1" value="" class="large-field" placeholder="* <?php echo $entry_address_1; ?>" />
        </div>
        <div class="span4">
          <?php //echo $entry_address_2; ?>
          <input type="text" name="address_2" value="" class="large-field" placeholder="<?php echo $entry_address_2; ?>" />
        </div>
        <div class="span4">
          <!-- <span class="required">*</span> <?php echo $entry_city; ?> -->
          <input type="text" name="city" value="" class="large-field" placeholder="* <?php echo $entry_city; ?>" />
        </div>
      </div>
      
      <div class="row-fluid custom-inputs">
        <div class="span4">
          <!-- <span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?> -->
          <input type="text" name="postcode" value="" class="large-field" placeholder="* <?php echo $entry_postcode; ?>" />
        </div>
        <div class="span4">
          <!-- <span class="required">*</span> <?php echo $entry_country; ?> -->
          <select name="country_id" class="large-field">
            <option value="">
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
        </div>
        <div class="span4">
          <!-- <span class="required">*</span> <?php echo $entry_zone; ?> -->
          <select name="zone_id" class="large-field"></select>
        </div>
      </div>
    </table>
  </div>
  <br />
  <div class="buttons">
    <div class="right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-address" class="button" />
    </div>
  </div>

<script type="text/javascript"><!--
$('#payment-address input[name=\'payment_address\']').live('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	} else {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
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
			
			$('#payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script>