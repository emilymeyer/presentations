<cfcomponent displayname="TestMatcher" hint="Tests the Matcher Functionality" extends="mxunit.framework.TestCase" output="false">
	
	<cffunction name="setup" access="public" returntype="any">
	    <cfset matcher = new refactoredCloset.cfc.Matcher() />
	</cffunction>
	
	<cffunction name="testGetShirtMatchesOneColor" access="public" returntype="void">
		<cfscript>
	    	actual = matcher.getMatchesForShirt("Blue");
	   		assert(ListFindNoCase(actual, "purple"));
	    	assert(ListFindNoCase(actual, "blue"));
		</cfscript>
    </cffunction>
   
	<cffunction name="testGetShoesMatches" access="public" returntype="void">
		<cfscript>
	    	var actual = matcher.getMatchesForShoes("Blue,Yellow");
	   		assert(ListFindNoCase(actual, "purple"));
	   		assert(ListFindNoCase(actual, "blue"));
	   		assert(ListFindNoCase(actual, "yellow"));
		</cfscript>
	</cffunction>
	
	<cffunction name="testClash" output="false" access="public" returntype="any">
    	<cfscript>
			var allShoesMatches = "purple,red,green";
			var shirtMatches = "yellow";
			var actual = matcher.checkClash(allShoesMatches, shirtMatches);
			assertEquals("Potential Clash!", actual);    		
    	</cfscript>
    </cffunction>

	<cffunction name="testMatch" output="false" access="public" returntype="any">
    	<cfscript>
			var allShoesMatches = "purple,red,green,blue";
			var shirtMatches = "blue";
			var actual = matcher.checkClash(allShoesMatches, shirtMatches);
			assertEquals("Nice Outfit!", actual);    		
    	</cfscript>
    </cffunction>
    
</cfcomponent>