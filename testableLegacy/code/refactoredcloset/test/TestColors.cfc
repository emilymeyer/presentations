<cfcomponent extends="mxunit.framework.TestCase" output="false">
	
	<cffunction name="setup" access="public" returntype="any">
		<cfset componentPrefix = "refactoredcloset.cfc." />
    	<cfset shirt = createObject("component", "#componentPrefix#Shirt") />
    	<cfset jeans = createObject("component", "#componentPrefix#Jeans") />
    	<cfset shoes = createObject("component", "#componentPrefix#Shoes") />
    	<cfset color = createObject("component", "#componentPrefix#Colors") />
	</cffunction>
	
	<cffunction name="testGetColorsForShirt" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newShirtId = shirt.insertShirt(name="Test Shirt", type="1") />
			<cfset var shirtColors = shirt.addColors("5", "#newShirtID.id#") />
			<cfset var color = color.getColorsForClothes(id="#newShirtId.id#", typeName="Shirt") />
			<cftransaction action="rollback" />
		</cftransaction>
		
		<cfset assertEquals("Blue", color.Name) />
		
    </cffunction>
	
	<cffunction name="testGetColorsForJeans" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newJeansId = Jeans.insertJeans(name="Test Jeans", type="2") />
			<cfset var JeansColors = Jeans.addColors("5", "#newJeansID.id#") />
			<cfset var color = color.getColorsForClothes(id="#newJeansId.id#", typeName="Jeans") />
			<cftransaction action="rollback" />
		</cftransaction>
		
		<cfset assertEquals("Blue", color.Name) />
		
    </cffunction>
	
	<cffunction name="testGetColorsForShoes" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newshoesId = shoes.insertshoes(name="Test shoes", type="3") />
			<cfset var shoesColors = shoes.addColors("5,2", "#newshoesID.id#") />
			<cfset var color = color.getColorsForClothes(id="#newshoesId.id#", typeName="Shoes") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertTrue(ListFindNoCase(valueList(color.Name), "Blue")) />
		<cfset assertTrue(ListFindNoCase(valueList(color.Name), "Orange")) />
		<cfset assertFalse(ListFindNoCase(valueList(color.Name), "Yellow")) />
		<cfset assertFalse(ListFindNoCase(valueList(color.Name), "Purple")) />
    </cffunction>

</cfcomponent>