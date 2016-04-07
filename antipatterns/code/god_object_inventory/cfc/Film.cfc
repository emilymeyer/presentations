<cfcomponent name="Film" accessors="true">

	<cfproperty name="Title" type="any" />
	<cfproperty name="Type" type="any" />
	<cfproperty name="Format" type="any" />
	<cfproperty name="Rating" type="any" />
	<cfproperty name="Genre" type="any" />
	<cfproperty name="ID" type="any" />
	
	<cffunction name="init" access="public" returntype="Film">
		<cfset variables.title = "">
		<cfset variables.type = "">
		<cfset variables.format = "">
		<cfset variables.rating = "">
		<cfset variables.genre = "">
		<cfset variables.id = "">
		
		<cfreturn this />
	</cffunction>

</cfcomponent>