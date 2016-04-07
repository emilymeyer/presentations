<cfparam name="id" default=""/>
<cfparam name="type" default=""/>

<cfquery name="getClothingType" datasource="Clothes">
	select id, name 
	from clothing_type
	where id = <cfqueryparam value="#type#" cfsqltype="cf_sql_integer" />
</cfquery>

<cfif getClothingType.name eq "jeans">

	<cfquery name="removecolors" datasource="Clothes">
		delete from jeans_color_bridge
		where jeans_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>

	<cfquery name="removejeans" datasource="Clothes">
		delete from jeans 
		where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>
	
<cfelseif getClothingType.name eq "shirt">
	
	<cfquery name="removecolors" datasource="Clothes">
		delete from shirt_color_bridge
		where shirt_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>

	<cfquery name="removeshirt" datasource="Clothes">
		delete from shirt 
		where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>
	
<cfelseif getClothingType.name eq "shoes">
	<cfquery name="removecolors" datasource="Clothes">
		delete from shoes_color_bridge
		where shoes_id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>

	<cfquery name="removejeans" datasource="Clothes">
		delete from shoes 
		where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_integer" />
    </cfquery>
</cfif>

<cflocation url="clotheslist.cfm" />