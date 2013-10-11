<?php if (count($languages) > 1) { ?>
  <form action="<?php echo $action; ?>" method="post" id="language_form">

    <ul id="language" class="list-inline">
      <?php foreach ($languages as $language): ?>
        <li>
          <a href="javascript:;" onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language_form').submit();">
            <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
          </a>
        </li>
      <?php endforeach; ?>
     </ul>

     <input class="s_hidden" type="hidden" name="language_code" value="" />
     <input class="s_hidden" type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </form>
<?php } ?>
