<cfset films=createObject("component", "#application.componentPrefix#film")/>

<cfoutput>
	<cfset id = films.create(Title="#form.Title#", Format="#form.Format#", Type="#form.Type#", Rating="#form.Rating#", Genre="#form.Genre#") />
</cfoutput>