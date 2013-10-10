<div class="container">
	<ul class="list-inline" id="menu_informations">
	    <li id="menucateg-homepage">
	    	<a href="<?php echo $home; ?>">
		    	<?php echo $text_home; ?>
		    </a>
		</li>
	
	    <?php foreach ($informations as $information) { ?>
	    	<li>
	    		<a href="<?php echo $information['href']; ?>">
	    			<?php echo $information['title']; ?>
	    		</a>
	    	</li>
	    <?php } ?>
	
		<li>
			<a href="<?php echo $voucher; ?>">
				<?php echo $text_voucher; ?>
			</a>
		</li>
		<li>
			<a href="<?php echo $newsletter; ?>">
				<?php echo $text_newsletter; ?>
			</a>
		</li>
		<li>
			<a href="<?php echo $affiliate; ?>">
				<?php echo $text_affiliate; ?>
			</a>
		</li>
		<li>
			<a href="<?php echo $contact; ?>">
				<?php echo $text_contact; ?>
			</a>
		</li>
	</ul>
</div>