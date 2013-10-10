<?php echo $header; ?>

<div id="content">

  <div class="breadcrumb">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>

    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>

    <?php } ?>

  </div>

  <?php if ($error_warning) { ?>

  <div class="warning"><?php echo $error_warning; ?></div>

  <?php } ?>

  <?php if ($success) { ?>

  <div class="success"><?php echo $success; ?></div>

  <?php } ?>

  <div class="box">



    <div class="hideMiContent">

      <div class="heading">

        <h1><img src="view/image/feed.png" alt="" /><?php echo $text_mass_discount;?></h1>

        <a class="openme" href="javascript:void(0)" 

           onclick="jQuery('.hideMiContent .content').slideToggle('fast'); jQuery('.hideMiContent .heading span').toggle(); "><span><?php echo $button_open_my_content; ?> +</span><span style="display: none;"><?php echo $button_close_my_content; ?> -</span></a>

      </div>

      <div class="content">

        <form id="frm-mass-discount" action="<?php echo $discount; ?>" method="post">

        <table>

        <thead>

          <tr>

          <td><?php echo $text_start_date;?></td>

          <td><?php echo $text_end_date;?></td>

          <td><?php echo $text_discount;?></td>

          <td><?php echo $text_way;?></td>

          <td><?php echo $text_type;?></td>

          <td><?php echo $text_category;?></td>

          <td></td>

          </tr>

        </thead>

        <tr>

        <td><input type="text" name="date_start" value="0000-00-00" class="date"></td>

            <td><input type="text" name="date_end" value="0000-00-00" class="date"></td>

            <td><input type="text" name="discount" id="discount" value="0"/></td>



            <td><select name="way">

              <option value="1"><?php echo $text_mod_increase;?></option>

              <option value="2"><?php echo $text_mod_discount;?></option>

            </select></td>



            <td><select name="type">

              <option value="2"><?php echo $text_percentage;?></option>

              <option value="1"><?php echo $text_value;?></option>

            </select></td>

        <td>

          <select name="category_id"  >        

            <option value="-1"><?php echo $text_all;?></option>

            <?php 

              foreach($categories as $cat){         

                echo '<option value="'.$cat['category_id'].'">'.$cat['name'].'</option>';

              }

            ?>        

          </select>

        </td>

            <td><a class="button" onclick="submitDiscount();"><?php echo $text_ok;?></a></td>

        </tr>     

        </table>

          </form>

      </div>

    </div>  



    <div class="heading">



      <h1><img src="view/image/stock-status.png" alt="" /> <?php echo $heading_title; ?></h1>

      <!-- <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div> -->



      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $edit_list; ?>'); $('#form').submit();" class="button button-action"><?php echo $button_edit_list; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button button-highlight"><?php echo $button_copy; ?></a><a onclick="$('#form').submit();" class="button button-caution"><?php echo $button_delete; ?></a></div>



    </div>

    <div class="content">

      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

        <table class="list">

          <thead>

            <tr>

              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>



              <td class="center"><?php echo $column_image; ?></td>



              <td class="left" width="368"><?php if ($sort == 'pd.name') { ?>

                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>

                <?php } ?>

              </td>



              <td class="left"><?php if ($sort == 'p.model') { ?>

                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>

                <?php } ?>

              </td>



              <td class="left"><?php if ($sort == 'p.price') { ?>

                <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>

                <?php } ?>

              </td>



              <td class="right"><?php if ($sort == 'p.quantity') { ?>

                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>

                <?php } ?>

              </td>



              <td class="left"><?php if ($sort == 'p.sort_order') { ?>

                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>

                <?php } ?>

              </td>



              <td class="left" width="83"><?php if ($sort == 'p.status') { ?>

                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>

                <?php } else { ?>

                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>

                <?php } ?>

              </td>



              <td class="right"><?php echo $column_action; ?></td>

            </tr>

          </thead>

          <tbody>

            <tr class="filter">

              <td></td>

              <td></td>

              <td>

                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />

                <!-- MOD OTTITZ -->

                <select name="filter_category_id"  id="filter_category_id">        

                          <option value=""/>

                  <?php 

                  foreach($categories as $tmp){         

                  if ($filter_category_id == $tmp['category_id']) { ?>

                          <option value="<?php echo $filter_category_id;?>" selected="selected"><?php echo $tmp['name'];?></option>

                          <?php } else { ?>

                          <option value="<?php echo $tmp['category_id'];?>"><?php echo $tmp['name']; ?></option>

                          <?php }  

                  }

                  ?>        

                </select></td>

                <!-- MOD OTTITZ END -->

              </td>

              <td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>

              <td align="left"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>

              <td align="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>



              <td align="left"><input type="text" name="filter_sort_order" value="<?php echo $filter_sort_order; ?>" style="text-align: left;" /></td>



              <td><select name="filter_status">

                  <option value="*"></option>

                  <?php if ($filter_status) { ?>

                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                  <?php } else { ?>

                  <option value="1"><?php echo $text_enabled; ?></option>

                  <?php } ?>

                  <?php if (!is_null($filter_status) && !$filter_status) { ?>

                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                  <?php } else { ?>

                  <option value="0"><?php echo $text_disabled; ?></option>

                  <?php } ?>

                </select></td>

              <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>

            </tr>

            <?php if ($products) { ?>

            <?php foreach ($products as $product) { ?>

            <tr>

              <td style="text-align: center;"><?php if ($product['selected']) { ?>

                <!-- <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" /> -->

                <input type="checkbox" name="selected[]" id="<?php echo $product['product_id']; ?>_select" value="<?php echo $product['product_id']; ?>" checked="checked" />



                <?php } else { ?>

                <!-- <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" /> -->

                <input type="checkbox" name="selected[]" id="<?php echo $product['product_id']; ?>_select" value="<?php echo $product['product_id']; ?>" />



                <?php } ?></td>

              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>



              <!-- <td class="left"><?php echo $product['name']; ?></td> -->

              <td class="left name"><input type="text" class="<?php echo strtolower($column_name); ?> editable" name="<?php echo $product['product_id']; ?>_name" id="<?php echo $product['product_id']; ?>_name" value="<?php echo $product['name']; ?>" size="50" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' /></td>





              <td class="left">



                <?php // echo $product['model']; ?>

                <input type="text" class="<?php echo strtolower($column_model); ?> editable" name="<?php echo $product['product_id']; ?>_model" id="<?php echo $product['product_id']; ?>_model" value="<?php echo $product['model']; ?>" size="16" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



              </td>

              <td class="left"><?php if ($product['special']) { ?>

                <span style="text-decoration: line-through;">



                  <?php // echo $product['price']; ?>

                  <input type="text" class="<?php echo strtolower($column_price); ?> editable" name="<?php echo $product['product_id']; ?>_price" id="<?php echo $product['product_id']; ?>_price" value="<?php echo $product['price']; ?>" size="8" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                </span><br/>



                <span style="color: #b00;">



                  <?php // echo $product['special']; ?>

                  <?php echo $text_special; ?><input type="text" class="<?php echo strtolower($column_price); ?> editable" name="<?php echo $product['product_id']; ?>_special" id="<?php echo $product['product_id']; ?>_special" value="<?php echo $product['special']; ?>" size="8" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                </span>

                <?php } else { ?>



                  <?php // echo $product['price']; ?>

                  <input type="text" class="<?php echo strtolower($column_price); ?> editable" name="<?php echo $product['product_id']; ?>_price" id="<?php echo $product['product_id']; ?>_price" value="<?php echo $product['price']; ?>" size="8" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                <?php } ?></td>



              <td class="right">

                <?php if ($product['quantity'] <= 0) { ?>



                  <span style="color: #FF0000;">

                    <?php // echo $product['quantity']; ?>

                    <input style="color: #FF0000;" type="text" class="<?php echo strtolower($column_quantity); ?> editable" name="<?php echo $product['product_id']; ?>_quantity" id="<?php echo $product['product_id']; ?>_quantity" value="<?php echo $product['quantity']; ?>" size="8" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                  </span>



                <?php } elseif ($product['quantity'] <= 5) { ?>

               

                  <span style="color: #FFA500;">

                    <?php // echo $product['quantity']; ?>

                    <input style="color: #FFA500;" type="text" class="<?php echo strtolower($column_quantity); ?> editable" name="<?php echo $product['product_id']; ?>_quantity" id="<?php echo $product['product_id']; ?>_quantity" value="<?php echo $product['quantity']; ?>" size="8" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                  </span>



                <?php } else { ?> 

                

                  <span style="color: #008000;">

                    <?php // echo $product['quantity']; ?>

                    <input style="color: #008000;" type="text" class="<?php echo strtolower($column_quantity); ?> editable" name="<?php echo $product['product_id']; ?>_quantity" id="<?php echo $product['product_id']; ?>_quantity" value="<?php echo $product['quantity']; ?>" size="8" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                  </span>



                <?php } ?></td>



                <td class="left">



                  <?php // echo $product['sort_order']; ?>

                  <input type="text" class="<?php echo strtolower($column_sort_order); ?> editable" name="<?php echo $product['product_id']; ?>_sort_order" id="<?php echo $product['product_id']; ?>_sort_order" value="<?php echo $product['sort_order']; ?>" size="16" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");' />



                </td>



              <!-- <td class="left"><?php echo $product['status']; ?></td> -->

              <td class="left status">

                <!-- <select name="<?php echo $product['product_id']; ?>_status" id="<?php echo $product['product_id']; ?>_status" onclick='document.getElementById("<?php echo $product['product_id']; ?>_select").setAttribute("checked","checked");'> 

                  <?php if ($product['status'] == $text_enabled) { ?>

                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                  <option value="0"><?php echo $text_disabled; ?></option>

                  <?php } else { ?>

                  <option value="1"><?php echo $text_enabled; ?></option>

                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                  <?php } ?>

                </select> -->



                <p class="field switch">

                  <label class="cb-enable<?php if ($product['status'] == $text_enabled){echo ' selected';} ?>" id="on<?php echo $product['product_id']; ?>" OnClick="turnon('<?php echo $product['product_id']; ?>');"><span>On</span></label>

                  <label class="cb-disable<?php if ($product['status'] != $text_enabled){echo ' selected';} ?>" id="off<?php echo $product['product_id']; ?>" OnClick="turnoff('<?php echo $product['product_id']; ?>');"><span>Off</span></label>

                </p>

              </td>





              <td class="right">

                <?php foreach ($product['action'] as $action) { ?>

                  <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>



                  <?php

                  $this->load->model('catalog/product');

                  $product_store = $this->model_catalog_product->getProductStores($product['product_id']);

                  

                  if (in_array(0, $product_store)) { ?>

                    <a target="_blank" 

                       href="<?php echo $store 

                                  . 'index.php?route=product/product&product_id=' 

                                  . $product['product_id']; ?>"><?php echo $text_view_in_store; //basename($store); ?></a>

                    <?php 

                  } ?>

                  

                  <?php /*foreach ($stores as $storel) {

                    if (in_array($storel['id'], $product_store)) { ?>

                     <a onClick="window.open('<?php echo $storel['href'] . 'index.php?route=product/product&product_id=' . $product['product_id']; ?>');">View in <?php echo $storel['name']; ?></a>

                  <?php }

                  }*/

                } ?>

              </td>

            </tr>

            <?php } ?>

            <?php } else { ?>

            <tr>

              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>

            </tr>

            <?php } ?>

          </tbody>

        </table>

      </form>

      <div class="pagination"><?php echo $pagination; ?></div>

    </div>

  </div>

