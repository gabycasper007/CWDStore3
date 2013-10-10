<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span12 da">
    <div class="row-fluid">
        <?php echo $content_top; ?>
    
        <?php require($showbreadcrumbs); ?>
        <h1><?php echo $heading_title; ?></h1>

        <div class="contact-info span5">
        
            <h2><?php echo $text_location; ?></h2>
            <b><?php echo $text_address; ?></b> <?php echo $store . $address; ?>
               <div class="telephone">
            <?php if ($telephone) { ?>
                <b><?php echo $text_telephone; ?></b>
                <?php echo $telephone; ?>
            <?php } ?>
                </div>         
            <?php if ($fax) { ?>
                <b><?php echo $text_fax; ?></b>
                <?php echo $fax; ?>
            <?php } ?>      
              
            <?php if($this->config->get('sellya_contact_custom_status') && $this->config->get('sellya_contact_custom_content')) { ?>
                <div class="contact-custom">
                    <?php echo htmlspecialchars_decode($this->config->get('sellya_contact_custom_content')); ?>
                </div>
            <?php } ?> 
            <div class="harta">
              <?php if ($harta) { echo htmlspecialchars_decode($harta); } ?>
            </div>
        </div>

        <form  class="span6" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="contact-form">
                <h2><?php echo $text_contact; ?></h2>
                <div>
                    <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" />
                    <?php if ($error_name) { ?>
                        <span class="error"><?php echo $error_name; ?></span>
                    <?php } ?>
                </div>    

                <div>
                    <input placeholder="<?php echo $entry_email; ?>" type="text" name="email" value="<?php echo $email; ?>" />
                    <?php if ($error_email) { ?>
                        <span class="error"><?php echo $error_email; ?></span>
                    <?php } ?>
                </div>    
                <div class="msj">Mesaj:</div>
                <textarea placeholder="<?php echo $entry_enquiry; ?>" name="enquiry" cols="40" rows="10">
                    <?php echo $enquiry; ?>
                </textarea>

                <?php if ($error_enquiry) { ?>
                    <span class="error"><?php echo $error_enquiry; ?></span>
                <?php } ?>

                <div>
                    <div class="o-imagine"><img src="index.php?route=information/contact/captcha" alt="" /></div>
                    <input placeholder="<?php echo $entry_captcha; ?>" type="text" name="captcha" value="<?php echo $captcha; ?>" />
                    <?php if ($error_captcha) { ?>
                        <span class="error"><?php echo $error_captcha; ?></span>
                    <?php } ?>
                </div>

                <div class="buttons" style="padding:20px 0 10px">
                    <div class="left">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
                    </div>
                </div>
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>