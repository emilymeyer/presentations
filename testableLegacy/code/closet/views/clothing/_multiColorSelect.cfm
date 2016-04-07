<cfoutput>
<select name="colors" id="colors" multiple="true">
	<cfloop query="getColors">
		<option name="color_#getColors.ID#" 
			id="color_#getColors.ID#" 
			value="#getColors.ID#"
			<cfif ListFind(colorList, getColors.Name) gt 0>
				selected
			</cfif>
		>#getColors.Name#</option>
	</cfloop>
</select>
</cfoutput>