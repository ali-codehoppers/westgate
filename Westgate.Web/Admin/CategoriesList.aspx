<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" EnableEventValidation="true"
    CodeBehind="CategoriesList.aspx.cs" Inherits="Westgate.Web.Admin.CategoriesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function addCategory() {
            $("#catFrame").attr("src", "AddCategory.aspx");
            $("#dialog").dialog("open");
        }
        function editCategory(id) {
            $("#catFrame").attr("src", "EditCategory.aspx?categoryId="+id);
            $("#dialog").dialog("open");
        }
        function deleteCategory(id) {
            window.location.href = "CategoriesList.aspx?deleteId="+id;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="dialog">
    <iframe id="catFrame" width="650" height="430"></iframe>
</div>
<div style="padding-top:10px;padding-bottom:10px">
    <a class="button" href="javascript:addCategory()">Add Category</a>    
</div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
        BorderWidth="1px" CellPadding="4" DataKeyNames="CategoryId"
        EmptyDataText="No Categories Defined" ForeColor="Black" GridLines="Vertical"
        Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" Visible="false" SortExpression="CategoryId"
                ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="NumberOfSubcategories" Visible="false" HeaderText="NumberOfSubcategories"
                SortExpression="NumberOfSubcategories" />
            <asp:TemplateField>
                <ItemTemplate>
                    <div style="width:80px;">
                        <div style="float:left;padding-left:10px">
                            <a href="javascript:editCategory('<%# Eval("CategoryId")%>')" style="text-decoration:none"><img src="../images/edit.png" style="border:0px;"/></a>
                        </div>
                        <div style="float:left;padding-left:10px">
                            <a href="javascript:deleteCategory('<%# Eval("CategoryId")%>')" style="text-decoration:none" onclick="return confirm('Are you sure you want to delete this record?');"><img src="../images/icon_cancel.png" style="border:0px;"/></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true, autoOpen: false, height: 500, width: 700, modal: true, resizable: false, closeText: 'show', close: function (ev, ui) { document.forms[0].submit(); }
            });
        });
	</script>
</asp:Content>
