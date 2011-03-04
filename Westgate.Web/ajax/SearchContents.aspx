<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="SearchContents.aspx.cs" Inherits="Westgate.Web.ajax.SearchContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label runat="server" ID="SearchItems" Visible=true style="font-size:14; font-weight:bold"></asp:Label>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>    
            <%if(Request["search"]!=""){ %>
                <div style="width:100%; float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                <div>
                <strong >
                <asp:HyperLink runat="server" ID="NameLink" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnCategoryClick("+Eval("CategoryId")+")"%>'></asp:HyperLink>
                </strong>
                </div>
                <asp:Label runat="server" ID="Desc" Text='<%#Eval("Description") %>' style="white-space:pre-wrap; wdith:300px"></asp:Label>
                </div>
            <%} %>
        </ItemTemplate>
   </asp:Repeater>
   <asp:Repeater ID="Repeater2" runat="server">
        <ItemTemplate>    
            <%if(Request["search"]!=""){ %>
                <div style="width:100%; float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                <div>
                <strong >
                <asp:HyperLink runat="server" ID="NameLink" Text='<%#Eval("Name") %>' NavigateUrl='<%#  "javascript:OnSubcategoryClick("+Eval("SubcategoryId")+")"%>'></asp:HyperLink>
                </strong>
                </div>
                <asp:Label runat="server" ID="Desc" Text='<%#Eval("Description") %>' style="white-space:pre-wrap; wdith:300px"></asp:Label>
                </div>
            <%} %>
        </ItemTemplate>
   </asp:Repeater>
   <asp:Repeater ID="Repeater3" runat="server">
        <ItemTemplate>    
            <%if(Request["search"]!=""){ %>
                <div style="width:100%; float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                <div>
                <strong >
                <asp:HyperLink runat="server" ID="NameLink" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnStoryClick("+Eval("StoryId")+")"%>'></asp:HyperLink>
                </strong>
                </div>
                <asp:Label runat="server" ID="Desc" Text='<%#Eval("Description") %>' style="white-space:pre-wrap; wdith:300px"></asp:Label>
                </div>
            <%} %>
        </ItemTemplate>
   </asp:Repeater>
<div style="clear:both">
</div>    
</asp:Content>
