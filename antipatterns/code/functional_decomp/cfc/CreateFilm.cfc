<cfcomponent displayname="Create Film" >
	
	<cffunction name="create" access="public">
		<cfargument name="Title" required="false" default="" />	
		<cfargument name="Format" required="false" default="" />	
		<cfargument name="Genre" required="false" default="" />	
		<cfargument name="Type" required="false" default="" />	
		<cfargument name="Rating" required="false" default="" />	
		
		<cfset var insertGenre=createObject("component", "#application.componentPrefix#InsertFilmGenre")/>
		<cfset var create_film = "" />
		
		<cfquery name="create_film" datasource="#application.datasource#">
			DECLARE @ID uniqueidentifier
			SET @ID = NewID()
		
			INSERT INTO films
			(ID, Title, Format, Type, Rating)
			VALUES
			(@ID,
			<cfqueryparam value="#arguments.Title#" cfsqltype="cf_sql_varchar" />,
			<cfqueryparam value="#arguments.Format#" cfsqltype="cf_sql_idstamp" />,
			<cfqueryparam value="#arguments.Type#" cfsqltype="cf_sql_idstamp" />,
			<cfqueryparam value="#arguments.Rating#" cfsqltype="cf_sql_idstamp" />
			)
			
			SELECT @ID AS id
		</cfquery>	
		
		<cfloop list="#arguments.Genre#" index="i" delimiters=",">
			<cfset genre = insertGenre.insert(film_id="#create_film.id#", genre_id="#i#") />
		</cfloop>
		
		<cflocation url="#application.URLRoot#films/list.cfm" />
				
	</cffunction>
	
</cfcomponent>