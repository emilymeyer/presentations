<cfcomponent extends="MXUnit.framework.TestCase" output="false">
	
	<cffunction name="setup" access="public" returntype="any">
    	<cfset shirt = createObject("component", "refactoredcloset.cfc.Shirt") />
	</cffunction>
	
	<cffunction name="testAddShirt" output="false" access="public" returntype="any">
		<cftransaction>
			<cfset var newShirtId = shirt.insertShirt(name="Test Shirt",  type="1") />
			<cfset var newShirt = shirt.getShirtByID(id="#newShirtId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals("Test Shirt", "#newShirt.Name#") />
		<cfset assertEquals("1", "#newShirt.type#") />
    </cffunction>
	
	<cffunction name="testAddColor" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newShirtId = shirt.insertShirt(name="Test Shirt",  type="1") />
			<cfset var shirtColors = shirt.addColors("5", "#newShirtID.id#") />
			<cfset var color = shirt.getShirtColor(shirt_id="#newShirtId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals("Blue", "#color.Name#") />
    </cffunction>

	<cffunction name="testRemoveColors" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newShirtId = shirt.insertShirt(name="Test Shirt",  type="1") />
			<cfset var shirtColors = shirt.addColors("5", "#newShirtID.id#") />
			<cfset shirt.addColors("5", "#newShirtID.id#") />
			<cfset shirt.removeColors(id="#newShirtId.id#") />
			<cfset var colors = shirt.getShirtColor(shirt_id="#newShirtId.id#") />

			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals(0, "#colors.recordcount#") />
    </cffunction>
	
	<cffunction name="testRemoveShirtFromCloset" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newShirtId = shirt.insertShirt(name="Test Shirt",  type="1") />
			<cfset shirt.removeShirtFromCloset(id="#newShirtId.id#") />
			<cfset var newShirt = shirt.getShirtByID(id="#newShirtId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals(0, "#newShirt.recordcount#") />
    </cffunction>
	   
</cfcomponent>