<cfquery name="getShirts" datasource="Clothes">
	select id, name, type
	from shirt
</cfquery>

<cfquery name="getJeans" datasource="Clothes">
	select id, name, type 
	from jeans
</cfquery>

<cfquery name="getShoes" datasource="Clothes">
	select id, name, type
	from shoes
</cfquery>

<link rel="stylesheet" type="text/css" href="../../stuff/styles.css" />

<cfoutput>
<body>
<table>
<tr><td class="header" colspan="4">Shirts</td></tr>
<tr>
	<td class="subHeader">Name</td>
	<td class="subHeader">Colors</td>
	<td class="subHeader" colspan="2">Remove</td>
</tr>
<cfloop query="getShirts">
	<cfquery name="getShirtColors" datasource="Clothes">
    	select color.*
		from shirt_color_bridge
		inner join color on shirt_color_bridge.color_id = color.id
		where shirt_color_bridge.shirt_id = <cfqueryparam value="#getShirts.id#" cfsqltype="cf_sql_integer" />
	</cfquery>
    
	<tr>
		<td>#getShirts.Name#</td>
		<td>#ValueList(getShirtColors.Name)#</td>
		<td><a href="deleteclothes.cfm?id=#getShirts.id#&type=#getShirts.type#">Delete</a></td>
		<td><a href="clothesform.cfm?id=#getShirts.id#&type=#getShirts.type#">Edit</a></td>
	</tr>
</cfloop>
</table>
</cfoutput>

<cfoutput>
<table>
<tr><td class="header" colspan="4">Jeans</td></tr>
<tr>
	<td class="subHeader">Name</td>
	<td class="subHeader">Colors</td>
	<td class="subHeader" colspan="2">Remove</td>
</tr>
<cfloop query="getJeans">
	<cfquery name="getJeansColors" datasource="Clothes">
    	select color.*
		from jeans_color_bridge
		inner join color on jeans_color_bridge.color_id = color.id
		where jeans_color_bridge.jeans_id = <cfqueryparam value="#getJeans.id#" cfsqltype="cf_sql_integer" />
	</cfquery>
	
	<tr>
		<td>#getJeans.Name#</td>
		<td>#ValueList(getJeansColors.Name)#</td>
		<td><a href="deleteclothes.cfm?id=#getJeans.id#&type=#getJeans.type#">Delete</a></td>
		<td><a href="clothesform.cfm?id=#getJeans.id#&type=#getJeans.type#">Edit</a></td>
	</tr>
</cfloop>
</table>
</cfoutput>

<cfoutput>
<table>
<tr><td class="header" colspan="4">Shoes</td></tr>
<tr>
	<td class="subHeader">Name</td>
	<td class="subHeader">Colors</td>
	<td class="subHeader" colspan="2">Remove</td>
</tr>
<cfloop query="getShoes">
	<cfquery name="getShoesColors" datasource="Clothes">
    	select color.*
		from shoes_color_bridge
		inner join color on shoes_color_bridge.color_id = color.id
		where shoes_color_bridge.shoes_id = <cfqueryparam value="#getShoes.id#" cfsqltype="cf_sql_integer" />
	</cfquery>
	
	<tr>
		<td>#getShoes.Name#</td>
		<td>#ValueList(getShoesColors.Name)#</td>
		<td><a href="deleteclothes.cfm?id=#getShoes.id#&type=#getShoes.type#">Delete</a></td>
		<td><a href="clothesform.cfm?id=#getShoes.id#&type=#getShoes.type#">Edit</a></td>
	</tr>
</cfloop>
</table>
</body>
</cfoutput>
<a href="clothesform.cfm">Add Clothing</a>
