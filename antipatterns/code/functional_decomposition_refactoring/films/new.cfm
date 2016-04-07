<cfset OptionController=createObject("component", "#application.componentPrefix#OptionController")/>

<cfset types = OptionController.get(field='Type', item='Film') />
<cfset formats = OptionController.get(field='Format', item='Film') />
<cfset ratings = OptionController.get(field='Rating', item='Film') />
<cfset genres = OptionController.get(field='Genre', item='Film') />

<cfoutput>
	<form id="form" name="form" action="_action.cfm" method="post">
		<input type="hidden" value="create"/>
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