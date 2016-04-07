<!--- Move these to cfcs --->
<!--- Pass Arguments --->
<!--- Make sure clothing type.cfm gets refactored as well. --->

<cffunction name="getClothingInfo" access="public">

	<cfset clothing = createObject("component", "library.cfc.Clothing") />	
	<cfset typeName = clothing.getClothingTypeName("#type#") />	

	<cfif typeName eq "shirt">
		<cfquery name="getArticleInformation" datasource="Clothes">
			select shirt.name, type, brand, description, clothing_type.Name as clothingTypeName
			from shirt
			inner join clothing_type on shirt.type = clothing_type.id
			where shirt.id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />
		</cfquery>
	
	<cfelseif typeName eq "jeans">
		<cfquery name="getArticleInformation" datasource="Clothes">
			select jeans.name, type, brand, description, clothing_type.Name as clothingTypeName 
			from jeans
			inner join clothing_type on jeans.type = clothing_type.id
			where jeans.id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />
		</cfquery>
	
	<cfelse>
		<cfquery name="getArticleInformation" datasource="Clothes">
			select shoes.name, type, brand, description, clothing_type.Name as clothingTypeName
			from shoes
			inner join clothing_type on shoes.type = clothing_type.id
			where shoes.id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cfif>

	<cfreturn getArticleInformation />
	
</cffunction>

<cffunction name="getColorsForClothes">
	
	<cfif typeName eq "shirt">
		<cfquery name="getColorsForClothes" datasource="Clothes">
	    	select Color.Name 
			from color
			inner join shirt_color_bridge on color.id = shirt_color_bridge.color_id
			where shirt_color_bridge.shirt_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />
	    </cfquery>
	<cfelseif typeName eq "jeans">
		<cfquery name="getColorsForClothes" datasource="Clothes">
	    	select Color.Name 
			from color
			inner join jeans_color_bridge on color.id = jeans_color_bridge.color_id
			where jeans_color_bridge.jeans_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />
	    </cfquery>
	<cfelse>
		<cfquery name="getColorsForClothes" datasource="Clothes">
	    	select Color.Name 
			from color
			inner join shoes_color_bridge on color.id = shoes_color_bridge.color_id
			where shoes_color_bridge.shoes_id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer" />
	    </cfquery>
	</cfif>
    
	<cfreturn getColorsForClothes />
	
</cffunction>