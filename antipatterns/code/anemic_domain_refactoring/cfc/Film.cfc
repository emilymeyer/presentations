<cfcomponent name="Film" accessors="true">

	<cfproperty name="Title" type="any" />
	<cfproperty name="Type" type="any" />
	<cfproperty name="Format" type="any" />
	<cfproperty name="Rating" type="any" />
	<cfproperty name="Genre" type="Array" />
	<cfproperty name="ID" type="any" />
	
	<cffunction name="init" access="public" returntype="Film">
		<cfset variables.title = "">
		<cfset variables.type = "">
		<cfset variables.format = "">
		<cfset variables.rating = "">
		<cfset variables.genre = ArrayNew(1)>
		<cfset variables.id = "">
		
		<cfreturn this />
	</cffunction>

	<cffunction name="getGenres" access="public">
		<cfargument name="film_id" required="yes"/>
		
		<cfset var genres = ""/>
		
		<cfquery name="genres" datasource="#application.datasource#">
			SELECT Options.Value AS Genre
			FROM Options
			INNER JOIN Film_Genre ON Film_Genre.Genre = Options.ID 
			INNER JOIN Films ON Films.ID = Film_Genre.film
			WHERE Films.ID = <Cfqueryparam value="#getId()#" cfsqltype="cf_sql_idstamp" />
		</cfquery>
		
		<cfreturn genres />
		
	</cffunction>
	
	<cffunction name="insertGenre" access="public">
		<cfargument name="film_id" required="yes" />
		<cfargument name="genre_id" required="yes" />
		
		<cfset var insert_genre =""/>
		
		<cfquery name="insert_genre" datasource="#application.datasource#">
			INSERT INTO Film_Genre
			(ID, film, genre)
			VALUES
			(NewId(), 
			<cfqueryparam value="#getId()#" cfsqltype="cf_sql_idstamp" />,
			<cfqueryparam value="#genre_id#" cfsqltype="cf_sql_idstamp" />
			)
		</cfquery>
		
	</cffunction>
	
	<cffunction name="deleteGenre" access="public">
		<cfargument name="film_id" required="true"/>
		
		<cfset var delete_genre = ""/>
		
		<cfquery name="delete_genre" datasource="#application.datasource#">
			DELETE FROM 
			Film_Genre
			WHERE Film_Genre.Film = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
		
	</cffunction>
	
</cfcomponent>