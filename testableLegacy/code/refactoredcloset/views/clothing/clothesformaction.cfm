<cfsilent>
	<cfset Clothing = createObject("component", "#application.ComponentPrefix#clothing") />
	<cfset Jeans = createObject("component", "#application.ComponentPrefix#jeans") />
	<cfset Shirt = createObject("component", "#application.ComponentPrefix#shirt") />
	<cfset Shoes = createObject("component", "#application.ComponentPrefix#shoes") />
</cfsilent>

<cfset clothingType = Clothing.getClothingTypeName(typeid=form.type) />

<cfif clothingType eq "jeans">
	<cfset jeansID = Jeans.insertJeans(name=form.name, type=form.type).id />
	<cfset Jeans.addColors(colors=form.colors, jeansID = jeansID)/>	
<cfelseif clothingType eq "shirt">
	<cfset shirtID = Shirt.insertShirt(name=form.name, type=form.type).id />		
	<cfset Shirt.addColors(colors=form.colors, shirtID = shirtID) />
<cfelseif clothingType eq "shoes">
	<cfset shoesID = Shoes.insertShoes(name=form.name, type=form.type).id />
	<cfset Shoes.addColors(colors=form.colors, shoesID = shoesID) />
</cfif>

<cflocation url="clotheslist.cfm" />