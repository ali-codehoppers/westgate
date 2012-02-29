<%@ Page Title="" Language="C#" MasterPageFile="~/Master/GalleryMaster.Master" AutoEventWireup="true"
    CodeBehind="Gallery.aspx.cs" Inherits="Westgate.Web.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%=this.ResolveClientUrl("~/script/pagination/pagination.css")%>" rel="stylesheet"
        type="text/css" />
    <link href="<%=this.ResolveClientUrl("~/script/pagination/demo.css")%>" rel="stylesheet"
        type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/pagination/jquery.pagination.js")%>"
        type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.css")%>"
        rel="stylesheet" type="text/css" />
    <script src="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.js")%>"
        type="text/javascript"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 5px">
        <div id="Searchresult" style="min-height: 450px; float: left; width: 100%">
        </div>
    </div>
    <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
    <div id="hiddenresult" style="display: none;">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <%# Container.ItemIndex % 24 == 0 ? "<div class='result' style='width:100%;'>" :""%>
                <asp:HyperLink runat="server" ID="link1" NavigateUrl='<%#Eval("CombinedImagePath")%>'>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath"))%>'
                        AlternateText='<%#Eval("Name")%>'></asp:Image>
                </asp:HyperLink>
                <%#(((Container.ItemIndex + 1) % 24 == 0) || (Container.ItemIndex) == (int.Parse(Label1.Text) - 1)) ? "</div>" : ""%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="Pagination" class="grey_top" style="margin-top:10px">
    </div>
    <div style="clear: both">
    </div>
    <script type="text/javascript">
        function pageselectCallback(page_index, jq) {

//            //var new_content = jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone();
//            //$('#Searchresult').empty().append(new_content);
//            $('#Searchresult').empty().append(jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone());


            var new_content = jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone();
            $('#Searchresult').empty().append(new_content);
            //                $("a[rel^='prettyPhoto']").prettyPhoto();
            $('#Searchresult a').lightBox({
                maxHeight: 500,
                maxWidth: 600
            });


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
            $('#Searchresult a').lightBox({
                maxHeight: 500,
                maxWidth: 600
            });
        }

        // When document is ready, initialize pagination
        $(document).ready(function () {
            initPagination();
            $('#Searchresult a').lightBox({
                maxHeight: 500,
                maxWidth: 600
            });

        });
    </script>
</asp:Content>
