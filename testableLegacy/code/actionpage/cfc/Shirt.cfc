<cfcomponent displayname="Shirt" output="false">
	
	<cffunction name="getShirtColor" output="false" access="public" returntype="query">
    	<cfargument name="shirt" type="string" required="true" />

		<cfset var getShirtColor = ""/>
		
    	<cfquery name="getShirtColor" datasource="Clothes">
			select Color.Name, Color.id
			from shirt_color_bridge
			inner join color on shirt_color_bridge.color_id = color.id
			where shirt_color_bridge.shirt_id = <cfqueryparam value="#arguments.shirt#" cfsqltype="cf_sql_idstamp" />
		</cfquery>
    	
		<cfreturn getShirtColor />
		
    </cffunction>
    
</cfcomponent>