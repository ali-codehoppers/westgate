<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs"
    Inherits="Westgate.Web.Admin.AddCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
        <link href="<%=this.ResolveClientUrl("~/stylesheet/stylesheet.css")%>" rel="stylesheet"
        type="text/css" />
</head>
<body>
    <form runat="server" id="CategoryForm">
    <div style="font-size: 14pt; font-weight: bold; height: 30px; width: 97%; background-color: #CCC;
        padding: 10px;">
        <asp:Label ID="addLabel" runat="server">Add Category</asp:Label>
    </div>
    <div style="padding: 10px; width: 90%;">
        <asp:Panel runat="server" ID="message" Visible="false">
            <asp:Label CssClass="successStyle" ID="successMessage" runat="server" Text="Category Saved."></asp:Label>
        </asp:Panel>
        <div class="labelStyle">
            <asp:Label ID="Name" runat="server" Text="Name" Width="100px"></asp:Label>
            <asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px"></asp:TextBox>
        </div>
        <div class="labelStyle">
            <asp:Label ID="Description" runat="server" Text="Description"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="DescriptionText" runat="server" TextMode="MultiLine" Height="100px"
                Width="97%"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="AddButton" runat="server" Text="Add Record" OnClick="AddButton_Click" 
                CssClass="buttonStyle" />
        </div>
    </div>
    </form>
</body>
</html>
