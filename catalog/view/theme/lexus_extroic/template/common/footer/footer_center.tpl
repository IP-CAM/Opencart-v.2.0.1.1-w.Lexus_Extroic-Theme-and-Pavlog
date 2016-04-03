<div class="<?php echo str_replace('_','-',$blockid); ?> <?php echo $blockcls;?>" id="pavo-<?php echo str_replace('_','-',$blockid); ?>">
  <div class="container">
    <div class="inside">
      <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          <?php
          if($content=$helper->getLangConfig('widget_site_info')){
          echo $content;
          }
          ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          <?php
          if($content=$helper->getLangConfig('widget_sosial')){
          echo $content;
          }
          ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          <?php
          echo $helper->renderModule('pavnewsletter');
          ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          <?php
          $info = $this->registry->get('config');
          ?>
          <div class="box">
            <div class="box-heading">Contact Us</div>
            <div class="box-content">
              <ul class="list-unstyled address">
                <li><i class="fa fa-map-marker"></i><?php echo $info->get('config_address'); ?></li>
                <li><i class="fa fa-tablet"></i><?php echo $info->get('config_telephone'); ?></li>
                <li><i class="fa fa-envelope-o"></i><a href="mailto:<?php echo $info->get('config_email'); ?>"><?php echo $info->get('config_email'); ?></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>