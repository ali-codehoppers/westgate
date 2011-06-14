<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditStory.aspx.cs" Inherits="Westgate.Web.Admin.EditStory" EnableEventValidation="true"%>

<%@ Register Src="addEdit.ascx" TagName="addEdit" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:addEdit ID="addEdit1" runat="server" />
    <script type="text/javascript">
        function addImage(id) {
            $("#imgframe").attr("src", "addNewImage.aspx?StoryId="+id);
            $("#dialog").dialog("open");
        }
        function editImage(id) {
            $("#imgframe").attr("src", "addNewImage.aspx?imageId=" + id);
            $("#dialog").dialog("open");
        }
        function deleteImage(id,storyId) {
            window.location.href = "EditStory.aspx?StoryId=" + storyId + "&deleteId=" + id;
        }
    </script>
    <div id="dialog">
        <iframe id="imgframe" width="970" height="900"></iframe>
    </div>
    <div style="padding-top:5px;padding-bottom:5px">
        <input onclick="javascript:addImage('<%=Request["StoryId"]%>')" value="Add Image" type="button"/>
    </div>
    <div style="padding-top:5px; padding-bottom:10px">
    <asp:GridView ID="gvImages" runat="server" BackColor="White" BorderColor="#DEDFDE"  AllowPaging="True"
        BorderStyle="None" BorderWidth="1px" CellPadding="4"  
        EmptyDataText="No Images for the Selected Story" ForeColor="Black" GridLines="Vertical"
        AutoGenerateColumns="False" Style="width: 100%"  >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ImageId" HeaderText="ImageId" SortExpression="ImageId"/>
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
                            <a href="javascript:editImage('<%# Eval("ImageId")%>')" style="text-decoration:none"><img src="../images/edit.png" style="border:0px;"/></a>
                        </div>
                        <div style="float:left;padding-left:10px">
                            <a href="javascript:deleteImage('<%# Eval("ImageId")%>','<%=Request["StoryId"] %>')" style="text-decoration:none" onclick="return confirm('Are you sure you want to delete this record?');"><img src="../images/icon_cancel.png" style="border:0px;"/></a>
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

    </div>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true, autoOpen: false, height: 'auto', width: 1000, modal: true, resizable: false, closeText: 'show', close: function (ev, ui) { document.forms[0].submit(); }
            });
        });
	</script>
    
</asp:Content>
