<?php
/******************************************************
* @package Pav Opencart Theme Framework for Opencart 1.5.x
* @version 1.1
* @author http://www.pavothemes.com
* @copyright Copyright (C) Augus 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
* @license   GNU General Public License version 2
*******************************************************/
$config = $this->registry->get('config');
// $this->language->load('module/themecontrol');
$themeName =  $config->get('config_template');
$themeConfig = (array)$config->get('themecontrol');
require_once(DIR_SYSTEM . 'pavothemes/loader.php');
$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
$helper->triggerUserParams( array('headerlayout','productlayout') );
/* Add scripts files */
$helper->addScript( 'catalog/view/javascript/jquery/jquery-2.1.1.min.js' );
$helper->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
$helper->addScript( 'catalog/view/javascript/bootstrap/js/bootstrap.min.js' );
$helper->addScript( 'catalog/view/javascript/common.js' );
$helper->addScript( 'catalog/view/theme/'.$themeName.'/javascript/common.js' );
if( isset($themeConfig['catalog_mode']) && $themeConfig['catalog_mode'] ){
$cart = null;
}
$logoType = $helper->getConfig('logo_type','logo-theme');
$headerlayout = $helper->getConfig('header_layout');
$template_layout = $helper->getConfig('template_layout');
$skin = $helper->getConfig('skin');
if( $helper->getConfig('enable_paneltool') ){
if( $helper->getParam('headerlayout') ){
$headerlayout = $helper->getParam('headerlayout');
}
if($helper->getParam('layout')){
$template_layout = $helper->getParam('layout');
}
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/paneltool.css' );
$helper->addScript( 'catalog/view/javascript/jquery/colorpicker/js/colorpicker.js' );
$helper->addCss( 'catalog/view/javascript/jquery/colorpicker/css/colorpicker.css' );
}
$helper->addScriptList( $scripts );
$ctheme=$helper->getConfig('customize_theme');
if( file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/customize/'.$ctheme.'.css') ) {
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/customize/'.$ctheme.'.css'  );
}
$helper->addCss( 'catalog/view/javascript/font-awesome/css/font-awesome.min.css' );

if( file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/animate.css') ) {
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/animate.css'  );
}

$helper->addCss('catalog/view/javascript/jquery/magnific/magnific-popup.css');
// -$helper->addCss( '//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700' );
$helper->addCssList( $styles );
$logoType = $helper->getConfig('logo_type','logo-theme');
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo  $helper->getDirection(); ?>" class="<?php echo $helper->getDirection(); ?>" lang="<?php echo $lang; ?>">
  <!--<![endif]-->
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($helper->getCssLinks() as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach( $helper->getScriptFiles() as $script )  { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <?php echo $google_analytics; ?>

    <?php if( isset($themeConfig['theme_width']) && $themeConfig['theme_width'] &&  $themeConfig['theme_width'] != 'auto' ) { ?>
    <style> #page .container{max-width:<?php echo $themeConfig['theme_width'];?>; width:auto;} </style>
    <?php } ?>

  </head>
  <body class="<?php echo $class; ?> <?php echo $helper->getPageClass();?> layout-<?php echo $template_layout; ?>">
    <div class="row-offcanvas row-offcanvas-left">
      <div id="page">
        <nav id="topbar">
          <div class="container">
            <div class="inside">
                <p class="welcome pull-left"> Phone: <span class="text-theme">
                <?php
                $info = $this->registry->get('config');
                echo $info->get('config_telephone');
                ?></span> &nbsp; &nbsp; &nbsp;
                Email: <a href="mailto:<?php echo $info->get('config_email'); ?>"><?php echo $info->get('config_email'); ?></a>
                </p>
                
                <div id="top-links" class="nav pull-right">
                    <div class="dropdown hover-buttom">
                        <button title="<?php echo $text_account; ?>" class="dropdown-toggle font-small btn btn-nostyle" data-toggle="dropdown">
                            <i class="fa fa-user hidden-lg"></i>
                            <span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span>
                            <i class="fa fa-angle-down"></i>
                        </button>
                          <ul class="dropdown-menu dropdown-menu-right">
                            <?php if ($logged) { ?>
                            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                            <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a></li>
                            <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><span><?php echo $text_checkout; ?></span></a></li>
                            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a></li>
                            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                            <?php } else { ?>
                            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                            <?php } ?>
                          </ul>
                    </div>
                </div>
                <?php echo $currency; ?>
                <?php echo $language; ?>
                <div class="clearfix"></div>
            </div>
          </div>
        </nav>
        <!-- header -->
        <?php require( ThemeControlHelper::getLayoutPath( 'common/header/header_layout.tpl' ) ); ?>
        <!-- /header -->
        <!-- sys-notification -->
        <div id="sys-notification">
          <div class="container">
            <div id="notification"></div>
          </div>
        </div>
        <!-- /sys-notification -->
        <?php
        /**
        * Showcase modules
        * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
        */
        //$modules = $helper->getCloneModulesInLayout( $blockid, $layoutID );
        $blockid = 'slideshow';
        $blockcls = "hidden-xs hidden-sm";
        $ospans = array(1=>12);
        require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
        ?>
        <?php
        /**
        * Showcase modules
        * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
        */
        $blockid = 'showcase';
        $blockcls = 'hidden-xs hidden-sm';
        $ospans = array(1=>12);
        require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
        ?>
        <?php
        /**
        * promotion modules
        * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
        */
        $blockid = 'promotion';
        $blockcls = "hidden-xs hidden-sm";
        $ospans = array(1=>12, 2=>12);
        require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
        ?>