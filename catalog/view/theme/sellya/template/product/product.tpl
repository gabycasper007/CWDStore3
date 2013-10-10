
<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span12">
  <div class="row-fluid" itemscope itemtype="http://schema.org/Product"> <!-- Google Rich Snippets, do not delete! -->

    <?php echo $content_top; ?>
    
    <!-- Breadcrumbs -->
    <?php require($showbreadcrumbs); ?> 
    
    <!-- Product name, titles -->
    <header class="product-name">
      <h1><span itemprop="name"><?php echo $heading_title; ?></span></h1> <!-- Google Rich Snippets, do not delete! -->
    
      <?php if (isset($useo_heading_title2)) {?>
        <h2 class = "useo_h2"><?php echo $useo_heading_title2; ?></h2><!-- secondary title for seo -->
      <?php } ?>
    </header>
    
    <div class="row-fluid">
      <div class="span9"> <!-- detalii produs stanga -->
    
        <!-- Product Info -->
        <div class="product-info row-fluid">
          <!-- Left side -->
          <div class="span6" id="productImages">
            <?php echo $product_images; ?>
          </div> <!-- // .image -->
    
          <div class="span6" id="productMainDetails">
    
            <!-- Review and stars ratings -->
            <?php if ($review_status) { ?>
              <div id="review">
                  <img src="catalog/view/theme/sellya/image/stars/stars<?php echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />
    
                  <a href="<?php echo $currentLink; ?>#tabs">
                    <?php echo $reviews; ?>
                  </a>
    
                  <a href="<?php echo $currentLink; ?>#tabs">
                    <?php echo $text_write; ?>
                  </a>
              </div>
            <?php } ?>
            <div class="share-this">
              <span class='st_facebook_large' displayText='Facebook'></span>
              <span class='st_twitter_large' displayText='Tweet'></span>
              <span class='st_googleplus_large' displayText='Google +'></span>
              <span class='st_linkedin_large' displayText='LinkedIn'></span>
              <span class='st_pinterest_large' displayText='Pinterest'></span>
              <span class='st_email_large' displayText='Email'></span>
