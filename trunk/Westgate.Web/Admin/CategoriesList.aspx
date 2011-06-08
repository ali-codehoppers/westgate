<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="CategoriesList.aspx.cs" Inherits="Westgate.Web.Admin.CategoriesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function addCategory() {
            $("#catFrame").attr("src", "AddCategory.aspx");
            $("#dialog").dialog("open");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="dialog">
    <iframe id="catFrame" width="970" height="900"></iframe>
</div>
<div style="padding-top:10px;padding-bottom:10px">
    <a class="button" href="javascript:addCategory()">Add Category</a>    
</div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
        BorderWidth="1px" CellPadding="4" DataKeyNames="CategoryId" DataSourceID="EntityDataSource1"
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
                            <asp:ImageButton ID="HyperLink1" runat="server" PostBackUrl='<%#"~/Admin/EditCategory.aspx?categoryId=" + Eval("CategoryId") %>' ImageUrl="~/images/edit.png" AlternateText="Edit"/>
                        </div>
                        <div style="float:left;padding-left:10px">
                            <asp:ImageButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" ImageUrl="~/images/icon_cancel.png"
                                CommandName="Delete" AlternateText="Delete"/>
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
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Categories"
        EnableDelete="True">
    </asp:EntityDataSource>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true, autoOpen: false, height: 400, width: 600, modal: true, resizable: false, closeText: 'show', close: function (ev, ui) { window.location.reload() }
            });
        });
	</script>
</asp:Content>
