<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="StoryList.aspx.cs" Inherits="Westgate.Web.Admin.StoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
        <asp:Label ID="StoryLabel" runat="server">Story List</asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:10px;padding-bottom:10px">
        <asp:LinkButton class="button" ID="HyperLink1" runat="server" PostBackUrl="~/Admin/AddStory.aspx" Text="Add Story" ></asp:LinkButton>
    </div>
    <div style="padding-bottom:10px">
        <asp:Label ID="Label1" runat="server" Text="Category:" Width="200px"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="edsCategory"
            DataTextField="Name" DataValueField="CategoryId">
        </asp:DropDownList>
    </div>
    <div style="padding-bottom:10px">
        <asp:Label ID="Label2" runat="server" Text="Subcategory:" Width="200px"></asp:Label>
        <asp:DropDownList ID="ddlSubcategories" runat="server" AutoPostBack="True" DataSourceID="edsSubcategory"
            DataTextField="Name" DataValueField="SubcategoryId" OnDataBound="ddlSubcategories_DataBound">
        </asp:DropDownList>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="false"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="StoryId" DataSourceID="EntityDataSource1"
            EmptyDataText="No Categories Defined" ForeColor="Black" GridLines="Vertical"
            Width="97%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="StoryId" HeaderText="StoryId" Visible="false" SortExpression="StoryId"
                    ReadOnly="True" />
                <asp:BoundField DataField="SubcategoryId" HeaderText="SubcategoryId" Visible="false"
                    SortExpression="SubcategoryId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField>
                    <ItemTemplate>
                    <div style="width:80px;">
                        <div style="float:left;padding-left:10px">
                            <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl='<%#"~/Admin/EditStory.aspx?StoryId=" + Eval("StoryId") %>' ImageUrl="~/images/edit.png" AlternateText="Edit"/>
                        </div>
                        <div style="float:left;padding-left:10px">
                            <asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" ImageUrl="~/images/icon_cancel.png"
                                CommandName="Delete" AlternateText="Delete"/>
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
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Stories"
        EnableDelete="True" AutoGenerateWhereClause="True" EntityTypeFilter="" Select=""
        Where="">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlSubcategories" DbType="Int32" DefaultValue="0"
                Name="SubcategoryId" PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsCategory" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Categories"
        EntityTypeFilter="Category">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsSubcategory" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Subcategories"
        Where="" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCategory" DefaultValue="0" Name="CategoryId"
                PropertyName="SelectedValue" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
