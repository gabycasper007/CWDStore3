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
		

	</head>
	<body class="<?php echo $body_class; ?>">	