<?php
	$num = count($pavreassurances);
	if($num != 0){
		$col = floor(12/$num);
		$col = "col-lg-$col col-md-$col col-sm-$col";
	}
?>
<?php
if (!empty($pavreassurances)) { ?>
	<div class="box box-normal pavreassurances <?php echo $prefix_class ?>">
		<div class="row">
			<?php $i=1?>
			<?php foreach ($pavreassurances as $reassurance) { ?>
				<div class="<?php echo $col; ?> col-xs-12 column">
					
					<div class="media border-left" data-toggle="modal" data-target="#myModal<?php echo $i;?>">
					  <a class="media-left" href="#">
					  	 <i class="fa-3x fa <?php echo $reassurance['select_icon'] ?>"></i>
					  </a>
					  <div class="media-body">
					    <h4><?php echo $reassurance['title']; ?></h4>
					    <?php echo htmlspecialchars_decode($reassurance['caption']); ?>	
					  </div>
					</div>

				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal<?php echo $i;?>" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <span class="icon-name fa <?php echo $reassurance['select_icon'] ?>"></span>
				        <h4><?php echo $reassurance['title']; ?></h4>
				        <?php echo htmlspecialchars_decode($reassurance['caption']); ?>
				      </div>
				      <div class="modal-body">
				       		<?php echo htmlspecialchars_decode($reassurance['detail']); ?>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				<?php $i++;?>
			<?php } ?>
		</div>
	</div>
<?php } ?>