</div>



<script type="text/javascript">       

  $(document).ready(function() {

    $('.editable').focus(function() {

      $(this).addClass("focusField");   

        if (this.value == this.defaultValue){

          this.select();

        }

        if(this.value != this.defaultValue){

          this.select();

        }

      });

      $('.editable').change(function() {

        $(this).removeClass("focusField");        

        if (this.value == ''){

          this.value = (this.defaultValue ? this.defaultValue : '');      

        }       

     });  

  });



  function turnon(product_id){

//  alert(product_id);

  $('#off'+product_id).removeClass('selected');

  $('#on'+product_id).addClass('selected');

  

  $.ajax({

    url: 'index.php?route=catalog/product/ajaxupdate&token=<?php echo $token; ?>&product_id='+product_id+'&status=1',

    type: 'get',

    dataType: 'json',

    });



}



function turnoff(product_id){

  $('#on'+product_id).removeClass('selected');

  $('#off'+product_id).addClass('selected');

  

  $.ajax({

    url: 'index.php?route=catalog/product/ajaxupdate&token=<?php echo $token; ?>&product_id='+product_id+'&status=0',

    type: 'get',

    dataType: 'json',

    });



}

  </script>



<script type="text/javascript"><!--

function filter() {

	url = 'index.php?route=catalog/product&token=<?php echo $token; ?>';

	

	var filter_name = $('input[name=\'filter_name\']').attr('value');

	

	if (filter_name) {

		url += '&filter_name=' + encodeURIComponent(filter_name);

	}

	

	var filter_model = $('input[name=\'filter_model\']').attr('value');

	

	if (filter_model) {

		url += '&filter_model=' + encodeURIComponent(filter_model);

	}

	

	var filter_price = $('input[name=\'filter_price\']').attr('value');

	

	if (filter_price) {

		url += '&filter_price=' + encodeURIComponent(filter_price);

	}



  // MOD OTTITZ

  var filter_category_id = $('select[name=\'filter_category_id\']').attr('value');

   

  if (filter_category_id) {

    url += '&filter_category_id=' + encodeURIComponent(filter_category_id);

  }

  //MOD OTTITZ END

	

	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');

	

	if (filter_quantity) {

		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);

	}





  var filter_sort_order = $('input[name=\'filter_sort_order\']').attr('value');

  

  if (filter_sort_order) {

    url += '&filter_sort_order=' + encodeURIComponent(filter_sort_order);

  }

  

	

	var filter_status = $('select[name=\'filter_status\']').attr('value');

	

	if (filter_status != '*') {

		url += '&filter_status=' + encodeURIComponent(filter_status);

	}	



	location = url;

}

//--></script> 

<script type="text/javascript"><!--

$('#form input').keydown(function(e) {

	if (e.keyCode == 13) {

		filter();

	}

});

//--></script> 

<script type="text/javascript"><!--

$('input[name=\'filter_name\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.name,

						value: item.product_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('input[name=\'filter_name\']').val(ui.item.label);

						

		return false;

	},

	focus: function(event, ui) {

      	return false;

   	}

});



$('input[name=\'filter_model\']').autocomplete({

	delay: 500,

	source: function(request, response) {

		$.ajax({

			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),

			dataType: 'json',

			success: function(json) {		

				response($.map(json, function(item) {

					return {

						label: item.model,

						value: item.product_id

					}

				}));

			}

		});

	}, 

	select: function(event, ui) {

		$('input[name=\'filter_model\']').val(ui.item.label);

						

		return false;

	},

	focus: function(event, ui) {

      	return false;

   	}

});







//--></script> 

<script type="text/javascript">

  $(document).ready(function(){

    $('.date').datepicker({dateFormat: 'yy-mm-dd'});  

  })

  function submitDiscount() {

    if(confirm('<?php echo $text_sure;?>')){

      $('#frm-mass-discount').submit();

    }

    

  }

</script>

<?php echo $footer; ?>