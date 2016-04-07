<cfcomponent>

	<cffunction name="get" access="public">
	
		<cfset var getGenre = ""/>
	
		<cfquery name="getGenre" datasource="#application.datasource#">
			SELECT Value, ID
			FROM Options
			WHERE Field = 'Genre'
			AND Item = 'Film'
			ORDER BY Sort_Order asc
		</cfquery>
	
		<cfreturn getGenre />
		
	</cffunction>
	
</cfcomponent>