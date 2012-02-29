<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Westgate.Web.ajax.Gallery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="<%=this.ResolveClientUrl("~/script/jquery-1.5.1.min.js")%>" type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/tooltip/js/jtip.js")%>" type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/tooltip/css/global.css")%>"
        rel="stylesheet" type="text/css" />
    <link href="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.css")%>"
        rel="stylesheet" type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.js")%>"
        type="text/javascript"></script>

   <script type="text/javascript">
        var isVisible = false;

        function SelectImage(id)
        {
            var image = document.getElementById(id);
            image.setAttribute("style", "max-width:100px; max-height:100px; margin:0px;  border-style:solid;  border-color:#fab647;");
        }

        function DeSelectImage(id)
        {
            var image = document.getElementById(id);
            image.setAttribute("style", "max-width:100px; max-height:100px; margin:2px;  border-style:none;  border-color:#fab647;");
        }

        // When document is ready, initialize pagination
        $(document).ready(function () {
            $('#Searchresult a.light_class').lightBox({
                maxHeight: 900,
                maxWidth: 900
            });
        });

        function animate_detail() {
          if (!isVisible) {
                $('.no_class').animate({
                    width: '300px'
                }, 1000, function () {

                });


                $(".imageDetail").show(1000, function () {
                    /* Replace First Div */
                });

                $('#button_showDetails').attr('value','Hide Details');
                isVisible=true;
            }
            else {

                 $(".imageDetail").hide(1000, function () {
                });

                $('.no_class').animate({
                    width: '100px'
                }, 1000, function () {

                });
                $('#button_showDetails').attr('value','Show Details');
                isVisible=false;
           }
        }

    </script>


</head>
<body>
    <form id="form1" runat="server">
    <%--    <div style="margin-top: 20px;">--%>
    <%--        <div style="width: 30%; float: left">
            <div style="border: 2px solid #CCC; min-height: 500px;">
                <asp:TreeView ID="tvStructure" runat="server" ImageSet="Simple" 
                    ShowLines="True" onselectednodechanged="tvStructure_SelectedNodeChanged">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="0px"
                        NodeSpacing="0px" VerticalPadding="0px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                        VerticalPadding="0px" />
                </asp:TreeView>
            </div>
        </div>--%>
    <div style="width: 100%; float: left;">
        <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
        <div id="Searchresult" style="width: 85%; float: left; padding-bottom: 10px;">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="no_class" style="float: left; padding: 2px; width: 100px; max-height: 100px">
                        <div style="float: left; padding: 2px">
                            <asp:HyperLink class="light_class" runat="server" ID="link1" NavigateUrl='<%#Eval("CombinedImagePath").ToString().Replace("~/","")%>'
                                title='<%#Eval("Name")%>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailPath(Eval("ImageId").ToString()).Replace("~/","")%>'
                                    AlternateText='<%#Eval("Name")%>' style="max-width:100px; max-height:100px; margin:2px; border-style:none" OnMouseOver="SelectImage(id)"  onMouseOut="DeSelectImage(id)"></asp:Image>
<%--                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath")).ToString().Replace("~/","")%>'
                                    AlternateText='<%#Eval("Name")%>' style="max-width:100px; max-height:100px; margin:2px; border-style:none" OnMouseOver="SelectImage(id)"  onMouseOut="DeSelectImage(id)"></asp:Image>
--%>                            </asp:HyperLink>
                        </div>
                        <div class="imageDetail" style="float: left; padding: 2px; padding-top: 2px; display: none">
                            <div style="margin-left: 5px; width: 180px">
                                <b>Name:</b>
                                <%# Eval("Name").ToString().Length > 45 ? Eval("Name").ToString().Substring(0, 45) + "..." : Eval("Name")%></div>
                            <div style="margin-left: 5px; width: 180px">
                                <b>Description: </b>
                                <%#Eval("Description").ToString().Length > 30 ? Eval("Description").ToString().Substring(0, 30)+"..." : Eval("Description")%></div>
                            <span style="float: right; width: 180px"><a href='ajax/Tooltip.aspx?ImageId=<%#Eval("ImageId")%>'
                                class="jTip" id="<%#Container.ItemIndex %>" name="Details" title="tooltip">more</a>
                            </span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="div_showDetails" style="float: left; margin-top: 20px; width:13%;">
            <input id="button_showDetails" type="button" value="Show Details" onclick="javascript:animate_detail();"
                style="padding: 5px;" />
        </div>
        <div style="clear: both">
        </div>
    </div>
    <%--    </div>--%>

    </form>
</body>
</html>
