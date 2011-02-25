<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddImage.aspx.cs" Inherits="Westgate.Web.Admin.AddImage" %>
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
<div><asp:Label ID="Label3" runat="server" Text="Story:" Width="200px"></asp:Label>
    <asp:DropDownList ID="ddlStories" runat="server" DataSourceID="edsStory" 
        DataTextField="Name" DataValueField="StoryId">
    </asp:DropDownList>
</div>
<div>
    <asp:Label ID="Label6" runat="server" Text="Name:" Width="200px"></asp:Label>
    <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
</div>
<div>
    <asp:Label ID="Label8" runat="server" Text="Description:" Width="200px"></asp:Label>
    <asp:TextBox runat="server" ID="tbDescription" TextMode="MultiLine" Rows="10"></asp:TextBox>
</div>
<div>
    <asp:Label ID="Label4" runat="server" Text="Before Image:" Width="200px"></asp:Label>
    <asp:FileUpload ID="fileBeforeImage" runat="server" />
</div>
<div>
    <asp:Label ID="Label5" runat="server" Text="After Image:" Width="200px"></asp:Label>
    <asp:FileUpload ID="fileAfterImage" runat="server" />
</div>
<div>Before Image:</div>
<div><asp:Image ID="imgBefore" runat="server" Visible="false"/></div>
<div>After Image:</div>  
<div><asp:Image ID="imgAfter" runat="server" Visible="false"/></div>
<div>Combined Image:</div>
<div>
    <asp:Image ID="imgCombined" runat="server" Visible="false"/>
</div>
<div>    
    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" 
        Text="Add Image" />
    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
        Text="Update Image" Visible="False" />
</div>
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
</asp:Content>
