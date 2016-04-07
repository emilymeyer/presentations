<cfparam name="id" default=""/>
<cfparam name="type" default=""/>

<cfsilent>
	<cfset Jeans = createObject("component", "#application.componentPrefix#Jeans")/>
	<cfset Shirt = createObject("component", "#application.componentPrefix#Shirt")/>
	<cfset Shoes = createObject("component", "#application.componentPrefix#Shoes")/>
	<cfset Clothing = createObject("component", "#application.componentPrefix#Clothing")/>
</cfsilent>

<cfset clothingType = Clothing.getClothingTypeName(typeID="#type#") />

<cfif clothingType eq "jeans">
	<cfset Jeans.removeColors(id="#id#") />
	<cfset Jeans.removeJeansFromCloset(id="#id#")/>
<cfelseif clothingType eq "shirt">
	<cfset Shirt.removeColors(id="#id#") />
	<cfset Shirt.removeShirtFromCloset(id="#id#")/>
<cfelseif clothingType eq "shoes">
	<cfset Shoes.removeColors(id="#id#") />
	<cfset Shoes.removeShoesFromCloset(id="#id#")/>
</cfif>

<cflocation url="clotheslist.cfm" />