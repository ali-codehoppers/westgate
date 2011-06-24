<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="subCategoryList.aspx.cs" Inherits="Westgate.Web.Admin.subCategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function addSubCategory(id) {
            var item = document.getElementById(id).selectedIndex;
            $("#catFrame").attr("src", "AddSubCategory.aspx?CatId=" + item);
            $("#dialog").dialog("open");
        }
        function editSubCategory(id) {
            $("#catFrame").attr("src", "EditSubCategory.aspx?SubcategoryId=" + id);
            $("#dialog").dialog("open");
        }
        function deleteSubCategory(subId, catId) {
            
            window.location.href = "subCategoryList.aspx?deleteId=" + subId+"&CategoryId="+catId;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
        <asp:Label ID="SubcategoryLabel" runat="server">Subcategories List</asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog">
        <iframe id="catFrame" width="650" height="430"></iframe>
    </div>
    <div style="padding-left: 445px; margin-bottom: 10px;">
        <div class="linkButtonStyle">
            <a href="javascript:addSubCategory('<%= ddlCategory.ClientID%>')">Add Subcategory</a>
        </div>
    </div>
    <div style="padding-bottom:10px">
        <asp:Label ID="Label1" runat="server" Text="Category:" Width="200px"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Category_Change"
            DataTextField="Name" DataValueField="CategoryId">
        </asp:DropDownList>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="false"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="SubcategoryId" 
            EmptyDataText="No Subcategories Defined" ForeColor="Black" GridLines="Vertical" Width="97%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SubcategoryId" HeaderText="SubcategoryId" Visible="false"
                    ReadOnly="True" SortExpression="SubcategoryId" />
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" Visible="false" SortExpression="CategoryId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="DefaultStoryId" HeaderText="DefaultStoryId" Visible="false"
                    SortExpression="DefaultStoryId" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="width: 80px;">
                            <div style="float: left; padding-left: 10px">
                                <a href="javascript:editSubCategory('<%# Eval("SubCategoryId")%>')" style="text-decoration:none"><img src="../images/edit.png" style="border:0px;"/></a>
                            </div>
                            <div style="float: left; padding-left: 10px">
                                 <a href="javascript:deleteSubCategory('<%# Eval("SubCategoryId")%>','<%# Eval("CategoryId")%>')" style="text-decoration:none" onclick="return confirm('Are you sure you want to delete this record?');"><img src="../images/icon_cancel.png" style="border:0px;"/></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="#FFFFFF" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#CCCCCC" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

        <script type="text/javascript">
            $(function () {
                $("#dialog").dialog({
                    bgiframe: true, autoOpen: false, height: 500, width: 700, modal: true, resizable: false, closeText: 'show', close: function (ev, ui) { document.forms[0].submit(); }
                });
            });
	</script>
</asp:Content>
