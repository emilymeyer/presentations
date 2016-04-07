
<cfset film=createObject("component", "#application.ComponentPrefix#film")/>
<cfset films = film.get()/>

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
				<td class="mypadding" valign="top">#film.Title#</td>
				<td class="mypadding" valign="top">#film.Type#</td>
				<td class="mypadding" valign="top">#film.Format#</td>
				<td class="mypadding" valign="top">#film.Rating#</td>
				<td class="mypadding" valign="top">
					<cfloop array="#film.genres#" index="theGenre">
						#theGenre# <br/>
					</cfloop>
				</td>
				<td>
					<a href="javascript:if(confirm('Are you sure you want to delete #film.Title#?')){window.location='#application.ComponentRoot#film.cfc?method=deleteFilm&film_id=#film.id#';}"><img src="#application.imagePrefix#delete.gif" style="border:none;"/></a>
				</td>
			</tr>
			<cfset count += 1/>
		</cfloop>
		</tbody>
	</table>
	<br/>
	<input type="button" value="New Movie" class="myborder background" onClick="parent.location='new.cfm'"/>
</div>
</cfoutput>
