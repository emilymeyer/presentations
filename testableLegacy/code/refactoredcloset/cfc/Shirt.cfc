<cfcomponent name="Shirt" output="false">
	
	<cffunction name="init" output="false" access="public" returntype="Shirt">
    	<cfreturn this />
    </cffunction>
    
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
	
	<cffunction name="addColors" output="false" access="public" returntype="any">
		<cfargument name="colors" required="true" default="" />
		<cfargument name="shirtID" required="true" default="" />
		
		<cfset var color = ""/>
		<cfset var insertShirtColors = ""/>
		
		<cfloop list="#arguments.colors#" index="color">
			<cfquery name="insertShirtColors" datasource="Clothes">
	    		insert into shirt_color_bridge (shirt_id, color_id)
				values(
					<cfqueryparam value="#arguments.shirtID#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#color#" cfsqltype="cf_sql_integer" />
				)
	    	</cfquery>
		</cfloop>
        
	</cffunction>
	
	<cffunction name="removeColors" output="false" access="public" returntype="any">
		<cfargument name="id" required="true" />
		
		<cfset var removecolors = "" />
		
		<cfquery name="removecolors" datasource="Clothes">
			delete from shirt_color_bridge
			where shirt_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
    	</cfquery>
    </cffunction>
    
	<cffunction name="removeShirtFromCloset" output="false" access="public" returntype="any">
		<cfargument name="id" required="true" />
		
		<cfset var removeShirtFromCloset = "" />
		
		<cfquery name="removeShirtFromCloset" datasource="Clothes">
			delete from shirt 
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
	    </cfquery>
    
	</cffunction>
    
	<cffunction name="getShirtColor" output="false" access="public" returntype="query">
    	<cfargument name="shirt_id" default="false" />
    	
		<cfset var getShirtColor = "" />
			
    	<cfquery name="getShirtColor" datasource="Clothes">
			select Color.Name, Color.id
			from shirt_color_bridge
			inner join color on shirt_color_bridge.color_id = color.id
			where shirt_color_bridge.shirt_id = <cfqueryparam value="#arguments.shirt_id#" cfsqltype="cf_sql_integer" />
		</cfquery>

		<cfreturn getShirtColor />
    
    </cffunction>
    
	<cffunction name="getShirtByID" output="false" access="public" returntype="query">
		<cfargument name="id" required="true" />
		
		<cfset var getShirtByID = "" />
		
   		<cfquery name="getShirtByID" datasource="Clothes">
        	select id, name, type
   			from shirt
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>
		
		<cfreturn getShirtByID />           
    
	</cffunction>
	
</cfcomponent>