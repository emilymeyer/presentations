<cfcomponent name="OptionsController">

	<cffunction name="get" access="public">
		<cfargument name="formField" required="true" />
		
		<cfset formElements = CreateObject("component", "#application.componentPrefix#OptionsController") />
		
		<cfreturn formElements.get(formfield = "#arguments.formField#", item="Film") />
	</cffunction>
	
</cfcomponent>