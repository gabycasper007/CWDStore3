
<div class="row-fluid" id="fizicalORjuridical">
  <div class="span3">
    <input type="radio" id="fizical" name="letsgetype" checked>
    <label for="fizical" class="letsgetlabel">persoana fizica</label>
  </div>
  <div class="span3">
    <input type="radio" id="juridical" name="letsgetype">
    <label for="juridical" class="letsgetlabel">persoana juridica</label>
  </div>
</div>

<div id="companyDetails">
  <h2>Datele firmei</h2>
  <div class="row-fluid custom-inputs">
    <div class="span4">
      <input type="text" name="firma" value="" class="large-field" placeholder="<?php echo $entry_firma; ?>" />
    </div>
    <div class="span4">
      <input type="text" name="recom" value="" class="large-field" placeholder="<?php echo $entry_recom; ?>" />  
    </div>
    <div class="span4">
      <input type="text" name="cont" value="" class="large-field" placeholder="<?php echo $entry_cont; ?>" />
    </div>
  </div>
    
  <div class="row-fluid custom-inputs">
    <div class="span4">
      <input type="text" name="cif" value="" class="large-field" placeholder="<?php echo $entry_cif; ?>" />
    </div>
    <div class="span4">
      <input type="text" name="banca" value="" class="large-field" placeholder="<?php echo $entry_banca; ?>" /> 
    </div>
  </div>
</div>

<h2>
  <?php echo $text_your_details; ?>
</h2>
<div class="row-fluid custom-inputs">
  <div class="span4">
    <input type="text" name="lastname" value="" class="large-field" placeholder="* <?php echo $entry_lastname; ?>" />
  </div>
  <div class="span4">
    <input type="text" name="telephone" value="" class="large-field" placeholder="* <?php echo $entry_telephone; ?>" />
  </div>
  <div class="span4">
    <input type="text" name="fax" value="" class="large-field" placeholder="<?php echo $entry_fax; ?>" />
  </div>
</div>

<div class="row-fluid custom-inputs">
  <div class="span4">
    <input type="text" name="firstname" value="" class="large-field" placeholder="* <?php echo $entry_firstname; ?>" />
  </div>
  <div class="span4">
    <input type="text" name="email" value="" class="large-field" placeholder="* <?php echo $entry_email; ?>" />
  </div>
  <div class="span4">
    <input type="text" name="company" value="" class="company large-field" placeholder="<?php echo $entry_company; ?>" />
  </div>

  <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
    <?php echo $entry_customer_group;
    foreach ($customer_groups as $customer_group) {
      if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
        <input type="radio" 
               name="customer_group_id" 
               value="<?php echo $customer_group['customer_group_id']; ?>" 
               id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" 
               checked="checked" />
        <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
      <?php }

      else { ?>

      <input type="radio" 
             name="customer_group_id" 
             value="<?php echo $customer_group['customer_group_id']; ?>" 
             id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
      <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
  
      <?php } 
    } ?>
  </div>
  
  <div class="span4" id="company-id-display">
    <!-- <span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?><br /> -->
    <input type="text" name="company_id" value="" class="large-field" placeholder="* <?php echo $entry_company_id; ?>" />
  </div>
  
  <div class="span4" id="tax-id-display">
    <!-- <span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?><br /> -->
    <input type="text" name="tax_id" value="" class="large-field" placeholder="* <?php echo $entry_tax_id; ?>" />
  </div>

</div>

<h2><?php echo $text_your_address; ?></h2>

<div class="row-fluid custom-inputs">
  <div class="span4">
    <input type="text" name="address_1" value="" class="huge-field" placeholder="* <?php echo $entry_address_1; ?>" />
  </div>
  <div class="span4">
    <input type="text" class="address2" name="address_2" value="" class="large-field" placeholder="<?php echo $entry_address_2; ?>" />
  </div>

  <div class="span4">
    <!-- <label for="country_id"><?php echo $entry_country; ?>*</label> -->
    <select name="country_id" class="large-field">
      <option value=""><?php echo $text_select; ?></option>
      <?php foreach ($countries as $country) { ?>
      <?php if ($country['country_id'] == $country_id) { ?>
      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
  </div>
</div>

<div class="row-fluid custom-inputs">
  <div class="span4">
    <!-- <label for="zone_id"><?php echo $entry_zone; ?>*</label> -->
    <select name="zone_id" class="large-field">
    </select>
  </div>
  <div class="span4">
    <!-- <input type="text" name="city" value="" class="large-field" placeholder="<?php echo $entry_city; ?>*" /> -->
    <input type="text" class="postcode" name="postcode" value="70000" class="large-field" placeholder="<?php echo $entry_postcode; ?>*" />
  </div>
  <div class="span4">
    <!-- <label for="city"><?php echo $entry_city; ?>*</label> -->
    <select name="city" class="large-field">
      <option value="0"> Selectati judetul/sectorul</option>
    </select>
  </div>

</div>


<h2><?php echo $text_your_password; ?></h2>

<div class="row-fluid custom-inputs">
  <div class="span4">
    <input type="password" name="password" value="" class="large-field" placeholder="* <?php echo $entry_password; ?>" />
  </div>
  <div class="span4">
    <input type="password" name="confirm" value="" class="large-field" placeholder="* <?php echo $entry_confirm; ?>" />
  </div>
</div>

<div style="clear: both; padding-top: 15px; border-top: 1px solid #EEEEEE;">
    <input type="checkbox" name="newsletter" value="1" id="newsletter" class="totheleft" />
    <label for="newsletter"><?php echo $entry_newsletter; ?></label>
    
    <?php if ($shipping_required) { ?>
    <input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" class="totheleft" />
    <label for="shipping"><?php echo $entry_shipping; ?></label>
    
    <?php } ?>
</div>

  <?php if ($text_agree) { ?>
  <div class="confidence">
    <input type="checkbox" name="agree" value="1" />
    <?php echo $text_agree; ?>
  </div>
  <div class="buttons">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="button" />
  </div>
  <?php } else { ?>
  <div class="buttons">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="button" />
  </div>
<?php } ?>
<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	
	/*if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}*/
});
$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
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


$('#payment-address select[name=\'zone_id\']').bind('change', function() {
  if (this.value == '') return;
  $.ajax({
    url: 'index.php?route=checkout/cart/zone&zone_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#payment-address select[name=\'zone_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
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

      if (json['zone_id'] < 4039 && json['zone_id'] > 4032) {
        html = '<option value="">Bucuresti</option>';
      }
      else { 
        html = '<option value=""><?php echo $text_select; ?></option>';
        
        if (json['city'] != '') {
          for (i = 0; i < json['city'].length; i++) {
                html += '<option value="' + json['city'][i]['city_id'] + '"';
              
            if (json['city'][i]['city_id'] == '<?php echo $city_id; ?>') {
                  html += ' selected="selected"';
              }
    
              html += '>' + json['city'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }
      }
      
      $('#payment-address select[name=\'city\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$('#payment-address select[name=\'zone_id\']').trigger('change');



//--></script> 
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
$('#fizical, label[for="fizical"]').bind('click', function () {
    $('#companyDetails').slideUp('fast');
});
$('#juridical, label[for="juridical"]').bind('click', function () {
    $('#companyDetails').slideDown('fast');
});
//--></script> 