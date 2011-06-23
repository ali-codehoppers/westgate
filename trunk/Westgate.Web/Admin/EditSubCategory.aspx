<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master"  CodeBehind="EditSubCategory.aspx.cs" Inherits="Westgate.Web.Admin.EditSubCategory" %>
<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
Edit Subcategory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:450px;">
        <div class="linkButtonStyle">
            <a href='AddStory.aspx?subcategoryId=<%=Request["subcategoryId"]%>'>Add Story</a>
        </div>
    </div>
    <div>
        <uc1:addEdit ID="addEdit1" runat="server" />    
    </div>
</asp:Content>

