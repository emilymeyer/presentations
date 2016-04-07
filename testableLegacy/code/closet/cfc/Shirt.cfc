<cfcomponent>
	<cffunction name="insertShirt" output="false" access="public" returntype="any">
    		<cfargument name="name" required="true" default="" />
    		<cfargument name="type" required="true" default="" />
    		
    		<cfset var insertShirt = "" />
    		
    		<cfquery name="insertShirt" datasource="Clothes">
    			insert into shirt (name, type)
    			values (
    				<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" />,
    				<cfqueryparam value="#arguments.type#" cfsqltype="cf_sql_integer" />
    			)
    			
    			SELECT IDENT_CURRENT('shirt') as ID
    	    </cfquery>
    		
    		<cfreturn insertShirt/>
    	</cffunction>

	
	
</cfcomponent>