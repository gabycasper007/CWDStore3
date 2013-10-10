<?php /* if (!$this->customer->isLogged() and (!isset($this->request->get['route']) || (isset($this->request->get['route']) && $this->request->get['route'] == 'account/newsletter'))) { ?> 
  <div class="box">
    <!-- <div class="box-heading"><h2><?php echo $heading_title; ?></h2></div> -->
    <div class="box-content" style="text-align: center;">
      <div id="frm_subscribe">
        <form name="subscribe" id="subscribe">
          <table border="0" cellpadding="2" cellspacing="2">
            <tr>
               <td align="left"><span class="required">*</span>&nbsp;<?php echo $entry_email; ?><br /><input type="text" value="" name="subscribe_email" id="subscribe_email"></td>
            </tr>

            <tr>
               <td align="left"><?php echo $entry_name; ?>&nbsp;<br /><input type="text" value="" name="subscribe_name" id="subscribe_name"> </td>
            </tr>

            <?php for($ns=1;$ns<=$option_fields;$ns++) {
              $ns_var= "option_fields".$ns; ?>
              <tr>
                <td align="left">
                  <?php 
                    if($$ns_var!="") {
                      echo($$ns_var."&nbsp;<br/>");
                      echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
                    }
                  ?>
                 </td>
              </tr>
              <?php 
            } ?>

            <tr>
              <td align="left">
                <a class="button" onclick="email_subscribe()"><span><?php echo $entry_button; ?></span></a>

                <?php if($option_unsubscribe) { ?>
                  <a class="button" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a>
                <?php } ?>    
              </td>
            </tr>

            <tr>
               <td align="center" id="subscribe_result"></td>
            </tr>

          </table>
        </form>
      </div>
    </div>
  </div> 
  <?php
}

else { */ ?>
<div class="subsc-title">
  <h2>Newsletter</h2>
Aboneaza-te la newsletter pentru a fi la curent cu toate reducerile si promotiile magazinului nostru
</div>
  <div id="frm_subscribe" class="span6">
    <form name="subscribe" id="subscribe">
        <input type="text" 
               value="<?php echo $mail_subject; ?>" 
               name="subscribe_email" 
               id="subscribe_email" 
               onfocus="if ( this.value == '<?php echo $mail_subject; ?>' ) {this.value = '' ;}"
               onblur="if ( this.value == '' ) {this.value = '<?php echo $mail_subject; ?>' ;}"
        >

        <input type="text" 
               value="<?php echo $mail_subject; ?>" 
               name="subscribe_name" 
               id="subscribe_name" 
               onfocus="if ( this.value == '<?php echo $mail_subject; ?>' ) {this.value = '' ;}"
               onblur="if ( this.value == '' ) {this.value = '<?php echo $mail_subject; ?>' ;}"
        >
        <a class="button" onclick="email_subscribe()"><div class="trm-class">Trimite</div></a>  
        <div id="subscribe_result"></div>
    </form>
  </div>      
<?php //} ?>


<script language="javascript">	
    function email_subscribe(){
    	$.ajax({
    			type: 'post',
    			url: 'index.php?route=module/newslettersubscribe/subscribe',
    			dataType: 'html',
                data:$("#subscribe").serialize(),
    			success: function (html) {
    				eval(html);
    			}}); 
    }

    function email_unsubscribe(){
    	$.ajax({
    			type: 'post',
    			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
    			dataType: 'html',
                data:$("#subscribe").serialize(),
    			success: function (html) {
    				eval(html);
    			}}); 
    }
</script>

