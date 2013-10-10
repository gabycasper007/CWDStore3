<?php echo $header; ?>

  <?php if ($attention) { ?>
    <div class="attention"><?php echo $attention; ?>
      <img src="catalog/view/theme/sellya/image/close.png" alt="" class="close" />
    </div>
  <?php } ?>

  <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?>
      <img src="catalog/view/theme/sellya/image/close.png" alt="" class="close" />
    </div>
  <?php } ?>

  <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?>
      <img src="catalog/view/theme/sellya/image/close.png" alt="" class="close" />
    </div>
  <?php } ?>

  <?php echo $column_left; ?>
  <?php echo $column_right; ?>

  <div id="content" class="span12">
    <div class="row-fluid">
      <?php echo $content_top; ?>

      <?php require($showbreadcrumbs); ?>

    <h1 class="cartheading">
      <?php echo $heading_title; ?>

      <?php if ($weight) { ?>
      &nbsp;(<?php echo $weight; ?>)
      <?php } ?>
    </h1>

    <div class="clearfix">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="cart-info">
          <?php if (isset($moneytofree)) { ?>
            <div class="money2free">
              <?php echo $moneytofree; ?>
            </div>
          <?php } ?>  
          <div>
            <div class="row-fluid bara-out">
              <div class="span2 image">
                <?php echo $column_image; ?>
              </div>
              <div class="span4 name">
                <?php echo $column_name; ?>
              </div>
              <!-- <div class="model">
              <?php echo $column_model; ?></di
              v> -->
              <div class="span2 price">
                <?php echo $column_price; ?>
              </div>
              <div class="span2 quantity">
                <?php echo $column_quantity; ?>
              </div>
              <div class="span2 total">
                <?php echo $column_total; ?>
              </div>
            </div>

            <tbody>
              <?php foreach ($products as $product) { ?>
              <div class="row-fluid cont-out">
                <div class="span12 cart">
                  <div class="span2 image">

                    <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                    </a>
                    <?php } ?>

                  </div>

                  <div class="span4 name">
                    <a href="<?php echo $product['remove']; ?>">
                      <img src="catalog/view/theme/sellya/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" />
                    </a>
                    <a href="<?php echo $product['href']; ?>">
                      <?php echo $product['name']; ?>
                    </a>

                    <?php if (!$product['stock']) { ?>
                    <span class="stock">***</span>
                    <?php } ?>
                    <div class="model">
                      <?php echo $product['model']; ?>
                    </div>
                    <div>

                      <?php foreach ($product['option'] as $option) { ?>
                      <small>
                        <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
                      </small><br />
                      <?php } ?>
                    </div>

                    <?php if ($product['reward']) { ?>
                    <small>
                      <?php echo $product['reward']; ?>
                    </small>
                    <?php } ?>
                  </div>

                  <div class="span2 price">
                    <?php echo $product['price']; ?>
                  </div>

                  <div class="span2 quantity cosss">
                    <input style="width:30px;" id="quantimini-<?php echo $product['product_id']; ?>" type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                   
                    <div class="edit-cant" onclick="$('#quantimini-<?php echo $product['product_id']; ?>').val(parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())+1);"></div>
                        <div class="edit-cant2" onclick="v=parseInt($('#quantimini-<?php echo $product['product_id']; ?>').val())-1;if(v>1) rval = v; else rval = 1; $('#quantimini-<?php echo $product['product_id']; ?>').val(rval);"></div>
                           &nbsp;
                          <input type="image" src="catalog/view/theme/sellya/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
                          &nbsp;  
                      </div>
                  <div class="span2 total">
                    <?php echo $product['total']; ?>
                  </div>
                </div>
              </div>
              <?php } ?>
              <!-- end of product cart -->
                  </div>

            <?php foreach ($vouchers as $vouchers) { ?>
            <tr>
              <td class="image"></td>
              <td class="name"><?php echo $vouchers['description']; ?></td>
              <td class="model"></td>
              <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
                &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/sellya/image/remove.png" alt="<?php echo $text_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
              <td class="price"><?php echo $vouchers['amount']; ?></td>
              <td class="total"><?php echo $vouchers['amount']; ?></td>
            </tr>
            <?php } ?>

          </tbody>

      </div>
    </div>
  </form>
  </div>

  <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
 <!--  <h2><?php echo $text_next; ?></h2> -->
