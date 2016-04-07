<cfcomponent name="Apartment_Main" accessors="true" >

	<cfproperty name="roomList" type="any" />
	
	<cffunction name="init">
		<cfset variables.roomList = ArrayNew(1) />
		<cfset getRooms()/>
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getFilmsByRoomID" access="public" hint="deprecated">
		<cfargument name="room_id" required="true"/>
	
		<cfset var film_list = ArrayNew(1)/>
		
		<cfquery name="films" datasource="#application.datasource#">
			SELECT Films.ID, Films.Title, Rating.Value AS Rating, Type.Value AS Type, Format.Value AS Format
			FROM Films 
			LEFT JOIN Options AS Rating ON Films.Rating = Rating.ID
			LEFT JOIN Options AS Type ON Films.Type = Type.ID 
			LEFT JOIN Options AS Format ON Films.Format = Format.ID 
			INNER JOIN Rooms_Movies_Bridge ON Rooms_Movies_Bridge.Film_ID = Films.ID
			WHERE Rooms_Movies_Bridge.Room_Id = <cfqueryparam value="#arguments.room_id#" cfsqltype="cf_sql_idstamp" />
		</cfquery>
		
		<cfloop query="films">
			<cfset film = createObject("Component", "Film").init() />
			<cfset film.setTitle(#films.title#)/>
			<cfset film.setId(#films.id#)/>
			<cfset film.setRating(#films.rating#)/>
			<cfset film.setType(#films.type#)/>
			<cfset film.setFormat(#films.format#)/>
			
			<cfset genre_query = getGenres(film_id = "#film.getID()#")/>
			<cfset genre_list = ArrayNew(1)/>
			
			<cfloop query="genre_query" >
				<cfset ArrayAppend(genre_list, genre_query.genre)/>
			</cfloop>
			
			<cfset film.setGenre(genre_list)/>
			<cfset arrayAppend(film_list, film) />
		</cfloop>
		
		<cfreturn film_list />
		
	</cffunction>

	<cffunction name="getGenres" access="private" hint="deprecated">
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

	<cffunction name="createFilm" access="public" hint="deprecated">
		<cfargument name="room_id" required="true" />	
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
		
		<cfset addFilmToRoom(room_id="#arguments.room_id#", film_id="#create_film.id#")/>
		
		<cflocation url="#application.URLRoot#films/list.cfm?room_id=#arguments.room_id#" />
		
	</cffunction>
	
	<cffunction name="insertGenre" access="private" hint="deprecated">
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
	
	<cffunction name="deleteFilm" access="remote" hint="deprecated">
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
	
	<cffunction name="deleteGenre" access="private" hint="deprecated">
		<cfargument name="film_id" required="yes" />
		
		<cfset var delete_genre = ""/>
		
		<cfquery name="delete_genre" datasource="#application.datasource#">
			DELETE FROM 
			Film_Genre
			WHERE Film_Genre.Film = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
		
	</cffunction>
	
	<cffunction name="getRooms" access="public">
		<cfset var get_rooms = ""/>
		<cfset var room = ""/>
		
		<cfquery name="get_rooms" datasource="#application.datasource#">
			SELECT Rooms.Id, Name
			FROM Rooms
		</cfquery>
		
		<cfloop query="get_rooms">
			<cfset room = createObject("Component", "#application.componentPrefix#Room").init() />
			<cfset room.setName(get_rooms.name) />	
			<cfset room.setId(get_rooms.id) />	
			<cfset ArrayAppend(variables.roomList, room) />	
		</cfloop>
		
		<cfreturn variables.roomList />
		
	</cffunction>

	<cffunction name="addFilmToRoom" access="private" hint="deprecated">
		<cfargument name="room_id" required="true">
		<cfargument name="film_id" required="true">
		
		<cfquery name="add_film_to_room" datasource="#application.datasource#">
			INSERT INTO Rooms_Movies_Bridge (ID, Film_ID, Room_ID)
			VALUES (NewID(), <cfqueryparam value="#arguments.film_id#" cfsqltype="cf_sql_idstamp" />, <cfqueryparam value="#arguments.room_id#" cfsqltype="cf_sql_idstamp" />)
		</cfquery>
		
	</cffunction>
	
	<cffunction name="addRoomToApartment" access="private">
		<cfargument name="room_id" required="yes">
		<cfargument name="room_name" required="yes">
		
		<cfset new_room = createObject("component", "Room").init()/>
		<cfset new_room.setId(arguments.room_id)/>
		<cfset new_room.setName(arguments.room_name)/>
		
		<cfset ArrayAppend(variables.roomList, new_room)/>
	
	</cffunction>
	
	<cffunction name="getRoomById" access="public">
		<cfargument name="room_id" access="public">

		<cfset theRoom = "" />
		<cfloop array="#application.apartment.getRoomList()#" index="room">
			<cfif room.getId() eq arguments.room_id>
				<cfset theRoom = room />
			</cfif>
		</cfloop>
		
		<cfreturn theRoom />
		
	</cffunction>
	
	<cffunction name="deleteRoom" access="remote">
		<cfargument name="room_id" required="true">
		
		<cfset var room = getRoomById(arguments.room_id)/>
		<cfset ArrayDelete(variables.roomList, room)/>

		<cfquery name="delete_room_query" datasource="#application.datasource#">
			DELETE FROM rooms 
			WHERE ID = <cfqueryparam value="#room.getId()#" cfsqltype="cf_sql_idstamp" />
		</cfquery>
		
		<cflocation url="../default.cfm" />
		
	</cffunction>
	
	<cffunction name="createRoom" access="public">
		<cfargument name="room_name" required="true"/>
		
		<cfquery name="add_room_query" datasource="#application.datasource#">
			DECLARE @ID uniqueidentifier
			SELECT @ID = NewID()
			
			INSERT INTO rooms (ID, Name)
			VALUES (@ID, <cfqueryparam value="#arguments.room_name#" cfsqltype="cf_sql_varchar" />)
			
			SELECT @ID as room_id
		</cfquery>
		
		<cfset addRoomToApartment(room_id="#add_room_query.room_id#", room_name="#arguments.room_name#")/>
		
		<cflocation url="../default.cfm" />
	
	</cffunction>
		
</cfcomponent>