<cfcomponent displayname="Get Format">

	<cffunction name="get" access="public">
	
		<cfset var getFormat= ""/>
	
		<cfquery name="getFormat" datasource="#application.datasource#">
			SELECT Value, ID
			FROM Options
			WHERE Field = 'Format'
			AND Item = 'Film'
			ORDER BY Sort_Order asc
		</cfquery>
	
		<cfreturn getFormat />
		
	</cffunction>

</cfcomponent>