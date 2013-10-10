<div id="banner<?php echo $module; ?>" class="banner">

  <?php foreach ($banners as $banner) {

    if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>">
    <?php } ?>

        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />

    <?php if ($banner['link']) { ?>
      </a>
    <?php }

  } ?>

</div>

<script type="text/javascript"><!--
  $(document).ready(function() {
  	$('#banner<?php echo $module; ?> div:first-child').css('display', 'block');
  });
  
  var banner = function() {
  	$('#banner<?php echo $module; ?>').cycle({
  		before: function(current, next) {
  			$(next).parent().height($(next).outerHeight());
  		}
  	});
  }
  setTimeout(banner, 2000);
//--></script>