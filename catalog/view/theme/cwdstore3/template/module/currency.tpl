<?php if (count($currencies) > 1) { ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currencyform">
    <div id="currency">

      <ul class="list-inline">
        <?php foreach ($currencies as $currency) { ?>
  	      <li <?php if ($this->currency->getCode() == $currency['code']) echo 'class="active-currency"';?>>
  	      	<a 
  	      	   title="<?php echo $currency['title']; ?>" 
  	      	   onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().parent().parent().submit();">
  	      			<?php echo $currency['symbol_right'] ? $currency['symbol_right'] : $currency['symbol_left']; ?>
  	      	</a>
  	      </li>
        <?php } ?>
      </ul>

      <input type="hidden" name="currency_code" value="" />
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </div>
  </form>
<?php } ?>
