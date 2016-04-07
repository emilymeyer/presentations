<cfcomponent displayname="TestClothingLib" extends="mxunit.framework.TestCase" output="false">
	
	<cffunction name="setup" output="false" access="public" returntype="any">
		<cfset libraryRoot = "/refactoredcloset/libraries/" />
    </cffunction>
    
	
	<cffunction name="testGetClothingTypeShirt" output="false" access="public" returntype="void">
    	 <cfinclude template="#libraryRoot#clothinglib.cfm" />
    	 <cfscript>
		    expected = "shirt";
		    actual = getClothingTypeName('1');
		    assertEquals(expected,actual);
		 </cfscript>
    </cffunction>
    
</cfcomponent>