<cfcomponent>
	
	<cffunction name="get" access="public">
		<cfset var films = ""/>
		<cfset var film_list = ArrayNew(1)/>
		
		<cfquery name="films" datasource="#application.datasource#">
			SELECT Films.ID, Films.Title, Rating.Value AS Rating, Type.Value AS Type, Format.Value AS Format
			FROM Films 
			LEFT JOIN Options AS Rating ON Films.Rating = Rating.ID
			LEFT JOIN Options AS Type ON Films.Type = Type.ID 
			LEFT JOIN Options AS Format ON Films.Format = Format.ID 
		</cfquery>
		
		<cfloop query="films">
			<cfset film = StructNew()/>
			<cfset film.title = #films.title#/>
			<cfset film.id = #films.id#/>
			<cfset film.rating = #films.rating#/>
			<cfset film.type = #films.type#/>
			<cfset film.format = #films.format#/>
			
			<cfset genre_query = getGenres(film_id = "#films.ID#")/>
			<cfset genre_list = ArrayNew(1)/>
			
			<cfloop query="genre_query" >
				<cfset ArrayAppend(genre_list, genre_query.genre)/>
			</cfloop>
			
			<cfset film.genres = genre_list/>
			<cfset arrayAppend(film_list, film) />
		</cfloop>
		
		<cfreturn film_list />
		
	</cffunction>

	<cffunction name="getGenres" access="private">
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

	<cffunction name="create" access="public">
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
		
		<cfloop list="#arguments.Genre#" index="i" delimiters=",">
			<cfset genre = insertGenre(film_id="#create_film.id#", genre_id="#i#") />
		</cfloop>
		
		<cflocation url="#application.URLRoot#films/list.cfm" />
		
	</cffunction>
	
	<cffunction name="insertGenre" access="private">
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
	
	<cffunction name="deleteFilm" access="remote">
		<cfargument name="film_id" required="yes" />
		
		<cfset var delete_film = ""/>
		
		<cfquery name="delete_film" datasource="#application.datasource#">
			DELETE FROM 
			Films
			WHERE Films.ID = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
		
		<cfset deleteGenre(film_id="#arguments.film_id#") />
		
		<cflocation url="#application.URLRoot#films/list.cfm" />
	</cffunction>
	
	<cffunction name="deleteGenre" access="private">
		<cfargument name="film_id" required="yes" />
		
		<cfset var delete_genre = ""/>
		
		<cfquery name="delete_genre" datasource="#application.datasource#">
			DELETE FROM 
			Film_Genre
			WHERE Film_Genre.Film = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
				
	</cffunction>
	
</cfcomponent>