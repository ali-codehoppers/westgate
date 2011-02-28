<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageContents.aspx.cs" Inherits="Westgate.Web.ajax.ImageContents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="<%=this.ResolveClientUrl("~/script/jquery-1.5.1.min.js")%>" type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/galleryview-2.1.1/galleryview.css")%>" rel="stylesheet" type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/galleryview-2.1.1/jquery.easing.1.3.js")%>" type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/galleryview-2.1.1/jquery.galleryview-2.1.1.js")%>" type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/galleryview-2.1.1/jquery.timers-1.2.js")%>" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul id="photos" class="galleryview">
            <asp:Repeater ID="rptImages" runat="server">
            <ItemTemplate>
                <li>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("AfterImagePath")%>' AlternateText='<%#Eval("Name")%>'></asp:Image>
			        <div class="panel-content">
                        <asp:Image ID="Image3" runat="server" ImageUrl='<%#Eval("CombinedImagePath")%>' AlternateText='<%#Eval("Name")%>'></asp:Image>				        
			            <div class="panel-overlay">
                            <h3><%#Eval("Name")%></h3>                        
                        </div>
                    </div>
                </li>    
            </ItemTemplate>
        </asp:Repeater>
        </ul>
    </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#photos').galleryView({
                panel_width: 936,
                panel_height: 273,
                frame_width: 70,
                frame_height: 70,
                nav_theme: 'dark'
            });
        });
    </script>
</body>
</html>
