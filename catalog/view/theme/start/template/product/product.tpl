<?php
$kuler = Kuler::getInstance();

$theme = $kuler->getTheme();
$kuler->addScript(array(
	"catalog/view/theme/$theme/js/lib/jquery.elevatezoom.js",
	"catalog/view/theme/$theme/js/product.js"
), true);
$kuler->language->load('kuler/start');
?>
<?php echo $header; ?>
<div class="breadcrumb">
  <div class="container">
    <div class="row">
        <div class="col-md-12">
          <ul>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
  <?php echo $column_left; ?>
  <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
  <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
  <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
  <?php } ?>
  <div id="content" class="<?php echo $class; ?>">
  <?php echo $content_top; ?>
  <div class="row product-info">
  <?php if ($thumb || $images) { ?>
    <div class="col-md-5 left image-panel">
      <?php if ($thumb) { ?>
        <div class="image"><a href="<?php echo $popup; ?>" class="product-image-link"><img id="main-image" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"/></a></div>
      <?php } ?>
      <?php if ($images) { ?>
        <div class="image-additional" id="image-additional">
          <?php foreach ($images as $image) { ?>
            <a title="<?php echo $heading_title; ?>" class="product-image-link" href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
              <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
            </a>
          <?php } ?>
        </div>
      <?php } ?>
    </div>
  <?php } ?>
  <div class="col-md-7 right">
  <?php if ($special) { ?>
  <div class="sale">-<?php echo $kuler->calculateSalePercent($special, $price); ?>%</div>
  <?php } ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($price) { ?>
    <div class="price">
      <?php if (!$special) { ?>
        <?php echo $price; ?>
      <?php } else { ?>
        <span class="price-new"><?php echo $special; ?></span> <span class="price-old"><?php echo $price; ?></span>
        <?php if ($kuler->getSkinOption('show_save_percent')) { ?>
          <div>
            <span><?php echo $kuler->translate($kuler->getSkinOption('save_text')); ?></span> <?php echo $kuler->calculateSalePercent($special, $price); ?>%
          </div>
        <?php } ?>
      <?php } ?>
      <br />
      <?php if ($tax && $kuler->getSkinOption('show_tax')) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
      <?php } ?>
      <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
      <?php } ?>
      <?php if ($discounts) { ?>
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
            <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
      <?php } ?>
    </div>
  <?php } ?>
  <?php if ($review_status) { ?>
    <div class="review">
      <div>
        <img src="catalog/view/theme/start/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />
        &nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
      </div>
    </div>
  <?php } ?>
  <div class="description">
    <h2><?php echo $kuler->language->get('text_product_details'); ?></h2>
    <?php if ($manufacturer) { ?>
      <?php if ($kuler->getSkinOption('show_brand_logo')) { ?>
        <a href="<?php echo $manufacturers; ?>"><img src="<?php echo $kuler->getManufacturerImage($product_id); ?>" alt="<?php echo $manufacturer; ?>" /></a><br />
      <?php } else { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
      <?php } ?>
    <?php } ?>
    <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
    <?php if ($reward) { ?>
      <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
    <?php } ?>
    <span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>
  <?php if ($options) { ?>
    <div class="options">
      <h2><?php echo $text_option; ?></h2>
      <br />
      <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option<?php if ($kuler->getSkinOption('button_select_list')) { ?> button-select-list<?php } ?>">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <?php if ($kuler->getSkinOption('button_select_list')) { ?>
              <?php foreach ($option['option_value'] as $option_value) { ?>
                <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                <label class="toggle"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></label>
              <?php } ?>
            <?php } else { ?>
              <select name="option[<?php echo $option['product_option_id']; ?>]">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['option_value'] as $option_value) { ?>
                  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </option>
                <?php } ?>
              </select>
            <?php } ?>
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <?php foreach ($option['option_value'] as $option_value) { ?>
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
              <br />
            <?php } ?>
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <?php foreach ($option['option_value'] as $option_value) { ?>
              <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
              <br />
            <?php } ?>
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <table class="option-image table table-striped">
              <?php foreach ($option['option_value'] as $option_value) { ?>
                <tr>
                  <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label></td>
                </tr>
              <?php } ?>
            </table>
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
          </div>
          <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
          <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
            <?php if ($option['required']) { ?>
              <span class="required">*</span>
            <?php } ?>
            <b><?php echo $option['name']; ?>:</b><br />
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
          </div>
          <br />
        <?php } ?>
      <?php } ?>
    </div>
  <?php } ?>
  <?php if ($kuler->getSkinOption('show_custom_block')) { ?>
    <div class="custom-block"><?php echo $kuler->translate($kuler->getSkinOption('custom_block_content')); ?></div>
  <?php } ?>
  <div class="quantity">
    <?php echo $text_qty; ?>
	  <?php if (!$kuler->getSkinOption('show_number_quantity')) { ?>
    <input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
		<?php } else { ?>
		  <button type="button" id="qty-dec">-</button>
		  <input type="text" name="quantity" size="2" class="dynamic-number" value="<?php echo $minimum; ?>" data-min="<?php echo $minimum; ?>" data-dec="#qty-dec" data-inc="#qty-inc" />
		  <button type="button" id="qty-inc">+</button>
		<?php } ?>
    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
  </div>
  <div class="details">
    <div>
      <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" id="button-cart" /></div>
      <a class="wishlist" onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
      <a class="compare" onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>
    </div>
    <?php if ($minimum > 1) { ?>
      <div class="minimum"><?php echo $text_minimum; ?></div>
    <?php } ?>
  </div>
  <?php if ($kuler->getSkinOption('default_sharing')) { ?>
    <div class="share"><!-- AddThis Button BEGIN -->
      <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
      <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script>
      <!-- AddThis Button END -->
    </div>
  <?php } ?>
  </div>
  </div>
  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
      <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    <?php if ($kuler->getSkinOption('show_custom_tab_1')) { ?>
      <a href="#tab-custom-tab-1"><?php echo $kuler->translate($kuler->getSkinOption('custom_tab_1_title')); ?></a>
    <?php } ?>
    <?php if ($kuler->getSkinOption('show_custom_tab_2')) { ?>
      <a href="#tab-custom-tab-2"><?php echo $kuler->translate($kuler->getSkinOption('custom_tab_2_title')); ?></a>
    <?php } ?>
  </div>
  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php if ($attribute_groups) { ?>
    <div id="tab-attribute" class="tab-content">
      <table class="attribute table table-striped">
        <?php foreach ($attribute_groups as $attribute_group) { ?>
          <thead>
          <tr>
            <td colspan="2"><?php echo $attribute_group['name']; ?></td>
          </tr>
          </thead>
          <tbody>
          <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
            <tr>
              <td><?php echo $attribute['name']; ?></td>
              <td><?php echo $attribute['text']; ?></td>
            </tr>
          <?php } ?>
          </tbody>
        <?php } ?>
      </table>
    </div>
  <?php } ?>
  <?php if ($review_status) { ?>
    <div id="tab-review" class="tab-content">
      <div id="review"></div>
      <h2 id="review-title"><?php echo $text_write; ?></h2>
      <b><?php echo $entry_name; ?></b><br />
      <input type="text" name="name" value="" />
      <br />
      <br />
      <b><?php echo $entry_review; ?></b>
      <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
      <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
      <br />
      <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
      <input type="radio" name="rating" value="1" />
      &nbsp;
      <input type="radio" name="rating" value="2" />
      &nbsp;
      <input type="radio" name="rating" value="3" />
      &nbsp;
      <input type="radio" name="rating" value="4" />
      &nbsp;
      <input type="radio" name="rating" value="5" />
      &nbsp;<span><?php echo $entry_good; ?></span><br />
      <br />
      <b><?php echo $entry_captcha; ?></b><br />
      <input type="text" name="captcha" value="" />
      <br />
      <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
      <br />
      <div class="buttons">
        <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
      </div>
    </div>
  <?php } ?>
  <?php if ($kuler->getSkinOption('show_custom_tab_1')) { ?>
    <div id="tab-custom-tab-1" class="tab-content">
      <?php echo $kuler->translate($kuler->getSkinOption('custom_tab_1_content')); ?>
    </div>
  <?php } ?>
  <?php if ($kuler->getSkinOption('show_custom_tab_2')) { ?>
    <div id="tab-custom-tab-2" class="tab-content">
      <?php echo $kuler->translate($kuler->getSkinOption('custom_tab_2_content')); ?>
    </div>
  <?php } ?>
  <?php if ($tags) { ?>
    <div class="tags"><b><?php echo $text_tags; ?></b>
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
          <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
          <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
      <?php } ?>
    </div>
  <?php } ?>
  <?php if ($products && $kuler->getSkinOption('show_related_products')) { ?>
    <div class="related-products">
      <h2><?php echo $kuler->language->get('text_related_products'); ?></h2>
      <div class="box-product">
        <div id="carousel2" class="carousel">
          <ul class="jcarousel-skin-opencart">
            <?php foreach ($products as $product) { ?>
              <li class="col-md-4 <?php echo $kuler->getSkinOption('enable_swap_image') ? '' : ' no-swap'; ?>">
                <?php if ($product['thumb']) { ?>
                  <div class="thumb">
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a>
                    <?php if ($images = $kuler->getProductImages($product['product_id'])) { ?>
                      <?php $size = $kuler->getImageSizeByPath($product['thumb']); ?>
                      <?php if(!$kuler->mobile->isMobile() && $kuler->getSkinOption('enable_swap_image')){ ?>
                        <span class="hover"><img src="<?php echo $kuler->resizeImage($images[0], $size['width'], $size['height']); ?>" alt="<?php echo $product['name']; ?>"/></span>
                      <?php } ?>
                    <?php } ?>
                    <div class="details">
                      <div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
                      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></a></div>
                      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></a></div>
                      <?php if (Kuler::getInstance()->getSkinOption('show_quick_view')) { ?>
                        <div class="quick-view"><a href="<?php echo Kuler::getInstance()->getQuickViewUrl($product); ?>" class="quick_view"><?php echo $kuler->translate($kuler->getSkinOption('view_button_text')); ?></a> </div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <?php if ($product['price']) { ?>
                  <div class="price">
                    <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                    <?php } else { ?>
                      <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                    <?php } ?>
                  </div>
                <?php } ?>
                <?php if ($product['rating']) { ?>
                  <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                <?php } ?>
              </li>
            <?php } ?>
          </ul>
        </div>
        <script type="text/javascript"><!--
          $('#carousel2 ul').jcarousel({
            vertical: false,
            visible: <?php echo $limit; ?>,
            scroll: <?php echo $scroll; ?>
          });
          //--></script>
      </div>
    </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
  </div><!--/#content-->
  <?php echo $column_right; ?>
  </div><!--/.row-->
</div><!--/.container-->
<script type="text/javascript">
  $('#button-cart').bind('click', function() {
   $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
    dataType: 'json',
    success: function(json) {
     $('.success, .warning, .attention, information, .error').remove();
     
     if (json['error']) {
      if (json['error']['option']) {
       for (i in json['error']['option']) {
        $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
       }
      }
     } 
     
     if (json['success']) {
      kulerAlert('success', json['success']);
      Kuler.cart_product_total += parseInt($('[name="quantity"]').val());

      $('#cart-total').html(json['total']);
      $('#cart-product-total').html(Kuler.cart_product_total);
     } 
    }
   });
  });
</script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script>
<?php echo $footer; ?>