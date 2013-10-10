<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=9">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width; initial-scale=1.0" />
		<title><?php echo $title; ?></title>
		<base href="<?php echo $base; ?>" />

		<?php if ($description) { ?>
			<meta name="description" content="<?php echo $description; ?>" />
		<?php } ?>

		<?php if ($keywords) { ?>
			<meta name="keywords" content="<?php echo $keywords; ?>" />
		<?php } ?>

		<?php if ($icon) { ?>
			<link href="<?php echo $icon; ?>" rel="icon" />
		<?php } ?>

		<?php foreach ($links as $link) { ?>
			<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
		<?php } ?>
		
		<!-- Stylesheets -->
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/bootstrap.css" />

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/flexslider.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/elastic_slideshow.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/camera.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/cloud-zoom.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/dcaccordion.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/blitzer/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/blitzer/jquery.ui.datepicker.css" />
        
        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Comfortaa|Open+Sans' rel='stylesheet' type='text/css'>
        
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/scssstyle.css" />
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/andreiut_css.css" />

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/stylesheet-mobile.css" />
		
		<!-- Scripts -->
		<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
		<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/bootstrap.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/lc_dropdown.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.dcjqaccordion.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.flexslider-min.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.elastislide.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/jquery.bxSlider.js"></script>
		<script type="text/javascript" src="catalog/view/theme/sellya/js/camera.js"></script>

		<?php foreach ($scripts as $script) { ?>
			<script type="text/javascript" src="<?php echo $script; ?>"></script>
		<?php } ?>

		<!--[if lt IE 9]> 
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
		<![endif]--> 
		<!--[if IE 7]>
			<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellya/stylesheet/ie7.css" />
		<![endif]-->

		<?php echo $google_analytics; ?>
		
         <!-- ShareThis -->
		<script type="text/javascript">var switchTo5x=true;</script>
		<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
		<script type="text/javascript">stLight.options({publisher: "ur-c0ff6dee-bb67-4f85-139a-73b6dabbf8c7", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
	</head>
	<body class="<?php echo $body_class; ?>">
		<div class="bgtop">
				<div class="row-fluid">
				 <div class="container">
					<div class="span6">
						<?php echo $navigation_main; ?>
					</div>

					<div class="span6">
						<div class="row-fluid">

							<div class="span4">
								<?php echo $currency; ?>
							</div>

							<div class="span4">
								<?php echo $language; ?>
							</div>

							<div class="span4"  id="follow_us">
								<?php if($this->config->get('sellya_follow_us_status')== 1) { ?>      
									<?php if($this->config->get('sellya_facebook') != '' || 
											$this->config->get('sellya_twitter') != '' || 
											$this->config->get('sellya_googleplus') != '' || 
											$this->config->get('sellya_rss') != '') { ?>  

											<?php if($this->config->get('sellya_facebook') != '') { ?>
												<a href="https://facebook.com/<?php echo $this->config->get('sellya_facebook'); ?>" class="tiptip" title="Facebook" target="_blank">
												<img src="catalog/view/theme/sellya/image/follow_us/f_logo.png" alt="Facebook"></a>
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
									        <img src="catalog/view/theme/sellya/image/follow_us/newsletter_icon.png" alt="<?php echo $text_newsletter; ?>" title="<?php echo $text_newsletter; ?>"></a>        
									<?php } ?>
								<?php } ?> 
								</div>
							</div>			
						</div>
			 		</div>		
			   	  </div>
			   </div>
		     </div>
		  <div class="container bg-cont">
		  				<div class="background-left"></div>
			<div class="background-right"></div>
			<div class="row-fluid header-margin">
				<div class="span4" id="logo">
					<?php if ($logo) { ?>
	        			<a href="<?php echo $home; ?>">
							<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
						</a>
					<?php } ?>
				</div>
				<div class="span4">
				  	<div class="bgsearch" id="search">
					   	<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
						<?php if (isset($searchanise)) { ?>
							<?php echo $searchanise; ?>
						<?php } ?>
						<div class="button-search"></div>
					</div>
				</div>
                <div class="span4 heightx">

                	<?php echo $content_login; ?>

                	<div class="row-fluid">
                		<div id="cart-bg" class="span6"><div class="cart-content"><?php echo $cart; ?></div></div>
                	</div>
                	

                </div>
			</div> <!-- end row-fluid -->

			<?php if($this->config->get('sellya_facebook_likebox_status')== 1) { ?>  
				<?php if($this->config->get('sellya_facebook_likebox_id') != '') { ?>
					<div class="facebook_<?php echo $this->config->get('sellya_facebook_likebox_position'); ?> hidden-phone">
						<div id="facebook_icon"></div>

						<div class="facebook_box">
						  <script src="//connect.facebook.net/en_US/all.js#xfbml=1"></script>
						  <fb:fan profile_id="<?php echo $this->config->get('sellya_facebook_likebox_id'); ?>" stream="0" connections="16" logobar="0" width="237" height="389"></fb:fan> 

						  <script type="text/javascript">    
							  $(function(){        
							        $(".facebook_right").hover(function(){            
								        $(".facebook_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
								        },
								  							   function(){            
								        $(".facebook_right").stop(true, false).animate({right: "-245" }, 800, 'easeInQuint' );        
								        },1000);    
							  });
							  $(function(){        
							        $(".facebook_left").hover(function(){            
							        	$(".facebook_left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
							        },
							  								  function(){            
							        $(".facebook_left").stop(true, false).animate({left: "-245" }, 800, 'easeInQuint' );        
							        },1000);    
							  });  
						  </script>
						</div>
					</div>
				</div>
				<?php } ?>
			<?php } ?>

			<div id="notification"></div>
		</header>

		<div class="row-fluid">
