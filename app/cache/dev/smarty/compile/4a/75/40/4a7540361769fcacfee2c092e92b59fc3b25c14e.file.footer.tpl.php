<?php /* Smarty version Smarty-3.1.19, created on 2017-11-30 12:49:02
         compiled from "/homepages/15/d701691074/htdocs/ritemadmin/themes/new-theme/template/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:10358771835a1ff02ea2dbc0-60615637%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4a7540361769fcacfee2c092e92b59fc3b25c14e' => 
    array (
      0 => '/homepages/15/d701691074/htdocs/ritemadmin/themes/new-theme/template/footer.tpl',
      1 => 1511970448,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10358771835a1ff02ea2dbc0-60615637',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'timer_start' => 0,
    'lang_iso' => 0,
    'host_mode' => 0,
    'iso_is_fr' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a1ff02ea3ad15_41714764',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a1ff02ea3ad15_41714764')) {function content_5a1ff02ea3ad15_41714764($_smarty_tpl) {?>
<div id="footer" class="bootstrap hide">
<!--
  <div class="col-sm-2 hidden-xs">
    <a href="http://www.prestashop.com/" class="_blank">PrestaShop&trade;</a>
    -
    <span id="footer-load-time"><i class="icon-time" title="<?php echo smartyTranslate(array('s'=>'Load time: '),$_smarty_tpl);?>
"></i> <?php echo number_format(microtime(true)-$_smarty_tpl->tpl_vars['timer_start']->value,3,'.','');?>
s</span>
  </div>

  <div class="col-sm-2 hidden-xs">
    <div class="social-networks">
      <a class="link-social link-twitter _blank" href="https://twitter.com/PrestaShop" title="Twitter">
        <i class="icon-twitter"></i>
      </a>
      <a class="link-social link-facebook _blank" href="https://www.facebook.com/prestashop" title="Facebook">
        <i class="icon-facebook"></i>
      </a>
      <a class="link-social link-github _blank" href="https://www.prestashop.com/github" title="Github">
        <i class="icon-github"></i>
      </a>
      <a class="link-social link-google _blank" href="https://plus.google.com/+prestashop/" title="Google">
        <i class="icon-google-plus"></i>
      </a>
    </div>
  </div>
  <div class="col-sm-5">
    <div class="footer-contact">
      <a href="http://www.prestashop.com/en/contact_us?utm_source=back-office&amp;utm_medium=footer&amp;utm_campaign=back-office-<?php echo mb_strtoupper($_smarty_tpl->tpl_vars['lang_iso']->value, 'UTF-8');?>
&amp;utm_content=<?php if ($_smarty_tpl->tpl_vars['host_mode']->value) {?>cloud<?php } else { ?>download<?php }?>" class="footer_link _blank">
        <i class="icon-envelope"></i>
        <?php echo smartyTranslate(array('s'=>'Contact'),$_smarty_tpl);?>

      </a>
      /&nbsp;
      <a href="http://forge.prestashop.com/?utm_source=back-office&amp;utm_medium=footer&amp;utm_campaign=back-office-<?php echo mb_strtoupper($_smarty_tpl->tpl_vars['lang_iso']->value, 'UTF-8');?>
&amp;utm_content=<?php if ($_smarty_tpl->tpl_vars['host_mode']->value) {?>cloud<?php } else { ?>download<?php }?>" class="footer_link _blank">
        <i class="icon-bug"></i>
        <?php echo smartyTranslate(array('s'=>'Bug Tracker'),$_smarty_tpl);?>

      </a>
      /&nbsp;
      <a href="http://www.prestashop.com/forums/?utm_source=back-office&amp;utm_medium=footer&amp;utm_campaign=back-office-<?php echo mb_strtoupper($_smarty_tpl->tpl_vars['lang_iso']->value, 'UTF-8');?>
&amp;utm_content=<?php if ($_smarty_tpl->tpl_vars['host_mode']->value) {?>cloud<?php } else { ?>download<?php }?>" class="footer_link _blank">
        <i class="icon-comments"></i>
        <?php echo smartyTranslate(array('s'=>'Forum'),$_smarty_tpl);?>

      </a>
      /&nbsp;
      <a href="http://addons.prestashop.com/?utm_source=back-office&amp;utm_medium=footer&amp;utm_campaign=back-office-<?php echo mb_strtoupper($_smarty_tpl->tpl_vars['lang_iso']->value, 'UTF-8');?>
&amp;utm_content=<?php if ($_smarty_tpl->tpl_vars['host_mode']->value) {?>cloud<?php } else { ?>download<?php }?>" class="footer_link _blank">
        <i class="icon-puzzle-piece"></i>
        <?php echo smartyTranslate(array('s'=>'Addons'),$_smarty_tpl);?>

      </a>
      /&nbsp;
      <a href="http://www.prestashop.com/en/training-prestashop?utm_source=back-office&amp;utm_medium=footer&amp;utm_campaign=back-office-<?php echo mb_strtoupper($_smarty_tpl->tpl_vars['lang_iso']->value, 'UTF-8');?>
&amp;utm_content=<?php if ($_smarty_tpl->tpl_vars['host_mode']->value) {?>cloud<?php } else { ?>download<?php }?>" class="footer_link _blank">
        <i class="icon-book"></i>
        <?php echo smartyTranslate(array('s'=>'Training'),$_smarty_tpl);?>

      </a>
      <?php if ($_smarty_tpl->tpl_vars['host_mode']->value) {?>
        /&nbsp;
        <a href="http://status.prestashop.com/" class="footer_link _blank">
          <i class="icon-circle status-page-dot"></i>
          <span class="status-page-description"></span>
        </a>
      <?php }?>
      <?php if ($_smarty_tpl->tpl_vars['iso_is_fr']->value&&!$_smarty_tpl->tpl_vars['host_mode']->value) {?>
        <p>Questions • Renseignements • Formations :
          <strong>+33 (0)1.40.18.30.04</strong>
        </p>
      <?php }?>
    </div>
  </div>

  <div class="col-sm-3">
    <?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['hook'][0][0]->smartyHook(array('h'=>"displayBackOfficeFooter"),$_smarty_tpl);?>

  </div>

  <div id="go-top" class="hide"><i class="icon-arrow-up"></i></div>
  -->
</div>
<?php }} ?>
