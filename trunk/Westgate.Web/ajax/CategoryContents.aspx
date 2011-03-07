<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="CategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.CategoryContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left">
        <div style="width: 100%">
            <h1 align="left">
                <span style="color: #faa01d">
                    <asp:label runat="server" text="Label" id="categoryName"></asp:label>
                </span>
            </h1>
        </div>
        <div style="width: 100%;">
            <asp:label runat="server" text="Label" id="categoryDescription" style="float: left"></asp:label>
        </div>
        <div id="Searchresult" style="min-height: 200px; float: left; width: 100%">
        </div>
        <asp:label id="Label1" runat="server" text="0" visible="false"></asp:label>
        <div id="hiddenresult" style="display: none;">
            <asp:repeater runat="server" id="rptCategories" datasourceid="edsSubcategories">
                <ItemTemplate>
                <%# Container.ItemIndex % 16 == 0 && Container.ItemIndex % 8 == 0 ? "<div class='result' style='float:left; padding-top:10px;width:100%;'>" :""%>
                 <%# (Container.ItemIndex % 16 == 0 || Container.ItemIndex % 8 == 0)?"<div style='float:left; width:40%'>":"" %>   
                    <div style="padding:5px;clear:both">
                         <img src="images/tick_icon.jpg" alt="" width="16" height="16" align="left" style="padding-right:10px;"/>
                         <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>' style="float:left" NavigateUrl='<%# "javascript:OnSubcategoryClick("+Eval("SubcategoryId")+")"%>' CssClass="black_link"></asp:HyperLink>
                    </div>
                <%# (Container.ItemIndex) == (int.Parse(Label1.Text)-1 ) ? "</div></div>" : ((Container.ItemIndex + 1) % 8 == 0 && (Container.ItemIndex + 1) % 16 == 0) ? "</div></div>" : (Container.ItemIndex + 1) % 8 == 0?"</div>":""%> 
                </ItemTemplate>            
            </asp:repeater>
        </div>
        
    </div>
    <div id="Pagination" class="grey_top">
    </div>
    <asp:entitydatasource runat="server" id="edsSubcategories" connectionstring="name=WestgateEntities"
        defaultcontainername="WestgateEntities" enableflattening="False" entitysetname="Subcategories"
        autogeneratewhereclause="True" entitytypefilter="" select="" where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="CategoryId" 
                QueryStringField="categoryId" />
        </WhereParameters>
    </asp:entitydatasource>
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
