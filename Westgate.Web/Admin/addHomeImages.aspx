<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addHomeImages.aspx.cs" Inherits="Westgate.Web.Admin.addHomeImages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
            ConnectionString="name=WestgateEntities" 
            DefaultContainerName="WestgateEntities" EnableFlattening="False" 
            EntitySetName="Images">
        </asp:EntityDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ImageId" DataSourceID="EntityDataSource1" style="width:100%">

            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="checkItem" AutoPostBack="true" OnCheckedChanged="SelectItemChange"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ImageId" HeaderText="ImageId" ReadOnly="True" 
                    SortExpression="ImageId" Visible="False" />
                <asp:BoundField DataField="StoryId" HeaderText="StoryId" 
                    SortExpression="StoryId" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
<asp:TemplateField HeaderText="Before Image" 
            SortExpression="BeforeImagePath">

            <ItemTemplate>
                <asp:Image ID="Image1" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("BeforeImagePath")) %>' runat="server"/> 
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>' Target="_blank">Open</asp:HyperLink>              
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="After Image" SortExpression="AfterImagePath">

            <ItemTemplate>
                <asp:Image ID="Image2" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("AfterImagePath")) %>' runat="server"/>  
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>' Target="_blank">Open</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Combined Image" 
            SortExpression="CombinedImagePath">
            <ItemTemplate>
                
                <asp:Image ID="Image3" Width="64" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("CombinedImagePath")) %>' runat="server"/>  
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>' Target="_blank">Open</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField DataField="OrderImage" HeaderText="OrderImage" 
                    SortExpression="OrderImage" Visible="False" />

            </Columns>
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
