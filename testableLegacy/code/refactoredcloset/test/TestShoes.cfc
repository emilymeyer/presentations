<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="any">
    	<cfset shoes = createObject("component", "refactoredcloset.cfc.shoes") />
	</cffunction>
	
	<cffunction name="testAddshoes" output="false" access="public" returntype="any">
		<cftransaction>
			<cfset var newshoesId = shoes.insertshoes(name="Test shoes",  type="3") />
			<cfset var newshoes = shoes.getshoesByID(id="#newshoesId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals("Test shoes", "#newshoes.Name#") />
		<cfset assertEquals("3", "#newshoes.type#") />
    </cffunction>
	
	<cffunction name="testAddColor" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newshoesId = shoes.insertshoes(name="Test shoes",  type="3") />
			<cfset var shoesColors = shoes.addColors("5", "#newshoesID.id#") />
			<cfset var color = shoes.getShoesColors(shoes_id="#newshoesId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals("Blue", "#color.Name#") />
    </cffunction>
	
	<cffunction name="testAddMultipleColor" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newshoesId = shoes.insertshoes(name="Test shoes", type="3") />
			<cfset var shoesColors = shoes.addColors("5,2", "#newshoesID.id#") />
			<cfset var color = shoes.getShoesColors(shoes_id="#newshoesId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertTrue(ListFindNoCase(valueList(color.Name), "Blue")) />
		<cfset assertTrue(ListFindNoCase(valueList(color.Name), "Orange")) />
		<cfset assertFalse(ListFindNoCase(valueList(color.Name), "Yellow")) />
		<cfset assertFalse(ListFindNoCase(valueList(color.Name), "Purple")) />
    </cffunction>

	<cffunction name="testRemoveColors" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newshoesId = shoes.insertshoes(name="Test shoes", type="3") />
			<cfset var shoesColors = shoes.addColors("5", "#newshoesID.id#") />
			<cfset shoes.addColors("5", "#newshoesID.id#") />
			<cfset shoes.removeColors(id="#newshoesId.id#") />
			<cfset var colors = shoes.getShoesColors(shoes_id="#newshoesId.id#") />

			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals(0, "#colors.recordcount#") />
    </cffunction>
	
	<cffunction name="testRemoveshoesFromCloset" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newshoesId = shoes.insertshoes(name="Test shoes", type="3") />
			<cfset shoes.removeshoesFromCloset(id="#newshoesId.id#") />
			<cfset var newshoes = shoes.getshoesByID(id="#newshoesId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals(0, "#newshoes.recordcount#") />
    </cffunction>
</cfcomponent>