<!-- User login or register -->
<div id="userVerif">
    <div class="toAccount" role="button" data-toggle="modal"
      <?php if (!$logged) {  // if logged, send me on click to account page, else show me modal login/register ?>
              href="#myModal"
      <?php } 
          else { ?>
              onclick="location='<?php echo $account; ?>'" 
      <?php } ?>
      >
    </div>
    <?php if ($logged) { ?> <!-- if logged, show me welcome message and logout link -->
        <div class="welcomeUser"><?php echo $text_logged_s; ?></div>
    <?php } ?>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
      <div><?php echo $heading_title; ?></div>
  </div>
  <div class="modal-body">
      <div class="newClient">
        <div class="logHeading"><?php echo $text_new_customer; ?></div>
        <div class="logDescr"><?php echo $text_register_account; ?></div>
        <button class="logbutton" onclick="location='<?php echo $text_register; ?>'">
          <?php echo $button_continue; ?>
        </button>
      </div>
      <div class="existingClient">
        <div class="logHeading"><?php echo $text_returning_customer; ?></div>
        <div class="logDescr"><?php echo $text_i_am_returning_customer; ?></div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <label for="email"><?php echo $entry_email ?>*</label>
          <input type="text" id="email" name="email" value="<?php echo $email; ?>">
          <label for="password"><?php echo $entry_password; ?>*</label>
          <input type="password" name="password" value="<?php echo $password; ?>">
          <input type="submit" value="<?php echo $button_login; ?>" class="logbutton" />
          <?php if ($redirect) { ?>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
          <a href="" class="logForgotten"><?php echo $text_forgotten; ?></a>
        </form>
      </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#myModal input').keydown(function(e) {
  if (e.keyCode == 13) {
    $('#myModal').submit();
  }
});
//--></script> 
