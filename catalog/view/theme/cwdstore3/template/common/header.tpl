<!DOCTYPE html>
<html lang="<?php echo $lang; ?>">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

		<title><?php echo $title; ?></title>
		<script type="text/javascript" src="catalog/view/theme/cwdstore3/js/allscripts.min.grunt.js"></script>

		<link rel="stylesheet/less" type="text/css" href="catalog/view/theme/cwdstore3/assets/bootstrap3/style.less" />
		<script src="catalog/view/theme/cwdstore3/assets/less-1.4.1.min.js" type="text/javascript"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="catalog/view/theme/cwdstore3/assets/html5shiv.js"></script>
		  	<script src="catalog/view/theme/cwdstore3/assets/respond.min.js"></script>
		<![endif]-->

	</head>
	<body class="<?php echo $body_class; ?>">

		<div class="well well-sm">
			<?php echo $navigation_main; ?>
		</div>