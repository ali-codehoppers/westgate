<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="AddSubCategory.aspx.cs" Inherits="Westgate.Web.Admin.AddSubCategory" %>
<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
Add Subcategory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div class="labelStyle">
        Category:
    </div>
    <div>
        <asp:Label runat="server" ID="lblCategoryName"></asp:Label>
    </div>
    <div class="labelStyle">
        <asp:Label  ID="Label1" runat="server" Text="Name"  ></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="tbName" runat="server" TextMode="SingleLine" Height="23px" Width="213px" ></asp:TextBox>
    </div>
    <div class="labelStyle">
        <asp:Label  ID="Description" runat="server" Text="Description"  ></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine" Height="205px" Width="97%"></asp:TextBox>
    </div>
    <div>
    <asp:Button ID="AddButton" runat="server" Text="Add Subcategory" 
    onclick="AddButton_Click" CssClass="buttonStyle"/>
    </div>
</asp:Content>