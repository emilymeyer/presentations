<cfquery name="getShirts" datasource="Clothes">
	select id, name
	from shirt
</cfquery>

<cfquery name="getJeans" datasource="Clothes">
	select id, name
	from jeans
</cfquery>

<cfquery name="getShoes" datasource="Clothes">
	select id, name
	from shoes
</cfquery>

<cfoutput>
<html>
<head>
<script type="text/javascript" src="#application.stuff#prototype.js"></script>
<script type="text/javascript">

	function checkOutfit() {
		var shirt = $$('input:checked[type="radio"][name="shirt"]').pluck('value');
		var jeans = $$('input:checked[type="radio"][name="jeans"]').pluck('value');
		var shoes = $$('input:checked[type="radio"][name="shoes"]').pluck('value');
		var pars = 'shirt_id='+shirt+'&jeans_id='+jeans+'&shoes_id='+shoes;
		var myAjax = new Ajax.Updater('outfitResponse', 'matcher.cfm', {
			method: 'get', 
			parameters: pars
		});
	}
</script>
</head> 
<body>
<table>
	<tr>
		<cfloop query="getShirts">
			<td>#getShirts.Name#</td>
			<td><input type="radio" name="shirt" id="shirt" value="#getShirts.id#" /></td>
		</cfloop>
	</tr>
</table>
<table>
	<tr>
		<cfloop query="getJeans">
			<td>#getJeans.Name#</td>
			<td><input type="radio" name="jeans" id="jeans" value="#getJeans.id#" /></td>
		</cfloop>
	</tr>
</table>
<table>
	<tr>
		<cfloop query="getShoes">
			<td>#getShoes.Name#</td>
			<td><input type="radio" name="shoes" id="shoes" value="#getShoes.id#" /></td>
		</cfloop>
	</tr>
</table>
<input type="button" name="button" value="button" onClick="checkOutfit();" />
<div id="outfitResponse">
</div>
</body>
</html>
</cfoutput>