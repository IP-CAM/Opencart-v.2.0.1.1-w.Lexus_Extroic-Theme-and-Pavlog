<?php if (count($currencies) > 1) { ?>
<div class="dropdown pull-right">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="currency">
  <div class="btn-group hover-buttom">
    <button class="btn btn-nostyle font-small dropdown-toggle" data-toggle="dropdown">
    <span class="hidden-lg hidden-md"><?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_left']; ?></strong>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
    <strong><?php echo $currency['symbol_right']; ?></strong>
    <?php } ?>
    <?php } ?></span>

    <span class="hidden-xs hidden-sm"><?php echo $text_currency; ?></span> <i class="fa fa-angle-down"></i></button>
    <ul class="dropdown-menu dropdown-menu-right">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li><a class="currency-select btn btn-link" data-name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></li>
      <?php } else { ?>
      <li><a class="currency-select btn btn-link" data-name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
