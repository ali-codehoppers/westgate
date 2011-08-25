<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
	CodeBehind="TagContents.aspx.cs" Inherits="Westgate.Web.ajax.TagContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div style="text-align: left">
<%--		<div style="width: 100%">
			<a href="javascript:OnHomeClick();" class="bread_crump">Home</a> <span>> </span>
			<asp:hyperlink runat="server" id="tagLink" cssclass="bread_crump"></asp:hyperlink>
		</div>
--%>		<div style="width: 100%; padding-top: 10px">
			<h1 align="left"><span style="color: #faa01d">
				<asp:label runat="server" text="Label" id="tagName"></asp:label>
			</span></h1>
		</div>
		<div style="width: 100%;">
			<asp:label runat="server" text="Label" id="tagDescription" style="float: left"></asp:label>
		</div>
		<div id="Searchresult" style="min-height: 200px; float: left; width: 100%">
		</div>
		<asp:label id="Label1" runat="server" text="0" visible="false"></asp:label>
	</div>
	<div id="Pagination" class="grey_top" style="display:none">
	</div>
    	<script type="text/javascript">
		function pageselectCallback(page_index, jq) {

			//var new_content = jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone();
			//$('#Searchresult').empty().append(new_content);
			$('#Searchresult').empty().append(jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone());

			return false;
		}

		/** 
		* Initialisation function for pagination
		*/
		function initPagination() {
			// count entries inside the hidden content
			var num_entries = jQuery('#hiddenresult div.result').length;
			// Create content inside pagination element
			$("#Pagination").pagination(num_entries, {
				callback: pageselectCallback,
				items_per_page: 1 // Show only one item per page
			});
		}

		// When document is ready, initialize pagination
		$(document).ready(function () {
			initPagination();
		});
	</script>
</asp:Content>
