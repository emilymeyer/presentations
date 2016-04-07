<cfparam name="url.room_id" default=""/>

<cfset films = application.apartment.getFilmsByRoomId(room_id="#url.room_id#")/>

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
<div align="center">
	<table class="myborder" style="font-family:Arial, Helvetica, sans-serif;" cellspacing="0px;" width="100%">
		<thead align="Left" style="background-color:##C8BBBE;">
			<th class="mypadding">Title</th>
			<th class="mypadding">Type</th>
			<th class="mypadding">Format</th>
			<th class="mypadding">Rating</th>
			<th class="mypadding">Genre(s)</th>
			<th class="mypadding">&nbsp;</th>
		</thead>
		<tbody>
		<cfset count = 0/>
		<cfloop index="film" array="#films#">
			<tr <cfif count % 2>class="background"</cfif>>
				<td class="mypadding" valign="top">#film.getTitle()#</td>
				<td class="mypadding" valign="top">#film.getType()#</td>
				<td class="mypadding" valign="top">#film.getFormat()#</td>
				<td class="mypadding" valign="top">#film.getRating()#</td>
				<td class="mypadding" valign="top">
					<cfloop array="#film.getGenre()#" index="theGenre">
						#theGenre# <br/>
					</cfloop>
				</td>
				<td>
					<a href="javascript:if(confirm('Are you sure you want to delete #film.getTitle()#?')){window.location='#application.ComponentRoot#Apartment_Main.cfc?method=deleteFilm&film_id=#film.getId()#&room_id=#url.room_id#';}"><img src="#application.imagePrefix#delete.gif" style="border:none;"/></a>
				</td>
			</tr>
			<cfset count += 1/>
		</cfloop>
		</tbody>
	</table>
	<br/>
	<input type="button" value="New Movie" class="myborder background" onClick="parent.location='new.cfm?room_id=#url.room_id#'"/>
</div>
</cfoutput>
