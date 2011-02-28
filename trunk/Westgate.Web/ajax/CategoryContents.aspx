<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="CategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.CategoryContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:left">
    <div style="width:100%">        
        <h1><asp:label runat="server" text="Label" ID="categoryName"></asp:label></h1>
    </div>
    <div>
        <asp:label runat="server" text="Label" ID="categoryDescription"></asp:label>
    </div>
    <div>
        <asp:repeater runat="server" ID="rptCategories" DataSourceID="edsSubcategories">
            <ItemTemplate>
                <div>
                    <img src="images/tick_icon.jpg" alt="" width="16" height="16" align="left" style="padding-right:10px;"/>
                    <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>' style="float:left" NavigateUrl='<%# "javascript:OnSubcategoryClick("+Eval("SubcategoryId")+")"%>' CssClass="black_link"></asp:HyperLink>
                </div>
            </ItemTemplate>            
        </asp:repeater>
    </div>
    </div>
    <asp:entitydatasource runat="server" ID="edsSubcategories" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Subcategories" AutoGenerateWhereClause="True" 
        EntityTypeFilter="" Select="" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="CategoryId" 
                QueryStringField="categoryId" />
        </WhereParameters>
    </asp:entitydatasource>
</asp:Content>