<!--               <span class='st_sharethis_large' displayText='ShareThis'></span> -->
            </div>
    
            <!-- Short Description -->
            <?php if ($shortdesc) { ?>
              <h3><?php echo $text_description; ?></h3>
              <div class="shortDescription">
                <?php echo $shortdesc; ?>
              </div>
            <?php } ?>
    
            <!-- Product Options -->
            <?php echo $product_options; ?>

            <?php if ($tags) { ?>
              <div class="tags">

                <!-- <b>
                  <?php echo $text_tags; ?>
                </b> -->
                <ul>
                  <?php for ($i = 0; $i < count($tags); $i++) { ?>
                  <?php if ($i < (count($tags) - 1)) { ?>
                  <li>
                    <a href="<?php echo $tags[$i]['href']; ?>">
                      <?php echo $tags[$i]['tag']; ?>
                    </a>
                  </li>

                    <?php } else { ?>
                    <li>
                      <a href="<?php echo $tags[$i]['href']; ?>">
                        <?php echo $tags[$i]['tag']; ?>
                      </a>
                    </li>
                    <?php } ?>
                  <?php } ?>
                </ul>

              </div>
            <?php } ?>
         
          </div> <!-- productMainDetails -->
        </div> <!-- // Product Info-->
    
        <?php echo $product_tabs; ?> <!-- product tabs -->
        <?php echo $product_related; ?> <!-- product related -->
      </div>
    
      <div class="span3 preturiRightSide"> <!-- preturi right side -->
        <!-- Product navigation (next/prev product) -->
        <div id="prev-next">
          <?php if ($prev_prod_name) { ?>
            <a href="<?php echo $prev_prod_url; ?>" class="tiptip" title="<?php echo $prev_prod_name;?>"><span>&laquo; <?php echo $text_previous_product;?></span></a>
          <?php } ?>
    
          <?php if ($next_prod_name) { ?>
            <a href="<?php echo $next_prod_url; ?>" class="tiptip" title="<?php echo $next_prod_name;?>"><span><?php echo $text_next_product;?> &raquo;</span></a>
          <?php } ?>
        </div>  
    
        <!-- the prices -->
        <?php if ($price) { ?>
          <div class="price">
        
            <?php if (!$special) { ?>
    
              <span class="price-new">
                <span class="<?php echo $holder_baseprice ;?>"><?php echo $price; ?></span>
              </span> 
                  
            <?php } else { 
                  
              if ($special < $price) {
              ?>
                <span class="price-old <?php echo $holder_baseprice_old ;?>">
                  <?php echo $price; ?>
                </span>
                 
                
              <?php } ?>
              
                  <span class="price-new <?php echo $holder_baseprice ;?>">
                  <?php echo $special; ?>
                </span>
               
            <?php } ?>
          
            <div id="loadingOpprice"></div>
        
            <?php  if ($tax) { ?>
              <div class="price-tax">
                <?php echo $text_tax; ?>
                <span class="<?php echo $holder_taxprice ;?>"><?php echo $tax; ?></span>
              </div>
            <?php } ?>
                                                    
            <?php  if ($points) { ?>
              <div class="reward">
                <small>
                  <?php echo $text_points; ?>
                  <?php echo $points; ?>
                </small>
              </div>
                  
              <span class="reward"><small><?php echo $text_points; ?> <span class="<?php echo $holder_price_in_reward;?>"><?php echo $points; ?></span></small></span><br />
                  
            <?php }  ?>
        
            <?php if ($discounts) { ?>
              <div class="discount">
                <?php foreach ($discounts as $discount) { 
                  echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?>
                <?php } ?>
              </div>
            <?php } ?>
        
          </div>
        <?php } ?>  <!-- // .price -->
         

         <div class="cart">

                  
            <!-- Add To Cart -->
              <div class="add-to-cart">
               
                <div class="row-fluid">
                  <div class="cantitate">
                       <input type="text" name="quantity" size="2" class="input-mini" value="<?php echo $minimum; ?>" />
                     <div class="edit-cant" onclick="$('.input-mini').val(parseInt($('.input-mini').val())+1);"></div>
                    <div class="edit-cant2" onclick="v=parseInt($('.input-mini').val())-1;if(v>1) rval = v; else rval = 1; $('.input-mini').val(rval);"></div>

                  </div>
                  <div class="stock"> 
                    <?php echo $stock; ?>
                     <?php if ( $icon  == 1) { ?> <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>out-of-stock.png" alt="Out of stock">
                      <?php } 
                          elseif ( $icon == 2) { ?> <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>limited-stock.png" alt="Stoc limitat"> 
                         <?php } 
                          else { ?> <img src="<?php echo DIR_TEMPLATE_IMAGE; ?>in-stock.png" alt="In stoc"> <?php } ?> <?php 

                          //if($config_live_show_weight && $weight>0) { ?> <!-- <span><?php echo $text_weight; ?></span> --> <?php /*if($config_live_show_weight_decimal_place>0) { $weight = number_format ( $weight , $config_live_show_weight_decimal_place , '.' , '' ); } else { $weight = number_format ( $weight , 2 , '.' , '' ); } */ ?> <!-- <a href="#" class="<?php echo $holder_baseweight ;?>"><?php echo $weight; ?> <?php echo $weight_class;?></a> --> <?php //}?>
                  </div>
                </div>

                <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button-exclusive" />
              </div>
              <div id="wishAndCompare">
                <div class="img-subdesc"><img src="catalog/view/theme/sellya/imgs/compara.png"/></div>
                <div class="compare" onclick="addToCompare('<?php echo $product_id; ?>');">
                  <?php echo $button_compare; ?>
                </div>
                <div class="img-subdesc"><img src="catalog/view/theme/sellya/imgs/salveaza.png"/></div>
                <div class="wishlist" onclick="addToWishList('<?php echo $product_id; ?>');">
                  <?php echo $button_wishlist; ?>
                </div>
                 <div class="img-subdesc"><img src="catalog/view/theme/sellya/imgs/printeaza.png"/></div>
                <div class="print">
                  <A HREF="javascript:window.print()">Printeaza</A>
                </div>
              </div>
              
              <?php if ($minimum > 1) { ?>
                <div class="minimum"><?php echo $text_minimum; ?></div>
              <?php } ?>

        <div class="productDetails">
                      
          <?php if ($manufacturer) { ?>
            <a href="<?php echo $manufacturers; ?>">
              <?php echo $manufacturer; ?>
            </a>
          <?php } ?>
          
          <?php if ($model) { ?>
            <div>
              <?php echo $text_model; ?>
              <?php echo $model; ?>
            </div>
          <?php } ?>
          
          <?php if ($reward) { ?>
            <div>
              <?php echo $text_reward; ?>
              <?php echo $reward; ?>
            </div> 
          
            <div>
              <?php echo $text_reward; ?>
            </div>
            <a  class="<?php echo $holder_basepoint ;?>"><?php echo $reward; ?></a>
          <?php } ?>
          
          <?php if($this->config->get('sellya_product_viewed_status') ==1) { ?>
            <div>
              <?php echo $text_product_viewed; ?>
            <?php echo $product_info['viewed']; ?> 
            </div>
          <?php } ?>
        
        </div> <!-- // productDetails -->
        
        <div class="row-fluid">
          <a href="#" class="cumpara-in-rate">Cumpara in rate</a>
          <div class="livrare preturiLeftSide">
            <h3>
              <?php echo $text_livrare; ?>
            </h3>
            <span>
              <?php echo $text_span_livrare; ?>
            </span>

            <div class="row-fluid">
              <label for="country-id"><?php echo $text_termen_livrare; ?></label>
              <select name="country_id" class="large-field">
                <option value=""><?php echo $text_select; ?></option>
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

            <img src="catalog/view/theme/sellya/imgs/divider-livrare.png" alt="">
            <p class="telephone-livrare">
              <?php echo $config_telephone; ?>
            </p>
            </div>
          </div>

          <p class="comision">
            <?php echo $text_comision_livrare; ?>
            <a href="">Afla cum !</a>
          </p>
          </div>
        </div>
      </div>
    </div>
        
    <?php echo $content_bottom; ?>
  </div>

