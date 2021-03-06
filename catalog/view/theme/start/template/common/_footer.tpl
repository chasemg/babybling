<div id="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 left">
				<div class="row info">
					<?php if ($kuler->getSkinOption('show_information')) { ?>
						<div class="col-lg-12">
							<?php if ($kuler->getSkinOption('show_information_title')) { ?>
								<h3><span><?php echo $kuler->translate($kuler->getSkinOption('information_title')); ?></span></h3>
							<?php } ?>
							<?php echo $kuler->translate($kuler->getSkinOption('information_content')); ?>
						</div>
					<?php } ?>
				</div><!-- /information-->
				<div class="row">
					<?php
					$modules = Kuler::getInstance()->getModules('footer_extra_info');
					if ($modules) {
						echo implode('', $modules);
					}
					?>
					<div class="col-lg-5 col-md-6 col-sm-6 col-xs-12 contact">
						<!-- Contact -->
						<?php if ($kuler->getSkinOption('show_contact')) { ?>
							<div>
								<?php if ($kuler->getSkinOption('show_contact_title')) { ?>
									<h3><span><?php echo $kuler->translate($kuler->getSkinOption('contact_title')); ?></span></h3>
								<?php } ?>
								<ul>
									<?php if (($skype1 = $kuler->getSkinOption('skype_1')) || ($skype2 = $kuler->getSkinOption('skype_2'))) { ?>
										<li class="skype">
											<?php if ($skype1) { ?>
												<span><?php echo $skype1; ?></span>
											<?php } ?>
											<?php if ($skype2 = $kuler->getSkinOption('skype_2') && $skype2) { ?>
												<span><?php echo $skype2; ?></span>
											<?php } ?>
										</li>
									<?php } ?>

									<?php if (($email1 = $kuler->getSkinOption('email_1')) || ($email2 = $kuler->getSkinOption('email_2'))) { ?>
										<li class="email">
											<?php if ($email1) { ?>
												<span><?php echo $email1; ?></span>
											<?php } ?>
											<?php if ($email2 = $kuler->getSkinOption('email_2') && $email2) { ?>
												<span><?php echo $email2; ?></span>
											<?php } ?>
										</li>
									<?php } ?>

									<?php if (($mobile1 = $kuler->getSkinOption('mobile_1')) || ($mobile2 = $kuler->getSkinOption('mobile_2'))) { ?>
										<li class="mobile">
											<?php if ($mobile1) { ?>
												<span><?php echo $mobile1; ?></span>
											<?php } ?>
											<?php if ($mobile2 = $kuler->getSkinOption('mobile_2') && $mobile2) { ?>
												<span><?php echo $mobile2; ?></span>
											<?php } ?>
										</li>
									<?php } ?>

									<?php if (($phone1 = $kuler->getSkinOption('phone_1')) || ($phone2 = $kuler->getSkinOption('phone_2'))) { ?>
										<li class="phone">
											<?php if ($phone1) { ?>
												<span><?php echo $phone1; ?></span>
											<?php } ?>
											<?php if ($phone2 = $kuler->getSkinOption('phone_2') && $phone2) { ?>
												<span><?php echo $phone2; ?></span>
											<?php } ?>
										</li>
									<?php } ?>

									<?php if (($fax1 = $kuler->getSkinOption('fax_1')) || ($fax2 = $kuler->getSkinOption('fax_2'))) { ?>
										<li class="fax">
											<?php if ($fax1) { ?>
												<span><?php echo $fax1; ?></span>
											<?php } ?>
											<?php if ($fax2 = $kuler->getSkinOption('fax_2') && $fax2) { ?>
												<span><?php echo $fax2; ?></span>
											<?php } ?>
										</li>
									<?php } ?>
								</ul>
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="row map">
					<?php
					$modules = Kuler::getInstance()->getModules('footer_address');
					if ($modules) {
						echo implode('', $modules);
					}
					?>
				</div><!--/.map-->
			</div><!--/.left-->
			<div class="col-lg-3 col-md-12 col-sm-12 right">
				<div class="row">
                	<div class="col-lg-12 col-md-3 col-sm-6 col-xs-12">
						<h3><?php echo $text_account; ?></h3>
						<ul>
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
							<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						</ul>
					</div>
					<?php if ($informations) { ?>
						<div class="col-lg-12 col-md-3 col-sm-6 col-xs-12">
							<h3><?php echo "Contact"; ?></h3>
								<?php
									echo "contact@email.com<br>";
									echo "123.456.7890<br>";?>
							
						</div>
					<?php } ?>
					<div class="col-lg-12 col-md-3 col-sm-6 col-xs-12">
						<h3><?php echo $text_service; ?></h3>
						<form action="$text_service" method="get">
							 
							 <input type="email" placeholder="Email address" name="email" >  <br>
							<button class="button kcp-button-submit">Subscribe</button>
							</form>
					</div>
					<div class="col-lg-12 col-md-3 col-sm-6 col-xs-12">
						<a href="" class="facebook"></a>
                        <a href="" class="pinterest"></a>
                        <a href="" class="instagram"></a>
					</div>
					
				</div>
			</div><!--/.right-->
		</div><!--/.row-->
	</div><!--/.container-->
</div><!--/.footer-->
<div class="social-newsletter">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 social">
				<?php if ($kuler->getSkinOption('show_social_icons')) { ?>
					<?php if ($kuler->getSkinOption('show_social_icons_title')) { ?>
						<h3><span><?php echo $kuler->translate($kuler->getSkinOption('social_icon_title')); ?></span></h3>
					<?php } ?>
					<?php if ($social_icons = $kuler->getSocialIcons()) { ?>
						<ul class="icon-style-<?php echo $kuler->getSkinOption('icon_style') ?> icon-size-<?php echo $kuler->getSkinOption('icon_size'); ?>">
							<?php foreach ($social_icons as $social_icon) { ?>
								<li><a href="<?php echo $social_icon['link']; ?>" target="_blank" class="<?php echo $social_icon['class']; ?>"></a></li>
							<?php } ?>
						</ul>
					<?php } ?>
				<?php } ?>
			</div><!--/social icons-->
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 newsletter">
				<?php if ($kuler->getSkinOption('show_newsletter')) { ?>
					<?php if ($kuler->getSkinOption('show_newsletter_title')) { ?>
					<h3><span><?php echo $kuler->translate($kuler->getSkinOption('newsletter_title')); ?></span></h3>
				<?php } ?>
					<form id="newsletter-form">
						<?php echo $kuler->translate($kuler->getSkinOption('newsletter_description_text')); ?>
						<input type="email" id="newsletter-mail"
						       placeholder="<?php echo $kuler->translate($kuler->getSkinOption('newsletter_input_text')); ?>"/>
						<button
							id="newsletter-submit"><?php echo $kuler->translate($kuler->getSkinOption('newsletter_button_text')); ?></button>
					</form>
					<script>
						Kuler.show_newsletter = <?php echo json_encode($kuler->getSkinOption('show_newsletter')); ?>;
						Kuler.newsletter_subscribe_link = <?php echo json_encode($kuler->getNewsletterSubscribeLink()); ?>;
					</script>
				<?php } ?>
			</div><!--/newsletter-->
		</div>
	</div>
</div>
<div id="powered">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-5 col-xs-12 copyright">
				<?php if ($kuler->getSkinOption('show_custom_copyright')) { ?>
					<?php echo $kuler->translate($kuler->getSkinOption('custom_copyright')); ?>
				<?php } else { ?>
					<?php echo $powered; ?>
				<?php } ?>
			</div>
			<?php if ($kuler->getSkinOption('show_payment_icons') && $payment_icons = $kuler->getPaymentIcons()) { ?>
				<div class="col-lg-8 col-md-6 col-sm-7 col-xs-12 payment">
					<ul>
						<?php foreach ($payment_icons as $payment_icon) { ?>
							<li><a href="<?php echo $payment_icon['link']; ?>"<?php if ($payment_icon['new_tab']) echo ' target="_blank"'; ?> title="<?php echo $kuler->translate($payment_icon['name']); ?>"><img src="<?php echo $payment_icon['thumb']; ?>" alt="<?php echo $kuler->translate($payment_icon['name']); ?>" /></a></li>
						<?php } ?>
					</ul>
				</div>
			<?php } ?>
		</div>
	</div>
</div>