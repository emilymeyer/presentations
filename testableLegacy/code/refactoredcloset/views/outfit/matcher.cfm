<cfimport path="refactoredcloset.cfc.Matcher"/>

<cfsilent>
	<cfset Shirt = createObject("component", "#application.componentPrefix#Shirt") />
	<cfset Shoes = createObject("component", "#application.componentPrefix#Shoes") />
	<cfset Matcher = new Matcher() />
</cfsilent>

<cfoutput>
<cfset getShirtColor = Shirt.getShirtColor(shirt_id="#shirt_id#") />
<cfset shirtColors = getShirtColor.Name />

<cfset allShirtMatches = Matcher.getMatchesForShirt("#shirtColors#") />

<cfset getShoesColor = Shoes.getShoesColors('#shoes_id#') />
<cfset shoesColors ="#ValueList(getShoesColor.Name)#" />

<cfset allShoesMatches = Matcher.getMatchesForShoes("#shoesColors#") />

<cfdump var = "#Matcher.checkClash(allShoesMatches,shirtColors)#" />

</cfoutput>