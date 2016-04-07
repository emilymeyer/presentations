<cfoutput>
	<cfset id = application.apartment.createFilm(Room_id="#form.room_id#", Title="#form.Title#", Format="#form.Format#", Type="#form.Type#", Rating="#form.Rating#", Genre="#form.Genre#") />
</cfoutput>