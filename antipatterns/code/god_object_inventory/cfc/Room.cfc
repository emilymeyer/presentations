<cfcomponent name="Room" >

	<cfproperty name="Name" type="any" />
	<cfproperty name="Films_In_Room" type="any" />
	<cfproperty name="Id" type="any" />

	<cffunction name="init" access="public" returntype="Room">
		<cfset variables.name = "">
		<cfset variables.films_in_room = "">
		<cfset variables.id = "">
		<cfreturn this>
	</cffunction>

	<cffunction name="getName" access="public" output="false" returntype="any">
		<cfreturn Name>
		
	</cffunction>

	<cffunction name="setName" access="public" output="false" returntype="void">
		<cfargument name="argName" type="any">
		<cfset Name=argName/>
		
	</cffunction>
	
	<cffunction name="getId" access="public" output="false" returntype="any">
		<cfreturn Id>
		
	</cffunction>

	<cffunction name="setId" access="public" output="false" returntype="void">
		<cfargument name="argId" type="any">
		<cfset Id=argId/>
		
	</cffunction>

	<cffunction name="getFilms_In_Room" access="public" output="false" returntype="any">
		<cfreturn Films_In_Room>
		
	</cffunction>

	<cffunction name="setFilms_In_Room" access="public" output="false" returntype="void">
		<cfargument name="argFilms_In_Room" type="any">
		<cfset Films_In_Room=argFilms_In_Room/>
		
	</cffunction>
</cfcomponent>