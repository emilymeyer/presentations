<cfoutput>
	<cfquery name="getShirtColor" datasource="Clothes">
		select Color.Name, Color.id
		from shirt_color_bridge
		inner join color on shirt_color_bridge.color_id = color.id
		where shirt_color_bridge.shirt_id = '#shirt#'
	</cfquery>

	<cfset shirtColors = ValueList(getShirtColor.Name) />
	<cfset matches = ""/>

	<cfloop list="#shirtColors#" index="color">
		<cfset allMatchesForColor =  evaluate("#color#_MATCHES") />
		<cfset matches = ListAppend(matches, "#allMatchesForColor#", ",") />
	</cfloop>

	<!--- Get Unique matches for the shirt color --->
	<cfset matchStruct = StructNew() />
	<cfloop list="#matches#" index="match">
		<cfset matchStruct[match] = "" />
	</cfloop>

	<cfset allShirtMatches = "#StructKeyList(matchStruct)#">
	<cfquery name="getShoesColor" datasource="Clothes">
		select Color.Name, Color.id
		from shoes_color_bridge
		inner join color on shoes_color_bridge.color_id = color.id
		where shoes_color_bridge.shoes_id = <cfqueryparam value="#shoes#" cfsqltype="cf_sql_integer" />
	</cfquery>

	<!--- Get Unique matches for the shoes colors --->
	<cfset shoesColors ="#ValueList(getShoesColor.Name)#" />
	<cfset matches = ""/>
	<cfloop list="#shoesColors#" index="color">
		<cfset allMatchesForColor =  evaluate("#color#_MATCHES") />
		<cfset matches = ListAppend(matches, "#allMatchesForColor#", ",") />
	</cfloop>

	<cfset matchStruct = StructNew() />
	<cfloop list="#matches#" index="match">
		<cfset matchStruct[match] = "" />
	</cfloop>
	
	<cfset allShoesMatches = "#StructKeyList(matchStruct)#">
	<!--- Make sure none of the shoe colors clash with the shirt colors --->
	<cfset clash = 0 />
	
	<cfloop list="#trim(shirtColors)#" index="color">
		<cfif ListFindNoCase(allShoesMatches, color) lte 0>
			<cfset clash = 1 />
		</cfif>
	</cfloop>

	<!---Give feedback to the user--->
	<cfif clash eq 1>
		<cfset message = "Potential Clash!" />
	<cfelse>
		<cfset message = "Nice Outfit!" />
	</cfif>
	#message#
</cfoutput>