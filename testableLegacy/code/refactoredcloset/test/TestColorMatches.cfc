<cfcomponent displayname="TestColorMatches" extends="mxunit.framework.TestCase" output="false">
	
	<cffunction name="setup" access="public" returntype="any">
	    <cfset colorMatches = new refactoredcloset.cfc.ColorMatches() />
	</cffunction>
	
	<cffunction name="testBlue" access="public" returntype="void">
	  <cfscript>
	    var expected = "purple, blue";
	    var actual = colorMatches.getMatchesByColorName("Blue");
	    assertEquals(expected,actual);
	   </cfscript>
   </cffunction>
   
   <cffunction name="testLightBlue" access="public" returntype="void" >
   	<cfscript>
   		var expected = "";
		var actual = colorMatches.getMatchesByColorName("Light Blue");
		assertEquals(expected, actual);
   	</cfscript>
   </cffunction>
   
	<cffunction name="testPurple" access="public" returntype="void">
	  <cfscript>
	    var expected = "blue, purple";
	    var actual = colorMatches.getMatchesByColorName("Purple");
	    assertEquals(expected,actual);
	   </cfscript>
   </cffunction>
	
	<cffunction name="testYellow" access="public" returntype="void">
	  <cfscript>
	    var expected = "yellow";
	    actual = colorMatches.getMatchesByColorName("Yellow");
	    assertEquals(expected,actual);
	   </cfscript>
   </cffunction>
   
	<cffunction name="testGreen" access="public" returntype="void">
	  <cfscript>
	    var expected = "blue, green";
	    var actual = colorMatches.getMatchesByColorName("Green");
	    assertEquals(expected,actual);
	   </cfscript>
   </cffunction>
	
	<cffunction name="testOrange" access="public" returntype="void">
	  <cfscript>
	    var expected = "red, orange, yellow";
	    var actual = colorMatches.getMatchesByColorName("Orange");
	    assertEquals(expected,actual);
	   </cfscript>
   </cffunction>
	
	<cffunction name="testBlackhasNoMatches" access="public" returntype="void">
	  <cfscript>
	    var expected = "";
	    var actual = colorMatches.getMatchesByColorName("Black");
	    assertEquals(expected,actual);
	   </cfscript>
   </cffunction>
	
</cfcomponent>