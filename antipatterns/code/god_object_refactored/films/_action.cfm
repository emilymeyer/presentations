<cfset room = application.apartment.getRoomById(room_id = #form.room_id#) />
<cfset film = createObject("Component", "#application.componentPrefix#Film") />

<cfoutput>
	<cfset newFilm = film.create(Title="#form.Title#", Format="#form.Format#", Type="#form.Type#", Rating="#form.Rating#", Genre="#form.Genre#") />
	<cfset room.addFilmToRoom(film="#newFilm#")/> 
	<cflocation url="#application.URLRoot#films/list.cfm?room_id=#room.getID()#" />
</cfoutput>