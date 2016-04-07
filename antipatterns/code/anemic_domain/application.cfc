<cfcomponent>
	
<cfset this.name = "anemic_domain" />
	
<cffunction name="onApplicationStart" access="remote">
		
	<cfscript>
		application.URLRoot = "http://antipatterns.local/anemic_domain/";
		
		application.ComponentRoot = "http://antipatterns.local/anemic_domain/cfc/";
		
		application.datasource="inventory";
		application.componentPrefix = "anemic_domain.cfc.";
		
		application.imagePrefix = "http://antipatterns.local/anemic_domain/images/";
		application.apartment = createObject("Component", "#application.componentPrefix#Apartment").init();	
		
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
