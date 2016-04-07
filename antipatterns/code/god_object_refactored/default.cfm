<cfoutput>
	<table>
	<cfloop array="#application.apartment.getRoomList()#" index="room">
		<tr>
			<td><a href="javascript:if(confirm('Are you sure you want to delete #room.getName()#?')){window.location='rooms/_delete_action.cfm?room_id=#room.getid()#';}"><img src="#application.imagePrefix#delete.gif" style="border:none;"/></a></td>
			<td><a href="films/list.cfm?room_id=#room.getID()#">#room.getName()#</a></td>
		</tr>
	</cfloop>
	</table>
			<input type="button" value="New Room" class="myborder background" onClick="parent.location='rooms/new.cfm'"/>
</cfoutput>

