<cfcomponent output="false"  extends="mxunit.framework.TestCase">
    	
	<cffunction name="testClothingTypeNameShirt" output="false" access="public" returntype="void">
    	<cfinclude template="../views/clothingtype.cfm" />
		
		<cfset expected = "shirt" />
		<cfset actual = getClothingTypeName() />
		
		<cfset assertEquals(expected, actual) />		
	</cffunction>

</cfcomponent>