<script type="text/javascript"><!--

  $(function(){
      $(".tiptip").tipTip();
  });

  $(document).ready(function() {
  	$('.colorbox').colorbox({
  		overlayClose: true,
  		opacity: 0.5,
  		rel: "colorbox"
  	});
  });

  $('#button-cart').bind('click', function() {
  	$.ajax({
  		url: 'index.php?route=checkout/cart/add',
  		type: 'post',
  		data: $('.add-to-cart input[type=\'text\'], .add-to-cart input[type=\'hidden\'], .add-to-cart input[type=\'radio\']:checked, .add-to-cart input[type=\'checkbox\']:checked, .add-to-cart select, .add-to-cart textarea'),
  		dataType: 'json',
  		success: function(json) {
  			$('.success, .warning, .attention, information, .error').remove();
  			
  			if (json['error']) {
  				if (json['error']['option']) {
  					for (i in json['error']['option']) {
  						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
  					}
  				}
  			} 
  			
  			if (json['success']) {
  				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/sellya/image/close.png" alt="" class="close" /></div>');
  					
  				$('.success').fadeIn('slow');
  					
  				$('#cart-total').html(json['total']);
  				
  				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
  			}	
  		}
  	});
  });
//--></script>

<?php if ($options) { ?>
  <script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>

  <?php foreach ($options as $option) { ?>

    <?php if ($option['type'] == 'file') { ?>
      <script type="text/javascript"><!--
      new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
      	action: 'index.php?route=product/product/upload',
      	name: 'file',
      	autoSubmit: true,
      	responseType: 'json',
      	onSubmit: function(file, extension) {
      		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
      		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
      	},
      	onComplete: function(file, json) {
      		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
      		
      		$('.error').remove();
      		
      		if (json['success']) {
      			alert(json['success']);
      			
      			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
      		}
      		
      		if (json['error']) {
      			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
      		}
      		
      		$('.loading').remove();	
      	}
      });
      //--></script>
    <?php } ?>

  <?php } ?>

