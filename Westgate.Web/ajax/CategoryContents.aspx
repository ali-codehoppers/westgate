<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="CategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.CategoryContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: left" >
        <div style="width: 100%">
            <h1 align="left">
                <span style="color: #faa01d">
                    <asp:label runat="server" text="Label" id="categoryName"></asp:label>
                </span>
            </h1>
        </div>
        <div style="width: 100%;">
            <asp:label runat="server" text="Label" id="categoryDescription" style="float: left"></asp:label>
        </div>
        <div>
            <asp:repeater runat="server" id="rptCategories" datasourceid="edsSubcategories">
                <ItemTemplate>
                    <div style="padding:5px;clear:both">
                         <img src="images/tick_icon.jpg" alt="" width="16" height="16" align="left" style="padding-right:10px;"/>
                         <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>' style="float:left" NavigateUrl='<%# "javascript:OnSubcategoryClick("+Eval("SubcategoryId")+")"%>' CssClass="black_link"></asp:HyperLink>
                    </div>
                </ItemTemplate>            
            </asp:repeater>
        </div>
    </div>
    <div style="clear:both">
    </div>
    <asp:entitydatasource runat="server" id="edsSubcategories" connectionstring="name=WestgateEntities"
        defaultcontainername="WestgateEntities" enableflattening="False" entitysetname="Subcategories"
        autogeneratewhereclause="True" entitytypefilter="" select="" where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="CategoryId" 
                QueryStringField="categoryId" />
        </WhereParameters>
    </asp:entitydatasource>
</asp:Content>
