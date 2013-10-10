       
<?php if ($options) { ?>
  <div class="options clearfix">
    <h4>
      <?php echo $text_option; ?>
    </h4>
  
    <?php 
    foreach ($options as $option) { 
      
      if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="optionHeader">
            <div class="optionNumber">1</div>
            <span class="groupOptionName">Alege <?php echo $option['name']; ?>:</span>
            
            <?php /* if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } */ ?>
          </div>
  
          <?php foreach ($option['option_value'] as $option_value) { ?>
            <div class="option_desc">
  
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" 
                     value="<?php echo $option_value['product_option_value_id']; ?>" 
                     id="option-value-<?php echo $option_value['product_option_value_id']; ?>"
                     <?php if (!isset($selected)) { echo 'checked';  $selected=true; } ?> 
              >
  
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" 
                     class="desc" 
                     id="desc_<?php echo $option_value['product_option_value_id']; ?>"
              >
  
                <span class="optionName"><?php echo $option_value['name']; ?></span>
  
                <?php if ($option_value['price']) { ?>
                  <!-- <span class="optionPrice">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span> -->
  
  
                  <?php if ($config_live_update == 1){?>
     
      <?php if ($config_live_show_pricevalue_with_option>0) { ?>
        <span class="optionPrice">
            <span class="optionPrice">
              <?php 
  
  $numerical_option_value = (float) preg_replace("/[a-zA-Z]/", "", 
                                        preg_replace("/\,/", ".", 
                                          preg_replace("/\./", "",$option_value['price'])
                                        )
                                    );
  
  $numerical_special = (float) preg_replace("/[a-zA-Z]/", "", 
                                        preg_replace("/\,/", ".", 
                                          preg_replace("/\./", "",$special)
                                        )
                                    );
  $numerical_price = (float) preg_replace("/[a-zA-Z]/", "", 
                                        preg_replace("/\,/", ".", 
                                          preg_replace("/\./", "",$price)
                                        )
                                    );
  
  if ($option_value['price_prefix'] == '%')  {
      if ($special) { 
          $price_with_option_updated = $numerical_special * $numerical_option_value / 100;
      }
      elseif ($price) { 
          $price_with_option_updated = $numerical_price * $numerical_option_value / 100;
      }
  }  
  elseif ($option_value['price_prefix'] == '*') {
      if ($special) { 
          $price_with_option_updated = $numerical_special * $numerical_option_value;
      }
      elseif ($price) { 
          $price_with_option_updated = $numerical_price * $numerical_option_value;
      }
  }
  elseif ($option_value['price_prefix'] == '/') {
      if ($special) { 
          $price_with_option_updated = $numerical_special / $numerical_option_value;
      }
      elseif ($price) { 
          $price_with_option_updated = $numerical_price / $numerical_option_value;
      }
  }
  elseif ($option_value['price_prefix'] == '+') {
      if ($special) { 
          $price_with_option_updated = $numerical_special + $numerical_option_value;
      }
      elseif ($price) { 
          $price_with_option_updated = $numerical_price + $numerical_option_value;
      }
  }
  elseif ($option_value['price_prefix'] == '-') {
      if ($special) { 
          $price_with_option_updated = $numerical_special - $numerical_option_value;
      }
      elseif ($price) { 
          $price_with_option_updated = $numerical_price - $numerical_option_value;
      }
  }
  
  $price_with_option_updated = round($price_with_option_updated,2);
  $price_with_option_updated = (string) preg_replace("/\./", ",", $price_with_option_updated);
  echo $price_with_option_updated . $symbolRight;
              ?>
            </span> 
        </span>
      <?php } ?>
  
      <?php if ($config_live_show_weight && $config_live_show_weight>0 && $config_live_show_option_weight >0 && $option_value['weight']>0) { ?>
      (<?php echo $text_weight;?>
  
        <?php if($config_live_hide_prefix_of_option_weight<=0){echo $option_value['weight_prefix'];} 
      
      if($config_live_show_weight_decimal_place>0){echo round($option_value['weight'],$config_live_show_weight_decimal_place);} else {echo $option_value['weight'];} ?>
      <?php echo $weight_class; ?>)
      <?php } ?>
  
      <?php if ($config_live_show_option_point >0 && $option_value['points']>0) { ?> 
      (<?php echo $text_reward." "; ?> <?php if ($config_live_hide_prefix_of_option_point <=0) { echo $option_value['points_prefix'];} echo $option_value['points']; ?>)
      <?php } ?>
      <?php } else {?>
      (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price']; ?>)
      <?php }?>
  
                  <?php /* if ($option_value['price_prefix'] == '%') { ?>
  
                    <span class="optionPrice">
                      <?php if ($special) { 
                          echo floatval($special) * intval($option_value['price']) / 100 + floatval($special);
                      }
                      elseif ($price) { 
                          echo floatval($price) * intval($option_value['price']) / 100 + floatval($price);
                      } ?>
                    </span>  
                  <?php } */
                }
                else { ?>
                    <span class="optionPrice"><?php echo ($special ? $special : $price); ?></span>
                <?php } ?>
  
                <?php if ( $option_value['o_description']) { ?>
                  <div class="individualOptionDesc"><?php echo $option_value['o_description'] ?></div>
                <?php } ?>  
  
                <div class="dim_description"
                     id="dim_description_<?php echo $option_value['product_option_value_id']; ?>" >
                     <?php echo $option_value['description']; ?>
                </div>
              </label>
  
            </div>
          <?php } ?>
        </div>
      <?php } ?> <!-- // $option['type'] == 'radio' -->
  
      <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>"  class="option optionSelect <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
  
          <?php if (strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])) != 'culoare') { ?>
            <div class="option-l">
  
              <?php /* if ($option['required']) { ?>
                <span class="required">*</span>
              <?php } */ ?>
              
              <span class="groupOptionName"><?php echo $option['name']; ?>:</span>
  
            </div>
          <?php } ?>
          <div class="option-r">
  
            <select name="option[<?php echo $option['product_option_id']; ?>]">
              <option value="">
                <?php // echo $text_select; ?>
                - Alege <?php echo $option['name']; ?>a -
              </option>
  
              <?php foreach ($option['option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>">
                  <?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?>
                     <?php echo $option_value['price']; ?>)
                  <?php } ?>
  
                  <?php if ($config_live_update == 1){?>
                  <?php if ($config_live_show_pricevalue_with_option>0) { ?>
                    <?php if($config_live_hide_prefix_of_option_value<=0){echo $option_value['price_prefix'];} ?><?php echo $option_value['price']; ?>
                  <?php } ?>
                  <?php if ($config_live_show_weight && $config_live_show_weight>0 && $config_live_show_option_weight >0 && $option_value['weight']>0) { ?>
                  (<?php echo $text_weight;?> <?php if($config_live_hide_prefix_of_option_weight<=0){echo $option_value['weight_prefix'];} 
                  if($config_live_show_weight_decimal_place>0){echo round($option_value['weight'],$config_live_show_weight_decimal_place);} else {echo $option_value['weight'];} ?>
                  <?php echo $weight_class; ?>)
                  <?php } ?>
                  <?php if ($config_live_show_option_point >0 && $option_value['points']>0) { ?> 
                  (<?php echo $text_reward." "; ?> <?php if ($config_live_hide_prefix_of_option_point <=0) { echo $option_value['points_prefix'];} echo $option_value['points']; ?>)
                  <?php } ?>
                  <?php } else {?>
                  (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price']; ?>)
                  <?php }?>
  
                  <?php if ( $option_value['o_description']) { ?>
                    <div class="individualOptionDesc"><?php echo $option_value['o_description'] ?></div>
                  <?php } ?>  
  
                </option>
              <?php } ?>
  
            </select>
          </div>
        </div>
        <?php 
      } ?> <!-- // $option['type'] == 'select' -->
  
  
            <?php if ($option['type'] == 'checkbox') { ?>
              <div id="option-<?php echo $option['product_option_id']; ?>"  class="option optionCheckbox <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
  
                <div class="optionHeader">
                  <div class="optionNumber">2</div>
                  <span class="groupOptionName">Alege <?php echo $option['name']; ?>:</span>
                  <?php /* if ($option['required']) { ?>
                    <span class="required">*</span>
                  <?php } */ ?>
                </div>
  
                <?php foreach ($option['option_value'] as $option_value) { ?>
                  <div class="option_desc">
  
  
  
                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="desc" id="desc_<?php echo $option_value['product_option_value_id']; ?>">
  
                      <div class="optionImage">
                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>">
                        <div class="optionMask"></div>
                      </div>
  
                    </label>
  
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
  
                    <div class="optionName">
                      <?php echo $option_value['name']; ?>
                    </div>
  
                    <?php /* if ($option_value['price']) { ?>
                      <span class="optionPrice">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
                    <?php } */ ?>
  
                      <?php if ($config_live_update == 1){?>
                      <?php if ($config_live_show_pricevalue_with_option>0) { ?>
                        <span class="optionPrice"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
                      <?php } ?>
                      <?php if ($config_live_show_weight && $config_live_show_weight>0 && $config_live_show_option_weight >0 && $option_value['weight']>0) { ?>
                      (<?php echo $text_weight;?> <?php if($config_live_hide_prefix_of_option_weight<=0){echo $option_value['weight_prefix'];} 
                      if($config_live_show_weight_decimal_place>0){echo round($option_value['weight'],$config_live_show_weight_decimal_place);} else {echo $option_value['weight'];} ?>
                      <?php echo $weight_class; ?>)
                      <?php } ?>
                      <?php if ($config_live_show_option_point >0 && $option_value['points']>0) { ?> 
                      (<?php echo $text_reward." "; ?> <?php if ($config_live_hide_prefix_of_option_point <=0) { echo $option_value['points_prefix'];} echo $option_value['points']; ?>)
                      <?php } ?>
                      <?php } else {?>
                      (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price']; ?>)
                      <?php }?>                              
  
                    <?php if ( $option_value['o_description']) { ?>
                      <div class="individualOptionDesc"><?php echo $option_value['o_description'] ?></div>
                    <?php } ?>  
  
                    <div class="desc_description" id="desc_description_<?php echo $option_value['product_option_value_id']; ?>">
                      <?php echo $option_value['description']; ?>
                    </div>
                  </div>
                <?php } ?>
                </div>
  
                <div class="optionHeader">
                  <div class="optionNumber">3</div>
                  <span class="groupOptionName">Detalii despre livrare:</span>
                  <?php if ($option['required']) { ?>
                    <span class="required">*</span>
                  <?php } ?>
                </div>
            <?php } ?> <!-- // $option['type'] == 'checkbox' -->
  
      <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
            <div class="option-r"> 
              <table class="option-image">
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <tr>
                  <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                  <td class="option_desc_<?php echo $option_value['product_option_value_id']; ?>"><div class="option_desc">
                    <label style="margin-left: -7px; line-height: 25px; font-size: 15px" for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="desc" id="desc_<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      <span class="optionPrice">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
                      <?php } ?>
  
                      <?php if ($config_live_update == 1){?>
                      <?php if ($config_live_show_pricevalue_with_option>0) { ?>
                        (<?php if($config_live_hide_prefix_of_option_value<=0){echo $option_value['price_prefix'];} ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                      <?php if ($config_live_show_weight && $config_live_show_weight>0 && $config_live_show_option_weight >0 && $option_value['weight']>0) { ?>
                      (<?php echo $text_weight;?> <?php if($config_live_hide_prefix_of_option_weight<=0){echo $option_value['weight_prefix'];} 
                      if($config_live_show_weight_decimal_place>0){echo round($option_value['weight'],$config_live_show_weight_decimal_place);} else {echo $option_value['weight'];} ?>
                      <?php echo $weight_class; ?>)
                      <?php } ?>
                      <?php if ($config_live_show_option_point >0 && $option_value['points']>0) { ?> 
                      (<?php echo $text_reward." "; ?> <?php if ($config_live_hide_prefix_of_option_point <=0) { echo $option_value['points_prefix'];} echo $option_value['points']; ?>)
                      <?php } ?>
                      <?php } else {?>
                      (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price']; ?>)
                      <?php }?>                                
                      
                      <?php if ( $option_value['o_description']) { ?>
                        <div class="individualOptionDesc"><?php echo $option_value['o_description'] ?></div>
                      <?php } ?>  
  
                      <?php if ($option_value['description']) { ?>
  
                      <span class="view" style="font-size: 10px;">(<?php echo $text_view; ?>)</span>
                      <?php } ?>
                    </label>
                    <div class="desc_description" id="desc_description_<?php echo $option_value['product_option_value_id']; ?>" style="font-size: 12px; border: 1px solid #ccc; background-color: #FFF; padding: 5px 8px; color: #999; font-weight: bold; display: none; line-height: 15px; position: absolute; left: 134px; bottom: 15px; z-index: 99; width: 274px; word-wrap:break-word;"><?php echo $option_value['description']; ?></div>
                  </div></td>
                </tr>
                <?php } ?>
              </table>                        
          </div>
        </div>
      <?php } ?> <!-- // $option['type'] == 'image' -->
  
      <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option optionText <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" /></div>
        </div> 
      <?php } ?> <!-- // $option['type'] == 'text' -->
  
      <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option optionTextarea <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
          <div class="option-r"><textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea></div>
        </div>
      <?php } ?> <!-- // $option['type'] == 'textarea' -->
  
      <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option optionFile <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
          <div class="option-r"><input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" /></div>
        </div>
      <?php } ?> <!-- // $option['type'] == 'file' -->
  
      <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option optionDate <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
          <div class="option-l"><?php /* if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } */ ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" class="date" /></div>
  
              <!-- value="<?php // echo $option['option_value']; ?>"  -->
        </div>
      <?php } ?> <!-- // $option['type'] == 'date' -->
  
      <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option optionDatetime <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" /></div>
        </div>
      <?php } ?> <!-- // $option['type'] == 'datetime' -->
  
      <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option optionTime <?php echo strtolower(preg_replace('/[^a-zA-Z,]+/', '', $option['name'])); ?>">
          <div class="option-l"><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <span class="groupOptionName"><?php echo $option['name']; ?>:</span></div>
          <div class="option-r"><input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" /></div>
        </div>
      <?php } ?> <!-- // $option['type'] == 'time' -->
  
    <?php } ?>
  </div> <!-- // options -->
