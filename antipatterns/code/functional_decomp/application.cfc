<cfcomponent>
	<cfset this.name = "functional_decomposition" />

	<cffunction name="onApplicationStart" access="remote">
	
		<cfscript>
         application.URLRoot = "http://antipatterns.local/functional_decomposition/";
         application.ComponentRoot = "http://antipatterns.local/functional_decomposition/cfc/";
		 application.datasource="inventory";
		 application.componentPrefix = "functional_decomposition.cfc.";
		 application.imagePrefix = "http://antipatterns.local/functional_decomposition/images/";
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