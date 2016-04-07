<cfcomponent name="Shoes" output="false">

	<cffunction name="insertShoes" output="false" access="public" returntype="any">
		<cfargument name="name" required="true" default="" />
		<cfargument name="type" required="true" default="" />
		
		<cfset var insertShoes = "" />
		
		<cfquery name="insertShoes" datasource="Clothes">
			insert into shoes (name, type)
			values (
				<cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.type#" cfsqltype="cf_sql_integer" />
			)
			
			SELECT IDENT_CURRENT('shoes') as ID
	    </cfquery>
		
		<cfreturn insertShoes />
	</cffunction>
	
	<cffunction name="addColors" output="false" access="public" returntype="any">
		<cfargument name="colors" required="true" default="" />
		<cfargument name="shoesID" required="true" default="" />
		
		<cfset var color = ""/>
		<cfset var insertShoesColors = ""/>
		
		<cfloop list="#arguments.colors#" index="color">
			<cfquery name="insertShoesColors" datasource="Clothes">
	    		insert into shoes_color_bridge (shoes_id, color_id)
				values(
					<cfqueryparam value="#arguments.shoesID#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#color#" cfsqltype="cf_sql_integer" />
				)
	    	</cfquery>
		</cfloop>
        
	</cffunction>
	
	<cffunction name="removeColors" output="false" access="public" returntype="any">
		<cfargument name="id" required="true" />
		
		<cfset removeColors = "" />
		
		<cfquery name="removecolors" datasource="Clothes">
			delete from shoes_color_bridge
			where shoes_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
    	</cfquery>
    </cffunction>
    
	<cffunction name="removeShoesFromCloset" output="false" access="public" returntype="any">
		<cfargument name="id" required="true" />

		<cfset removeShoesFromCloset = "" />
		
		<cfquery name="removeShoesFromCloset" datasource="Clothes">
			delete from shoes 
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
	    </cfquery>
    </cffunction>
	
	<cffunction name="getShoesColors" output="false" access="public" returntype="query">
		<cfargument name="shoes_id" required="true" />
    	
		<cfset var getShoesColor = "" />
				
    	<cfquery name="getShoesColor" datasource="Clothes">
			select Color.Name, Color.id
			from shoes_color_bridge
			inner join color on shoes_color_bridge.color_id = color.id
			where shoes_color_bridge.shoes_id = <cfqueryparam value="#shoes_id#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfreturn getShoesColor />
    </cffunction>
    
	<cffunction name="getShoesByID" output="false" access="public" returntype="query">
		<cfargument name="id" required="true" />
		
		<cfset var getShoesByID = "" />
		
   		<cfquery name="getShoesByID" datasource="Clothes">
        	select id, name, type
   			from Shoes
			where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
        </cfquery>
		
		<cfreturn getShoesByID />           
    
	</cffunction>

</cfcomponent>