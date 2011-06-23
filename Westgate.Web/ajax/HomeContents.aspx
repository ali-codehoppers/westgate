<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="HomeContents.aspx.cs" Inherits="Westgate.Web.ajax.HomeContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div style="height: 100px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="37" colspan="2" align="left">
                    <h1>
                        Welcome to <span style="color: #faa01d">WEST</span> <span style="color: #4f5456">GATE</span></h1>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left" valign="top">
                    West Gate a leading London building company, works for domestic and commercial clients
                    throughout London. The company carries out a wide range of general building and
                    interior refurbishment work for residential and commercial clients, including:
                </td>
            </tr>
        </table>
    </div>
    <div id="Searchresult" style="min-height:237px;">
    </div>
    <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
    <div id="hiddenresult" style="display: none;">
                <asp:Repeater ID="CategoryRepeater" runat="server" OnItemDataBound="CategoryRepeater_ItemCommand"> 
                    <ItemTemplate>
                       
                    <%# Container.ItemIndex % 2 == 0?"<div class='result' style='float:left; padding-top:5px;width:90%;'>":"" %>
                           <div style="float:left; width:48%;">
                                <h2 style="padding-top:0px; margin-top:0px;" align="left">
                                    <asp:HyperLink runat="server" ID="Link1" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnCategoryClick("+Eval("CategoryId")+")"%>' style="font: normal 14px 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;
	color: #f99e1b;	padding:0px 0px 0px 0px;margin: 0px 0px 0px 0px;text-decoration:none"></asp:HyperLink>
                                </h2>
                        
                                <asp:Label runat="server" ID="CatId" Text='<%#Eval("CategoryId")%>' Visible="false"></asp:Label>
                                <asp:Repeater ID="subCategoryRepeater" runat="server">
                                    <ItemTemplate>
                                    <%# Container.ItemIndex == 7 ? "<div style='padding-left:32px;clear:both;'><a class='black_link' href='" + "javascript:OnCategoryClick(" + Eval("CategoryId") + ")" + "'>more...</a></div>" : ""%>
                                        <div style='padding-top:5px;width:100%;display:table;<%# Container.ItemIndex >= 7 ? "display:none" :""%>'>
                                            <img src="images/tick_icon.jpg" alt="" width="16" height="16" align="left" style="padding-right:10px;"/>
                                            <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>' style="float:left" NavigateUrl='<%# "javascript:OnSubcategoryClick("+Eval("SubcategoryId")+")"%>' CssClass="black_link"></asp:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                           </div>
                  <%# (Container.ItemIndex % 2 != 0 || Container.ItemIndex==(int.Parse(Label1.Text)-1)) ? "</div>" : ""%>
                                      
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
                items_per_page: 1 // Show only one item per page
            });
        }

        // When document is ready, initialize pagination
        $(document).ready(function () {
            initPagination();
        });
    </script>
</asp:Content>
