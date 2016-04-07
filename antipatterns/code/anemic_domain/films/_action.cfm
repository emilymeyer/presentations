<cfset room = application.apartment.getRoomById(room_id = #form.room_id#) />
<cfset filmService = createObject("component", "#application.componentPrefix#services/FilmService") />

<cfoutput>
	<cfset newFilm = filmService.createFilm(Room_id="#form.room_id#", Title="#form.Title#", Format="#form.Format#", Type="#form.Type#", Rating="#form.Rating#", Genre="#form.Genre#") />
	<cfset room.addFilmToRoom(film="#newFilm#")/> 
	<cflocation url="#application.URLRoot#films/list.cfm?room_id=#room.getID()#" />
</cfoutput>