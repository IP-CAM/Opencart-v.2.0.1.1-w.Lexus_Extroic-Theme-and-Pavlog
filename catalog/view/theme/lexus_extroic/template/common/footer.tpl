<?php 
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
  $config = $this->registry->get('config'); 
  $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('config_template') );
  $helper->loadFooterModules();
  $layoutID = 1 ;
?>
 
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
 
  $ospans = array(1=>12);
  $tmcols = 'col-sm-12 col-xs-12';
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php } ?>
 
<footer id="footer">
 
  <?php
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array(1=>6, 2=>6);
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>


  <?php

    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array(1=>4,2=>4,3=>4);
   
      require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );

      if( count($modules) <=0 ){
          require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_center.tpl' ) );
      }
  ?>

  <?php
    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array();

    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
    if( count($modules) <=0 ){
       require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_bottom.tpl' ) );      
    }
  ?>


</footer>
 
 
<div id="powered">
  <div class="container">
    <div class="copyright pull-left">
    <?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
      <?php echo html_entity_decode($helper->getConfig('copyright')); ?>
    <?php } else { ?>
      <?php echo $powered; ?>. 
    <?php } ?>
    </div> 

    <?php if( $content=$helper->getLangConfig('widget_paypal') ) {?>
      <div class="paypal pull-right">
        <?php echo $content; ?>
      </div>
    <?php } ?> 
  </div>


</div>

<div id="top"><a class="scrollup" href="#"><i class="fa fa-angle-up"></i>Top</a></div>

<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>

</div>
  <?php  echo $helper->renderAddon( 'offcanvas' );?>  
</div>
</body></html>