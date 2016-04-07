<cfcomponent name="ColorMatches" output="false" accessors="false">
	<cfproperty name="Blue" displayname="Blue" type="any" />
	<cfproperty name="Purple" displayname="Purple" type="any" />
	<cfproperty name="Red" displayname="Red" type="any" />
	<cfproperty name="Orange" displayname="Orange" type="any" />
	<cfproperty name="Yellow" displayname="Yellow" type="any" />
	<cfproperty name="Green" displayname="Green" type="any" />
		
	<cffunction name="init" output="false" access="public" returntype="void">
		<cfset variables.blue = "purple, blue" />
		<cfset variables.red = 'red, orange' />
		<cfset variables.yellow = 'yellow' />
		<cfset variables.green = 'blue, green' />
		<cfset variables.orange = 'red, orange, yellow' />
		<cfset variables.purple = 'blue, purple' />
    </cffunction>
    
	<cffunction name="getMatchesByColorName" output="false" access="public" returntype="any">
    	<cfargument name="colorName" required="true"/>
		
		<cfset var matches = "" />
		
		<cfif arguments.colorName eq "blue">
			<cfset matches = variables.blue />
		<cfelseif arguments.colorName eq "red">
			<cfset matches = variables.red /> 
		<cfelseif arguments.colorName eq "purple">
			<cfset matches = variables.purple /> 
		<cfelseif arguments.colorName eq "orange">
			<cfset matches = variables.orange /> 
		<cfelseif arguments.colorName eq "yellow">
			<cfset matches = variables.yellow /> 
		<cfelseif arguments.colorName eq "green">
			<cfset matches = variables.green /> 
		</cfif>
    	
		<cfreturn matches />
		
	</cffunction>
    
	
</cfcomponent>