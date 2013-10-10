<?php echo $header; ?>

<div class="row-fluid account-heading">
  <h1><?php echo $heading_title; ?></h1>
  <div class="welcomePop">
    <div class="userimg"></div>
    Bine ai venit, <strong><?php echo $text_logged_s; ?></strong>
  </div>
</div>

<?php require($showbreadcrumbs); ?>

<?php echo $column_left; ?>
<?php echo $column_right; ?>

<div id="content" class="span9 categorycontent">
  <div class="row-fluid">
    <?php echo $content_top; ?>

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

      <h2><?php echo $text_your_details; ?></h2>

      <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
      <?php } ?>      

      <div class="content">
        <table class="form withlabels">

          <tr>
            <td>
              <label for="firstname">
                <?php echo $entry_firstname; ?><span class="required">*</span>
              </label>  
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" id="firstname" />
              <?php if ($error_firstname) { ?>
              <span class="error"><?php echo $error_firstname; ?></span>
              <?php } ?>
            </td>

            <td>
              <label for="lastname">
                <?php echo $entry_lastname; ?><span class="required">*</span>
              </label>  
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" />
              <?php if ($error_lastname) { ?>
              <span class="error"><?php echo $error_lastname; ?></span>
              <?php } ?>
            </td>
          </tr>

          <tr>
            <td>
              <label for="email">
                <?php echo $entry_email; ?><span class="required">*</span>
              </label>  
              <input type="text" name="email" value="<?php echo $email; ?>" id="email" />

              <?php if ($error_email) { ?>
                <span class="error"><?php echo $error_email; ?></span>
              <?php } ?>
            </td>

            <td>
              <label for="telephone">
                <?php echo $entry_telephone; ?><span class="required">*</span>
              </label>  
              <input type="text" name="telephone" value="<?php echo $telephone; ?>" />
              <?php if ($error_telephone) { ?>
              <span class="error"><?php echo $error_telephone; ?></span>
              <?php } ?>
            </td>
          </tr>

          <tr>
            <td>
              <label for="fax">
                <?php echo $entry_fax; ?>
              </label>  
              <input type="text" name="fax" value="<?php echo $fax; ?>" id="fax" />
            </td>
            <td>
              <label for="firma">
                <?php echo $entry_firma; ?>
              </label>  
              <input type="text" name="firma" value="<?php echo $firma; ?>" />
            </td>
          </tr>

          <tr>
            <td>
              <label for="cif">
                <?php echo $entry_cif; ?>
              </label>  
              <input type="text" name="cif" value="<?php echo $cif; ?>" id="cif" />
            </td>
            <td>
              <label for="recom">
                <?php echo $entry_recom; ?>
              </label>  
              <input type="text" name="recom" value="<?php echo $recom; ?>" />
            </td>
          </tr>

          <tr>
            <td>
              <label for="banca">
                <?php echo $entry_banca; ?>
              </label>  
              <input type="text" name="banca" value="<?php echo $banca; ?>" id="banca" />
            </td>
            <td>
              <label for="">
                <?php echo $entry_cont; ?>
              </label>  
              <input type="text" name="cont" value="<?php echo $cont; ?>" /></td>
            </td>
          </tr>

        </table>
      </div>

      <div class="buttons">
        <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>

        <div class="right">
          <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
        </div>
      </div>

    </form>

    <?php echo $content_bottom; ?>

  </div>
</div>
<?php echo $footer; ?>