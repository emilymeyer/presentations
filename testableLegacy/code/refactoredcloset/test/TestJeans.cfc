<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="any">
    	<cfset jeans = createObject("component", "refactoredcloset.cfc.Jeans") />
	</cffunction>
	
	<cffunction name="testAddJeans" output="false" access="public" returntype="any">
		<cftransaction>
			<cfset var newjeansId = jeans.insertjeans(name="Test jeans", type="2") />
			<cfset var newjeans = jeans.getjeansByID(id="#newjeansId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals("Test jeans", "#newjeans.Name#") />
		<cfset assertEquals("2", "#newjeans.type#") />
    </cffunction>
	
	<cffunction name="testAddColor" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newjeansId = jeans.insertjeans(name="Test jeans", type="2") />
			<cfset var jeansColors = jeans.addColors("5", "#newjeansID.id#") />
			<cfset var color = jeans.getjeansColor(jeans_id="#newjeansId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals("Blue", "#color.Name#") />
    </cffunction>

	<cffunction name="testRemoveColors" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newjeansId = jeans.insertjeans(name="Test jeans", type="2") />
			<cfset var jeansColors = jeans.addColors("2", "#newjeansID.id#") />
			<cfset jeans.addColors("2", "#newjeansID.id#") />
			<cfset jeans.removeColors(id="#newjeansId.id#") />
			<cfset colors = jeans.getjeansColor(jeans_id="#newjeansId.id#") />

			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals(0, "#colors.recordcount#") />
    </cffunction>
	
	<cffunction name="testRemovejeansFromCloset" output="false" access="public" returntype="void">
    	<cftransaction>
			<cfset var newjeansId = jeans.insertjeans(name="Test jeans", type="2") />
			<cfset jeans.removejeansFromCloset(id="#newjeansId.id#") />
			<cfset var newjeans = jeans.getjeansByID(id="#newjeansId.id#") />
			<cftransaction action="rollback" />
		</cftransaction>
		<cfset assertEquals(0, "#newjeans.recordcount#") />
    </cffunction>
</cfcomponent>