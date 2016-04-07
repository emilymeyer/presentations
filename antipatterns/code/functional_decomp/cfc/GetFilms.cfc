<cfcomponent displayname="Get Films">

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
			
			<cfset genres=createObject("component", "#application.componentPrefix#GetFilmGenre")/>
			<cfset genre_query = genres.get(film_id = "#films.ID#")/>
			<cfset genre_list = ArrayNew(1)/>
			
			<cfloop query="genre_query" >
				<cfset ArrayAppend(genre_list, genre_query.genre)/>
			</cfloop>
			
			<cfset film.genres = genre_list/>
			<cfset arrayAppend(film_list, film) />
		</cfloop>
		
		<cfreturn film_list />
		
	</cffunction>

</cfcomponent>