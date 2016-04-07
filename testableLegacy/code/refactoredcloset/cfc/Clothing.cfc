<cfcomponent name="Clothing" output="false">
	
	<cffunction name="getClothingTypeName" output="false" access="public" returntype="any">
		<cfargument name="typeID" required="true"/>
		 
		<cfset var getClothingType = "" />
		
		<cfquery name="getClothingTypeName" datasource="Clothes">
			select id, name 
			from clothing_type
			where id = <cfqueryparam value="#arguments.typeID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfreturn getClothingTypeName.name />
		
	</cffunction>
	
	<cffunction name="getClothingTypes" output="false" access="public" returntype="query">
		
		<cfset var getClothingTypes = "" />
		
		<cfquery name="getClothingTypes" datasource="Clothes">
			SELECT ID, Name 
			FROM Clothing_Type
		</cfquery>
		
		<cfreturn getClothingTypes />
	
	</cffunction>
	
	<cffunction name="getClothingInfo" access="public">
		<cfargument name="type" required="true" />
		<cfargument name="clothingID" required="true" />
	
		<cfset var typeName = getClothingTypeName(typeid="#arguments.type#") />
		<cfset var getArticleInformation = "" />
		
		<cfif typeName eq "shirt">
		
			<cfset var shirt = createObject("component", "refactoredcloset.cfc.Shirt") />
			<cfset getArticleInformation = shirt.getShirtByID(arguments.clothingID)/>
			
		<cfelseif typeName eq "jeans">
		
			<cfquery name="getArticleInformation" datasource="Clothes">
				select jeans.name, type, brand, description, clothing_type.Name as clothingTypeName 
				from jeans
				inner join clothing_type on jeans.type = clothing_type.id
				where jeans.id = <cfqueryparam value="#arguments.clothingID#" cfsqltype="cf_sql_integer" />
			</cfquery>
		
		<cfelse>
			<cfquery name="getArticleInformation" datasource="Clothes">
				select shoes.name, type, brand, description, clothing_type.Name as clothingTypeName
				from shoes
				inner join clothing_type on shoes.type = clothing_type.id
				where shoes.id = <cfqueryparam value="#arguments.clothingID#" cfsqltype="cf_sql_integer" />
			</cfquery>
		</cfif>
		
		<cfreturn getArticleInformation />
		
	</cffunction>
	
</cfcomponent>