<div class="row-fluid cont-che">
  <div class="span9">
  <div class="content">
    <p>
      <?php echo $text_next_choice; ?>
    </p>

    <table class="radio">
      <?php if ($coupon_status) { ?>
      <tr class="highlight">
        <td>
          <?php 
          if ($next == 'coupon') { ?>
            <input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" />

          <?php } 
          else { ?>
            <input type="radio" name="next" value="coupon" id="use_coupon" />

          <?php } ?>
        </td>
        <td>
          <label for="use_coupon">
            <?php echo $text_use_coupon; ?>
          </label>
        </td>
      </tr>
      <?php } ?>

      <?php 
      if ($voucher_status) { ?>
      <tr class="highlight">
        <td>
          <?php 
          if ($next == 'voucher') { ?>
            <input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" />

          <?php } 
          else { ?>
            <input type="radio" name="next" value="voucher" id="use_voucher" />

          <?php } ?>
        </td>

        <td>
          <label for="use_voucher">
            <?php echo $text_use_voucher; ?>
          </label>
        </td>
      </tr>
      <?php } ?>

      <?php if ($reward_status) { ?>
      <tr class="highlight">
        <td>
          <?php 
          if ($next == 'reward') { ?>
            <input type="radio" name="next" value="reward" id="use_reward" checked="checked" />

          <?php } 
          else { ?>
            <input type="radio" name="next" value="reward" id="use_reward" />

          <?php } ?>
        </td>

        <td>
          <label for="use_reward">
            <?php echo $text_use_reward; ?>
          </label>
        </td>
      </tr>
      <?php } ?>

      <?php if ($shipping_status) { ?>
      <tr class="highlight">
        <td>
          <?php 
          if ($next == 'shipping') { ?>
            <input type="radio" name="next" value="shipping" id="shipping_estimate" checked="checked" />

          <?php } 
          else { ?>
            <input type="radio" name="next" value="shipping" id="shipping_estimate" />

          <?php } ?>
        </td>

        <td>
          <label for="shipping_estimate">
            <?php echo $text_shipping_estimate; ?>
          </label>
        </td>
      </tr>
      <?php } ?>

    </table>
  </div>

  <div class="cart-module">

    <!-- COUPON -->
    <div id="coupon" class="content custom-inputs" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <!-- <?php echo $entry_coupon; ?>&nbsp; -->
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" />
        <input type="hidden" name="next" value="coupon" />
        &nbsp;
        <input type="submit" value="<?php echo $button_coupon; ?>" class="button" />
      </form>
    </div>

    <!-- VOUCHER -->
    <div id="voucher" class="content custom-inputs" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <!-- <?php echo $entry_voucher; ?>&nbsp; -->
        <input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" />
        <input type="hidden" name="next" value="voucher" />
        &nbsp;
        <input type="submit" value="<?php echo $button_voucher; ?>" class="button" />
      </form>
    </div>
    
    <!-- REWARD -->
    <div id="reward" class="content custom-inputs" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <!-- <?php echo $entry_reward; ?>&nbsp; -->
        <input type="text" name="reward" value="<?php echo $reward; ?>" placeholder="<?php echo $entry_reward; ?>" />
        <input type="hidden" name="next" value="reward" />
        &nbsp;
        <input type="submit" value="<?php echo $button_reward; ?>" class="button" />
      </form>
    </div>

    <div id="shipping" class="content custom-inputs" style="display: <?php echo ($next == 'shipping' ? 'block' : 'none'); ?>;">
      <p>
        <?php echo $text_shipping_detail; ?>
      </p>

      <div class="row-fluid">
        <!-- <span class="required">*</span>
        <?php echo $entry_country; ?> -->
        
        <div class="span4">
          <select name="country_id">
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

        <!-- <span class="required">*</span>
        <?php echo $entry_zone; ?> -->

        <div class="span4">
          <select name="zone_id">
          </select>
        </div>

        <!-- <span id="postcode-required" class="required">*</span>
        <?php echo $entry_postcode; ?> -->

        <div class="span4">
          <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="* <?php echo $entry_postcode; ?>" />
        </div>

      </div>

      <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="button" />
    </div>
  </div>

</div>
  <?php } ?>
  <div class="span3">
    <div class="cart-total">
      <div id="total">
        <?php foreach ($totals as $total) { ?>
          <div class="row-fluid">
            <b><?php echo $total['title']; ?>:</b>
            <?php echo $total['text']; ?>
          </div>
        <?php } ?>
      </div>
    </div>
    <div class="buttons">
      <div class="right2"><a href="<?php echo $checkout; ?>" class="button"><?php echo $button_checkout; ?></a></div>
    </div>
  </div>

  <div class="clearfix"></div>
