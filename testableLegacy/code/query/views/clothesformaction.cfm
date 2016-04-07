<cfquery name="getClothingType" datasource="Clothes">
	select id, name 
	from clothing_type
	where id = <cfqueryparam value="#form.type#" cfsqltype="cf_sql_integer" />
</cfquery>

<cfif getClothingType.name eq "jeans">
	<cfquery name="insertjeans" datasource="Clothes">
		insert into jeans (name, type)
		values (
			<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar" />,
			<cfqueryparam value="#form.type#" cfsqltype="cf_sql_integer" />
		)
		SELECT IDENT_CURRENT('jeans') as ID
    </cfquery>
	
	<cfloop list="#form.colors#" index="color">
		<cfquery name="insertjeanscolors" datasource="Clothes">
    		insert into jeans_color_bridge (jeans_id, color_id)
			values(
				<cfqueryparam value="#insertjeans.id#" cfsqltype="cf_sql_integer" />,
				<cfqueryparam value="#color#" cfsqltype="cf_sql_integer" />
			)
    	</cfquery>
	</cfloop>
<cfelseif getClothingType.name eq "shirt">
	<cfquery name="addShirt" datasource="Clothes">
		insert into shirt (name, type)
		values (
			<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar" />,
			<cfqueryparam value="#form.type#" cfsqltype="cf_sql_integer" />
		)
		SELECT IDENT_CURRENT('shirt') as ID
    </cfquery>

	<cfloop list="#form.colors#" index="color">
		<cfquery name="insertshirtcolors" datasource="Clothes">
    		insert into shirt_color_bridge (shirt_id, color_id)
			values(
				<cfqueryparam value="#addShirt.id#" cfsqltype="cf_sql_integer" />,
				<cfqueryparam value="#color#" cfsqltype="cf_sql_integer" />
			)
    	</cfquery>
	</cfloop>
<cfelseif getClothingType.name eq "shoes">
	
	<cfquery name="insertshoes" datasource="Clothes">
		insert into shoes (name, type)
		values (
			<cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar" />,
			<cfqueryparam value="#form.type#" cfsqltype="cf_sql_integer" />
		)
		SELECT IDENT_CURRENT('shoes') as ID
    </cfquery>
	
	<cfloop list="#form.colors#" index="color">
		<cfquery name="insertshoescolors" datasource="Clothes">
    		insert into shoes_color_bridge (shoes_id, color_id)
			values(
				<cfqueryparam value="#insertshoes.id#" cfsqltype="cf_sql_integer" />,
				<cfqueryparam value="#color#" cfsqltype="cf_sql_integer" />
			)
    	</cfquery>
	</cfloop>
</cfif>
<cflocation url="clotheslist.cfm" />