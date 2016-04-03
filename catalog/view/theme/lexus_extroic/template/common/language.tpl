<?php if (count($languages) > 1) { ?>
<div class="dropdown pull-right">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group hover-buttom">
    <button class="btn btn-nostyle font-small dropdown-toggle" data-toggle="dropdown">
    <span class="hidden-lg hidden-md"><?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
    <?php } ?>
    <?php } ?></span>
    <span class="hidden-xs hidden-sm"><?php echo $text_language; ?></span> <i class="fa fa-angle-down"></i></button>
    <ul class="dropdown-menu dropdown-menu-right">
      <?php foreach ($languages as $language) { ?>
      <li><a href="<?php echo $language['code']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