</div>
  <div class="row-fluid continue-shop">
    <a href="<?php echo $continue; ?>" class="button">
      <?php echo $button_shopping; ?>
    </a>
  </div>

  <div id="checkoutWrap">
    <div id="checkout">
      <div class="checkout-heading">
        <?php echo $text_checkout_option; ?>
      </div>
      <div class="checkout-content"></div>
    </div>

    <?php if (!$logged) { ?>
      <div id="payment-address">
        <div class="checkout-heading">
          <span>
            <?php echo $text_checkout_account; ?>
          </span>
        </div>
        <div class="checkout-content"></div>
      </div>

    <?php } else { ?>
      <div id="payment-address">
        <div class="checkout-heading">
          <span>
          <?php echo $text_checkout_payment_address; ?>
          </span>
        </div>
        <div class="checkout-content"></div>
      </div>
    <?php } ?>

    <?php if ($shipping_required) { ?>
      <div id="shipping-address">
        <div class="checkout-heading">
          <?php echo $text_checkout_shipping_address; ?>
        </div>
        <div class="checkout-content"></div>
      </div>

      <div id="shipping-method">
        <div class="checkout-heading">
          <?php echo $text_checkout_shipping_method; ?>
        </div>
        <div class="checkout-content"></div>
      </div>
    <?php } ?>

    <div id="payment-method">
      <div class="checkout-heading">
        <?php echo $text_checkout_payment_method; ?>
      </div>
      <div class="checkout-content"></div>
    </div>

    <div id="confirm">
      <div class="checkout-heading">
        <?php echo $text_checkout_confirm; ?>
      </div>
      <div class="checkout-content"></div>
    </div>
  </div>  

<?php echo $content_bottom; ?>
</div>
</div>

<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '600px',
					height: '400px',
					href: false,
					html: html
				});
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/sellya/image/loading.gif" alt="" /></span>');
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

