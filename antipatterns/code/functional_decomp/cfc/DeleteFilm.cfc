<cfcomponent>
	
	<cffunction name="deleteFilm" access="remote">
		<cfargument name="film_id" required="yes" />
		
		<cfset var deleteFilmGenre = createObject("component", "#application.componentPrefix#DeleteFilmGenres")/>
		<cfset var delete_film = ""/>
		
		<cfquery name="delete_film" datasource="#application.datasource#">
			DELETE FROM 
			Films
			WHERE Films.ID = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
		
		<cfset deleteFilmGenre.deleteGenre(film_id="#arguments.film_id#") />
		
		<cflocation url="#application.URLRoot#films/list.cfm" />
	</cffunction>

</cfcomponent>