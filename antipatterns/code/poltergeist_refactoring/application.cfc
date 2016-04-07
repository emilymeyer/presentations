<cfcomponent>
	
<cfset this.name = "poltergeist_refactoring" />
	
<cffunction name="onApplicationStart" access="remote">
		
	<cfscript>
		application.URLRoot = "http://antipatterns.local/poltergeist_refactoring/";
		
		application.ComponentRoot = "http://antipatterns.local/poltergeist_refactoring/cfc/";
		
		application.datasource="inventory";
		application.componentPrefix = "poltergeist_refactoring.cfc.";
		
		application.imagePrefix = "http://antipatterns.local/poltergeist_refactoring/images/";
		application.apartment = createObject("component", "#application.componentPrefix#Apartment").init();
		
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
