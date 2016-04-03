<?php 
$objlang = $this->registry->get('language');
?>
<div class="box nopadding">
	<?php if( trim($heading) ){ ?>
	<div class="box-heading"><span><?php echo $objlang->get(trim($heading)); ?></span></div>
	<?php } ?>
	<div class="box-content"><div id="pts-bannerbuilder<?php echo rand(1,90000); ?>" class="clearfix <?php echo $class ?>">
 	
 		<?php  $level = 1; $rows = $layouts; require( $template_builder ); ?>
	</div></div>
</div>	
