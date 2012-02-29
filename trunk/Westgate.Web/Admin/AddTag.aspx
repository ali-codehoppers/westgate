<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTag.aspx.cs" Inherits="Westgate.Web.Admin.AddTag" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="<%=this.ResolveClientUrl("~/stylesheet/stylesheet.css")%>" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript" src="script/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="script/jscripts/HtmlEditor.js"></script>
</head>
<body>
    <form runat="server" id="TagForm">
    <div style="font-size: 14pt; font-weight: bold; height: 30px; width: 97%; background-color: #CCC;
        padding: 10px;">
        <asp:Label ID="addLabel" runat="server">Add Tag</asp:Label>
    </div>
    <div style="padding: 10px; width: 90%;">
        <asp:Panel runat="server" ID="message" Visible="false">
            <asp:Label CssClass="successStyle" ID="successMessage" runat="server" Text="Tag Saved."></asp:Label>
        </asp:Panel>
        <div class="labelStyle">
            <asp:Label ID="Name" runat="server" Text="Name" Width="100px"></asp:Label>
            <asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px"></asp:TextBox>
        </div>
        <div class="labelStyle">
            <asp:Label ID="ShowInTab" runat="server" Text="Show in tabs" Width="100px"></asp:Label>
            <asp:RadioButton ID="RadioButtonYes" runat="server" Text="Yes" GroupName="Controls"
                Width="50px" />
            <asp:RadioButton ID="RadioButtonNo" runat="server" Text="No" GroupName="Controls"
                Width="50px" Checked="true" />
        </div>
        <div class="labelStyle">
            <asp:Label ID="Description" runat="server" Text="Description" ></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="DescriptionText" runat="server" TextMode="MultiLine" Height="100px"
                Width="90%"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="AddButton" runat="server" Text="Add Record" OnClick="AddButton_Click"
                CssClass="buttonStyle" />
        </div>
    </div>
    </form>
</body>
</html>
