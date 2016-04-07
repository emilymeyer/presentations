<cfcomponent name="TestMatcher" extends="MXUnit.framework.TestCase" output="false">

	<cffunction name="setup" access="public" returntype="any">
        <cfset matcher = createObject("component", "actionpage.cfc.Matcher") />
    </cffunction>
	
   
</cfcomponent>