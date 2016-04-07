<cfoutput>
<cfquery name="getColors" datasource="Clothes">
	SELECT ID, Name 
	FROM Color
</cfquery>

<cfinclude template="../../libraries/clothinglib.cfm" />

<cfset clothingInfo = getClothingInfo() />
<cfset colors = getColorsForClothes() />
<cfset colorList = valueList(colors.name)>

<select name="colors" id="colors">
	<cfloop query="getColors">
		<option name="color_#getColors.ID#" 
			id="color_#getColors.ID#" 
			value="#getColors.ID#"
			<cfif ListFind(colorList, getColors.Name) >
				selected
			</cfif>
		>#getColors.Name#</option>
	</cfloop>
</select>
</cfoutput>