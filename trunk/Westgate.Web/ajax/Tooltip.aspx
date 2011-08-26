<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tooltip.aspx.cs" Inherits="Westgate.Web.Tooltip" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="float:left">
            <asp:Image ID="Image_Tooltip" style="max-height:80px; max-width:200;" runat="server"/>
        </div>
        <div style="float:left; padding:5px">
            <b><asp:Label id="Label1" Text="Name:" runat="server"></asp:Label></b>
            <asp:Label id="Text_Name" Text="Name" runat="server"></asp:Label>
            <br/>
            <b><asp:Label id="Label2" Text="Description:" runat="server"></asp:Label></b>
            <asp:Label id="Text_Desc" Text="Description" runat="server"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
