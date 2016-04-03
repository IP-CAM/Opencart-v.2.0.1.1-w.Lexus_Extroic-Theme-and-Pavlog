<?php 

	$span = 12/$cols; 
	$active = 'latest';
	$id = rand(1,9)+rand();	



$themeConfig = (array)$objconfig->get('themecontrol');
	$listingConfig = array(
	'category_pzoom'                     => 1,
	'quickview'                          => 0,
	'show_swap_image'                    => 0,
	'product_layout'		=> 'default',
	'enable_paneltool'	                 => 0
);
$listingConfig      = array_merge($listingConfig, $themeConfig );
$categoryPzoom 	    = $listingConfig['category_pzoom'];
$quickview          = $listingConfig['quickview'];
$swapimg            = $listingConfig['show_swap_image'];
$categoryPzoom      = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 
$theme              = $objconfig->get('config_template');
if( $listingConfig['enable_paneltool'] && isset($_COOKIE[$theme.'_productlayout']) && $_COOKIE[$theme.'_productlayout'] ){
	$listingConfig['product_layout'] = trim($_COOKIE[$theme.'_productlayout']);
} 
$productLayout = DIR_TEMPLATE.$objconfig->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
if( !is_file($productLayout) ){
	$listingConfig['product_layout'] = 'default';
}
$productLayout = DIR_TEMPLATE.$objconfig->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
?>

<div class="box pavproducts <?php echo $prefix_class ?>">
<?php if( !empty($module_description) ) { ?>
 <div class="module-desc">
	<?php echo $module_description;?>
 </div>
 <?php } ?>
  <div class="tab-nav">
	<ul class="nav nav-color nav-justified" id="pavproducts<?php echo $id;?>">
		<?php $i =1; foreach( $tabs as $tab => $category ) { if( empty($category) ){ continue;}?>

			 <li class="<?php echo "bg-new".$i;  ?>">
			 	<a href="#tab-<?php echo $tab.$id;?>" data-toggle="tab">
			 	<i class="<?php echo $category['class'];?> fa-2x"></i>
			 	</a>
			 </li> 
		<?php $i++; } ?>
	</ul>
  </div>

	<div class="tab-content">
		<?php foreach( $tabs as $tab => $category ) { 
				if( empty($category) ){ continue;}
				$products = $category['products'];

			?>
			<div class="tab-pane products-rows  tabcarousel<?php echo $id; ?> slide" id="tab-<?php echo $tab.$id;?>">
				
				<?php if( count($products) > $itemsperpage ) { ?>
				<a class="carousel-control left middle" href="#tab-<?php echo $tab.$id;?>"   data-slide="prev">
					<i class="fa fa-angle-left"></i>
				</a>
				<a class="carousel-control right middle" href="#tab-<?php echo $tab.$id;?>"  data-slide="next">
					<i class="fa fa-angle-right"></i>
				</a>
				<?php } ?>
				<div class="carousel-inner products-block">		
				 <?php 
					$pages = array_chunk( $products, $itemsperpage);
				// echo '<pre>'.print_r( $pages, 1 ); die;
				 ?>	
				  <?php foreach ($pages as  $k => $tproducts ) {   ?>
						<div class="item <?php if($k==0) {?>active<?php } ?>">
							<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
								<?php if( $i%$cols == 1 ) { ?>
								  <div class="row products-row">
									<?php } ?> 
									  <div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 product-col border">
							  			<?php require( $productLayout );  ?>   		
									  </div>
								  	<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
									</div>
									<?php } ?>
							<?php } //endforeach; ?>
						</div>
				  <?php } ?>
				</div>  
			</div>
		<?php } // endforeach of tabs ?>	
	</div>
</div>

<script type="text/javascript">
$(function () {
	// $('.pavproducts<?php echo $id;?>').carousel({interval:99999999999999,auto:false,pause:'hover'});
	$('#pavproducts<?php echo $id;?> a:first').tab('show');
});
</script>
