<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="false"
    CodeBehind="HomeImages.aspx.cs" Inherits="Westgate.Web.Admin.HomeImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="HomeImagesLabel" runat="server">Manage Home Images</asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog">
        <iframe id="catFrame" width="650" height="430" frameborder="0"></iframe>
    </div>
    <div style="padding-left: 445px; margin-bottom: 10px;">
        <div class="linkButtonStyle">
            <a href="javascript:addHomeImages()">Add Home Images</a>
        </div>
    </div>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Images" Where="it.OrderImage is not null" 
        OrderBy="it.OrderImage">
        </asp:EntityDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="width: 97%;"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical" 
        onrowcommand="GridView1_RowCommand" DataSourceID="EntityDataSource1">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ImageId" HeaderText="ImageId" ReadOnly="True" SortExpression="ImageId"
                Visible="False" />
            <asp:BoundField DataField="StoryId" HeaderText="StoryId" SortExpression="StoryId"
                Visible="False" />
            <asp:TemplateField >
                <ItemTemplate>
                    <center>
                    <asp:ImageButton ID="deleteButton" ImageUrl="~/images/delete.png" runat="server" CommandName="DeleteImage" CommandArgument='<%# Eval("ImageId") %>' AlternateText="Remove Image from Home Page" OnClientClick="return confirm('Are you sure you want to delete this record?');"/>
                    </center>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:TemplateField HeaderText="Before Image" SortExpression="BeforeImagePath">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>' Target="_blank">
                        <asp:Image ID="Image1" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("BeforeImagePath")) %>' runat="server" />
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="After Image" SortExpression="AfterImagePath">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>' Target="_blank">
                          <asp:Image ID="Image2" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("AfterImagePath")) %>' runat="server" />
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="Combined Image" SortExpression="CombinedImagePath">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>' Target="_blank">
                        <asp:Image ID="Image3" Width="64" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("CombinedImagePath")) %>' runat="server" />
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OrderImage" HeaderText="OrderImage" SortExpression="OrderImage" Visible="False" />
            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField runat="server" ID="hiddenImageId" Value='<%# Eval("ImageId") %>'/>
                    <asp:ImageButton ID="upButton" ImageUrl="~/images/top_arrow.png" runat="server" CommandName="ImageUp" CommandArgument='<%# Eval("ImageId") %>'/>
                    <asp:ImageButton ID="downButton" ImageUrl="~/images/down_arrow.png" runat="server" CommandName="ImageDown" CommandArgument='<%# Eval("ImageId") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No Selected Images
        </EmptyDataTemplate>
        <EmptyDataRowStyle Font-Bold="true" />
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
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true,
                autoOpen: false,
                height: 500,
                width: 700,
                modal: true,
                resizable: false,
                closeText: 'show',
                close: function (ev, ui) { //document.forms[0].submit();
                    window.location.href = "HomeImages.aspx";
                }
            });
        });
    </script>
</asp:Content>
