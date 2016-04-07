<cfcomponent output="false">

	<cfset this.name = "refactoredcloset" />
	
	<cffunction name="onApplicationStart" access="remote">
		<cfscript>
			application.stuff = "http://legacy.local:81/closet/stuff/";
			application.componentPrefix = "refactoredcloset.cfc.";
			application.imagePrefix = "http://legacy.local:81/refactoredcloset/images/";
		 </cfscript>
	</cffunction>
	
	<cffunction name="onRequestStart" access="remote">
		<cfif StructKeyExists(url, 'init') >
			<cfscript>
	    		onApplicationStart();
	    	</cfscript>
		</cfif>
	</cffunction>
	
</cfcomponent>