// Checkput JS
$('#checkout .checkout-content input[name=\'account\']').live('change', function() {
  if ($(this).attr('value') == 'register') {
    $('#payment-address .checkout-heading span').html('<?php echo $text_checkout_account; ?>');
  } else {
    $('#payment-address .checkout-heading span').html('<?php echo $text_checkout_payment_address; ?>');
  }
});
$('.checkout-heading a').live('click', function() {
  $('.checkout-content').slideUp('slow');
  
  $(this).parent().parent().find('.checkout-content').slideDown('slow');
});
<?php if (!$logged) { ?> 
$(document).ready(function() {
  $.ajax({
    url: 'index.php?route=checkout/login',
    dataType: 'html',
    success: function(html) {
      $('#checkout .checkout-content').html(html);
        
      $('#checkout .checkout-content').slideDown('slow');
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});   
<?php } else { ?>
$(document).ready(function() {
  $.ajax({
    url: 'index.php?route=checkout/payment_address',
    dataType: 'html',
    success: function(html) {
      $('#payment-address .checkout-content').html(html);
        
      $('#payment-address .checkout-content').slideDown('slow');
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
<?php } ?>
// Checkout
$('#button-account').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').attr('value'),
    dataType: 'html',
    beforeSend: function() {
      $('#button-account').attr('disabled', true);
      $('#button-account').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },    
    complete: function() {
      $('#button-account').attr('disabled', false);
      $('.wait').remove();
    },      
    success: function(html) {
      $('.warning, .error').remove();
      
      $('#payment-address .checkout-content').html(html);
        
      $('#checkout .checkout-content').slideUp('slow');
        
      $('#payment-address .checkout-content').slideDown('slow');
        
      $('.checkout-heading a').remove();
        
      $('#checkout .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
// Login
$('#button-login').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/login/validate',
    type: 'post',
    data: $('#checkout #login :input'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-login').attr('disabled', true);
      $('#button-login').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-login').attr('disabled', false);
      $('.wait').remove();
    },        
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        $('#checkout .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
        
        $('.warning').fadeIn('slow');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
// Register
$('#button-register').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/register/validate',
    type: 'post',
    data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-register').attr('disabled', true);
      $('#button-register').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-register').attr('disabled', false); 
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
            
      if (json['redirect']) {
        location = json['redirect'];        
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }
        
        if (json['error']['firstname']) {
          $('#payment-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
        }
        
        if (json['error']['lastname']) {
          $('#payment-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
        } 
        
        if (json['error']['email']) {
          $('#payment-address input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
        }
        
        if (json['error']['telephone']) {
          $('#payment-address input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
        } 
          
        if (json['error']['company_id']) {
          $('#payment-address input[name=\'company_id\']').after('<span class="error">' + json['error']['company_id'] + '</span>');
        } 
        
        if (json['error']['tax_id']) {
          $('#payment-address input[name=\'tax_id\']').after('<span class="error">' + json['error']['tax_id'] + '</span>');
        } 
                                    
        if (json['error']['address_1']) {
          $('#payment-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
        } 
        
        if (json['error']['city']) {
          $('#payment-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
        } 
        
        if (json['error']['postcode']) {
          $('#payment-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        } 
        
        if (json['error']['country']) {
          $('#payment-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('#payment-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
        
        if (json['error']['password']) {
          $('#payment-address input[name=\'password\']').after('<span class="error">' + json['error']['password'] + '</span>');
        } 
        
        if (json['error']['confirm']) {
          $('#payment-address input[name=\'confirm\']').after('<span class="error">' + json['error']['confirm'] + '</span>');
        }                                                                 
      } else {
        <?php if ($shipping_required) { ?>        
        var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
        
        if (shipping_address) {
          $.ajax({
            url: 'index.php?route=checkout/shipping_method',
            dataType: 'html',
            success: function(html) {
              $('#shipping-method .checkout-content').html(html);
              
              $('#payment-address .checkout-content').slideUp('slow');
              
              $('#shipping-method .checkout-content').slideDown('slow');
              
              $('#checkout .checkout-heading a').remove();
              $('#payment-address .checkout-heading a').remove();
              $('#shipping-address .checkout-heading a').remove();
              $('#shipping-method .checkout-heading a').remove();
              $('#payment-method .checkout-heading a').remove();                      
              
              $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');                  
              $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
              $.ajax({
                url: 'index.php?route=checkout/shipping_address',
                dataType: 'html',
                success: function(html) {
                  $('#shipping-address .checkout-content').html(html);
                },
                error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
              }); 
            },
            error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
          }); 
        } else {
          $.ajax({
            url: 'index.php?route=checkout/shipping_address',
            dataType: 'html',
            success: function(html) {
              $('#shipping-address .checkout-content').html(html);
              
              $('#payment-address .checkout-content').slideUp('slow');
              
              $('#shipping-address .checkout-content').slideDown('slow');
              
              $('#checkout .checkout-heading a').remove();
              $('#payment-address .checkout-heading a').remove();
              $('#shipping-address .checkout-heading a').remove();
              $('#shipping-method .checkout-heading a').remove();
              $('#payment-method .checkout-heading a').remove();              
              $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
            },
            error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
          });     
        }
        <?php } else { ?>
        $.ajax({
          url: 'index.php?route=checkout/payment_method',
          dataType: 'html',
          success: function(html) {
            $('#payment-method .checkout-content').html(html);
            
            $('#payment-address .checkout-content').slideUp('slow');
            
            $('#payment-method .checkout-content').slideDown('slow');
            
            $('#checkout .checkout-heading a').remove();
            $('#payment-address .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();                
            
            $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });         
        <?php } ?>
        
        $.ajax({
          url: 'index.php?route=checkout/payment_address',
          dataType: 'html',
          success: function(html) {
            $('#payment-address .checkout-content').html(html);
              
            $('#payment-address .checkout-heading span').html('<?php echo $text_checkout_payment_address; ?>');
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }  
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
// Payment Address  
$('#button-payment-address').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/payment_address/validate',
    type: 'post',
    data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-payment-address').attr('disabled', true);
      $('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-payment-address').attr('disabled', false);
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }
                
        if (json['error']['firstname']) {
          $('#payment-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
        }
        
        if (json['error']['lastname']) {
          $('#payment-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
        } 
        
        if (json['error']['telephone']) {
          $('#payment-address input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
        }   
        
        if (json['error']['company_id']) {
          $('#payment-address input[name=\'company_id\']').after('<span class="error">' + json['error']['company_id'] + '</span>');
        } 
        
        if (json['error']['tax_id']) {
          $('#payment-address input[name=\'tax_id\']').after('<span class="error">' + json['error']['tax_id'] + '</span>');
        } 
                            
        if (json['error']['address_1']) {
          $('#payment-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
        } 
        
        if (json['error']['city']) {
          $('#payment-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
        } 
        
        if (json['error']['postcode']) {
          $('#payment-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        } 
        
        if (json['error']['country']) {
          $('#payment-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('#payment-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
      } else {
        <?php if ($shipping_required) { ?>
        $.ajax({
          url: 'index.php?route=checkout/shipping_address',
          dataType: 'html',
          success: function(html) {
            $('#shipping-address .checkout-content').html(html);
          
            $('#payment-address .checkout-content').slideUp('slow');
            
            $('#shipping-address .checkout-content').slideDown('slow');
            
            $('#payment-address .checkout-heading a').remove();
            $('#shipping-address .checkout-heading a').remove();
            $('#shipping-method .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();
            
            $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
        <?php } else { ?>
        $.ajax({
          url: 'index.php?route=checkout/payment_method',
          dataType: 'html',
          success: function(html) {
            $('#payment-method .checkout-content').html(html);
          
            $('#payment-address .checkout-content').slideUp('slow');
            
            $('#payment-method .checkout-content').slideDown('slow');
            
            $('#payment-address .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();
                          
            $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        }); 
        <?php } ?>
        
        $.ajax({
          url: 'index.php?route=checkout/payment_address',
          dataType: 'html',
          success: function(html) {
            $('#payment-address .checkout-content').html(html);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });         
      }   
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
// Shipping Address     
$('#button-shipping-address').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/shipping_address/validate',
    type: 'post',
    data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-shipping-address').attr('disabled', true);
      $('#button-shipping-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-shipping-address').attr('disabled', false);
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#shipping-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }
                
        if (json['error']['firstname']) {
          $('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
        }
        
        if (json['error']['lastname']) {
          $('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
        } 
        
        if (json['error']['email']) {
          $('#shipping-address input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
        }
        
        if (json['error']['telephone']) {
          $('#shipping-address input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
        }   
                    
        if (json['error']['address_1']) {
          $('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
        } 
        
        if (json['error']['city']) {
          $('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
        } 
        
        if (json['error']['postcode']) {
          $('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        } 
        
        if (json['error']['country']) {
          $('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
      } else {
        $.ajax({
          url: 'index.php?route=checkout/shipping_method',
          dataType: 'html',
          success: function(html) {
            $('#shipping-method .checkout-content').html(html);
            
            $('#shipping-address .checkout-content').slideUp('slow');
            
            $('#shipping-method .checkout-content').slideDown('slow');
            
            $('#shipping-address .checkout-heading a').remove();
            $('#shipping-method .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();
            
            $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');              
            
            $.ajax({
              url: 'index.php?route=checkout/shipping_address',
              dataType: 'html',
              success: function(html) {
                $('#shipping-address .checkout-content').html(html);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });           
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        }); 
        
        $.ajax({
          url: 'index.php?route=checkout/payment_address',
          dataType: 'html',
          success: function(html) {
            $('#payment-address .checkout-content').html(html);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });         
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
// Guest
$('#button-guest').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/guest/validate',
    type: 'post',
    data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-guest').attr('disabled', true);
      $('#button-guest').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-guest').attr('disabled', false); 
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }
                
        if (json['error']['firstname']) {
          $('#payment-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
        }
        
        if (json['error']['lastname']) {
          $('#payment-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
        } 
        
        if (json['error']['email']) {
          $('#payment-address input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
        }
        
        if (json['error']['telephone']) {
          $('#payment-address input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
        } 
          
        if (json['error']['company_id']) {
          $('#payment-address input[name=\'company_id\']').after('<span class="error">' + json['error']['company_id'] + '</span>');
        } 
        
        if (json['error']['tax_id']) {
          $('#payment-address input[name=\'tax_id\']').after('<span class="error">' + json['error']['tax_id'] + '</span>');
        } 
                                    
        if (json['error']['address_1']) {
          $('#payment-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
        } 
        
        if (json['error']['city']) {
          $('#payment-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
        } 
        
        if (json['error']['postcode']) {
          $('#payment-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        } 
        
        if (json['error']['country']) {
          $('#payment-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('#payment-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
      } else {
        <?php if ($shipping_required) { ?>  
        var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
        
        if (shipping_address) {
          $.ajax({
            url: 'index.php?route=checkout/shipping_method',
            dataType: 'html',
            success: function(html) {
              $('#shipping-method .checkout-content').html(html);
              
              $('#payment-address .checkout-content').slideUp('slow');
              
              $('#shipping-method .checkout-content').slideDown('slow');
              
              $('#payment-address .checkout-heading a').remove();
              $('#shipping-address .checkout-heading a').remove();
              $('#shipping-method .checkout-heading a').remove();
              $('#payment-method .checkout-heading a').remove();    
                              
              $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
              $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');                  
              
              $.ajax({
                url: 'index.php?route=checkout/guest_shipping',
                dataType: 'html',
                success: function(html) {
                  $('#shipping-address .checkout-content').html(html);
                },
                error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
              });
            },
            error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
          });         
        } else {
          $.ajax({
            url: 'index.php?route=checkout/guest_shipping',
            dataType: 'html',
            success: function(html) {
              $('#shipping-address .checkout-content').html(html);
              
              $('#payment-address .checkout-content').slideUp('slow');
              
              $('#shipping-address .checkout-content').slideDown('slow');
              
              $('#payment-address .checkout-heading a').remove();
              $('#shipping-address .checkout-heading a').remove();
              $('#shipping-method .checkout-heading a').remove();
              $('#payment-method .checkout-heading a').remove();
              
              $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
            },
            error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
          });
        }
        <?php } else { ?>       
        $.ajax({
          url: 'index.php?route=checkout/payment_method',
          dataType: 'html',
          success: function(html) {
            $('#payment-method .checkout-content').html(html);
            
            $('#payment-address .checkout-content').slideUp('slow');
              
            $('#payment-method .checkout-content').slideDown('slow');
              
            $('#payment-address .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();
                            
            $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });       
        <?php } ?>
      }  
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
// Guest Shipping
$('#button-guest-shipping').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/guest_shipping/validate',
    type: 'post',
    data: $('#shipping-address input[type=\'text\'], #shipping-address select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-guest-shipping').attr('disabled', true);
      $('#button-guest-shipping').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-guest-shipping').attr('disabled', false); 
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#shipping-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }
                
        if (json['error']['firstname']) {
          $('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
        }
        
        if (json['error']['lastname']) {
          $('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
        } 
                    
        if (json['error']['address_1']) {
          $('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
        } 
        
        if (json['error']['city']) {
          $('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
        } 
        
        if (json['error']['postcode']) {
          $('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        } 
        
        if (json['error']['country']) {
          $('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
      } else {
        $.ajax({
          url: 'index.php?route=checkout/shipping_method',
          dataType: 'html',
          success: function(html) {
            $('#shipping-method .checkout-content').html(html);
            
            $('#shipping-address .checkout-content').slideUp('slow');
            
            $('#shipping-method .checkout-content').slideDown('slow');
            
            $('#shipping-address .checkout-heading a').remove();
            $('#shipping-method .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();
              
            $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });       
      }  
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
$('#button-shipping-method').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/shipping_method/validate',
    type: 'post',
    data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-shipping-method').attr('disabled', true);
      $('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-shipping-method').attr('disabled', false);
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#shipping-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }     
      } else {
        $.ajax({
          url: 'index.php?route=checkout/payment_method',
          dataType: 'html',
          success: function(html) {
            $('#payment-method .checkout-content').html(html);
            
            $('#shipping-method .checkout-content').slideUp('slow');
            
            $('#payment-method .checkout-content').slideDown('slow');
            $('#shipping-method .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();
            
            $('#shipping-method .checkout-heading').append('<a><?php echo $text_modify; ?></a>'); 
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });         
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
$('#button-payment-method').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/payment_method/validate', 
    type: 'post',
    data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-payment-method').attr('disabled', true);
      $('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },  
    complete: function() {
      $('#button-payment-method').attr('disabled', false);
      $('.wait').remove();
    },      
    success: function(json) {
      $('.warning, .error').remove();
      
      if (json['redirect']) {
        location = json['redirect'];
      } else if (json['error']) {
        if (json['error']['warning']) {
          $('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
        }     
      } else {
        $.ajax({
          url: 'index.php?route=checkout/confirm',
          dataType: 'html',
          success: function(html) {
            $('#confirm .checkout-content').html(html);
            
            $('#payment-method .checkout-content').slideUp('slow');
            
            $('#confirm .checkout-content').slideDown('slow');
            
            $('#payment-method .checkout-heading a').remove();
            
            $('#payment-method .checkout-heading').append('<a><?php echo $text_modify; ?></a>');  
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });         
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  }); 
});
//--></script>
<?php } ?>
<?php echo $footer; ?>