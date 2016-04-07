<cfcomponent displayname="Shoes" output="false">
	
	<cffunction name="createShoes" output="false" access="public" returntype="any">
    	
    	<cfargument name="name" required="true" />
    	<cfargument name="type" required="true" />
    	
		<cfset var insertshoes="" />
		
    	<cfquery name="insertshoes" datasource="Clothes">
			insert into shoes (name, type)
			values (
				<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.type#" cfsqltype="cf_sql_integer" />
			)
			
			SELECT IDENT_CURRENT('shoes') as ID
	    </cfquery>
		
		<cfreturn insertshoes />
    
	</cffunction>
    
</cfcomponent>