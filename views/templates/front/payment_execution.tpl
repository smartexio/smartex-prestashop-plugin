{capture name=path}{l s='Ethereum payment.' mod='smartex'}{/capture}

{include file="$tpl_dir./breadcrumb.tpl"}

<h2>{l s='Order summary' mod='smartex'}</h2>

{assign var='current_step' value='payment'}

{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.' mod='smartex'}</p>
{else}

<h3>{l s='Ether payment.' mod='smartex'}</h3>

<form action="{$link->getModuleLink('smartex', 'validation', [], true)|escape:'html'}" method="post">
<p>
	<img src="{$this_path}ethereum.png" alt="{l s='Pay with Smartex' mod='smartex'}" style="float:left; margin: 0px 10px 5px 0px;" />
	{l s='You have chosen to pay by Ethereum.' mod='smartex'}
	<br/><br />
	{l s='Here is a short summary of your order:' mod='smartex'}
</p>
<p style="margin-top:20px;">
	- {l s='The total amount of your order is' mod='smartex'}
	<span id="amount" class="price">{displayPrice price=$total}</span>
	{if $use_taxes == 1}
    	{l s='(tax incl.)' mod='smartex'}
    {/if}
</p>
<p>
	{l s='Your Ethereum invoice will be displayed on the next page.' mod='smartex'}
	<br /><br />
	<b>{l s='Please confirm your order by clicking "I confirm my order."' mod='smartex'}.</b>
</p>
<p class="cart_navigation" id="cart_navigation">
	<input type="submit" value="{l s='I confirm my order' mod='smartex'}" class="exclusive_large" />
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Ethereum Payments' mod='smartex'}</a>
</p>
</form>
{/if}

