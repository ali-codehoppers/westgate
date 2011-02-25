<%@ Page Title="" Language="C#" MasterPageFile="~/Master/mainMaster.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Westgate.Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplace" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grey_welcome" style="padding-top: 10px; height: 100px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="37" colspan="2" align="left">
                    <h1>
                        Welcome to <span style="color: #faa01d">WEST</span> <span style="color: #4f5456">GATE</span></h1>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left" valign="top">
                    West gate a leading London building company, works for domestic and commercial clients
                    throughout London. The company carries out a wide range of general building and
                    interior refurbishment work for residential and commercial clients, including:
                </td>
            </tr>
        </table>
    </div>
    <div id="Searchresult" class="grey_welcome" style="min-height: 200px;">
    </div>
    <div id="hiddenresult" style="display: none;">
                <asp:Repeater ID="CategoryRepeater" runat="server" OnItemDataBound="CategoryRepeater_ItemCommand">
                    <ItemTemplate>
                       <div class="result">                         
                           
                           <div>
                                <h2 style="padding-top:0px; margin-top:0px;">
                                    <asp:HyperLink runat="server" ID="Link1" Text='<%#Eval("Name") %>'></asp:HyperLink>
                                </h2>
                        
                                <asp:Label runat="server" ID="CatId" Text='<%#Eval("CategoryId")%>' Visible="false"></asp:Label>
                                <asp:Repeater ID="subCategoryRepeater" runat="server">
                                    <ItemTemplate>
                                        <img src="images/tick_icon.jpg" alt="" width="16" height="16" />
                                        <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:Repeater>
                           </div>
                           </div>
                    </ItemTemplate>
                </asp:Repeater>
    </div>
    <div id="Pagination" class="grey_top">
    </div>
    <script type="text/javascript">
        function pageselectCallback(page_index, jq) {

            //var new_content = jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone();
            //$('#Searchresult').empty().append(new_content);
            $('#Searchresult').empty().append(jQuery('#hiddenresult div.result:eq(' + page_index + ')').clone());

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
                items_per_page: 2 // Show only one item per page
            });
        }

        // When document is ready, initialize pagination
        $(document).ready(function () {
            initPagination();
        });
    </script>
</asp:Content>
