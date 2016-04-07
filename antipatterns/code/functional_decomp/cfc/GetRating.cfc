<cfcomponent>

	<cffunction name="get" access="public">
	
		<cfset var getRatings = ""/>
	
		<cfquery name="getRatings" datasource="#application.datasource#">
			SELECT Value, ID
			FROM Options
			WHERE Field = 'Rating'
			AND Item = 'Film'
			ORDER BY Sort_Order asc
		</cfquery>
	
		<cfreturn getRatings />
		
	</cffunction>

</cfcomponent>