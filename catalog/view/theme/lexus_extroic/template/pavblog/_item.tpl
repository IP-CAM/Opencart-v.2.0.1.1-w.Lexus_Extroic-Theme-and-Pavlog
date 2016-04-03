<div class="blog-item">
<?php if( $config->get('cat_show_title') ) { ?>

<?php if( $config->get('cat_show_created') ) { ?>
		<span class="create">
			<span class="day"><?php echo date("d",strtotime($blog['created']));?></span> /
			<span class="month"><?php echo date("m",strtotime($blog['created']));?></span> /
			<span class="month"><?php echo date("Y",strtotime($blog['created']));?></span>
		</span>
		<?php } ?>	
	
	<div class="blog-body">
		<?php if( $blog['thumb'] && $config->get('cat_show_image') )  { ?>
		<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" class="img-responsive"/>
		<?php } ?>
		
		<div class="blog-header">
			<h4 class="blog-title">	<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a></h4>
			<?php } ?>
		</div>

		<?php if( $config->get('cat_show_description') ) {?>
		<div class="description">
			<?php echo $blog['description'];?>
		</div>
		<?php } ?>
		<?php if( $config->get('cat_show_readmore') ) { ?>
		<a href="<?php echo $blog['link'];?>" class="btn btn-default"><?php echo $objlang->get('text_readmore');?></a>
		<?php } ?>
	</div>

	<hr>
	<div class="blog-meta">
		<ul class="list-inline">
		  	<li><?php if( $config->get('blog_show_author') ) { ?>
			<span class="author"><b><?php echo $objlang->get("text_write_by");?></b> <?php echo $blog['author'];?></span>
			<?php } ?>
			</li>

			<li>
			<?php if( $config->get('blog_show_category') ) { ?>
			<span class="publishin">
				<b><?php echo $objlang->get("text_published_in");?></b>
				<a class="color" href="<?php echo $blog['category_link'];?>" title="<?php echo $blog['category_title'];?>"><?php echo $blog['category_title'];?></a>
			</span>
			<?php } ?>	
			</li>

			<li>
			<?php if( $config->get('blog_show_created') ) { ?>
			<span class="created"><b><?php echo $objlang->get("text_created_date");?></b> <?php echo $blog['created'];?></span>
			<?php } ?>
			</li>

			<li>
			<?php if( $config->get('blog_show_hits') ) { ?>
			<span class="hits"><b><?php echo $objlang->get("text_hits");?></b> <?php echo $blog['hits'];?></span>
			<?php } ?>		
			</li>

			<li>
			<?php if( $config->get('blog_show_comment_counter') ) { ?>
			<span class="comment_count"><b><?php echo $objlang->get("text_comment_count");?></b> <?php echo $blog['comment_count'];?></span>
			<?php } ?>	
			</li>
		</ul>
	</div>
	<hr>

</div>