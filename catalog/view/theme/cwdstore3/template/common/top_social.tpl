<?php if($this->config->get('sellya_follow_us_status')== 1) { ?>      

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

<?php } ?>

<a href="<?php echo $newsletter; ?>" class="tiptip" title="Newsletter">
<img src="catalog/view/theme/sellya/image/follow_us/newsletter_icon.png" alt="Newsletter" title="Newsletter"></a>        