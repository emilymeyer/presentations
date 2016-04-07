<cfcomponent>
	
	
<cfset this.name = "films_ref" />
	
	
<cffunction name="onApplicationStart" access="remote">
	
		
<cfscript>
         application.URLRoot = "http://antipatterns.local/functional_decomposition_refactoring/";
		
 		application.ComponentRoot = "http://antipatterns.local/functional_decomposition_refactoring/cfc/";
		 
application.datasource="inventory";
		 application.componentPrefix = "functional_decomposition_refactoring.cfc.";
	
	 application.imagePrefix = "http://antipatterns.local/functional_decomposition_refactoring/images/";
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
