<div class="oe_wrapper">
	<div id="oe_overlay" class="oe_overlay"></div> <!-- Overlay effect -->
	<nav id="menu" class="row hidden-phone">
			<?php if($this->config->get('sellya_menu_categories_style')== 1) { ?>
				<?php if($this->config->get('sellya_menu_categories_status')== 1) { ?>
					<?php if ($categories) { ?>
						<div id="menu_oc" class="menu_categs">
						  	<ul>
							    <?php if(($this->config->get('sellya_menu_homepage_status')== 1) && ($this->config->get('sellya_menu_homepage_style')== 1)) { ?>
							    	<li id="menucateg-homepage">
							    		<a href="<?php echo $home; ?>">
							    			<img src="catalog/view/theme/sellya/image/homepage.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
							    		</a>
							    	</li>
							    <?php }
							    
							    if(($this->config->get('sellya_menu_homepage_status')== 1) && ($this->config->get('sellya_menu_homepage_style')== 2)) { ?>
								    <li id="menucateg-homepage">
								    	<a href="<?php echo $home; ?>">
									    	<?php echo $text_home; ?>
									    </a>
									</li>
							    <?php } ?> 
							    
							    <?php foreach ($categories as $category) { 
							    	// Category name without spaces and lowercased
							    	$menucategID = 'menucateg-' . str_replace(' ', '-', strtolower($category['name']));
							    	?>
								    <li id="<?php echo $menucategID; ?>">  
								    	<a href="<?php echo $category['href']; ?>">
								    		<?php echo $category['name']; ?>
								    	</a>
								      	<?php if ($category['children']) { ?>
									      	<div>
										        <?php for ($i = 0; $i < count($category['children']);) { ?>
											        <ul>
											          	<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
														<?php for (; $i < $j; $i++) { ?>
														  	<?php if (isset($category['children'][$i])) { ?>
														 		<li>
														 			<a href="<?php echo $category['children'][$i]['href']; ?>">
														 				<?php echo $category['children'][$i]['name']; ?>
														 			</a>
														 		</li>
														  	<?php } 
														  		  if ( (($i+1) % 4 == 0) && ($i+1 < $j) ) {  // imparte meniul in mai multe coloane de cate 4 ?> 
																	 </ul>
																	 <ul>
														  	<?php } ?>
														<?php } ?>
											        </ul>
										        <?php } ?>
										        <?php if ($featured_menu_products) { ?>
										        	<?php foreach ($featured_menu_products as $product) { ?> 
										        		<?php if ($product['cat_id'] == $category['id']) { ?>
												      		<a class="productRecommendedInMenu" href="<?php echo $product['href']; ?>" title="<?php echo $product['name'] ?>">
												      			<img src="<?php echo $product['thumb']; ?>" />
												      			<div class="recomTitle"><?php echo $product['name'] ?></div>
												      			<div class="recomDescr"><?php echo $product['model'] ?></div>
												      			<div class="recomPrice"><?php echo $product['price'] ?></div>
												      		</a>
												      		<div class="recomBar 
												      			<?php if (count($category['children']) < 5) echo 'singlecolmen'; ?>"> <!-- if one column -->
												      			<div>Recomandarea noastra</div>
												      		</div>
											      		<?php break; 
											      		} 
											      	} ?>	
									      		<?php } ?>
									      	</div>
								      	<?php } ?>
								    </li>
							    <?php } ?>
						 	</ul>
						</div>
					<?php } ?>
				<?php } ?>
			<?php } ?>
			<?php if($this->config->get('sellya_menu_categories_style')== 2) { ?>
				<?php if($this->config->get('sellya_menu_categories_status')== 1) { ?>
				  	<ul>
					    <li>
					    	<span>
					    		<?php echo $text_menu_categories; ?>
					    	</span>  
					    	<div>    
							  	<ul>
								    <?php foreach ($categories as $category) { ?>
									    <li>
									    	<a href="<?php echo $category['href']; ?>">
									    		<?php echo $category['name']; ?>
									    	</a>
									      	<?php if ($category['children']) { ?>
										      	<div>
											        <?php for ($i = 0; $i < count($category['children']);) { ?>
												        <ul>
															<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
															<?php for (; $i < $j; $i++) { ?>
																<?php if (isset($category['children'][$i])) { ?>
																	<li>
																		<a href="<?php echo $category['children'][$i]['href']; ?>">
																			<?php echo $category['children'][$i]['name']; ?>
																		</a>
																	</li>
																<?php } ?>
															<?php } ?>
												        </ul>
											        <?php } ?>
										      	</div>
									      	<?php } ?>
									    </li>
								    <?php } ?>
							  	</ul>
				      		</div>  
				    	</li>
				  	</ul> 
				<?php } ?>  
			<?php } ?> 
			<?php if($this->config->get('sellya_menu_categories_style')== 3) { ?>
				<?php if($this->config->get('sellya_menu_categories_status')== 1) { ?>
					<div id="menu-category-wall" class="menu_categs">
					  	<ul>
						    <li>
						    	<a>
						    		<?php echo $text_menu_categories; ?>
						    	</a>   
							    <div class="span10">
								    <?php $counter = 0; 
								    foreach ($categories as $category) { 
										if (($counter+5) %5 == 0) $xclass="span-first-child";
										else $xclass=""; ?>
									    <div class="span2 <?php echo $xclass; ?>">
										    <?php if($this->config->get('sellya_mm2_main_category_icon_status')== 1) { ?>       
										    	<div class="image">
										    		<a href="<?php echo $category['href']; ?>">
										    			<img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" />
										    		</a>
										    	</div>
										    <?php } ?>
										    
										    <div class="menu-category-wall-sub-name">
										    	<a href="<?php echo $category['href']; ?>">
										    		<?php echo $category['name']; ?>
										    	</a>
										    </div>
										    <?php if ($category['children']) { ?>
										      	<div>
											        <?php for ($i = 0; $i < count($category['children']);) { ?>
												        <ul>
															<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
															<?php for (; $i < $j; $i++) { ?>
																<?php if (isset($category['children'][$i])) { ?>
																	<li>
																		<a href="<?php echo $category['children'][$i]['href']; ?>">
																			<?php echo $category['children'][$i]['name']; ?>
																		</a>
																	</li>
																<?php } ?>
															<?php } ?>
												        </ul>
											        <?php } ?>
										      	</div>
										    <?php } ?>
									    </div>
									    <?php $counter++; 
									} ?>
							    </div> 
						    </li>
					  	</ul>
					</div>   
				<?php } ?>  
			<?php } ?>
			<?php if ($this->config->get('sellya_menu_brands_status') == "1"): ?>
				<div id="menu_brands" class="menu_categs">        
					<ul>
						<li>
							<a>
								<?php echo $text_menu_brands; ?>
							</a> 
							<?php if($this->config->get('sellya_menu_brands_per_row')== 4) { ?>   
								<div class="span8">
							<?php } ?>
							<?php if($this->config->get('sellya_menu_brands_per_row')== 6) { ?>   
								<div class="span6">
							<?php } ?>
							<?php if($this->config->get('sellya_menu_brands_per_row')== 8) { ?>   
								<div class="span8">
							<?php } ?>
							<?php if ($manufacturers) { ?>           
								<?php $counter = 0; foreach ($manufacturers as $manufacturer) { 
								if (($counter+$this->config->get('sellya_menu_brands_per_row')) %$this->config->get('sellya_menu_brands_per_row') == 0) $xclass="span-first-child"; 
								else $xclass=""; ?>
								<?php if($this->config->get('sellya_menu_brands_per_row')== 4) { ?>   
									<div class="span2 <?php echo $xclass; ?>">
								<?php } ?>
								<?php if($this->config->get('sellya_menu_brands_per_row')== 6) { ?>   
									<div class="span1 <?php echo $xclass; ?>">
								<?php } ?>
								<?php if($this->config->get('sellya_menu_brands_per_row')== 8) { ?>   
									<div class="span1 <?php echo $xclass; ?>">
								<?php } ?>
										<?php if($this->config->get('sellya_menu_brands_style')== "1") { ?>           
											<div class="image">
												<a href="<?php echo $manufacturer['href']; ?>">
													<img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" />
												</a>
											</div>
										<?php } ?>
										<?php if($this->config->get('sellya_menu_brands_style')== "2") { ?>           
											<div class="name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
										<?php } ?>
										<?php if($this->config->get('sellya_menu_brands_style')== "3") { ?>           
											<div class="image">
												<a href="<?php echo $manufacturer['href']; ?>">
													<img src="<?php echo $manufacturer['image']; ?>" title="<?php echo $manufacturer['name']; ?>" alt="<?php echo $manufacturer['name']; ?>" />
												</a>
											</div>
											<div class="name">
												<a href="<?php echo $manufacturer['href']; ?>">
													<?php echo $manufacturer['name']; ?>
												</a>
											</div>
										<?php } ?>                    
									</div>
								<?php $counter++; } ?>
							<?php } ?>
						  	</div>  
						</li>
					</ul>
				</div>
			<?php endif; ?> 
			<?php if ($this->config->get('sellya_menu_link_1_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_1_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_1_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_1_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_1') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_1'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_2_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_2_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_2_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_2_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_2') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_2'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>  
			<?php if ($this->config->get('sellya_menu_link_3_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_3_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_3_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_3_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_3') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_3'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_4_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_4_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_4_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_4_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_4') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_4'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_5_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_5_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_5_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_5_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_5') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_5'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_6_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_6_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_6_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_6_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_6') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_6'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_7_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_7_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_7_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_7_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_7') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_7'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?> 
			<?php if ($this->config->get('sellya_menu_link_8_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_8_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_8_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_8_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_8') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_8'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_9_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_9_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_9_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_9_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_9') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_9'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if ($this->config->get('sellya_menu_link_10_status') == "1"): ?>
				<?php if($this->config->get('sellya_menu_link_10_url') != ''): ?>
				    <div class="menu_links">
						<a href="<?php echo $this->config->get('sellya_menu_link_10_url'); ?>" target="<?php echo $this->config->get('sellya_menu_link_10_target'); ?>">
							<?php if($this->config->get('sellya_menu_link_10') != '') { ?>
					        	<span>
					        		<?php echo $this->config->get('sellya_menu_link_10'); ?>
					        	</span>
							<?php } ?>
				        </a>
				    </div>
				<?php endif; ?>
			<?php endif; ?>
			<?php if($this->config->get('sellya_menu_information_pages_status')== 1) { ?>
				<div id="menu_informations" class="menu_categs">       
				 	<ul>
					   <?php if(($this->config->get('sellya_menu_homepage_status')== 1) && ($this->config->get('sellya_menu_homepage_style')== 1)) { ?>
					    	<li id="menucateg-homepage">
					    		<a href="<?php echo $home; ?>">
					    			<img src="catalog/view/theme/sellya/image/homepage.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
					    		</a>
					    	</li>
					    <?php }
					    
					    if(($this->config->get('sellya_menu_homepage_status')== 1) && ($this->config->get('sellya_menu_homepage_style')== 2)) { ?>
						    <li id="menucateg-homepage">
						    	<a href="<?php echo $home; ?>">
							    	<?php echo $text_home; ?>
							    </a>
							</li>
					    <?php } ?> 

		                <?php foreach ($informations as $information) { ?>
		                	<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
		                <?php } ?>
							<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				  	</ul>
				</div>    
			<?php } ?>
			<?php if($this->config->get('sellya_menu_your_account_status')== 1) { ?>
				<div id="menu_your_account" class="menu_categs">        
				  	<ul>
					    <li>
					    	<span><?php echo $text_account; ?></span> 
					      	<div>    
						        <ul>
									<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
									<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
									<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						        </ul>
					      	</div>  
					    </li>
				  	</ul>
				</div>
			<?php } ?>
			<?php if($this->config->get('sellya_menu_custom_block_status')== 1) { ?>
				<?php if($this->config->get('sellya_menu_custom_block_content') != '') { ?>
					<div id="menu_custom_block" class="menu_categs">        
					  	<ul>
						    <li>
						    	<a><?php echo $this->config->get('sellya_menu_custom_block_title'); ?></a> 
						      	<div>  
							        <ul>
										<li> 
											<div>
												<?php echo htmlspecialchars_decode($this->config->get('sellya_menu_custom_block_content')); ?>   
											</div>    
										</li>
							        </ul>         
						      	</div>  
						    </li>
					  	</ul>
					</div>    
				<?php } ?>                 
			<?php } ?>
			<?php if($this->config->get('sellya_menu_custom_block_2_status')== 1) { ?>
				<?php if($this->config->get('sellya_menu_custom_block_2_content') != '') { ?>
				<div id="menu_custom_block" class="menu_categs">        
				  	<ul>
					    <li>
					    	<a><?php echo $this->config->get('sellya_menu_custom_block_2_title'); ?></a> 
					      	<div>  
						        <ul>
									<li> 
										<div>
											<?php echo htmlspecialchars_decode($this->config->get('sellya_menu_custom_block_2_content')); ?>   
										</div>    
						          	</li>
						        </ul>         
					      	</div>  
					    </li>
				  	</ul>
				</div>    
				<?php } ?>                 
			<?php } ?>
			<?php if($this->config->get('sellya_menu_custom_block_3_status')== 1) { ?>
				<?php if($this->config->get('sellya_menu_custom_block_3_content') != '') { ?>
				<div id="menu_custom_block" class="menu_categs">        
				  	<ul>
					    <li>
					    	<a><?php echo $this->config->get('sellya_menu_custom_block_3_title'); ?></a> 
					      	<div>  
						        <ul>
									<li> 
										<div>
											<?php echo htmlspecialchars_decode($this->config->get('sellya_menu_custom_block_3_content')); ?>   
										</div> 
									</li>
						        </ul>         
					      	</div>  
					    </li>
				  	</ul>
				</div>   
				<?php } ?>              
			<?php } ?>    
			<?php if($this->config->get('sellya_menu_contacts_status')== 1) { ?>
				<div id="menu_contacts" class="menu_categs">        
				  	<ul>
					    <li>
					    	<a href="<?php echo $contact; ?>"><?php echo $text_menu_contact_us; ?></a> 
					      	<div>       
						      	<?php if($this->config->get('sellya_contact_mphone1') != '' || $this->config->get('sellya_contact_mphone2') != '' || $this->config->get('sellya_contact_sphone1') != '' || $this->config->get('sellya_contact_sphone2') != '' || $this->config->get('sellya_contact_fax1') != '' || $this->config->get('sellya_contact_fax2') != '' || $this->config->get('sellya_contact_email1') != '' || $this->config->get('sellya_contact_email2') != '' || $this->config->get('sellya_contact_skype1') != '' || $this->config->get('sellya_contact_skype2') != '') { ?>
							        <ul>
							          	<li>               
										    <div class="span3">
											    <div class="contacts">
													<h1><?php echo $text_menu_contacts; ?></h1>
											               
											        <?php if($this->config->get('sellya_contact_mphone1') != '' || $this->config->get('sellya_contact_mphone2') != '') { ?>        
											        	<span class="mm_icon"><img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_mphone_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="Mobile Phone" title="Mobile Phone">
											        	</span>     
														<?php if($this->config->get('sellya_contact_mphone1') != '') { ?>
												        	<span>
												        		<?php echo $this->config->get('sellya_contact_mphone1'); ?>
												        	</span>
												        	<br /> 
														<?php } ?>
														<?php if($this->config->get('sellya_contact_mphone2') != '') { ?>
												        	<span>
												        		<?php echo $this->config->get('sellya_contact_mphone2'); ?>
												        	</span>
														<?php } ?>
														<br /><br />
													<?php } ?> 
											        
											        <?php if($this->config->get('sellya_contact_sphone1') != '' || $this->config->get('sellya_contact_sphone2') != '') { ?>              
											        	<span class="mm_icon">
											        		<img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_sphone_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="Static Phone" title="Static Phone">
											        	</span>                     
														<?php if($this->config->get('sellya_contact_sphone1') != '') { ?>
												        	<span>
												        		<?php echo $this->config->get('sellya_contact_sphone1'); ?>
												        	</span>
												        	<br /> 
														<?php } ?>
														<?php if($this->config->get('sellya_contact_sphone2') != '') { ?>
												        	<span>
												        		<?php echo $this->config->get('sellya_contact_sphone2'); ?>
												        	</span>
														<?php } ?>
														<br /><br />
													<?php } ?>   
											        
											        <?php if($this->config->get('sellya_contact_fax1') != '' || $this->config->get('sellya_contact_fax2') != '') { ?>              
											        	<span class="mm_icon">
											        		<img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_fax_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="Fax" title="Fax">
											        	</span>   
														<?php if($this->config->get('sellya_contact_fax1') != '') { ?>
												        	<span><?php echo $this->config->get('sellya_contact_fax1'); ?></span>
												        	<br /> 
														<?php } ?>
														<?php if($this->config->get('sellya_contact_fax2') != '') { ?>
												        	<span><?php echo $this->config->get('sellya_contact_fax2'); ?></span>
														<?php } ?>
														<br /><br />
													<?php } ?>
											        <?php if($this->config->get('sellya_contact_email1') != '' || $this->config->get('sellya_contact_email2') != '') { ?>              
											        	<span class="mm_icon">
											        		<img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_email_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="E-mail" title="E-mail">
											        	</span>           
														<?php if($this->config->get('sellya_contact_email1') != '') { ?>
												        	<span><?php echo $this->config->get('sellya_contact_email1'); ?></span>
												        	<br /> 
														<?php } ?>
														<?php if($this->config->get('sellya_contact_email2') != '') { ?>
												        	<span><?php echo $this->config->get('sellya_contact_email2'); ?></span>
														<?php } ?>
														<br /><br />
													<?php } ?>
											        <?php if($this->config->get('sellya_contact_skype1') != '' || $this->config->get('sellya_contact_skype2') != '') { ?>              
												        <span class="mm_icon">
												        	<img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_skype_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="Skype" title="Skype">
												        </span>         
														<?php if($this->config->get('sellya_contact_skype1') != '') { ?>
												        	<span><?php echo $this->config->get('sellya_contact_skype1'); ?></span>
												        	<br /> 
														<?php } ?>
														<?php if($this->config->get('sellya_contact_skype2') != '') { ?>
												        	<span><?php echo $this->config->get('sellya_contact_skype2'); ?></span>
												        <?php } ?>
												        <br /><br />
												  	<?php } ?>  
												    
												    <?php if($this->config->get('sellya_contact_location1') == '' && $this->config->get('sellya_contact_location2') == '' && $this->config->get('sellya_contact_hours') == '') { ?>   
												        <a href="<?php echo $contact; ?>" class="button" style="margin-bottom:20px"><?php echo $text_menu_contact_form; ?></a>       
											        <?php } ?>  		      
											     </div>
										     </div>  
							          	</li>
							        </ul>  
							    <?php } ?>
					     		<?php if($this->config->get('sellya_contact_location1') != '' || $this->config->get('sellya_contact_location2') != '' || $this->config->get('sellya_contact_hours') != '') { ?>       
							        <ul>
							            <li>
										    <div class="span3">
										        <?php if($this->config->get('sellya_contact_location1') != '' || $this->config->get('sellya_contact_location2') != '') { ?>
										        	<h1>
										        		<?php echo $text_menu_contact_address; ?>
										        	</h1>              
										        	<span class="mm_icon"><img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_location_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="Address" title="Address">
										        	</span>         
													<?php if($this->config->get('sellya_contact_location1') != '') { ?>
											        	<span><?php echo $this->config->get('sellya_contact_location1'); ?></span>
											        	<br /> 
													<?php } ?>
													<?php if($this->config->get('sellya_contact_location2') != '') { ?>
											        	<span><?php echo $this->config->get('sellya_contact_location2'); ?></span>
											        <?php } ?>
											        <br /><br /><br />
											    <?php } ?>
										        <?php if($this->config->get('sellya_contact_hours') != '') { ?>
											        <h1><?php echo $text_menu_contact_hours; ?></h1>               
											        <span class="mm_icon"><img src="catalog/view/theme/sellya/image/icons_footer/icon_contact_hours_<?php echo $this->config->get('sellya_f1_contact_icon_style'); ?>.png" alt="Business Hours" title="Business Hours">
											        </span>         
											        <span>
											        	<pre><?php echo $this->config->get('sellya_contact_hours'); ?></pre>
											        </span>
											        <br /> 
												<?php } ?>
												<br />  	    
										        <a href="<?php echo $contact; ?>" class="button" style="margin-bottom:20px">
										        	<?php echo $text_menu_contact_form; ?>
										        </a> 
										    </div>
							            </li>
							        </ul> 
						      	<?php } ?>         
					      	</div>  
					    </li>
				  	</ul>
				</div>
			<?php } ?>
			<?php echo $accountmodal; ?>
			<!-- my cart -->
	</nav>
</div>