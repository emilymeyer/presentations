<cfparam name="url.room_id" default=""/>
<cfset optionController=createObject("component", "#application.componentPrefix#OptionController")/>

<cfset types = optionController.get(Field='Type', Item="Film") />
<cfset formats = optionController.get(Field='Format', Item="Film") />
<cfset ratings = optionController.get(Field='Rating', Item="Film") />
<cfset genres = optionController.get(Field='Genre', Item="Film") />

<cfoutput>
	<form id="form" name="form" action="_action.cfm" method="post">
		<input type="hidden" name="method" value="create"/>
		<input type="hidden" name="room_id" value="#url.room_id#"/>
		<table>
			<tr>
				<td>
					Title:
				</td>
				<td>
					<input type="text" name="title" />
				</td>
			</tr>
			<tr>
				<td>
					Type:
				</td>
				<td>
					<select name="type" type="dropdown">
						<option> </option>
						<cfloop query="types">
							<option value="#types.id#">#types.value#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					Format:
				</td>
				<td>
					<select name="format" type="dropdown">
						<option> </option>
						<cfloop query="formats">
							<option value="#formats.id#">#formats.value#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					Rating:
				</td>
				<td>
					<cfloop query="ratings">
						#ratings.value# <input type="radio" name="rating" value="#ratings.id#"/>
					</cfloop>
				</td>
			</tr>
			<tr>
				<td>
					Genre:
				</td>
				<td>
					<select name="genre" type="dropdown" multiple="true">
						<cfloop query="genres">
							<option value="#genres.id#">#genres.value#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="submit"/>
				</td>
			</tr>
		</table>
	</form>
</cfoutput>