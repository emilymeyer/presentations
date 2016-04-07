<cfcomponent>

	<cffunction name="get" access="public">
	
		<cfset var getTypes = ""/>
	
		<cfquery name="getTypes" datasource="#application.datasource#">
			SELECT Value, ID
			FROM Options
			WHERE Field = 'Type'
			AND Item = 'Film'
			ORDER BY Sort_Order asc
		</cfquery>
	
		<cfreturn getTypes />
		
	</cffunction>

</cfcomponent>