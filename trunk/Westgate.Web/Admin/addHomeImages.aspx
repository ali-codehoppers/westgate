﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addHomeImages.aspx.cs"
    Inherits="Westgate.Web.Admin.addHomeImages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="<%=this.ResolveClientUrl("~/stylesheet/stylesheet.css")%>" rel="stylesheet"
        type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel runat="server" ID="messageImg" Visible="false">
            <asp:Label runat="server" ID="imageCount" CssClass="messageImage" Text="Limit:10 Maximum Images."></asp:Label>
        </asp:Panel>
        <asp:Panel runat="server" ID="messageSuccessImg" Visible="false">
            <asp:Label runat="server" ID="Label1" CssClass="messageSuccessImage" Text="Images for Home Page added successfully."></asp:Label>
        </asp:Panel>
      <div style="margin-bottom: 10px;margin-top:10px">
        <div class="linkButtonStyle">
            <asp:LinkButton runat="server" ID="UpdateHomeImages" OnClick="updateImages">Update</asp:LinkButton>
        </div>
      </div>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=WestgateEntities"
            DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Images">
        </asp:EntityDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ImageId" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical"
            DataSourceID="EntityDataSource1" Style="width: 100%" OnDataBound="checkImages">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="checkItem" />
                        <asp:HiddenField runat="server" ID="ImageHiddenValue" Value='<%# Eval("ImageId") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ImageId" HeaderText="ImageId" ReadOnly="True" SortExpression="ImageId"
                    Visible="False" />
                <asp:BoundField DataField="StoryId" HeaderText="StoryId" SortExpression="StoryId"
                    Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Before Image" SortExpression="BeforeImagePath">
                    <ItemTemplate>
                        <asp:Image ID="Image1" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("BeforeImagePath")) %>'
                            runat="server" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>'
                            Target="_blank">Open</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="After Image" SortExpression="AfterImagePath">
                    <ItemTemplate>
                        <asp:Image ID="Image2" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("AfterImagePath")) %>'
                            runat="server" />
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>'
                            Target="_blank">Open</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Combined Image" SortExpression="CombinedImagePath">
                    <ItemTemplate>
                        <asp:Image ID="Image3" Width="64" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("CombinedImagePath")) %>'
                            runat="server" />
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>'
                            Target="_blank">Open</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OrderImage" HeaderText="OrderImage" SortExpression="OrderImage"
                    Visible="False" />
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
    </form>
</body>
</html>
