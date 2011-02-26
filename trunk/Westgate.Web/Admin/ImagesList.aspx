<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ImagesList.aspx.cs" Inherits="Westgate.Web.Admin.ImagesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><asp:Label ID="Label1" runat="server" Text="Category:" Width="200px"></asp:Label>
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
        DataSourceID="edsCategory" DataTextField="Name" DataValueField="CategoryId">
    </asp:DropDownList>
</div>
<div><asp:Label ID="Label2" runat="server" Text="Subcategory:" Width="200px"></asp:Label>
    <asp:DropDownList ID="ddlSubcategories" runat="server" AutoPostBack="True" 
        DataSourceID="edsSubcategory" DataTextField="Name" 
        DataValueField="SubcategoryId" ondatabound="ddlSubcategories_DataBound">
    </asp:DropDownList>
</div>
<div><asp:Label ID="Label3" runat="server" Text="Story" Width="200px"></asp:Label>
    <asp:DropDownList ID="ddlStories" runat="server" DataSourceID="edsStory" 
        DataTextField="Name" DataValueField="StoryId" AutoPostBack="True">
    </asp:DropDownList>
</div>
<div>
<asp:GridView ID="gvImages" runat="server" BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="edsImages" 
        EmptyDataText="No Images for the Selected Story" ForeColor="Black" 
        GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="ImageId">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="ImageId" SortExpression="ImageId">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ImageId") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%#"~/Admin/AddImage.aspx?imageId=" + Eval("ImageId") %>' ID="hl12">Edit</asp:HyperLink>
                <asp:LinkButton ID="LinkButton1" Runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');"
                CommandName="Delete">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
        <asp:TemplateField HeaderText="Before Image" 
            SortExpression="BeforeImagePath">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BeforeImagePath") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image Width="32" Height="19" ImageUrl='<%# "~/" + Eval("BeforeImagePath") %>' runat="server"/> 
                <asp:HyperLink runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>' Target="_blank">Open</asp:HyperLink>              
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="After Image" SortExpression="AfterImagePath">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AfterImagePath") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image Width="32" Height="19" ImageUrl='<%#"~/" + Eval("AfterImagePath") %>' runat="server"/>  
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>' Target="_blank">Open</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Combined Image" 
            SortExpression="CombinedImagePath">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" 
                    Text='<%# Bind("CombinedImagePath") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                
                <asp:Image Width="64" Height="19" ImageUrl='<%#"~/" + Eval("CombinedImagePath") %>' runat="server"/>  
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>' Target="_blank">Open</asp:HyperLink>
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
    <asp:EntityDataSource ID="edsCategory" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Categories" EntityTypeFilter="Category">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsSubcategory" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Subcategories" Where="" AutoGenerateWhereClause="True" 
        EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCategory" DefaultValue="0" 
                Name="CategoryId" PropertyName="SelectedValue" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsStory" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Stories" Where="" AutoGenerateWhereClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlSubcategories" DefaultValue="0" 
                Name="SubcategoryId" PropertyName="SelectedValue" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsImages" runat="server" ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EntitySetName="Images" Where="" 
        AutoGenerateWhereClause="True" EnableFlattening="False" 
        EnableDelete="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlStories" DefaultValue="0" Name="StoryId" 
                PropertyName="SelectedValue" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</div>
</asp:Content>

