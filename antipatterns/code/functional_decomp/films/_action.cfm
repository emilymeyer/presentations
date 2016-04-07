<cfset createFilm=createObject("component", "#application.componentPrefix#CreateFilm")/>

<cfdump var="#form#">

<cfoutput>
	<cfset id = createFilm.create(Title="#form.Title#", Format="#form.Format#", Type="#form.Type#", Rating="#form.Rating#", Genre="#form.Genre#") />
</cfoutput>