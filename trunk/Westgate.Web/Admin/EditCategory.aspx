<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="EditCategory.aspx.cs" Inherits="Westgate.Web.Admin.EditCategory" %>


<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>
    
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
Edit Category
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:450px;">
        <div class="linkButtonStyle">
            <a href='AddSubCategory.aspx?categoryId=<%=Request["categoryId"]%>'>Add Subcategory</a>
        </div>
    </div>
    <div>
        <uc1:addEdit ID="addEdit1" runat="server" />
    </div>
</asp:Content>
