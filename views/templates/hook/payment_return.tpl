{if $state == '2'}
        <p>{l s='Your order on %s is complete.' sprintf=$shop_name mod='smartex'}
                <br /><br /> <strong>{l s='Your order will be sent as soon as your payment is confirmed by the Ethereum network.' mod='smartex'}</strong>
                <br /><br />{l s='If you have questions, comments or concerns, please contact our' mod='smartex'} <a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='expert customer support team. ' mod='smartex'}</a>
        </p>
{else}
      	<p class="warning">
                {l s="We noticed a problem with your order. If you think this is an error, feel free to contact our" mod='smartex'}
                <a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='expert customer support team. ' mod='smartex'}</a>.
        </p>
{/if}
