<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" EnableEventValidation="true"
    CodeBehind="CategoriesList.aspx.cs" Inherits="Westgate.Web.Admin.CategoriesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">Categories List</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding-left:445px;margin-bottom:10px;">
                    <div class="linkButtonStyle">
                        <a  href="AddCategory.aspx">Add Category</a>    
                    </div>
</div>
<div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
        BorderWidth="1px" CellPadding="4" DataKeyNames="CategoryId"
        EmptyDataText="No Categories Defined" ForeColor="Black" GridLines="Vertical"
        Width="97%">
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
</asp:Content>
