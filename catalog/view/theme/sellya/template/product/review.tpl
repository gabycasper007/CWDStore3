<?php if ($reviews) {
	foreach ($reviews as $review) { ?>
		<div class="content">
			<div class="reviews-left">
		<!-- 		<b><?php echo $review['author']; ?></b> -->
				<img src="catalog/view/theme/sellya/image/stars/stars<?php 
						echo $this->config->get('sellya_mid_prod_stars_color'); ?>-<?php 
						echo $review['rating'] . '.png'; ?>"
					 alt="<?php echo $review['reviews']; ?>" />
 		<span class="morerev">
		  <?php echo $review['reviews'] ?>
		</span>
				<!-- <span>(<?php echo $review['date_added']; ?>)</span> -->
			</div>
			<!-- <div class="reviews-right">
				<div class="review-arrow"></div>
				<?php echo $review['text']; ?>
			</div>
		</div> -->

	<?php } ?>

	<!-- <div class="pagination">
		<?php echo $pagination; ?>
	</div> -->
<?php }

else { ?>
	<div class="content">
		<?php echo $text_no_reviews; ?>
	</div>
<?php } ?>