<?php } ?>



         <script type="text/javascript" src="catalog/view/javascript/jquery/live_update_product_price_v1.1.js"></script>
    <style>#divhid{visibility:hidden; width:50px; margin-top:-1800px; right:-10; position:fixed;}</style>
          
    <div id="update_box" style="display:none;"><div class="pop-title_bar"><a href="">X</a></div><div class="update_box_heading"><h2><?php echo $live_update_value;?></h2></div>
    <span id="pop_values">
    <span class="pop_text-points" style="display:none;"><?php echo $text_reward; ?> 
    <span class="pop_points"> </span>
    </span><br />

    <span class="pop_text-weight" style="display:none;"><?php echo $text_weight; ?> 
    <span class="pop_weight"> </span>
    </span><br />

    <span class="pop_text_price"><?php echo $text_price; ?> 
    <span class="pop_price-old" style="display:none;"> </span> 
    <span class="pop_price-new"> </span>
    </span><br />

    <span class="pop_text-tax" style="display:none;"><?php echo $text_tax; ?> 
    <span class="pop_price-tax"> </span>
    </span><br />

    <span class="pop_text_price_in_reward_points" style="display:none;"><?php echo $text_points; ?> 
    <span class="pop_price_in_reward_points"> </span>
    </span>

    </span>
    </div><div id="divhid">
    <span id="live_update_value" class=""><?php echo $live_update_value;?></span>
    <span id="text_live_update_invalid_qty" class=""><?php echo $text_live_update_invalid_qty;?></span>
    <span id="text_price" class=""><?php echo $text_price;?></span>
    <span id="text_tax" class=""><?php echo $text_tax;?></span>
    <span id="text_weight" class=""><?php echo $text_weight;?></span>
    <span id="text_reward" class=""><?php echo $text_reward;?></span>
    <span id="holder_baseprice" class=""><?php echo $holder_baseprice;?></span>
    <span id="holder_baseprice_old" class=""><?php echo $holder_baseprice_old;?></span>
    <span id="holder_taxprice" class=""><?php echo $holder_taxprice;?></span>
    <span id="holder_price_in_reward_points" class=""><?php echo $holder_price_in_reward;?></span>
    <span id="holder_basepoint" class=""><?php echo $holder_basepoint;?></span>
    <span id="holder_baseweight" class=""><?php echo $holder_baseweight;?></span>
    <span id="weight_class" class=""><?php echo $weight_class;?></span>
          
    <?php if ($price) { ?>
      <span id="symbol_left" class=""><?php if(isset($this->session->data['symbol_left'])){echo $this->session->data['symbol_left'];}?></span>
      <span id="symbol_right" class=""><?php if(isset($this->session->data['symbol_right'])){echo $this->session->data['symbol_right'];}?></span>
      <span id="baseprice" class=""><?php echo $priceonly; ?></span>
      <?php if($special){?>
        <span id="baseprice_special" class=""><?php {echo $specialonly;}?></span>
      <?php }?>

      <?php if($tax){?>
        <span id="price_ex_tax" class=""><?php echo $taxexclude;?></span>
      <?php }?>
      <?php if($points){?>
        <span id="price_in_reward_points" class=""><?php echo $points;?></span>
      <?php }?>
      <span id="decimal_place" class=""><?php if(isset($this->session->data['decimal_place'])){echo $this->session->data['decimal_place'];}else{echo 2;}?></span>
      <span id="decimal_point" class=""><?php echo $this->session->data['decimal_point'];?></span>
      <span id="thousand_point" class=""><?php echo $this->session->data['thousand_point'];?></span>
      <span id="live_update" class=""><?php echo $config_live_update;?></span>
      <span id="live_update_output" class=""><?php echo $config_live_update_output;?></span>
      <span id="live_update_price" class=""><?php echo $config_live_update_price;?></span>
      <span id="live_update_special_price" class=""><?php echo $config_live_update_special_price;?></span>
      <span id="live_update_price_excluding_tax" class=""><?php echo $config_live_update_price_excluding_tax;?></span>
      <span id="live_update_price_in_reward_points" class=""><?php echo $config_live_update_price_in_reward_points;?></span>
      <span id="live_update_weight" class=""><?php echo $config_live_update_weight;?></span>
      <span id="live_update_points" class=""><?php echo $config_live_update_points;?></span>
      <span id="live_update_price_with_qty" class=""><?php echo $config_live_update_price_with_qty;?></span>
      <span id="live_update_special_price_with_qty" class=""><?php echo $config_live_update_special_price_with_qty;?></span>
      <span id="live_update_price_excluding_tax_with_qty" class=""><?php echo $config_live_update_price_excluding_tax_with_qty;?></span>
      <span id="live_update_price_in_reward_points_with_qty" class=""><?php echo $config_live_update_price_in_reward_points;?></span>
      <span id="live_update_weight_with_qty" class=""><?php echo $config_live_update_weight_with_qty;?></span>
      <span id="live_update_discount" class=""><?php echo $config_live_update_discount;?></span>
      <span id="show_pricevalue_with_option" class=""><?php echo $config_live_show_pricevalue_with_option;?></span>
      <span id="show_weight" class=""><?php echo $config_live_show_weight;?></span>
      <span id="show_option_weight" class=""><?php echo $config_live_show_option_weight;?></span>
      <span id="baseweight" class=""><?php echo $weight; ?></span>
      <span id="show_option_point" class=""><?php echo $config_live_show_option_point;?></span>
      <span id="show_weight_decimal_point" class=""><?php echo $config_live_show_weight_decimal_place;?></span>
      <span id="basepoint" class=""><?php echo $reward; ?></span>
    <?php } ?>

    <?php if ($options) { ?>
    <?php foreach ($options as $optionvalue) { ?>
    <?php if ($optionvalue['type'] == 'select'){?>
    <span class="divhid">option_<?php echo $optionvalue['type']; ?></span>
    <?php foreach ($optionvalue['option_value'] as $option_value_value){?>
    <span id="option_price_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['price_prefix']?></span>
    <span id="option_price_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_incl_tax_without_symbol']?></span>
    <span id="option_price_excl_tax_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_excl_tax_without_symbol']?></span>
    <span id="option_weight_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight_prefix']?></span>
    <span id="option_weight_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight']?></span>
    <span id="option_points_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points_prefix']?></span>
    <span id="option_points_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points']?></span>
    <?php } ?>
    <?php } ?>
    <?php if ($optionvalue['type'] == 'radio'){?>
    <span class="divhid">option_<?php echo $optionvalue['type']; ?></span>
    <?php foreach ($optionvalue['option_value'] as $option_value_value){?>
    <span id="option_price_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['price_prefix']?></span>
    <span id="option_price_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_incl_tax_without_symbol']?></span>
    <span id="option_price_excl_tax_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_excl_tax_without_symbol']?></span>
    <span id="option_weight_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight_prefix']?></span>
    <span id="option_weight_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight']?></span>
    <span id="option_points_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points_prefix']?></span>
    <span id="option_points_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points']?></span>
    <?php } ?>
    <?php } ?>
    <?php if ($optionvalue['type'] == 'checkbox'){?>
    <span class="divhid">option_<?php echo $optionvalue['type']; ?></span>
    <?php foreach ($optionvalue['option_value'] as $option_value_value){?>
    <span id="option_price_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['price_prefix']?></span>
    <span id="option_price_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_incl_tax_without_symbol']?></span>
    <span id="option_price_excl_tax_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_excl_tax_without_symbol']?></span>
    <span id="option_weight_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight_prefix']?></span>
    <span id="option_weight_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight']?></span>
    <span id="option_points_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points_prefix']?></span>
    <span id="option_points_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points']?></span>
    <?php } ?>
    <?php } ?>
    <?php if ($optionvalue['type'] == 'image'){?>
    <span class="divhid">option_<?php echo $optionvalue['type']; ?></span>
    <?php foreach ($optionvalue['option_value'] as $option_value_value){?>
    <span id="option_price_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['price_prefix']?></span>
    <span id="option_price_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_incl_tax_without_symbol']?></span>
    <span id="option_price_excl_tax_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['option_price_excl_tax_without_symbol']?></span>
    <span id="option_weight_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight_prefix']?></span>
    <span id="option_weight_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['weight']?></span>
    <span id="option_points_prefix_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points_prefix']?></span>
    <span id="option_points_<?php echo $option_value_value['product_option_value_id']; ?>" class="divhid"><?php echo $option_value_value['points']?></span>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php } ?>

    <?php if ($discounts) { ?>
        <?php foreach ($discounts as $discount_value) { ?>
            <span id="dischidden">
            <span id="dischidden_<?php echo $discount_value['quantity']; ?>" class="divhid"><?php echo $discount_value['price_only']; ?></span>
            </span>
        <?php } ?>
    <?php } ?>
    </div>