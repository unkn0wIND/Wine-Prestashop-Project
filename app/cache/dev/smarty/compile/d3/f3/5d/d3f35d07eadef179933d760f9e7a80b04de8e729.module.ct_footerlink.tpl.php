<?php /* Smarty version Smarty-3.1.19, created on 2017-11-30 12:49:43
         compiled from "module:ct_footerlink/views/templates/hook/ct_footerlink.tpl" */ ?>
<?php /*%%SmartyHeaderCode:92509565a1ff0578c8f08-02453952%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd3f35d07eadef179933d760f9e7a80b04de8e729' => 
    array (
      0 => 'module:ct_footerlink/views/templates/hook/ct_footerlink.tpl',
      1 => 1512035577,
      2 => 'module',
    ),
  ),
  'nocache_hash' => '92509565a1ff0578c8f08-02453952',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'ct_footerlink_links' => 0,
    'lang' => 0,
    'ct_footerlink_link' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_5a1ff0578cdbd1_49222293',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5a1ff0578cdbd1_49222293')) {function content_5a1ff0578cdbd1_49222293($_smarty_tpl) {?><!-- begin /homepages/15/d701691074/htdocs/modules/ct_footerlink/views/templates/hook/ct_footerlink.tpl -->

<!-- Block links module -->
<div id="links_block_footer" class="block links">
	
	
	<ul id="ct_footerlink" class="block_content ">
	<?php  $_smarty_tpl->tpl_vars['ct_footerlink_link'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ct_footerlink_link']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['ct_footerlink_links']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['ct_footerlink_link']->key => $_smarty_tpl->tpl_vars['ct_footerlink_link']->value) {
$_smarty_tpl->tpl_vars['ct_footerlink_link']->_loop = true;
?>
		<?php if (isset($_smarty_tpl->tpl_vars['ct_footerlink_link']->value[$_smarty_tpl->tpl_vars['lang']->value])) {?> 
			<li>
				<a href="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ct_footerlink_link']->value['url'], ENT_QUOTES, 'UTF-8');?>
" title="<?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ct_footerlink_link']->value[$_smarty_tpl->tpl_vars['lang']->value], ENT_QUOTES, 'UTF-8');?>
" <?php if ($_smarty_tpl->tpl_vars['ct_footerlink_link']->value['newWindow']) {?> onclick="window.open(this.href);return false;"<?php }?>><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['ct_footerlink_link']->value[$_smarty_tpl->tpl_vars['lang']->value], ENT_QUOTES, 'UTF-8');?>
</a></li>
		<?php }?>
	<?php } ?>
	</ul>
</div>
<!-- /Block links module -->
<!-- end /homepages/15/d701691074/htdocs/modules/ct_footerlink/views/templates/hook/ct_footerlink.tpl --><?php }} ?>
