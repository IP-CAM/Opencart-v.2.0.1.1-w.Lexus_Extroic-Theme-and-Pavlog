<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>

<?php if( $product['special'] ) {   ?>
        <span class="product-label sale-exist"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
  <?php } ?>

<div class="product-block item-full" itemtype="http://schema.org/Product" itemscope>
  <div class="block-img">
    <?php if ($product['thumb']) {    ?>
      
      <div class="image">
        <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
          <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        </a>
        <div id="item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>" class="item-countdown"></div>
      </div>
    <?php } ?>

    <div class="action">
      <div class="compare">     
        <button class="btn btn-default dark" type="button" data-toggle="tooltip" data-placement="right" title="<?php echo $objlang->get("button_wishlist"); ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> 
      </div>  
      <div class="wishlist">
        <button class="btn btn-default dark" type="button" data-toggle="tooltip" data-placement="right" title="<?php echo $objlang->get("button_compare"); ?>" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button> 
      </div>
      <div class="quickview">
        <a class="btn btn-default dark iframe-link" data-toggle="tooltip" data-placement="right" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="fa fa-eye"></i></a>
      </div>
    </div>    
  </div>
         
  <div class="product-meta">      
    <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
        <?php if( isset($product['description']) ){ ?> 
    <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
    <?php } ?> 

    <blockquote class="pull-left">       
    <?php if ($product['price']) { ?>
    <div class="price clearfix" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
      <?php if (!$product['special']) {  ?>
        <span class="price-new"><?php echo $product['price']; ?></span>
        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
        <meta content="<?php echo $p[0]; ?>" itemprop="price">
        <?php } ?>
      <?php } else { ?>
        <span class="price-new"><?php echo $product['special']; ?></span>
        <span class="price-old"><?php echo $product['price']; ?></span> 
        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
        <meta content="<?php echo $p[0]; ?>" itemprop="price">
        <?php } ?>

      <?php } ?>
      <meta content="<?php // echo $this->currency->getCode(); ?>" itemprop="priceCurrency">
    </div>
    <?php } ?>

    <?php if ( isset($product['rating']) ) { ?>
      <div class="rating">
        <?php for ($is = 1; $is <= 5; $is++) { ?>
        <?php if ($product['rating'] < $is) { ?>
        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
        <?php } else { ?>
        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i>
        </span>
        <?php } ?>
        <?php } ?>
      </div>
    <?php } ?>
    </blockquote>

      <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
    <div class="cart pull-right">            
       <button data-loading-text="Loading..." class="btn btn-default" type="button" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
          <?php echo $button_cart; ?>
      </button>
    </div>
  <?php } ?>
  </div>  
</div>

<script type="text/javascript">
  jQuery(document).ready(function($){
    $("#item<?php echo $module; ?>countdown_<?php echo $product['product_id']; ?>").lofCountDown({
      formatStyle:2,
      TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($product['date_end_string'])); ?>",
      DisplayFormat:"<ul class='list-inline'><li>%%D%% <div><?php echo $objlang->get("text_days");?></div></li><li> %%H%% <div><?php echo $objlang->get("text_hours");?></div></li><li> %%M%% <div><?php echo $objlang->get("text_minutes");?></div></li><li> %%S%% <div><?php echo $objlang->get("text_seconds");?></div></li></ul>",
      FinishMessage: "<?php echo $objlang->get('text_finish');?>"
    });
  });
</script>





