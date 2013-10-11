<div class="account-bg">
    <div class="text-ac">
        <?php echo $text_account; ?>
    </div>

    <div class="hidden">
        <h2><?php echo $text_goto; ?></h2>
        <ul class="list-unstyled">
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

        <fb:login-button show-faces="true" width="200" max-rows="1"></fb:login-button>

        <?php if($logged) { ?>
                Bine ati venit <a href="<?php echo $logout ?>">Logout</a>
        <?php } ?>

        <?php echo $text_whyhaveaccount; ?>
    </div>
</div>
