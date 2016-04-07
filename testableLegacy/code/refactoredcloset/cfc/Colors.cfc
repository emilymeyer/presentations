<cfcomponent name="Colors" output="false">

	<cffunction name="getColors" output="false" access="public" returntype="query">
    	
    	<cfset var getColors = "" />
    	
    	<cfquery name="getColors" datasource="Clothes">
    		SELECT ID, Name 
			FROM Color
        </cfquery>
        
		<cfreturn getColors/>
		
    </cffunction>
	
	<cffunction name="getColorsForClothes">
		<cfargument name="id" required="true" />
		<cfargument name="typeName" required="true" />
		
		<cfset var getColorsForClothes = "" />
		
		<cfif arguments.typeName eq "shirt">
			<cfquery name="getColorsForClothes" datasource="Clothes">
		    	select Color.Name 
				from color
				inner join shirt_color_bridge on color.id = shirt_color_bridge.color_id
				where shirt_color_bridge.shirt_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
		    </cfquery>
		<cfelseif arguments.typeName eq "jeans">
			<cfquery name="getColorsForClothes" datasource="Clothes">
		    	select Color.Name 
				from color
				inner join jeans_color_bridge on color.id = jeans_color_bridge.color_id
				where jeans_color_bridge.jeans_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
		    </cfquery>
		<cfelse>
			<cfquery name="getColorsForClothes" datasource="Clothes">
		    	select Color.Name 
				from color
				inner join shoes_color_bridge on color.id = shoes_color_bridge.color_id
				where shoes_color_bridge.shoes_id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
		    </cfquery>
		</cfif>
	    
		<cfreturn getColorsForClothes />
		
	</cffunction>

	
</cfcomponent>