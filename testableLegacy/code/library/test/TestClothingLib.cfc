<cfcomponent displayname="TestClothingLib" extends="mxunit.framework.TestCase" output="false">
	
	<cffunction name="testGetClothingTypeShirt" output="false" access="public" returntype="void">
    	 <cfinclude template="../views/clothinglib.cfm" />
    	 <cfscript>
		    expected = "shirt";
		    actual = getClothingInfo();
		    assertEquals(expected,actual);
		 </cfscript>
    </cffunction>

    
    
</cfcomponent>