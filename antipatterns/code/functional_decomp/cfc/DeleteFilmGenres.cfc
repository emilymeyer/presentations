<cfcomponent>

	<cffunction name="deleteGenre" access="public">
		<cfargument name="film_id" required="yes" />
		
		<cfset var delete_genre = ""/>
		
		<cfquery name="delete_genre" datasource="#application.datasource#">
			DELETE FROM 
			Film_Genre
			WHERE Film_Genre.Film = <cfqueryparam value="#arguments.film_id#"/>
		</cfquery>
				
	</cffunction>


</cfcomponent>