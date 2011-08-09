﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageContents.aspx.cs"
    Inherits="Westgate.Web.ajax.ImageContents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/script/gallery/jquery.ad-gallery.css")%>" />
    <script src="<%=this.ResolveClientUrl("~/script/jquery-1.5.1.min.js")%>" type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/gallery/jquery.ad-gallery.js")%>"
        type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            var galleries = $('.ad-gallery').adGallery({
                width: 945, // Width of the image, set to false and it will read the CSS width
                height: 355, slideshow: {
                
                    enable: true,
                    autostart: true,
                    speed: 3500,
                    start_label: 'Start',
                    stop_label: 'Stop',
                    countdown_prefix: '(', // Wrap around the countdown
                    countdown_sufix: ')',
                    onStart: function () {
                        // Do something wild when the slideshow starts
                    },
                    onStop: function () {
                        // Do something wild when the slideshow stops
                    }
                }
            });
            galleries[0].settings.effect = 'fade';
            $('#toggle-description').click(
      function () {
          if (!galleries[0].settings.description_wrapper) {
              galleries[0].settings.description_wrapper = $('#descriptions');
          } else {
              galleries[0].settings.description_wrapper = false;
          }
          return false;
      }
    );
        });
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container" style="padding-left:10px">
        <div id="gallery" class="ad-gallery">
            <div class="ad-image-wrapper">
            </div>
            <div class="ad-controls">
            </div>
            <div class="ad-nav">
                <div class="ad-thumbs">
                    <ul class="ad-thumb-list">
                        <asp:Repeater ID="rptImages" runat="server">
                            <ItemTemplate>
                                <li>
                                    <div style="width:70px; height:15px;"></div>
                                    <asp:HyperLink runat="server" ID="link1" NavigateUrl='<%#Eval("CombinedImagePath")%>'>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath"))%>' AlternateText='<%#Eval("Name")%>'></asp:Image>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        <div id="descriptions">
        </div>
    </div>
    </form>
</body>
</html>
