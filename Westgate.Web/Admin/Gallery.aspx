<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Gallery.aspx.cs" Inherits="Westgate.Web.Admin.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="EditCategoryLabel" runat="server">Gallery</asp:Label>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 20px;">
        <div style="width: 20%; border: 2px solid #CCC; min-height: 200px; float: left">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="gallery_repeater" style="float: center; height: 38px;">
                        <div style="padding-top: 10px;">
                            <%#Eval("Name")=="All" ? "<b>" : ""%>
                            <asp:HyperLink ID="Linking1" class="grey_top" runat="server" NavigateUrl='<%# "Gallery.aspx?tagId="+Eval("TagId")+""%>'
                                Text='<%# Eval("Name")%>'></asp:HyperLink>
                            <%#Eval("Name")=="All" ? "</b>" : ""%>
                        </div>
                        <%#Eval("Name") == "All" ? "<hr style=\" border: 1.5px solid #ccc;\" />" : ""%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="width: 78%; float: left">
            <div style="margin: 5px">
                <div id="Searchresult" style="min-height: 450px; float: left; width: 100%">
                </div>
            </div>
            <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
            <div id="hiddenresult" style="display: none;">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <%# Container.ItemIndex % 24 == 0 ? "<div class='result' style='width:100%;'>" :""%>
                        <asp:HyperLink runat="server" ID="link1" NavigateUrl='<%# "AddImageNew.aspx?imageId="+Eval("ImageId")+""%>"'>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath"))%>'
                                AlternateText='<%#Eval("Name")%>'></asp:Image>
                        </asp:HyperLink>
                        <%--                           <img src="../images/delete.gif" style="display: inherit;" onclick="javascript:deleteImageGallery('<%# Eval("ImageId")%>','<%=Request["TagId"] %>')" />
                        --%>
                        <%#(((Container.ItemIndex + 1) % 24 == 0) || (Container.ItemIndex) == (int.Parse(Label1.Text) - 1)) ? "</div>" : ""%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="Pagination" class="grey_top" style="margin-top: 10px">
            </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function pageselectCallback(page_index, jq) {

            //            //var new_content = jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone();
            //            //$('#Searchresult').empty().append(new_content);
            //            $('#Searchresult').empty().append(jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone());


            var new_content = jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone();
            if (new_content.length > 0)
                $('#Pagination').show();
            $('#Searchresult').empty().append(new_content);
            //                $("a[rel^='prettyPhoto']").prettyPhoto();
            //                $('#Searchresult a').lightBox({
            //                    maxHeight: 500,
            //                    maxWidth: 600
            //                });


            return false;

        }

        /** 
        * Initialisation function for pagination
        */
        function initPagination() {
            // count entries inside the hidden content
            var num_entries = jQuery('#hiddenresult div.result').length;
            // Create content inside pagination element
            $("#Pagination").pagination(num_entries, {
                callback: pageselectCallback,
                items_per_page: 1 // Show only one item per page
            });
        }

        function PaginationTest() {
            //                $('#Searchresult a').lightBox({
            //                    maxHeight: 500,
            //                    maxWidth: 600
            //                });
        }

        // When document is ready, initialize pagination
        $(document).ready(function () {
            initPagination();
            //                $('#Searchresult a').lightBox({
            //                    maxHeight: 500,
            //                    maxWidth: 600
            //                });

        });


        function mouseOver() {
            alert("tata");

        }

    </script>
</asp:Content>
