<cfcomponent>
	
<cfset this.name = "anemic_domain_refactoring" />
	
<cffunction name="onApplicationStart" access="remote">
		
	<cfscript>
		application.URLRoot = "http://antipatterns.local/anemic_domain_refactoring/";
		
		application.ComponentRoot = "http://antipatterns.local/anemic_domain_refactoring/cfc/";
		
		application.datasource="inventory";
		application.componentPrefix = "anemic_domain_refactoring.cfc.";
		
		application.imagePrefix = "http://antipatterns.local/anemic_domain_refactoring/images/";
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
