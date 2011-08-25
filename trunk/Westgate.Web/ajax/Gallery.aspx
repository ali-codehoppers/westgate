<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Westgate.Web.ajax.Gallery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="<%=this.ResolveClientUrl("~/script/jquery-1.5.1.min.js")%>" type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/pagination/pagination.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%=this.ResolveClientUrl("~/script/pagination/demo.css")%>" rel="stylesheet"
        type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/pagination/jquery.pagination.js")%>"
        type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.js")%>"
        type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.css")%>"
        rel="stylesheet" type="text/css" />
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
    <div style="width: 80%; float: left">
        <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
        <div id="Searchresult" style="width: 80%; float: left">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="link1" NavigateUrl='<%#Eval("CombinedImagePath")%>'
                        title='<%#Eval("Name")%>'>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath"))%>'
                            AlternateText='<%#Eval("Name")%>'></asp:Image>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="clear: both">
        </div>
    </div>
    <%--    </div>--%>
    <script type="text/javascript">
        // When document is ready, initialize pagination
        $(document).ready(function () {
            $('#Searchresult a').lightBox({
                maxHeight: 500,
                maxWidth: 600
            });
        });
    </script>
    </form>
</body>
</html>
