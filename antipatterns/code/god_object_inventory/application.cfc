<cfcomponent>
	
	
<cfset this.name = "god_object_inventory" />
	
	
<cffunction name="onApplicationStart" access="remote">
		
	<cfscript>
		application.URLRoot = "http://antipatterns.local/god_object_inventory/";
		
		application.ComponentRoot = "http://antipatterns.local/god_object_inventory/cfc/";
		
		application.datasource="inventory";
		application.componentPrefix = "god_object_inventory.cfc.";
		
		application.imagePrefix = "http://antipatterns.local/god_object_inventory/images/";
		application.apartment = createObject("component", "#application.componentPrefix#Apartment_Main").init();
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
