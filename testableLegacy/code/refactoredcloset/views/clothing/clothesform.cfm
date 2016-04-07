<cfparam name="url.clothingID" default="0" /> 
<cfparam name="type" default="0" /> 
<cfsilent>
	<cfset Clothing = createObject("component", "#application.ComponentPrefix#clothing") />
	<cfset Colors = createObject("component", "#application.ComponentPrefix#colors") />
</cfsilent>
<cfoutput>

<cfset getClothingTypes = Clothing.getClothingTypes() />

<cfset getColors = Colors.getColors() />

<cfset clothingInfo = Clothing.getClothingInfo(clothingID=url.clothingID, type=type) />

<cfset clothesColors = Colors.getColorsForClothes(url.clothingID, clothingInfo.clothingTypeName) />

<cfset colorList = valueList(clothesColors.name)>

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
					<cfinclude template="_multiColorSelect.cfm">
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="submit" value="submit" /></td>
		</tr>
	</table>
</form>
</cfoutput>