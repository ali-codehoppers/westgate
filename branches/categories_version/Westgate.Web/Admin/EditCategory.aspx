<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master"
    CodeBehind="EditCategory.aspx.cs" Inherits="Westgate.Web.Admin.EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="EditCategoryLabel" runat="server">Edit Category</asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog">
        <iframe id="subCatFrame" width="650" height="430" frameborder="0"></iframe>
    </div>
        <asp:Panel runat="server" ID="message" Visible="false">
            <asp:Label CssClass="successStyle" ID="successMessage" runat="server" Text="Category Saved."></asp:Label>
        </asp:Panel>
    <div>
        <div class="labelStyle">
            <asp:Label ID="Name" runat="server" Text="Name" Width="100px"></asp:Label>
            <asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px"></asp:TextBox>
        </div>
        <div class="labelStyle">
            <asp:Label ID="Description" runat="server" Text="Description"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="DescriptionText" runat="server" TextMode="MultiLine" Height="100px"
                Width="97%"></asp:TextBox>
        </div>
        <asp:Button ID="EditButton" runat="server" Text="Save Changes" OnClick="EditButton_Click"
            CssClass="buttonStyle" />
    </div>
    <div style="width: 97%">
        <hr />
    </div>
    <div style="height: 50px">
        <div class="labelStyle" style="float: left; width: 445px; text-align: left; padding-top: 5px;
            font-size: 14pt;">
            List of Subcategories
        </div>
        <div style="float: left;">
            <div class="linkButtonStyle">
                <a href="javascript:addSubcategory('<%=Request["categoryId"]%>')">Add Subcategory</a>
            </div>
        </div>
    </div>
    <div>
        <asp:GridView ID="gvSubcategories" runat="server" AllowPaging="false" AllowSorting="false"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="SubcategoryId" EmptyDataText="No Subcategories Defined"
            ForeColor="Black" GridLines="Vertical" Width="97%">
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
                                <a href="EditSubcategory.aspx?subcategoryId=<%# Eval("SubCategoryId")%>" style="text-decoration: none">
                                    <img src="../images/edit.png" style="border: 0px;" /></a>
                            </div>
                            <div style="float: left; padding-left: 10px">
                                <a href="javascript:deleteSubCategory('<%# Eval("SubCategoryId")%>','<%# Eval("CategoryId")%>')"
                                    style="text-decoration: none" onclick="return confirm('Are you sure you want to delete this record?');">
                                    <img src="../images/icon_cancel.png" style="border: 0px;" /></a>
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
                bgiframe: true,
                autoOpen: false,
                height: 500,
                width: 700,
                modal: true,
                resizable: false,
                closeText: 'show',
                close: function (ev, ui) { //document.forms[0].submit();
                    window.location.href = 'EditCategory.aspx?categoryId=<%=Request["categoryId"]%>';
                }
            });
        });
    </script>
</asp:Content>
