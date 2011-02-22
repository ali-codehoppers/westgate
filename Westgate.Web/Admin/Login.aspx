<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Westgate.Web.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
    <center>
    <div>
        <div>
            <asp:Label runat="server" Text="" ID="lblError" Width="200px" Font-Bold="true" ForeColor="Red" Font-Size="14pt"></asp:Label>
        </div>
        <div>
            <asp:Label runat="server" Text="User Name:" ID="Label1" Width="200px"></asp:Label>
            <asp:TextBox runat="server" ID="tbUserName"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="Password:" ID="Label2" Width="200px"></asp:Label>
            <asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox>
        </div>
        <div>
            <asp:Button runat="server" ID="btnLogin" Text="Login as Admin" 
                onclick="btnLogin_Click"/>
        </div>
    </div>
    </center>
    </form>
</body>
</html>
