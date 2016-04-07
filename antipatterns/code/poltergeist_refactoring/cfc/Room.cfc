<cfcomponent name="Room" accessors="true">

	<cfproperty name="Name" type="any" />
	<cfproperty name="Films_In_Room" type="any" />
	<cfproperty name="Id" type="any" />

	<cffunction name="init" access="public" returntype="Room">
		<cfset variables.name = "">
		<cfset variables.films_in_room = ArrayNew(1)>
		<cfset variables.id = "">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getFilmsByRoomID" access="public">
		<cfset var film_list = ArrayNew(1)/>
		
		<cfquery name="films" datasource="#application.datasource#">
			SELECT Films.ID, Films.Title, Rating.Value AS Rating, Type.Value AS Type, Format.Value AS Format
			FROM Films 
			LEFT JOIN Options AS Rating ON Films.Rating = Rating.ID
			LEFT JOIN Options AS Type ON Films.Type = Type.ID 
			LEFT JOIN Options AS Format ON Films.Format = Format.ID 
			INNER JOIN Rooms_Movies_Bridge ON Rooms_Movies_Bridge.Film_ID = Films.ID
			WHERE Rooms_Movies_Bridge.Room_Id = <cfqueryparam value="#getId()#" cfsqltype="cf_sql_idstamp" />
		</cfquery>
		
		<cfloop query="films">
			<cfset film = createObject("Component", "Film").init() />
			<cfset film.setTitle(#films.title#)/>
			<cfset film.setId(#films.id#)/>
			<cfset film.setRating(#films.rating#)/>
			<cfset film.setType(#films.type#)/>
			<cfset film.setFormat(#films.format#)/>
			
			<cfset genre_query = film.getGenres(film_id = "#film.getID()#")/>
			<cfset genre_list = ArrayNew(1)/>
			
			<cfloop query="genre_query" >
				<cfset ArrayAppend(genre_list, genre_query.genre)/>
			</cfloop>
			
			<cfset film.setGenre(genre_list)/>
			
			<cfset ArrayAppend(film_list, film) />
		</cfloop>
		
		<cfset setFilms_In_Room(film_list) />
		<cfreturn getFilms_In_Room() />
		
	</cffunction>
	
	<cffunction name="addFilmToRoom" access="public">
		<cfargument name="film" required="true">

		<cfquery name="add_film_to_room" datasource="#application.datasource#">
			INSERT INTO Rooms_Movies_Bridge (ID, Film_ID, Room_ID)
			VALUES (NewID(), <cfqueryparam value="#arguments.film.getId()#" cfsqltype="cf_sql_idstamp" />, <cfqueryparam value="#getId()#" cfsqltype="cf_sql_idstamp" />)
		</cfquery>
		
		<cfset ArrayAppend(getFilms_In_Room(), film) />
		
	</cffunction>	

</cfcomponent>