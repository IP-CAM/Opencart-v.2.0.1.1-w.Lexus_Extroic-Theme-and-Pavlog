<?php  echo $header; ?>
<?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<div class="container">

	<div class="row">
		<?php if( $SPAN[0] ): ?>
		<aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
		  <?php echo $column_left; ?>
		</aside>	
	    <?php endif; ?> 
		<div id="content" class="col-md-<?php echo $SPAN[1];?>">
		<?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
		<?php echo $content_top; ?>
		<h1><?php echo $heading_title; ?></h1>
		<div class="well">
		<!-- Start Div Content -->
		<div class="pav-header">
			<a class="pull-right" href="<?php echo $latest_rss;?>"><span class="fa fa-rss text-warning"></span></a>	
		</div>
		<div class="pav-filter-blogs">
			<div class="pav-blogs">
				<?php $cols = $config->get('cat_columns_leading_blogs');
				if( count($leading_blogs) ) { ?>
					<div class="leading-blogs clearfix">
						<?php foreach( $leading_blogs as $key => $blog ) { $key = $key + 1;?>
						<div class="pavcol<?php echo $cols;?>">
						<?php require( '_item.tpl' ); ?>
						</div>
						<?php if( ( $key%$cols==0 || $cols == count($leading_blogs)) ){ ?>
							<div class="clearfix"></div>
						<?php } ?>
						<?php } ?>
					</div>
				<?php } ?>
				<hr>
				<?php
					$cols = $config->get('cat_columns_secondary_blogs');
					$cols = !empty($cols)?$cols:1;
					if ( count($secondary_blogs) ) { ?>
					<div class="secondary clearfix">
						
						<?php foreach( $secondary_blogs as $key => $blog ) {  $key = $key+1; ?>
						<div class="pavcol<?php echo $cols;?>">
						<?php require( '_item.tpl' ); ?>
						</div>
						<?php if( ( $key%$cols==0 || $cols == count($leading_blogs)) ){ ?>
							<div class="clearfix"></div>
						<?php } ?>
						<?php } ?>
					</div>
				<?php } ?>
					
				<div class="pav-pagination pagination"><?php echo $pagination;?></div>
			</div>
		</div>
		</div>
		<!-- End Div Content -->
		<?php echo $content_bottom; ?></div>
		<!-- End Div Row -->
		<?php if( $SPAN[2] ): ?>
		<aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">	
		<?php echo $column_right; ?>
		</aside>
	<?php endif; ?>
	</div>

</div><!-- End Div Container -->
<?php echo $footer; ?>