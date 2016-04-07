<cfinvoke component="#application.componentPrefix#poltergeist.OptionsInvoker" method="get" returnvariable="types">
	<cfinvokeargument name="formField" value="type">
	<cfinvokeargument name="item" value="Film">
</cfinvoke>

<cfinvoke component="#application.componentPrefix#poltergeist.OptionsInvoker" method="get" returnvariable="formats">
	<cfinvokeargument name="formField" value="format">
	<cfinvokeargument name="item" value="Film">
</cfinvoke>

<cfinvoke component="#application.componentPrefix#poltergeist.OptionsInvoker" method="get" returnvariable="ratings">
	<cfinvokeargument name="formField" value="rating">
	<cfinvokeargument name="item" value="Film">
</cfinvoke>

<cfinvoke component="#application.componentPrefix#poltergeist.OptionsInvoker" method="get" returnvariable="genres">
	<cfinvokeargument name="formField" value="genre">
	<cfinvokeargument name="item" value="Film">
</cfinvoke>

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