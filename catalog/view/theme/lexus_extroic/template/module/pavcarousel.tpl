<?php 
$id = rand(1,10); 
$span = floor(12/$columns);
?>
<div id="pavcarousel<?php echo $id;?>" class="box box-normal carousel slide pavcarousel hidden-sm hidden-xs">
	<div class="carousel-content">
		<div class="carousel-inner box-content">
			<?php
			$pages = array_chunk( $banners, $itemsperpage );?>

			<?php foreach ($pages as $k => $tbanners) {?>
			<div class="item <?php if($k==0) {?>active<?php } ?>">
				<?php foreach( $tbanners as $i => $banner ) {  $i=$i+1;?>
				<?php if( $i%$columns == 1 ) { ?>
				<div class="row">
					<?php } ?>

					<div class="col-lg-<?php echo $span;?> col-xs-<?php echo $span;?> col-sm-<?php echo $span;?>">
						<div class="item-inner">
							<?php if ($banner['link']) { ?>
							<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
							<?php } else { ?>
							<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
							<?php } ?>
						</div>
					</div>

					<?php if( $i%$columns == 0 || $i==count($tbanners) ) { ?>
				</div>
				<?php } ?>
				<?php } //endforeach; banner ?>
			</div>
			<?php } //endforeach; pages?>	
		</div>
		<?php if( count($banners) > $itemsperpage ){ ?>	
			<a class="carousel-control left middle" href="#pavcarousel<?php echo $id;?>" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control right middle" href="#pavcarousel<?php echo $id;?>" data-slide="next">
				<i class="fa fa-angle-right"></i>
			</a>	
		<?php } ?>
	</div>
</div>
<?php if( count($banners) > 1 ){ ?>
<script type="text/javascript"><!--
$('#pavcarousel<?php echo $id;?>').carousel({interval:false});
--></script>
<?php } ?>