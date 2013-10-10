<div class="span6 account-bg">
        <div class="text-ac"><?php echo $text_account; ?></div>

        <div class="hidden">
            <div class="arroww"><img src="catalog/view/theme/sellya/image/sagetica.png"/></div>
                <div class="row-fluid">
                        <div class="span6">
                                <h2><?php echo $text_goto; ?></h2>
                                <ul>
                                        <li>
                                                <a href="<?php echo $login; ?>">
                                                        <?php echo $text_login ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $account; ?>">
                                                        <?php echo $text_account ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $register; ?>">
                                                        <?php echo $text_register ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $forgotten; ?>">
                                                        <?php echo $text_forgotten ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $edit; ?>">
                                                        <?php echo $text_edit ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $password; ?>">
                                                        <?php echo $text_password ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $address; ?>">
                                                        <?php echo $text_address ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $wishlist; ?>">
                                                        <?php echo $text_wishlist ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $order; ?>">
                                                        <?php echo $text_order ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $download; ?>">
                                                        <?php echo $text_download ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $return; ?>">
                                                        <?php echo $text_return ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $transaction; ?>">
                                                        <?php echo $text_transaction ?>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="<?php echo $newsletter; ?>">
                                                        <?php echo $text_newsletter ?>
                                                </a>
                                        </li>
                                </ul>
                        </div>
                        <div class="span6 autentification">
                                <div class="row-fluid">
                                        <?php 
                                        if(!$logged) { ?>

                                        <h2>Autentificare</h2>
                                        <a class="btn btn-large autentificare" href="<?php echo $login; ?>">
                                        </a>
                                        <a class="box-fbconnect-a" href="<?php echo $fbconnect_url; ?>"><?php echo $fbconnect_button; ?></a>
                                        <a class="btn btn-large autentificare" href="<?php echo $login; ?>">
                                        </a>
                                        <a class="btn btn-large autentificare" href="<?php echo $login; ?>">
                                        </a>
                                        <a class="btn btn-large autentificare" href="<?php echo $login; ?>">
                                        </a>
                                        <a class="btn btn-large autentificare" href="<?php echo $login; ?>">
                                        </a>
                                <?php } ?>
                                </div>
                                <div class="row-fluid">
                                        <fb:login-button show-faces="true" width="200" max-rows="1"></fb:login-button>
                                </div>
                                <div class="row-fluid">
                                       <?php 
                                        if($logged) { ?>

                                        <span class="welcomee">Bine ati venit</span> <a href="<?php echo $logout ?>">Logout</a>
                                                
                                <?php } ?>
                                </div>
                        </div>
                </div>
                <div class="row-fluid">
                        <span class="why"><?php echo $text_whyhaveaccount; ?></span>
                </div>
        </div>
</div>
