      </div> <!-- end container -->
    </div>
  </div>

<footer id="footer">
   
<?php if($this->config->get('sellya_information_block_status')== 1) { ?> 

    <div class="container">

      <div id="footer_info_content" class="row-fluid">
        <div class="span3 inf">
         <img src="catalog/view/theme/sellya/imgs/info.png" style="float:left; margin-right:10px;" alt="Informatii" title="Informatii">
           <h3><?php echo $text_information; ?></h3>
            <ul>
              <?php 
                $i = 0;  
               foreach ($informations as $information) { 
                 if (++$i <= 6) {  ?>  
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php }
              } ?>
              <li><a href="http://anpc.ro">ANPC</a></li>
          </ul>
        </div>
        <div class="span3 inf">
           <img src="catalog/view/theme/sellya/imgs/clienti.png" style="float:left; margin-right:10px;" alt="Serviciu clienti" title="Serviciu clienti">
          <h3><?php echo $text_service; ?></h3>
          <ul>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
            <li><a href="index.php?route=information/news">Our News</a></li>
            <?php 
              $i = 0;  
              foreach ($informations as $information) { 
                if (++$i > 6) {  ?>  
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php }
              } ?>
          </ul>
        </div>
        <div class="span3 inf">
          <img src="catalog/view/theme/sellya/imgs/extra.png" style="float:left; margin-right:10px;" alt="Extra" title="Extra">
            <h3><?php echo $text_extra; ?></h3>
            <ul>
              <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
              <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
              <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
              <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          </ul>
        </div>
       <!--  <div class="span2">
          <img src="catalog/view/theme/sellya/imgs/clienti.png" style="float:left; margin-right:10px;" alt="Serviciu clienti" title="Serviciu clienti">
            <h3><?php echo $text_account; ?></h3>
              <ul>
                <li><a href="<?php echo $account; ?>"><?php echo $text_enter_account; ?></a></li>
                <li><a href="<?php echo $register; ?>"><?php echo $text_create_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
              </ul>
        </div> -->
        <div class="span4 inf">
          <img src="catalog/view/theme/sellya/imgs/phone.png" style="float:left; margin-right:10px;" alt="contact" title="contact">
                <h3><?php echo $text_contact; ?></h3>
          <div class="redBorderMeRight">
            <div id="sloganFtr">
              <?php echo $address; ?>
            </div>
            <div id="phoneFtr">
              <?php echo $telephone; ?>
            </div>
             <div id="techSup">
             Tech support: <?php echo $tech; ?>
            </div>
            <div id="infoLine">
             Sales infoline: <?php echo $infoline; ?>
            </div>
             <div id="mailFtr">
             <a href="mailto:<?php echo $email; ?>"> <?php echo $email; ?></a>
            </div>
          </div>

         
    
        </div>
          <div class="row-fluid">
             <div class="span12 footer-imgs">
    
               <?php if($this->config->get('sellya_payment_block_status')== 1) { ?>
            <div id="payment_logos" class="span6">
                    <?php if ($this->config->get('sellya_payment_block_custom_status') == "1"): ?>
                    <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
                      $path_image = $this->config->get('config_ssl') . 'image/';
                    } else {
                      $path_image = $this->config->get('config_url') . 'image/';
                    }
                    if ($this->config->get('sellya_payment_block_custom') != ''){ ?>   
                    <?php if($this->config->get('sellya_payment_block_custom_url') != ''): ?> 
                <a href="<?php echo $this->config->get('sellya_payment_block_custom_url'); ?>" target="_blank">
                  <img src="<?php echo $path_image . $this->config->get('sellya_payment_block_custom') ?>" alt="Payment" title="Payment"></a>
                    <?php else: ?>         
                  <img src="<?php echo $path_image . $this->config->get('sellya_payment_block_custom') ?>" alt="Payment" title="Payment">
                    <?php endif; ?>
                <?php } ?>
                <?php endif; ?>           
             
                          <?php if ($this->config->get('sellya_payment_trusted') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_trusted_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_trusted_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer7.png" alt="trusted" title="Visa"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/americanexpress.png" alt="Visa" title="Visa">
                    <?php endif; ?>
                <?php endif; ?> 

                    <?php if ($this->config->get('sellya_payment_verified_visa') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_verified_visa_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_verified_visa_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer7.png" alt="verified_visa" title="Visa"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/discover.png" alt="Visa" title="Visa">
                    <?php endif; ?>
                <?php endif; ?> 

                    <?php if ($this->config->get('sellya_payment_payu') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_payu_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_payu_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer7.png" alt="payu" title="Visa"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/egold.png" alt="Visa" title="Visa">
                    <?php endif; ?>
                <?php endif; ?> 

                    <?php if ($this->config->get('sellya_payment_LibraPay') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_LibraPay_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_LibraPay_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer7.png" alt="LibraPay" title="Visa"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/maestro.png" alt="Visa" title="Visa">
                    <?php endif; ?>
                <?php endif; ?> 
                    

                    <?php if ($this->config->get('sellya_payment_paypal') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_paypal_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_paypal_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer6.png" alt="PayPal" title="PayPal"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/mastercard.png" alt="PayPal" title="PayPal">
                    <?php endif; ?>
                <?php endif; ?>  
                    
                    <?php if ($this->config->get('sellya_payment_visa') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_visa_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_visa_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer7.png" alt="Visa" title="Visa"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/paypal.png" alt="Visa" title="Visa">
                    <?php endif; ?>
                <?php endif; ?>   

                    <?php if ($this->config->get('sellya_payment_mastercard') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_mastercard_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_mastercard_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer5.png" alt="MasterCard" title="MasterCard"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/visa.png" alt="MasterCard" title="MasterCard">
                    <?php endif; ?>
                <?php endif; ?> 
                   
                    <?php if ($this->config->get('sellya_payment_maestro') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_maestro_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_maestro_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/imgs/footer8.png" alt="Maestro" title="Maestro"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/visaelectron.png" alt="Maestro" title="Maestro">
                    <?php endif; ?>
                <?php endif; ?>
                   
                    <?php if ($this->config->get('sellya_payment_discover') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_discover_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_discover_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/image/payment/payment_image_discover.png" alt="Discover" title="Discover"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/westernunion.png" alt="Discover" title="Discover">
                    <?php endif; ?>
                <?php endif; ?>                   
                    
                    <?php if ($this->config->get('sellya_payment_moneybookers') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_moneybookers_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_moneybookers_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/image/payment/payment_image_moneybookers.png" alt="Moneybookers" title="Moneybookers"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment_icons/worldpay.png" alt="Moneybookers" title="Moneybookers">
                    <?php endif; ?>
                <?php endif; ?>   
                    
                    <?php if ($this->config->get('sellya_payment_american_express') == "1"): ?>
                    <?php if($this->config->get('sellya_payment_american_express_url') != ''): ?>
                  <a href="<?php echo $this->config->get('sellya_payment_american_express_url'); ?>" target="_blank">
                  <img src="catalog/view/theme/sellya/image/payment/payment_image_american_express.png" alt="American Express" title="American Express"></a>
                    <?php else: ?>
                        <img src="catalog/view/theme/sellya/image/payment/payment_image_american_express.png" alt="American Express" title="American Express">
                    <?php endif; ?>
                <?php endif; ?>              
            </div>
          <?php } ?>
            <div class="span4">
              <?php if($this->config->get('sellya_follow_us_status')== 1) { ?>      
  <?php if($this->config->get('sellya_facebook') != '' || $this->config->get('sellya_twitter') != '' || $this->config->get('sellya_googleplus') != '' || $this->config->get('sellya_rss') != '') { ?>  
    <div id="follow_us">  
      <?php if($this->config->get('sellya_facebook') != '') { ?>
        <a href="https://facebook.com/<?php echo $this->config->get('sellya_facebook'); ?>" class="tiptip" title="Facebook" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/f_logo.png" alt="Facebook" ></a>
      <?php } ?>
      <?php if($this->config->get('sellya_twitter') != '') { ?>
        <a href="https://twitter.com/#!/<?php echo $this->config->get('sellya_twitter'); ?>" class="tiptip" title="Twitter" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/t_logo.png" alt="Twitter"></a>
      <?php } ?>
      <?php if($this->config->get('sellya_googleplus') != '') { ?>
        <a href="https://plus.google.com/u/0/<?php echo $this->config->get('sellya_googleplus'); ?>" class="tiptip" title="Google+" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/g_logo.png" alt="Google+"></a>
      <?php } ?>
      <?php if($this->config->get('sellya_rss') != '') { ?>
        <a href="<?php echo $this->config->get('sellya_rss'); ?>" class="tiptip" title="RSS" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/r_logo.png" alt="RSS"></a>
        <?php } ?>
      <?php if($this->config->get('sellya_pinterest') != '') { ?>
        <a href="https://pinterest.com/<?php echo $this->config->get('sellya_pinterest'); ?>/" class="tiptip" title="Pinterest" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/p_logo.png" alt="Pinterest"></a>
        <?php } ?>
      <?php if($this->config->get('sellya_vimeo') != '') { ?>
        <a href="https://www.vimeo.com/<?php echo $this->config->get('sellya_vimeo'); ?>" class="tiptip" title="Vimeo" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/v_logo.png" alt="Vimeo"></a>
        <?php } ?> 
      <?php if($this->config->get('sellya_flickr') != '') { ?>
        <a href="https://www.flickr.com/photos/<?php echo $this->config->get('sellya_flickr'); ?>" class="tiptip" title="Flickr" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/fl_logo.png" alt="Flickr"></a>
        <?php } ?>  
      <?php if($this->config->get('sellya_linkedin') != '') { ?>
        <a href="https://www.linkedin.com/in/<?php echo $this->config->get('sellya_linkedin'); ?>" class="tiptip" title="LinkedIn" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/l_logo.png" alt="LinkedIn"></a>
        <?php } ?>
      <?php if($this->config->get('sellya_youtube') != '') { ?>
        <a href="https://youtube.com/user/<?php echo $this->config->get('sellya_youtube'); ?>/" class="tiptip" title="YouTube" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/y_logo.png" alt="YouTube"></a>
        <?php } ?>
      <?php if($this->config->get('sellya_dribbble') != '') { ?>
        <a href="https://www.dribbble.com/<?php echo $this->config->get('sellya_dribbble'); ?>" class="tiptip" title="Dribbble" target="_blank">
        <img src="catalog/view/theme/sellya/image/follow_us/d_logo.png" alt="Dribbble"></a>
        <?php } ?>
        <a href="<?php echo $newsletter; ?>" class="tiptip" title="<?php echo $text_newsletter; ?>">
        <img src="catalog/view/theme/sellya/image/follow_us/newsletter_icon.png" alt="<?php echo $text_newsletter; ?>"></a>
        
    </div> 
  <?php } ?>
<?php } ?>  
            </div>
          </div>
         </div> 
      </div>
    </div>
  </div>

<?php } ?> 

<!-- <?php if($this->config->get('sellya_information_block_status')== 1) { ?> 
  <div id="footer_info_phone" class="row-fluid visible-phone">
    <div class="container">
      <div id="footer_info_phone_content">
        <div class="span3 subnav">
          <ul class="nav nav-pills">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $text_information; ?></a>
              <ul class="dropdown-menu">
                <?php 
                  $i = 0;  
                  foreach ($informations as $information) { 
                    if (++$i < 5) {  ?>  
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                  <?php }
                  } ?>
                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
              </ul> 
            </li>
          </ul>    
        </div>
        <div class="span3 subnav">
          <ul class="nav nav-pills">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $text_service; ?></a>
              <ul class="dropdown-menu">
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <?php 
                  $i = 0;  
                  foreach ($informations as $information) { 
                    if (++$i > 4) {  ?>  
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                  <?php }
                  } ?>
              </ul> 
            </li>
          </ul>    
        </div>  
        <div class="span3 subnav">
          <ul class="nav nav-pills">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $text_extra; ?></a>
              <ul class="dropdown-menu">
                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
              </ul> 
            </li>
          </ul>    
        </div>
        <div class="span3 subnav">
          <ul class="nav nav-pills">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $text_account; ?></a>
              <ul class="dropdown-menu">
                <li><a href="<?php echo $account; ?>"><?php echo $text_enter_account; ?></a></li>
                <li><a href="<?php echo $register; ?>"><?php echo $text_create_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
              </ul> 
            </li>
          </ul>    
        </div>          
      </div>
    </div>
  </div>
<?php } ?>  -->


</footer>


<?php if($this->config->get('sellya_status')== 1) { ?>


  <div id="footer_cr">
    <div class="container">
      <div class="row-fluid">
        <div class="span12 copyright">
          <?php echo $powered; ?>
          <div class="created-by">Un magazin online creeat de <a href="http://creativewebdesign.ro">Creative Web Design</a> folosind platforma CWD Store.</div>
        </div>
        <div class="span12 cwdLgo">
          <a href="http://www.creativewebdesign.ro/" title="web design"></a>
        </div>
      </div>

      <div id="footer_cr_content" class="row-fluid">

        <?php if($this->config->get('sellya_powered_status')== 1) { ?> 
        <?php if($this->config->get('sellya_powered_content') != '') { ?>
        <div class="span<?php echo 12 / ($this->config->get('sellya_payment_block_status') + $this->config->get('sellya_powered_status') + $this->config->get('sellya_follow_us_status')) ; ?>">  
        <div id="powered_content">
            <?php if($this->config->get('sellya_powered_content') != '') { ?>
                <?php echo htmlspecialchars_decode($this->config->get('sellya_powered_content')); ?>
                <?php } ?>             
        </div>
        </div>
        <?php } ?>
        <?php } ?>
      </div>
    </div>
  </div>


  <?php if($this->config->get('sellya_about_status')== 1) { ?> 
    <?php if($this->config->get('sellya_about_content') != '') { ?>
      <div id="footer_about">
        <div id="footer_about_content" class="row-fluid">
            <?php if($this->config->get('sellya_about_content') != '') { 
              echo htmlspecialchars_decode($this->config->get('sellya_about_content'));
            } ?>             
        </div>
      </div>
    <?php } ?>
  <?php } ?>

<?php } ?>

<script type="text/javascript" src="catalog/view/theme/sellya/js/cloud-zoom.js"></script>
<script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.tipTip.js"></script>
<script type="text/javascript" src="catalog/view/theme/sellya/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="catalog/view/theme/sellya/js/bootstrap-collapse.js"></script>
<?php if($this->config->get('sellya_others_totop') =='1') { ?>	
<script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.ui.totop.js"></script>
<script type="text/javascript">

  $('.es-carousel-wrapper').elastislide({
    speed       : 450,  // animation speed
    easing      : '', // animation easing effect
    // the minimum number of items to show. When we resize the window, this will make sure minItems are always shown (unless of course minItems is higher than the total number of elements)
    minItems  : 1
  });
  //Fix to adjust on windows resize
  $(window).triggerHandler('resize.elastislide');
  
  $(document).ready(function() {

		/*
		var defaults = {
	  		containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
	 	};
		*/	
		$().UItoTop({ easingType: 'easeOutQuart' });	
	});
</script>
<?php } ?>
<script type="text/javascript">
    $(function(){
        $(".tiptip").tipTip();
    });
</script>
<script type="text/javascript">
  $(function() {
    $('#review a').bind('click', function() {
      $('a[href=\'#tab-review\']').trigger('click');
    });
    $('.toAccount[href="#myModal"]').bind('hover', function () {
      $('#myModal').modal('show');
    });
    var $oe_menu    = $('#menu_oc');
    var $oe_menu_items  = $oe_menu.children('li');
    var $oe_overlay   = $('#oe_overlay');
            $oe_menu_items.bind('mouseenter',function(){
      var $this = $(this);
      $this.addClass('slided selected');
      $this.children('div').css('z-index','9999').stop(true,true).slideDown(200,function(){
        $oe_menu_items.not('.slided').children('div').hide();
        $this.removeClass('slided');
      });
    }).bind('mouseleave',function(){
      var $this = $(this);
      $this.removeClass('selected').children('div').css('z-index','1');
    });
    $oe_menu.bind('mouseenter',function(){
      var $this = $(this);
      $oe_overlay.stop(true,true).fadeTo(0, 1);
      $this.addClass('hovered');
    }).bind('mouseleave',function(){
      var $this = $(this);
      $this.removeClass('hovered');
      $oe_overlay.stop(true,true).fadeTo(0, 0);
      $oe_menu_items.children('div').hide();
      $oe_overlay.hide();
    })
  });
</script>
</body></html>