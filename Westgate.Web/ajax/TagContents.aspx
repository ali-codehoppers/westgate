<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="TagContents.aspx.cs" Inherits="Westgate.Web.ajax.TagContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left">
        <%--		<div style="width: 100%">
			<a href="javascript:OnHomeClick();" class="bread_crump">Home</a> <span>> </span>
			<asp:hyperlink runat="server" id="tagLink" cssclass="bread_crump"></asp:hyperlink>
		</div>
        --%>
        <div style="width: 100%; padding-top: 10px">
            <h1 align="left">
                <span style="color: #555; font-weight: bold;">
                    <asp:label runat="server" text="Label" id="tagName"></asp:label>
                </span>
            </h1>
        </div>
        <div style="width: 100%; margin-top:20px;">
            <asp:label runat="server" text="Label" id="tagDescription" style="float: left; width: 100%"></asp:label>
        </div>
        <div style="width: 100%; min-height: 20px; clear: both">
        </div>
    </div>
    <script type="text/javascript">
    </script>
</asp:Content>
