<?php $objlang = $this->registry->get('language'); ?>
 <div class="product-block item-skincare" itemtype="http://schema.org/Product" itemscope>
    
    <div class="block-img">
        <?php if ($product['thumb']) {    ?>
            <?php if( $product['special'] ) {   ?>
            <span class="product-label bts">
                <span class="product-label-special"><?php echo $objlang->get( 'text_sale' ); ?></span>
            </span>
        <?php } ?>

            <div class="image">
                <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                    <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                </a>
            </div>
        <?php } ?>


        <!-- button active -->
         <div class="action">
             <div class="quick-view">
                 <?php //#2 Start fix quickview in fw?>
                 <?php if ( isset($quickview) && $quickview ) { ?>
                     <a data-toggle="tooltip" data-placement="top" title="<?php echo $objlang->get('quick_view'); ?>" class="pav-colorbox btn btn-success" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>">
                        <i class="fa fa-eye"></i>
                        <!-- <span><?php echo $objlang->get('quick_view'); ?></span> -->
                     </a>
                 <?php } ?>
                 <?php //#2 End fix quickview in fw?>
             </div>
             <div class="wishlist">
                <button class="btn btn-success" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
            </div>

            <div class="compare">
                <button class="btn btn-success" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
        </div>
    </div>

    <div class="product-meta">

        <div class="meta">
            <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
              
            <?php if ( isset($product['rating']) ) { ?>
              <div class="rating">
                <img src="catalog/view/theme/<?php echo PAVO_THEME_NAME;?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['rating']; ?>"></div>
                  <?php } else { ?>
              <div class="norating"><img alt="0" src="catalog/view/theme/<?php echo PAVO_THEME_NAME;?>/image/stars-0.png"></div>  
            <?php } ?>

            <?php if ($product['price']) { ?>
            <div class="price" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
                <?php if (!$product['special']) {  ?>
                    <span class="special-price"><?php echo $product['price']; ?></span>
                    <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?>
                    <meta content="<?php echo $p[0]; ?>" itemprop="price">
                    <?php } ?>
                <?php } else { ?>
                    <span class="price-old"><?php echo $product['price']; ?></span>
                    <span class="price-new"><?php echo $product['special']; ?></span>

                    <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?>
                    <meta content="<?php echo $p[0]; ?>" itemprop="price">
                    <?php } ?>

                <?php } ?>
            </div>
            <?php } ?>

            <?php if( isset($product['description']) ){ ?>
                <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
            <?php } ?>
        </div>
    </div>

    <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
     <div class="cart">
         <button data-loading-text="Loading..." class="btn btn-default" type="button" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
<!--             <i class="fa fa-shopping-cart"></i> --> 
            <?php echo $button_cart; ?>
        </button>
     </div>
    <?php } ?>
</div>