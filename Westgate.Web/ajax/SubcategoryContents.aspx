<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="SubcategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.SubcategoryContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:left">
    <div style="width:100%">        
        <h1><asp:label runat="server" text="Label" ID="SubcategoryName"></asp:label></h1>
    </div>
    <div>
        <asp:label runat="server" text="Label" ID="SubcategoryDescription"></asp:label>
    </div>
    <div>
        <asp:repeater runat="server" ID="rptCategories" DataSourceID="edsSubcategories">
            <ItemTemplate>
                <div>
                    <img src="../images/tick_icon.jpg" alt="" width="16" height="16" />
                    <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnStoryClick("+Eval("StoryId")+")"%>' CssClass="black_link"></asp:HyperLink>
                </div>
            </ItemTemplate>            
        </asp:repeater>
    </div>
    </div>
    <asp:entitydatasource runat="server" ID="edsSubcategories" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Stories" AutoGenerateWhereClause="True" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="SubcategoryId" 
                QueryStringField="SubcategoryId" />
        </WhereParameters>
    </asp:entitydatasource>
</asp:Content>
