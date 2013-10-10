<!-- breadcrumbs -->
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { 

      echo $breadcrumb['separator']; ?>
      <span itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
        <a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a>
      </span>
      
    <?php } ?>
</div> 