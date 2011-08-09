<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Westgate.Web.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="<%=this.ResolveClientUrl("~/stylesheet/login-box.css")%>" rel="stylesheet" type="text/css" />
</head>
<body>
    
    <form id="form1" runat="server">
<div style="width:450px;margin:auto;">
    <div id="login-box">
         <h2>
                Login</h2>
            Westgate Admin Site
            <br />
            <br />
        <div>
            <asp:Label runat="server" Text="" ID="lblError" Width="200px" Font-Bold="true" ForeColor="Red" Font-Size="14pt"></asp:Label>
        </div>
        <div>
            <div class="login-box-name">
                <asp:Label runat="server" Text="User Name:" ID="Label1"></asp:Label>
            </div>
            <div class="login-box-field">    
                <asp:TextBox runat="server" ID="tbUserName" style="margin-top:10px;width:200px"></asp:TextBox>
            </div>
        </div>
        <div style="clear:both">
            <div class="login-box-name">
                <asp:Label runat="server" Text="Password:" ID="Label2"></asp:Label>
            </div>
            <div class="login-box-field">    
                <asp:TextBox runat="server" ID="tbPassword" TextMode="Password" style="margin-top:10px;width:200px"></asp:TextBox>
            </div>
        </div>
        <div>
            <asp:ImageButton runat="server" ID="btnLogin" Text="Login as Admin" ImageUrl="~/images/login-btn.png" 
                onclick="btnLogin_Click" style="width:103px;height:42px;margin-left:90px"/>
        </div>
    </div>
</div>


    </form>
</body>
</html>
