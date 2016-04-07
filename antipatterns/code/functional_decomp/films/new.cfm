<cfset type=createObject("component", "#application.componentPrefix#GetType")/>
<cfset format=createObject("component", "#application.componentPrefix#GetFormat")/>
<cfset genre=createObject("component", "#application.componentPrefix#GetGenre")/>
<cfset rating=createObject("component", "#application.componentPrefix#GetRating")/>

<cfset types = type.get() />
<cfset formats = format.get()/>
<cfset genres = genre.get()/>
<cfset ratings = rating.get()/>

<cfsavecontent variable="style">
	<style type="text/css">
	
		.mypadding{
			padding-left:5px; 
			padding-right:7px;
		}
		
		.myborder{   
			  border:1px solid #C8BBBE;
		}
		
		.background{ 
			background-color:#FDEEF4;
		}
		
		
	</style>
</cfsavecontent>
<cfhtmlhead text="#style#">

<cfoutput>
	<form id="form" name="form" action="_action.cfm" method="post">
		<input type="hidden" value="create"/>
		<div align="center">
		<table style="font-family:Arial, Helvetica, sans-serif;" cellspacing="0px;" width="40%">
			<tr>
				<td align="right" style="padding-right:1em;">
					Title:
				</td>
				<td width="40%">
					<input type="text" name="title" />
				</td>
			</tr>
			<tr>
				<td align="right" style="padding-right:1em;">
					Type:
				</td>
				<td width="50%">
					<select name="type" type="dropdown">
						<option> </option>
						<cfloop query="types">
							<option value="#types.id#">#types.value#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding-right:1em;">
					Format:
				</td>
				<td width="50%">
					<select name="format" type="dropdown" width="100">
						<option> </option>
						<cfloop query="formats">
							<option value="#formats.id#">#formats.value#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding-right:1em;">
					Rating:
				</td>
				<td style="font-size:14px;" width="50%">
					<cfloop query="ratings">
						<input type="radio" name="rating" value="#ratings.id#"/>  #ratings.value#
					</cfloop>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding-right:1em;">
					Genre:
				</td>
				<td width="50%">
					<select name="genre" type="dropdown" multiple="true">
						<cfloop query="genres">
							<option value="#genres.id#">#genres.value#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="submit"/>
				</td>
			</tr>
		</table>
</div>
	</form>
</cfoutput>