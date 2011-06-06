<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditStory.aspx.cs" Inherits="Westgate.Web.Admin.EditStory" %>

<%@ Register Src="addEdit.ascx" TagName="addEdit" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:addEdit ID="addEdit1" runat="server" />
    <script type="text/javascript">
        function addImage() {
            $("#imgframe").attr("src", "addNewImage.aspx");
            $("#dialog").dialog("open");

        }
    </script>
    <div id="dialog">
        <iframe id="imgframe" width="900" height="900"></iframe>
    </div>
    <div>
        <input onclick="javascript:addImage()" value="Add Image" type="button"/>
    </div>
    <asp:GridView ID="gvImages" runat="server" BackColor="White" BorderColor="#DEDFDE"
        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        EmptyDataText="No Images for the Selected Story" ForeColor="Black" GridLines="Vertical"
        AutoGenerateColumns="False" Style="width: 100%" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:TemplateField HeaderText="Before Image" SortExpression="BeforeImagePath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BeforeImagePath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("BeforeImagePath")) %>'
                        runat="server" />
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>'
                        Target="_blank">Open</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="After Image" SortExpression="AfterImagePath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AfterImagePath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("AfterImagePath")) %>'
                        runat="server" />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>'
                        Target="_blank">Open</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Combined Image" SortExpression="CombinedImagePath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CombinedImagePath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image3" Width="64" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("CombinedImagePath")) %>'
                        runat="server" />
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>'
                        Target="_blank">Open</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ImageId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                     <div style="width:80px;">
                        <div style="float:left;padding-left:10px">
                            <asp:ImageButton ID="HyperLink1" runat="server" PostBackUrl='<%#"~/Admin/AddImage.aspx?imageId=" + Eval("ImageId") %>' ImageUrl="~/images/edit.png" AlternateText="Edit"/>
                        </div>
                        <div style="float:left;padding-left:10px">
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" ImageUrl="~/images/icon_cancel.png"
                                CommandName="Delete" AlternateText="Delete"/>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <script type="text/javascript">
	$(function() {
	
		$( "#dialog" ).dialog({
		    bgiframe: true, autoOpen: false, height: 'auto', width: 900, modal: true, resizable: false
		});
	});
	</script>
    
</asp:Content>
