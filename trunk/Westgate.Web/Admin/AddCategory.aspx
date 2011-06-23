<%@ Page Title="" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Admin/Admin.Master" CodeBehind="AddCategory.aspx.cs" Inherits="Westgate.Web.Admin.AddCategory" %>

<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
Add Category
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
        <uc1:addEdit ID="addEdit1" runat="server" />
    </div>
</asp:Content>