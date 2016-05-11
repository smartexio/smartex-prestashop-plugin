<fieldset style="width: 140px; margin-right: 300px;">

<legend>

     {l s='Smartex Information' mod='smartex'}

</legend>

<div id="info">
	<table>
	<tr>
		<td align="left" valign="top">{l s='Invoice:' mod='smartex'}</td>
		<td><a href="{$smartexurl}/invoice?id={$invoice_id}" title="" target="_blank">Open</a></td>
	</tr>
	<tr>
		<td align="left" valign="top">{l s='Status:' mod='smartex'}</td>
		<td>{$status}</td>
	</tr>
	</table>
</div>

</fieldset>
