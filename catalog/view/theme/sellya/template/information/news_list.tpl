<?php echo $header; ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content">
   <?php echo $content_top; ?>
    
   <?php require($showbreadcrumbs); ?>
    
   <h1><?php echo $heading_title; ?></h1>
   <div>
      <table>
         <tr>
            <td><?php echo $text_title; ?></td>
            <td><?php echo $text_description; ?></td>
			   <td><?php echo $text_date; ?></td>
            <td></td>
         </tr>
         <?php foreach ($all_news as $news) { ?>
            <tr>
               <td><?php echo $news['title']; ?></td>
               <td><?php echo $news['description']; ?></td>
			      <td><?php echo $news['date_added']; ?></td>
               <td>
                  <a href="<?php echo $news['view']; ?>">
                     <?php echo $text_view; ?>
                  </a>
               </td>
            </tr>
         <?php } ?>
      </table>
   </div>

   <div class="pagination">
      <?php echo $pagination; ?>
   </div>    
   <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>