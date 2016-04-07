<cfparam name="url.id" default="0" /> 
<cfparam name="type" default="0" /> 
<cfoutput>
<cfquery name="getColors" datasource="Clothes">
	SELECT ID, Name 
	FROM Color
</cfquery>

<cfquery name="getClothingTypes" datasource="Clothes">
	SELECT ID, Name 
	FROM Clothing_Type
</cfquery>

<link rel="stylesheet" type="text/css" href="../../stuff/styles.css" />

<cfinclude template="../../libraries/clothinglib.cfm" />

<cfset clothingInfo = getClothingInfo() />
<cfset colors = getColorsForClothes() />
<cfset colorList = valueList(colors.name)>


<form name="clothesform" id="clothesform" action="clothesformaction.cfm" method="post">
	<table name="clothestable" id="clothestable" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				Name:
			</td>
			<td>
				<input name="name" value="#clothingInfo.Name#" />
			</td>
		</tr>
		<tr>
			<td>
				Clothing Type:
			</td>
			<td>
				<select name="type" id="type" >
					<cfloop query="getClothingTypes">
						<option name="#getClothingTypes.ID#" 
							id="#getClothingTypes.ID#" 
							value="#getClothingTypes.ID#"
							<cfif clothingInfo.type eq getClothingTypes.id>selected</cfif>
							>
							 #getClothingTypes.Name#
						</option>
					</cfloop>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				Colors:
			</td>
			<td>
				<div id="colorSelectDiv">
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
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="submit" class="submit" value="submit" /></td>
		</tr>
	</table>
</form>
</cfoutput>