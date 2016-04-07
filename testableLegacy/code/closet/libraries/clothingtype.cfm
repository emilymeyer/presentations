<cffunction name="getClothingTypeName" access="public">

	<cfquery name="getClothingTypeName" datasource="Clothes">
		select Name
		from clothing_type
		where id = <cfqueryparam value="#type#" cfsqltype="cf_sql_integer" />
	</cfquery>
	
	<cfreturn getClothingTypeName.Name />

</cffunction>
