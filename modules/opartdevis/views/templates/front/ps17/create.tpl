{**
* @category Prestashop
* CHEMIN : /modules/opartdevis/views/templates/front/ps17
* @category Module
* @author Olivier CLEMENCE <manit4c@gmail.com>
* @copyright  Op'art
* @license Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
**}
{extends file='page.tpl'}

{block name="page_content"}
<div class="content">
    <div class="row">
        <section id="center_column" class="span9">	
            {capture name=path}{l s='Create your quotation' mod='opartdevis'}{/capture}
            <center><h1>{l s='Create your quotation' mod='opartdevis'}</h1></center></br></br>
            {if isset($errors)}
                {include file='_partials/form-errors.tpl' errors=$errors}
            {/if}
            {if isset($cartEmpty) && $cartEmpty==true}
            <p>{l s='Your cart is empty, please add product into your cart before creating your quotation.' mod='opartdevis'}</p>
            {/if}
            {if $showForm}        
            <form action="{$link->getModuleLink('opartdevis', 'createquotation')|escape:'htmlall':'UTF-8'}" method="post" class="contact-form-box" enctype="multipart/form-data" id="opartDevisForm">
                <input type="hidden" name="idCart" value="{$id_cart|escape:'htmlall':'UTF-8'}" />
                <input type="hidden" name="quotationId" value="{$quotationId|escape:'htmlall':'UTF-8'}" />
                <input type="hidden" name="opart_devis_customer_id" id="opart_devis_customer_id" value="{$customerId|escape:'htmlall':'UTF-8'}"/>
                <!--<fieldset>-->
                <div class="container">
                    <h4>{l s='Products in your quotation' mod='opartdevis'}</h4>
                    <table class="table table-bordered stock-management-on" id="cart_summary">
                        <thead>
                        <tr>
                            <th>{l s='Product' mod='opartdevis'}</th>
                            <th><span class="OpartMaxWidthDevice">{l s='Availability' mod='opartdevis'}</span></th>
                            <th>{l s='Qty' mod='opartdevis'}</th>
                            <th>{l s='Unit price' mod='opartdevis'} {if $priceDisplay == 1}{l s='tax excl.' mod='opartdevis'}{else}{l s='tax incl.' mod='opartdevis'}{/if}</th>
                            <th>{l s='Total' mod='opartdevis'} {if $priceDisplay == 1}{l s='tax excl.' mod='opartdevis'}{else}{l s='tax incl.' mod='opartdevis'}{/if}</th>
                        </tr>
                        </thead>
                        {foreach $summary.products as $product}
                        {assign var='productId' value=$product.id_product}
                        {assign var='productAttributeId' value=$product.id_product_attribute}
                        {assign var='productIdAddressDelivery' value=$product.id_address_delivery}   
                        <tr>
                            <td>
                                {$product.name|escape:'htmlall':'UTF-8'}{if isset($product.attributes_small)} - {$product.attributes_small|escape:'htmlall':'UTF-8'}{/if}
                            </td>
                            <td>{if $product.quantity_available>0}{$product.available_now|escape:'htmlall':'UTF-8'}{else}{$product.available_later|escape:'htmlall':'UTF-8'}{/if}</td>
                            <td>{$product.cart_quantity|escape:'htmlall':'UTF-8'}</td>
                            {*<td>{if $priceDisplay == 1}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_wt}{/if}</td>
                            <td>{if $priceDisplay == 1}{convertPrice price=$product.total}{else}{convertPrice price=$product.total_wt}{/if}</td>*}
                            <td>{if $priceDisplay == 1}{Tools::displayPrice($product.price)|escape:'htmlall':'UTF-8'}{else}{Tools::displayPrice($product.price_wt)|escape:'htmlall':'UTF-8'}{/if}</td>
                            <td>{if $priceDisplay == 1}{Tools::displayPrice($product.total)|escape:'htmlall':'UTF-8'}{else}{Tools::displayPrice($product.total_wt)|escape:'htmlall':'UTF-8'}{/if}</td>
                        </tr>
                        {* customized data*}   
                                {if isset($customizedDatas.$productId.$productAttributeId.$productIdAddressDelivery)}
                                    {foreach $customizedDatas.$productId.$productAttributeId.$productIdAddressDelivery as $id_customization => $customization}
                                        {if $id_customization == $product.id_customization}
                                            <tr>
                                            <td colspan="5">
                                            {foreach $customization.datas as $type => $custom_data}
                                                {if $type == $CUSTOMIZE_FILE}
                                                    {foreach $custom_data as $picture}
                                                        <br />&nbsp; &nbsp;<img src="{$ps_base_url|escape:'htmlall':'UTF-8'}/upload/{$picture.value|escape:'htmlall':'UTF-8'}_small" alt="" />
                                                    {/foreach}
                                                {elseif $type == $CUSTOMIZE_TEXTFIELD}
                                                    {foreach $custom_data as $textField}
                                                        <br />&nbsp; &nbsp;
                                                        {if $textField.name}
                                                            {$textField.name|escape:'htmlall':'UTF-8'}
                                                        {else}
                                                            {l s='Text #' mod='opartdevis'}{$textField@index+1|escape:'htmlall':'UTF-8'}
                                                        {/if}
                                                        {l s=':' mod='opartdevis'} {$textField.value|escape:'htmlall':'UTF-8'}
                                                    {/foreach}
                                                {/if}
                                            {/foreach}
                                            </td>                                          
                                        </tr>
                                       {/if}
                                    {/foreach}
                                {/if}
                                
                        {* end customized data*}
                        {/foreach}
						<!-- discount -->
						{if sizeof($summary.discounts)}
							{foreach $summary.discounts as $discount}
								<tr class="cart_discount {if $discount@last}last_item{elseif $discount@first}first_item{else}item{/if}" id="cart_discount_{$discount.id_discount|escape:'htmlall':'UTF-8'}"><td colspan="2">{$discount.name|escape:'htmlall':'UTF-8'}</td>										
									<td>1</td>
									<td>
										<span class="price-discount">
										{if !$priceDisplay}{Tools::displayPrice($discount.value_real*-1)|escape:'htmlall':'UTF-8'}{else}{Tools::displayPrice($discount.value_tax_exc*-1)|escape:'htmlall':'UTF-8'}{/if}
										</span>
									</td>
									<td class="cart_discount_price">
										<span class="price-discount price">{if !$priceDisplay}{Tools::displayPrice($discount.value_real*-1)|escape:'htmlall':'UTF-8'}{else}{Tools::displayPrice($discount.value_tax_exc*-1)|escape:'htmlall':'UTF-8'}{/if}</span>
									</td>
								</tr>
							{/foreach}
						{/if}
                        <tfoot>
                        <tr class="cart_total_price">
                         <td colspan="4" class="text-right">{l s='Total' mod='opartdevis'} {l s='tax excl.' mod='opartdevis'}</td>
                         <td class="price" id="opartQuotationTotalQuotation">{Tools::displayPrice($summary.total_price_without_tax)|escape:'htmlall':'UTF-8'}</td>
                        </tr>
                        <!--									
                        <tr class="cart_total_price">
                         <td colspan="4" class="text-right">{l s='Total shipping' mod='opartdevis'} {if $priceDisplay==1}{l s='tax excl.' mod='opartdevis'}{/if}</td>
                         <td class="price" id="opartQuotationTotalShipping">{if $priceDisplay==1}{Tools::displayPrice($summary.total_shipping_tax_exc)|escape:'htmlall':'UTF-8'}{else}{Tools::displayPrice($summary.total_shipping)|escape:'htmlall':'UTF-8'}{/if}</td>
                        </tr>
                         -->
                        <tr class="cart_total_price">
                         <td colspan="4" class="text-right">{l s='Total tax' mod='opartdevis'}</td>
                         <td class="price" id="opartQuotationTotalTax">{Tools::displayPrice($summary.total_tax)|escape:'htmlall':'UTF-8'}</td>
                        </tr>
                        <tr class="cart_total_price">
                         <td colspan="4" class="total_price_container text-right">{l s='Total' mod='opartdevis'} {l s='tax incl.' mod='opartdevis'}</td>
                         <td class="price" id="total_price_container"><span id="opartQuotationTotalQuotationWithTax">{Tools::displayPrice($summary.total_price)|escape:'htmlall':'UTF-8'}</span></td>
                        </tr>
                        </tfoot>                        
                    </table>
                    <p class="opartDevisInfos">{l s='To edit your product list, open your cart and make your change.' mod='opartdevis'}<br />{l s='Then click again on the "create quotation" button.' mod='opartdevis'}</p>

                    <!-- Telephone -->

                        <div class="clearfix">
                        <div class="form-group opartDevisConteneurQuotationName">
                            <label for="quotation_name">{l s='Votre e-mail et numéro de téléphone : *' mod='opartdevis'}</label>
                            <input type="text" name="quotation_name" id="quotation_name" required="required" value="{$quotationName|escape:'htmlall':'UTF-8'}"/>


                        </div>
                    </div>


                    <!-- addresses -->
                    {if count($addresses)>0}
                    <div class="clearfix">
                        <h4>{l s='Choose your addresses' mod='opartdevis'}</h4>
                        <div class="form-group opartDevisConteneurTextarea">
                            <label for="delivery_address"> {l s='Delivery addresse' mod='opartdevis'}</label>
                            <select name="delivery_address" {if isset($summary)}onChange="opartDevisLoadCarrierList();"{/if} class="delivery_address">
                                {foreach $addresses as $address}
                                <option value="{$address.id_address|escape:'htmlall':'UTF-8'}" {if isset($summary) && $summary.delivery->id == $address.id_address}selected="selected"{/if}>{$address.firstname|escape:'htmlall':'UTF-8'} {$address.lastname|escape:'htmlall':'UTF-8'} - {$address.address1|escape:'htmlall':'UTF-8'}{if $address.address2!=""} {$address.address2|escape:'htmlall':'UTF-8'}{/if} - {$address.postcode|escape:'htmlall':'UTF-8'} {$address.city|escape:'htmlall':'UTF-8'}</option>
                                {/foreach}
                            </select>
                        </div>                        
                        <div class="form-group opartDevisConteneurTextarea">
                            <label for="invoice_address"> {l s='Invoice addresse' mod='opartdevis'}</label>
                            <select name="invoice_address" class="invoice_address">
                                {foreach $addresses as $address}
                                <option value="{$address.id_address|escape:'htmlall':'UTF-8'}" {if isset($summary) && $summary.invoice->id == $address.id_address}selected="selected"{/if}>{$address.firstname|escape:'htmlall':'UTF-8'} {$address.lastname|escape:'htmlall':'UTF-8'} - {$address.address1|escape:'htmlall':'UTF-8'}{if $address.address2!=""} {$address.address2|escape:'htmlall':'UTF-8'}{/if} - {$address.postcode|escape:'htmlall':'UTF-8'} {$address.city|escape:'htmlall':'UTF-8'}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    {else}
                    <p class="opartDevisInfos">{l s='We didn\'t found any addresses, please go to your personnal account and add addresses' mod='opartdevis'}</p>
                    {/if}
                    {if isset($summary)}
						{if $from!='payment'}
							<!-- TRANSPORTEUR EN COMMMENTAIRE !!!
							<div class="clearfix">
								<div class="form-group">
								<h4>{l s='Choose your carrier' mod='opartdevis'}</h4>                        
								<select id="opart_devis_carrier_input" name="opart_devis_carrier_input"></select>	
								</div>                        
								<input type="hidden" name="selected_carrier" value="{if isset($cart->id_carrier)}{$cart->id_carrier|escape:'htmlall':'UTF-8'}{/if}" id="selected_carrier" />
							</div>
                                                {else}
                                                    <input type="hidden" name="opart_devis_carrier_input" value="{if isset($cart->id_carrier)}{$cart->id_carrier|escape:'htmlall':'UTF-8'}{/if}" />                                                            
						{/if} -->
                    {/if}
                    <!-- messages -->
                    
                    <div class="clearfix">
                        <h4>{l s='Informations supplémentaires (Facultatif)' mod='opartdevis'}</h4>
                        <div class="form-group opartDevisConteneurTextarea">
                            <label for="message_not_visible">{l s='Laissez nous un message' mod='opartdevis'}</label>
                            <textarea class="form-control opartDevisTextArea" id="messageNotVisible" name="message_not_visible">{if isset($message_not_visible)}{$message_not_visible|escape:'htmlall':'UTF-8':'UTF-8'|stripslashes}{/if}</textarea>
                        </div>
                    </div>
                
                    <p class="cart_navigation clearfix">
                        <a href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}" class="btn btn-default button button-small">
                            <span><i class="icon-chevron-left"></i> {l s='Back to Your Account' mod='opartdevis'}</span>
                        </a>
                        <a href="{$base_dir|escape:'htmlall':'UTF-8'}" class="btn btn-default button button-small">
                            <span><i class="icon-chevron-left"></i> {l s='Home' mod='opartdevis'}</span>
                        </a>
                        <button type="submit" name="submitQuotation" id="submitMessage" class="button btn btn-default button-medium"><span><i class="icon-save"></i> {l s='Save and send your quotation' mod='opartdevis'}</span></button>
                    </p>
                </div>
                <!--</fieldset>     -->           
            </form>         
            {/if}
        </section>
    </div>
</div>
<script type="text/javascript">
    var opart_module_dir = "{$content_dir|escape:'htmlall':'UTF-8'}{$opart_module_dir|escape:'htmlall':'UTF-8'}";  
    opartDevisControllerUrl = "{$content_dir|escape:'htmlall':'UTF-8'}/index.php?fc=module&module=opartdevis&controller=createquotation";        
    priceDisplay = {$priceDisplay|escape:'htmlall':'UTF-8'};
    currency_format = '{$currency->format|escape:'htmlall':'UTF-8'}';
    currency_sign = '{$currency->sign|escape:'htmlall':'UTF-8'}';
    currency_blank = {$currency->blank|escape:'htmlall':'UTF-8'};
</script>
{/block}