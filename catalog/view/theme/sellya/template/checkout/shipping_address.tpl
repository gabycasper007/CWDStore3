<?php if ($addresses) { ?>

  <div class="row-fluid existing-new-address">

    <div class="span4">
      <input type="radio" name="shipping_address" value="existing" id="shipping-address-existing" checked="checked" />
      <label for="shipping-address-existing"><?php echo $text_address_existing; ?></label>
    </div>

    <div class="span4">
      <input type="radio" name="shipping_address" value="new" id="shipping-address-new" />
      <label for="shipping-address-new"><?php echo $text_address_new; ?></label>
    </div>

  </div>

  <div id="shipping-existing">

    <select name="address_id" size="5">
      <?php foreach ($addresses as $address) { ?>

      <?php 
      if ($address['address_id'] == $address_id) { ?>
        <option value="<?php echo $address['address_id']; ?>" selected="selected">
          <?php echo $address['firstname']; ?>
          <?php echo $address['lastname']; ?>,
          <?php echo $address['address_1']; ?>,
          <?php echo $address['city']; ?>,
          <?php echo $address['zone']; ?>,
          <?php echo $address['country']; ?>
        </option>

      <?php } 
        else { ?>
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

  <div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
    <table class="form">

      <div class="row-fluid custom-inputs">
        <div class="span4">
          <!-- <td><span class="required">*</span> <?php echo $entry_firstname; ?></td> -->
          <input type="text" name="firstname" value="" class="large-field" placeholder="* <?php echo $entry_firstname; ?>" />
        </div>
        <div class="span4">
          <!-- <td><span class="required">*</span> <?php echo $entry_lastname; ?></td> -->
          <input type="text" name="lastname" value="" class="large-field" placeholder="* <?php echo $entry_lastname; ?>" />
        </div>
        <div class="span4">
          <!-- <td><?php echo $entry_company; ?></td> -->
          <input type="text" name="company" value="" class="large-field" placeholder="<?php echo $entry_company; ?>" />
        </div>
      </div>

      <div class="row-fluid custom-inputs">
        <div class="span4">
          <!-- <td><span class="required">*</span> <?php echo $entry_address_1; ?></td> -->
          <input type="text" name="address_1" value="" class="large-field" placeholder="* <?php echo $entry_address_1; ?>" />
        </div>
        <div class="span4">
          <!-- <td><?php echo $entry_address_2; ?></td> -->
          <input type="text" name="address_2" value="" class="large-field" placeholder="<?php echo $entry_address_2; ?>" />
        </div>
        <div class="span4">
          <!-- <td><span class="required">*</span> <?php echo $entry_city; ?></td> -->
          <input type="text" name="city" value="" class="large-field" placeholder="* <?php echo $entry_city; ?>" />
        </div>
      </div>
      
      <div class="row-fluid custom-inputs">
        <div class="span4">
          <!-- <td><span id="shipping-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td> -->
          <input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field" placeholder="* <?php echo $entry_postcode; ?>" />
        </div>

        <div class="span4">
          <!-- <td><span class="required">*</span> <?php echo $entry_country; ?></td> -->
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
          <!-- <td><span class="required">*</span> <?php echo $entry_zone; ?></td> -->
          <select name="zone_id" class="large-field"></select>
        </div>
      </div>

    </table>
  </div>

  <br />
  <div class="buttons">
    <div class="right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-address" class="button" />
    </div>
  </div>
<script type="text/javascript"><!--
$('#shipping-address input[name=\'shipping_address\']').live('change', function() {
	if (this.value == 'new') {
		$('#shipping-existing').hide();
		$('#shipping-new').show();
	} else {
		$('#shipping-existing').show();
		$('#shipping-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#shipping-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
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
			
			$('#shipping-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#shipping-address select[name=\'country_id\']').trigger('change');
//--></script>