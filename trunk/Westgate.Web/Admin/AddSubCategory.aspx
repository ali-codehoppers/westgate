<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="Westgate.Web.Admin.AddSubCategory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="<%=this.ResolveClientUrl("~/stylesheet/stylesheet.css")%>" rel="stylesheet"
    type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div class="labelStyle">
        <asp:Label runat="server" ID="Label2" Width="100px" Text="Category:" ></asp:Label>
        <asp:Label runat="server" ID="lblCategoryName" Font-Bold="false"></asp:Label>
    </div>
    <div class="labelStyle">
        <asp:Label  ID="Label1" runat="server" Text="Name"   Width="100px" ></asp:Label>
                <asp:TextBox ID="tbName" runat="server" TextMode="SingleLine" Height="23px" Width="213px" ></asp:TextBox>

    </div>
    <div class="labelStyle">
        <asp:Label  ID="Description" runat="server" Text="Description"  ></asp:Label>
    </div>
    <div>
        <asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine" Height="100px" Width="97%"></asp:TextBox>
    </div>
    <div style="text-align:center">
    <asp:Button ID="AddButton" runat="server" Text="Add Subcategory" 
    onclick="AddButton_Click" CssClass="buttonStyle"/>
    </div>
    </form>
</body>
</html>
