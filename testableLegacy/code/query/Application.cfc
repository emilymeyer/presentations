<cfcomponent output="false">

<cfset this.name = "closet" />
	
<cffunction name="onApplicationStart" access="remote">
		
	<cfscript>
		application.stuff = "http://legacy.local:81/closet/stuff/";
		application.imagePrefix = "http://legacy.local/closet/images/";
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
