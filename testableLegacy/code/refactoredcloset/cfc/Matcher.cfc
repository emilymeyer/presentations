<cfcomponent name="Matcher" output="false">
	
	<cffunction name="init" output="false" access="public" returntype="Matcher">
		<cfset variables.ColorMatches = New refactoredcloset.cfc.ColorMatches() />
		<cfreturn this />
    </cffunction>
    
	<cffunction name="getMatchesForShirt" output="false" access="public" returntype="any">
		<cfargument name="colorName" required="false" default=""/>
		
		<cfset var allMatchesForColor =  variables.ColorMatches.getMatchesByColorName("#arguments.colorName#") />
		<cfset var matchStruct = StructNew() />
		<cfset var match = "" />
		
		<cfloop list="#allMatchesForColor#" index="match">
			<cfset matchStruct[trim(match)] = "" />
		</cfloop>

		<cfreturn "#StructKeyList(matchStruct)#" />
		
    </cffunction>
	
	<cffunction name="getMatchesForShoes" access="public" returntype="any">
		<cfargument name="colorName" default="" />
		
		<cfset var matchStruct = StructNew() />
		<cfset var allMatchesForColor = "" />
		<cfset var color = "" />
		<cfset var matches = "" />
		<cfset var match = "" />
		
		<cfloop list="#arguments.colorName#" index="color">
			<cfset matches = variables.ColorMatches.getMatchesByColorName("#trim(color)#") />
			<cfset allMatchesForColor = ListAppend(allMatchesForColor, "#matches#", ",") />
		</cfloop>
		
		<cfloop list="#allMatchesForColor#" index="match">
			<cfset matchStruct[trim(match)] = "" />
		</cfloop>
		
		<cfreturn "#StructKeyList(matchStruct)#">

    </cffunction>
    
	<cffunction name="checkClash" output="false" access="public" returntype="any">
		<cfargument name="allShoesMatches" default="" />
		<cfargument name="shirtColors" default="" />
		
		<cfset var message = "" />
		
		<cfif ListFindNoCase(arguments.allShoesMatches, trim(arguments.shirtColors)) lte 0>
			<cfset message = "Potential Clash!" />
		<cfelse>
			<cfset message = "Nice Outfit!" />
		</cfif>
		
		<cfreturn message />		
	</cffunction>
	
</cfcomponent>