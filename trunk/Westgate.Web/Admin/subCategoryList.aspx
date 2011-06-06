<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="subCategoryList.aspx.cs" Inherits="Westgate.Web.Admin.subCategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:10px;padding-bottom:10px">
        <asp:Button ID="HyperLink1" runat="server" PostBackUrl="~/Admin/AddSubCategory.aspx" Text="Add Subcategory" />
    </div>
    <div style="padding-bottom:10px">
        <asp:Label ID="Label1" runat="server" Text="Category:" Width="200px"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="edsCategory"
            DataTextField="Name" DataValueField="CategoryId">
        </asp:DropDownList>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="SubcategoryId" DataSourceID="EntityDataSource1"
            EmptyDataText="No Categories Defined" ForeColor="Black" GridLines="Vertical"
            Width="100%">
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
                                <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl='<%#"~/Admin/EditSubCategory.aspx?SubcategoryId=" + Eval("SubCategoryId") %>' ImageUrl="~/images/edit.png" AlternateText="Edit"/>
                            </div>
                            <div style="float: left; padding-left: 10px">
                                <asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" ImageUrl="~/images/icon_cancel.png"
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
    </div>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Subcategories"
        EnableDelete="True" AutoGenerateWhereClause="True" EntityTypeFilter="" Select=""
        Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCategory" DbType="Int32" DefaultValue="0" Name="CategoryId"
                PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsCategory" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Categories"
        EntityTypeFilter="Category">
    </asp:EntityDataSource>
</asp:Content>
