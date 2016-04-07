<cfcomponent>
	
<cfset this.name = "poltergeist" />
	
<cffunction name="onApplicationStart" access="remote">
		
	<cfscript>
		application.URLRoot = "http://antipatterns.local/poltergeist/";
		
		application.ComponentRoot = "http://antipatterns.local/poltergeist/cfc/";
		
		application.datasource="inventory";
		application.componentPrefix = "poltergeist.cfc.";
		
		application.imagePrefix = "http://antipatterns.local/poltergeist/images/";
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
