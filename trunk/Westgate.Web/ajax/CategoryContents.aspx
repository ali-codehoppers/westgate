<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="CategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.CategoryContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <img src="../images/tick_icon.jpg" alt="" width="16" height="16" />
                    <%#Eval("Name")%>
                </div>
            </ItemTemplate>            
        </asp:repeater>
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
