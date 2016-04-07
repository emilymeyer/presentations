<cfquery name="getShirts" datasource="Clothes">
	select shirt.id, shirt.name as name, shirt.type
	from shirt
</cfquery>

<cfquery name="getJeans" datasource="Clothes">
	select * 
	from jeans
</cfquery>

<cfquery name="getShoes" datasource="Clothes">
	select * 
	from shoes
</cfquery>

<link rel="stylesheet" type="text/css" href="../../stuff/styles.css" />

<cfoutput>
<table>
<th>Shirts</th>
<tr>
	<td>Name</td>
	<td>Colors</td>
	<td>Remove</td>
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
		<td><a href="clothesform.cfm?clothingID=#getShirts.id#&type=#getShirts.type#">Edit</a></td>
	</tr>
</cfloop>
</table>
</cfoutput>

<cfoutput>
<table>
<th>Jeans</th>
<tr>
	<td>Name</td>
	<td>Colors</td>
	<td>Remove</td>
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
<th>Shoes</th>
<tr>
	<td>Name</td>
	<td>Colors</td>
	<td>Remove</td>
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
</cfoutput>
<a href="clothesform.cfm">Add Clothing</a>
