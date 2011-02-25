<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="Westgate.Web.Admin.AddSubCategory" %>
<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:addEdit ID="addEdit1" runat="server" />
</asp:Content>
