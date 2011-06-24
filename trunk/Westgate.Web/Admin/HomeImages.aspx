<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="HomeImages.aspx.cs" Inherits="Westgate.Web.Admin.HomeImages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="padding-top:10px;padding-bottom:10px">
    <a class="button" href="javascript:addHomeImages()">Add Home Images</a>    
</div>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        style="width:100%">
    <Columns>
        <asp:BoundField DataField="ImageId" HeaderText="ImageId" ReadOnly="True" 
            SortExpression="ImageId" Visible="False" />
        <asp:BoundField DataField="StoryId" HeaderText="StoryId" 
            SortExpression="StoryId" Visible="False" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
        <asp:BoundField DataField="BeforeImagePath" HeaderText="BeforeImagePath" 
            SortExpression="BeforeImagePath" />
        <asp:BoundField DataField="AfterImagePath" HeaderText="AfterImagePath" 
            SortExpression="AfterImagePath" />
        <asp:BoundField DataField="CombinedImagePath" HeaderText="CombinedImagePath" 
            SortExpression="CombinedImagePath" />
        <asp:BoundField DataField="OrderImage" HeaderText="OrderImage" 
            SortExpression="OrderImage" Visible="False" />
    <asp:TemplateField>
        <ItemTemplate>
            <asp:ImageButton ID="upButton" ImageUrl="~/images/top_arrow.png" runat="server" />
            <asp:ImageButton ID="downButton" ImageUrl="~/images/down_arrow.png" runat="server"/>
        </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    
    <EmptyDataTemplate>
        No Selected Images
    </EmptyDataTemplate>
    <EmptyDataRowStyle Font-Bold="true"/>
</asp:GridView>
</asp:Content>

