<cfcomponent name="Apartment" accessors="true">
	
	<cfproperty name="roomList" type="any" />
	
	<cffunction name="init">
		<cfset variables.roomList = ArrayNew(1) />
		<cfset getRooms()/>
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getRoomById" access="public">
		<cfargument name="room_id" access="public">

		<cfset theRoom = "" />
		<cfloop array="#application.apartment.getRoomList()#" index="room">
			<cfif room.getId() eq arguments.room_id>
				<cfset theRoom = room />
			</cfif>
		</cfloop>
		
		<cfreturn theRoom />
		
	</cffunction>
	
	<cffunction name="getRooms" access="public">
		<cfset var get_rooms = ""/>
		<cfset var room = ""/>
		
		<cfquery name="get_rooms" datasource="#application.datasource#">
			SELECT Rooms.Id, Name
			FROM Rooms
		</cfquery>
		
		<cfloop query="get_rooms">
			<cfset room = createObject("Component", "#application.componentPrefix#Room").init() />
			<cfset room.setName(get_rooms.name) />	
			<cfset room.setId(get_rooms.id) />	
			<cfset ArrayAppend(variables.roomList, room) />	
		</cfloop>
		
		<cfreturn variables.roomList />
		
	</cffunction>
	
	<cffunction name="createRoom" access="public">
		<cfargument name="room_name" required="true"/>
		
		<cfquery name="add_room_query" datasource="#application.datasource#">
			DECLARE @ID uniqueidentifier
			SELECT @ID = NewID()
			
			INSERT INTO rooms (ID, Name)
			VALUES (@ID, <cfqueryparam value="#arguments.room_name#" cfsqltype="cf_sql_varchar" />)
			
			SELECT @ID as room_id
		</cfquery>
		
		<cfset addRoomToApartment(room_id="#add_room_query.room_id#", room_name="#arguments.room_name#")/>
		
		<cflocation url="../default.cfm" />
	
	</cffunction>
	
	<cffunction name="addRoomToApartment">
		<cfargument name="room_id" required="yes">
		<cfargument name="room_name" required="yes">
		
		<cfset new_room = createObject("component", "Room").init()/>
		<cfset new_room.setId(arguments.room_id)/>
		<cfset new_room.setName(arguments.room_name)/>
		
		<cfset ArrayAppend(variables.roomList, new_room)/>
	
	</cffunction>
	
	<cffunction name="deleteRoom" access="remote" output="true">
		<cfargument name="room_id" required="true">
		
		<cfset var room = application.apartment.getRoomById(arguments.room_id)/>
		<cfset ArrayDelete(variables.roomList, room)/>

		<cfquery name="delete_room_query" datasource="#application.datasource#">
			DELETE FROM rooms 
			WHERE ID = <cfqueryparam value="#room.getId()#" cfsqltype="cf_sql_idstamp" />
		</cfquery>
		
		<cflocation url="../default.cfm" />
		
	</cffunction>
		
</cfcomponent>