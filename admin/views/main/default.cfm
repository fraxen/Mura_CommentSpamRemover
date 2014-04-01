<cfsilent>
<!---

This file is part of muraFW1
(c) Stephen J. Withington, Jr. | www.stephenwithington.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

		Document:	/admin/views/main/default.cfm
		Author:		Steve Withington | www.stephenwithington.com
		Modified:	2011.02.04

--->
</cfsilent>
<cfoutput>
	<h3>Site Comments</h3>	
	<!---<ul id="navTask">
		<li><a href="#buildURL('admin:main.another')#">Another Page</a></li>
	</ul>--->

	<form action="#buildURL('admin:main.deleteComments')#" method="post">
	<table width="100%" id="siteComments">
		<thead>
		<tr>
			<th valign="bottom">View</th>
			<th valign="bottom">Name</th>
			<th valign="bottom">Email</th>
			<th valign="bottom">IP</th>
			<th valign="bottom">Date Entered</th>
			<th valign="bottom">Comment</th>
			<th valign="bottom">Delete</th>
			<th valign="bottom">Select<br/><a href="##" onclick="var allBoxes=document.getElementsByTagName('input');for(j=0;j<allBoxes.length;j++){if(allBoxes[j].type=='checkbox'){allBoxes[j].checked=true;}}return false;">select&nbsp;all</a></th>
		</tr>
		</thead>
		<tbody>
		<cfloop query="rc.qGetComments">
			<tr>
				<td><a href="#rc.$.getBean('content').loadBy(contentID='#contentid#',siteId='#session.siteid#').getURL()#" target="_blank">#title#</a></td>
				<td>#name#</td>
				<td style="text-align: CENTER;">#email#</td>
				<td style="text-align: CENTER;">#ip#</td>
				<td style="text-align: CENTER;">#dateformat(entered, "short")#</td>
				<td style="text-align: CENTER;" title="#comments#">
						View
				</td>
				<td style="text-align: CENTER;">
					<a href="#buildURL('admin:main.default?cid=#URLEncodedFormat(commentid)#')#" onclick="return confirm('Delete the comment by #name#? [Comment Date: #dateformat(entered, 'short')#]')">Delete</a>
				</td>
				<td style="text-align: CENTER;"><input type="checkbox" name="selectedComments" value="#URLEncodedFormat(commentid)#" /></td>
			</tr>
		</cfloop>
		</tbody>
	</table>
	<div style="margin-bottom: 18px;" class="row">
		<button type="submit" value="save" class="btn btn-danger pull-right" onclick="return confirm('Delete the selected comment(s)')"><i class="icon-trash icon-white" data-original-title=""></i>
Delete selection</button>
	</div>
	</form>
</cfoutput>