<?php } ?>
<script type="text/javascript"><!--
  $('#review .pagination a').live('click', function() {
  	$('#review').fadeOut('slow');
  		
  	$('#review').load(this.href);
  	
  	$('#review').fadeIn('slow');
  	
  	return false;
  });
  //$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
  $('#button-review').bind('click', function() {
  	$.ajax({
  		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
  		type: 'post',
  		dataType: 'json',
  		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
  		beforeSend: function() {
  			$('.success, .warning').remove();
  			$('#button-review').attr('disabled', true);
  			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
  		},
  		complete: function() {
  			$('#button-review').attr('disabled', false);
  			$('.attention').remove();
  		},
  		success: function(data) {
  			if (data['error']) {
  				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
  			}
  			
  			if (data['success']) {
  				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
  								
  				$('input[name=\'name\']').val('');
  				$('textarea[name=\'text\']').val('');
  				$('input[name=\'rating\']:checked').attr('checked', '');
  				$('input[name=\'captcha\']').val('');
  			}
  		}
  	});
  });

  $('#tabs a').tabs();
//--></script> 

<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript"><!--
  $(document).ready(function() {

  	if ($.browser.msie && $.browser.version == 6) {
  		$('.date, .datetime, .time').bgIframe();
  	}

    $('.date').datepicker(
      {
       dateFormat: 'dd-mm-yy',
       dayNamesMin: [ "Du", "Lu", "Ma", "Mi", "Joi", "Vi", "Sa" ],
       monthNames: [ "Ianuarie", "Februarie", "Martie", "Aprilie", "Mai", "Iunie", "Iulie", "August", "Septembrie", "Octombrie", "Noiembrie", "Decembrie" ],
       showAnim: "slideDown",
       beforeShowDay: function choosedays(d) {
          var dmy = (d.getMonth()+1); 
          unavailableDates = ['06-30-2013'];

          if(d.getMonth()<9) 
              dmy="0"+dmy; 
          dmy+= "-"; 

          if(d.getDate()<10) dmy+="0"; 
              dmy+=d.getDate() + "-" + d.getFullYear(); 

          //console.log(dmy+' : '+($.inArray(dmy, unavailableDates)));

          if ($.inArray(dmy, unavailableDates) != -1) {
              return [false, "","unAvailable"]; 
          } else{
               return [true,"","Available"]; 
          }
          //$.datepicker.noWeekends;
       },
       showButtonPanel: true,
       firstDay: 1,
       defaultDate: 0,
       minDate: 0
      }
    );

  	$('.datetime').datetimepicker({
  		dateFormat: 'yy-mm-dd',
  		timeFormat: 'h:m'
  	});

  	$('.time').timepicker({timeFormat: 'h:m'});

    $('.desc').hover(function(){
      id = $(this).attr('id').replace('desc_', '');

      if ($('#desc_description_' + id).html()) {
        $('#desc_description_' + id).show();
      }
    },function(){
      $('#desc_description_' + id).hide();
    });
  });

  $('.image-additional').elastislide({
    speed       : 450,  // animation speed
    easing      : '', // animation easing effect
    // the minimum number of items to show. When we resize the window, this will make sure minItems are always shown (unless of course minItems is higher than the total number of elements)
        minItems  : 1
      });
  //Fix to adjust on windows resize
  $(window).triggerHandler('resize.elastislide');

//--></script>
<?php echo $footer; ?>