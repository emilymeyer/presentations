<cfoutput>
<cfloop from="1" to="4999" index="A">
<cfthread action="run" name="testing#A#" indexvalue="#A#">
<cfloop from="1" to="25" index="B">#B#<br>
<cfquery name="InsertTemp" datasource="clothes">
INSERT INTO Temp(ID, Site_ID, field1, field2)
VALUES (newid(), newid(),'#A#', '#B#')
</cfquery>
</cfloop>
</cfthread>
</cfloop>
</cfoutput>