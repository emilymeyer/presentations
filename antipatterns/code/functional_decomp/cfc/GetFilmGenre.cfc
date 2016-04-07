<cfcomponent name="GetFilmGenre">
	<cffunction name="get" access="public">
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
</cfcomponent>