<cfcomponent>

	<cffunction name="get" access="public" >
		<cfargument name="Field" required="true" />
		<cfargument name="item" required="true" />
		
		<cfset var getOptions = ""/>
	
		<cfquery name="getOptions" datasource="#application.datasource#">
			SELECT Value, ID
			FROM Options
			WHERE Field = <cfqueryparam value="#arguments.Field#" cfsqltype="cf_sql_varchar" />
			AND Item = <cfqueryparam value="#arguments.item#" cfsqltype="cf_sql_varchar" />
			ORDER BY Sort_Order asc
		</cfquery>
	
		<cfreturn getOptions />
	
	</cffunction>

</cfcomponent>