<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageContents.aspx.cs"
    Inherits="Westgate.Web.ajax.ImageContents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/script/gallery/jquery.ad-gallery.css")%>" />
    <%--    <script src="<%=this.ResolveClientUrl("~/script/jquery-1.5.1.min.js")%>" type="text/javascript"></script>--%>
    <script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script src="<%=this.ResolveClientUrl("~/script/gallery/jquery.ad-gallery.js")%>"
        type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/jquery-ui-1.8.13.custom/css/smoothness/jquery-ui-1.8.13.custom.css")%>"
        rel="stylesheet" type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/jquery-ui-1.8.13.custom/js/jquery-ui-1.8.13.custom.min.js")%>"
        type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.js")%>"
        type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.css")%>"
        rel="stylesheet" type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/new_gallery/3dslider.js")%>" type="text/javascript"></script>
    <%--  <script type="text/javascript">

        var iframe = document.getElementById('imagesFrame');
        var innerDoc = iframe.contentDocument || iframe.contentWindow.document;
        alert(innerDoc);
        //innerDoc.getElementById('search_application').value = appli;

        $(document).ready(function () {
            $('.ad-image a').lightBox({
                maxHeight: 500,
                maxWidth: 900
            });
        });

    </script>--%>
    <style type="text/css">
        #slideshow
        {
            position: relative;
            margin: 0 auto;
            width: 622px;
            height: 400px;
            top: 40px;
            left: 30px;
        }
        #slideshow .slide
        {
            position: absolute;
            width: auto;
            height: auto;
        }
        #slideshow .slide img
        {
            width: 100%;
        }
        #slideshow .control
        {
            position: absolute;
            display: block;
            z-index: 10000;
            cursor: pointer;
        }
        #slideshow #pause
        {
            position: absolute;
            bottom: 0px;
            right: -40px;
            cursor: pointer;
            color: #ffffff;
            display: none;
        }
        #slideshow #play
        {
            position: absolute;
            bottom: 0px;
            right: -40px;
            cursor: pointer;
            color: #ffffff;
            display: none;
        }
        
        .gallery_bg
        {
            background-position: left top;
            font: normal 12px 'Lucida Sans Unicode' , 'Lucida Grande' , sans-serif;
            color: #999;
            text-indent: 5px;
            background: url(../images/gallery_img_bg.png);
            text-decoration: none;
            line-height: 25px;
            background-repeat: repeat-x;
        }

        #logo_cont
        {
            background-position: left top;
            font: normal 12px 'Lucida Sans Unicode' , 'Lucida Grande' , sans-serif;
            color: #999;
            text-indent: 5px;
            background: url(../images/gallery_bg.png);
            text-decoration: none;
            line-height: 25px;
            background-repeat: repeat-x;
        }

        
        
    </style>



</head>
<body style="margin-left:0px; margin-right:0px; ">
    <form id="form1" runat="server">
    <div id="container" style="padding-left: 0px; height: 484px; max-width:612px; float:left" class="gallery_bg">
        <div id="slideshow" style="float: left">
            <asp:Repeater ID="rptImages" runat="server">
                <ItemTemplate>
                    <%# (Eval("BeforeImagePath") != null && Eval("BeforeImagePath").ToString().Length > 0) ? "<div class='slide'><img id='Image1' src='" +Eval("GalleryImagePathBefore").ToString().Replace("~/","../")+"' AlternateText='"+Eval("Name")+"'></asp:Image></div>" : ""%>
                    <%# (Eval("AfterImagePath") != null && Eval("AfterImagePath").ToString().Length > 0) ? "<div class='slide'><img id='Image1' src='" +Eval("GalleryImagePathAfter").ToString().Replace("~/","../")+"' AlternateText='"+Eval("Name")+"'></asp:Image></div>" : ""%>
<%--                    <div class="slide">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("GalleryImagePath")%>' AlternateText='<%#Eval("Name")%>'>
                        </asp:Image>
                    </div>
--%>                </ItemTemplate>
            </asp:Repeater>
            <%--            <div class="ad-image-wrapper">
            </div>
            <div class="ad-controls">
            </div>
            <div class="ad-nav">
                <div id="test" class="ad-thumbs">
                    <ul class="ad-thumb-list">
                        <asp:Repeater ID="rptImages" runat="server">
                            <ItemTemplate>
                                <li>
                                    <div style="width: 70px; height: 15px;">
                                    </div>
                                    <asp:HyperLink runat="server" ID="link1" NavigateUrl='<%#Eval("CombinedImagePath")%>'>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath"))%>'
                                            AlternateText='<%#Eval("Name")%>'></asp:Image>
                                    </asp:HyperLink>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>--%>
        </div>
        <div id="descriptions">
        </div>
    </div>
    <div id="logo_cont" style="width:341px; float: left; height:484px;">
    </div>
    </form>
    <script type="text/javascript">
        //        $(function () {
        //            var galleries = $('.ad-gallery').adGallery({
        //                width: 945, // Width of the image, set to false and it will read the CSS width
        //                height: 355, slideshow: {

        //                    enable: true,
        //                    autostart: true,
        //                    speed: 3500,
        //                    start_label: 'Start',
        //                    stop_label: 'Stop',
        //                    countdown_prefix: '(', // Wrap around the countdown
        //                    countdown_sufix: ')',
        //                    onStart: function () {
        //                        $('#ad-image a').lightBox({
        //                            maxHeight: 500,
        //                            maxWidth: 600
        //                        });
        //                        // Do something wild when the slideshow starts
        //                    },
        //                    onStop: function () {
        //                        // Do something wild when the slideshow stops
        //                        $('#ad-image a').lightBox({
        //                            maxHeight: 500,
        //                            maxWidth: 600
        //                        });
        //                    }
        //                }
        //            });

        //            galleries[0].settings.effect = 'fade';
        //            $('#toggle-description').click(
        //      function () {
        //          if (!galleries[0].settings.description_wrapper) {
        //              galleries[0].settings.description_wrapper = $('#descriptions');
        //          } else {
        //              galleries[0].settings.description_wrapper = false;
        //          }
        //          return false;
        //      }
        //    );
        //        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ad-image a').lightBox({
                maxHeight: 500,
                maxWidth: 600
            });
            $("#slideshow").dddSlider();
        });
    </script>
</body>
</html>
