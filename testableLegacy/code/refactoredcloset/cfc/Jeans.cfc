<cfcomponent name="Jeans" output="false">
	
	<cffunction name="insertJeans" output="false" access="public" returntype="any">
		<cfargument name="name" required="true" default="" />
		<cfargument name="type" required="true" default="" />
		
		<cfset var insertjeans = "" />
		
		<cfquery name="insertjeans" datasource="Clothes">
			insert into jeans (name, type)
			values (
				<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.type#" cfsqltype="cf_sql_integer" />
			)
	
			SELECT IDENT_CURRENT('jeans') as ID
	    </cfquery>
	
		<cfreturn insertjeans />
	</cffunction>
	
	<cffunction name="addColors" output="false" access="public" returntype="any">
		<cfargument name="colors" required="true" default="" />
		<cfargument name="jeansID" required="true" default="" />
		
		<cfset var color = ""/>
		<cfset var insertjeanscolors = ""/>
		
		<cfloop list="#arguments.colors#" index="color">
			<cfquery name="insertjeanscolors" datasource="Clothes">
	    		insert into jeans_color_bridge (jeans_id, color_id)
				values(
					<cfqueryparam value="#arguments.jeansID#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#color#" cfsqltype="cf_sql_integer" />
				)
	    	</cfquery>
		</cfloop>
        
	</cffunction>
	
	<cffunction name="removeColors" output="false" access="public" returntype="any">
    	<cfargument name="id" required="true" />
    	
		<cfset var removeColors = "" />
		
    	<cfquery name="removeColors" datasource="Clothes">
			delete from jeans_color_bridge
			where jeans_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
    </cffunction>
	
	<cffunction name="removeJeansFromCloset" output="false" access="public" returntype="any">
    	<cfargument name="id" required="true" />

		<cfset var removejeans = "" />
    	
    	<cfquery name="removejeans" datasource="Clothes">
			delete from jeans 
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
    	</cfquery>
   
    </cffunction>
    
    <cffunction name="getJeansColor" output="false" access="public" returntype="query">
    	<cfargument name="jeans_id" default="false" />
    	
		<cfset getJeansColor = "" />
		
    	<cfquery name="getJeansColor" datasource="Clothes">
			select Color.Name, Color.id
			from jeans_color_bridge
			inner join color on jeans_color_bridge.color_id = color.id
			where jeans_color_bridge.jeans_id = <cfqueryparam value="#arguments.jeans_id#" cfsqltype="cf_sql_integer" />
		</cfquery>

		<cfreturn getJeansColor />
    
    </cffunction>
	
	<cffunction name="getJeansByID" output="false" access="public" returntype="query">
		<cfargument name="id" required="true" />
		
		<cfset var getJeansByID = "" />
		
   		<cfquery name="getJeansByID" datasource="Clothes">
        	select id, name, type
   			from Jeans
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>
		
		<cfreturn getJeansByID />           
    
	</cffunction>
	
</cfcomponent>