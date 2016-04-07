<cfcomponent name="FilmService">

	<cffunction name="getGenres" access="public">
		<cfargument name="film_id" required="yes"/>
		
		<cfset var genres = ""/>
		
		<cfquery name="genres" datasource="#application.datasource#">
			SELECT Options.Value AS Genre
			FROM Options
			INNER JOIN Film_Genre ON Film_Genre.Genre = Options.ID 
			INNER JOIN Films ON Films.ID = Film_Genre.film
			WHERE Films.ID = <Cfqueryparam value="#arguments.film_id#" cfsqltype="cf_sql_idstamp" />
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
			<cfqueryparam value="#film_id#" cfsqltype="cf_sql_idstamp" />,
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
	
	<cffunction name="createFilm" access="public">
		<cfargument name="Title" required="false" default="" />	
		<cfargument name="Format" required="false" default="" />	
		<cfargument name="Genre" required="false" default="" />	
		<cfargument name="Type" required="false" default="" />	
		<cfargument name="Rating" required="false" default="" />	
		
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
		
		<cfset film = createObject("Component", "#application.componentPrefix#Film").init() />
		<cfset film.setTitle(#arguments.Title#) />
		<cfset film.setFormat(#arguments.Format#) />
		<cfset film.setType(#arguments.Type#) />
		<cfset film.setRating(#arguments.Rating#) />
		<cfset film.setID(#create_film.id#) />
		
		<cfloop list="#arguments.Genre#" index="i" delimiters=",">
			<cfset genre = insertGenre(film_id="#film.getID()#", genre_id="#i#") />
		</cfloop>
		
		<cfreturn film/>
		
	</cffunction>
	
	<cffunction name="deleteFilm" access="remote">
		<cfargument name="film_id" required="yes" />
		<cfargument name="room_id" required="yes" />
		
		<cfset var delete_film = ""/>
		
		<cfquery name="delete_film" datasource="#application.datasource#">
			DELETE FROM 
			Films
			WHERE Films.ID = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
		
		<cfset deleteGenre(film_id="#arguments.film_id#") />
		
		<cflocation url="#application.URLRoot#films/list.cfm?room_id=#arguments.room_id#" />
	</cffunction>

</cfcomponent>