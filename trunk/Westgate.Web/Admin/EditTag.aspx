<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="EditTag.aspx.cs" Inherits="Westgate.Web.Admin.EditTag" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        ul
        {
            list-style-type: none;
            margin: 0px;
            margin-bottom: 2px;
        }
        li
        {
            margin-bottom: 2px;
            color: #333;
            background: none;
            background-color: #CCC;
        }
    </style>
    <script type="text/javascript" src="script/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="script/jscripts/HtmlEditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="EditCategoryLabel" runat="server">Edit Tag</asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog">
        <iframe id="catFrame" width="650" height="430" frameborder="0"></iframe>
    </div>
    <asp:Panel runat="server" ID="message" Visible="false">
        <asp:Label CssClass="successStyle" ID="successMessage" runat="server" Text="Category Saved."></asp:Label>
    </asp:Panel>
    <div>
        <div class="labelStyle">
            <asp:Label ID="Name" runat="server" Text="Name" Width="100px"></asp:Label>
            <asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px"></asp:TextBox>
        </div>
        <div class="labelStyle">
            <asp:Label ID="ShowInTab" runat="server" Text="Show in tabs" Width="100px"></asp:Label>
            <asp:RadioButton ID="RadioButtonYes" runat="server" Text="Yes" GroupName="Controls"
                Width="50px" />
            <asp:RadioButton ID="RadioButtonNo" runat="server" Text="No" GroupName="Controls"
                Width="50px" Checked="true" />
        </div>
        <div class="labelStyle">
            <asp:Label ID="Description" runat="server" Text="Description"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="DescriptionText" runat="server" TextMode="MultiLine" Height="100px"
                Width="97%"></asp:TextBox>
        </div>
        <asp:Button ID="EditButton" runat="server" Text="Save Changes" OnClick="EditButton_Click"
            CssClass="buttonStyle" />
    </div>
    <div style="width: 97%">
        <hr />
    </div>
    <div style="height: 50px">
        <asp:Panel runat="server" ID="messageOrderSaved" Style="display: none;">
            <asp:Label CssClass="successStyle" ID="Label1" runat="server" Text="Images order have been saved sucessfully.."></asp:Label>
        </asp:Panel>
        <div class="labelStyle" style="float: left; width: 405px; text-align: left; padding-top: 15px;
            font-size: 14pt; margin-left: 30px">
            List of Images
        </div>
        <br />
        <div style="margin-right: 60px; margin-bottom: 10px; float: right">
            <div class="linkButtonStyle">
                <a href="javascript:addTagImages('<%=Request["TagId"]%>')">Add Image</a>
            </div>
        </div>
    </div>
    <br />
    <div>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table class="listTableHeader" border="0" style="width: 90%; margin-left: 40px;">
                    <tr>
                        <td style="padding-left: 10px; min-width: 100px;">
                            Name
                        </td>
                        <td style="min-width: 10px">
                        </td>
                        <td style="min-width: 250px">
                            Description
                        </td>
                        <td style="min-width: 10px">
                        </td>
                        <td style="min-width: 100px" align="center">
                            Before<br>
                            Image
                        </td>
                        <td style="min-width: 10px">
                        </td>
                        <td style="min-width: 100px" align="center">
                            After<br>
                            Image
                        </td>
                        <td style="min-width: 10px">
                        </td>
                        <td style="min-width: 125px" align="center">
                            Combined<br>
                            Image
                        </td>
                        <td width="20%">
                            <div style="width: 97%">
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                </table>
                <ul id="sortable" style="width: 90%;">
            </HeaderTemplate>
            <ItemTemplate>
                <li class="ui-state-default">
                    <table border="0">
                        <tr>
                            <td style="padding-left: 10px; min-width: 100px">
                                <%#Eval("Name") %>
                            </td>
                            <td style="min-width: 10px">
                            </td>
                            <td style="min-width: 250px">
                                <%#Eval("Description")%>
                            </td>
                            <td style="min-width: 10px">
                            </td>
                            <td style="min-width: 100px" align="center">
                                <asp:Image ID="Image4" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("BeforeImagePath")) %>'
                                    runat="server" />
                                <br>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>'
                                    Target="_blank">Open</asp:HyperLink>
                            </td>
                            <td style="min-width: 10px">
                            </td>
                            <td style="min-width: 100px" align="center">
                                <asp:Image ID="Image5" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("AfterImagePath")) %>'
                                    runat="server" />
                                <br>
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>'
                                    Target="_blank">Open</asp:HyperLink>
                            </td>
                            <td style="min-width: 10px">
                            </td>
                            <td style="min-width: 125px" align="center">
                                <asp:Image ID="Image6" Width="64" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("CombinedImagePath")) %>'
                                    runat="server" />
                                <br>
                                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>'
                                    Target="_blank">Open</asp:HyperLink>
                            </td>
                            <td style="min-width: 10px">
                            </td>
                            <td style="min-width: 100px">
                                <div style="width: 80px;">
                                    <div style="float: left; padding-left: 10px">
                                        <a href="javascript:deleteImage('<%# Eval("ImageId")%>','<%=Request["TagId"] %>')"
                                            style="text-decoration: none" onclick="return confirm('Are you sure you want to delete this record?');">
                                            <img src="../images/icon_cancel.png" style="border: 0px;" /></a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <%--                    <%#Eval("ImageId")%>
                    <%#Eval("Name") %>
                    <%#Eval("Description")%>
                    <asp:Image ID="Image1" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("BeforeImagePath")) %>'
                        runat="server" />
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("BeforeImagePath") %>'
                        Target="_blank">Open</asp:HyperLink>
                    <asp:Image ID="Image2" Width="32" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("AfterImagePath")) %>'
                        runat="server" />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AfterImagePath") %>'
                        Target="_blank">Open</asp:HyperLink>
                    <asp:Image ID="Image3" Width="64" Height="19" ImageUrl='<%# GetThumbnailImagePath(Eval("CombinedImagePath")) %>'
                        runat="server" />
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("CombinedImagePath") %>'
                        Target="_blank">Open</asp:HyperLink>
                    <div style="width: 80px;">
                        <div style="float: left; padding-left: 10px">
                            <a href="javascript:deleteImage('<%# Eval("ImageId")%>','<%=Request["TagId"] %>')"
                                style="text-decoration: none" onclick="return confirm('Are you sure you want to delete this record?');">
                                <img src="../images/icon_cancel.png" style="border: 0px;" /></a>
                        </div>
                    </div>--%>
                    <%--                    <%#Eval("Name") %> --%>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        <%--		<asp:GridView ID="gvImages" runat="server" BackColor="White" BorderColor="#DEDFDE"
			AllowPaging="True" BorderStyle="None" BorderWidth="1px" CellPadding="4" EmptyDataText="No Images for the Selected Story"
			ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Style="width: 97%">
			<AlternatingRowStyle BackColor="White" />
			<Columns>
				<asp:BoundField DataField="ImageId" HeaderText="ImageId" SortExpression="ImageId" />
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
						<div style="width: 80px;">
							<div style="float: left; padding-left: 10px">
								<a href="javascript:deleteImage('<%# Eval("ImageId")%>','<%=Request["TagId"] %>')"
									style="text-decoration: none" onclick="return confirm('Are you sure you want to delete this record?');">
									<img src="../images/icon_cancel.png" style="border: 0px;" /></a>
							</div>
						</div>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
			<FooterStyle BackColor="#CCCC99" />
			<HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
			<RowStyle BackColor="#CCCCCC" />
			<SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
			<SortedAscendingCellStyle BackColor="#FBFBF2" />
			<SortedAscendingHeaderStyle BackColor="#848384" />
			<SortedDescendingCellStyle BackColor="#EAEAD3" />
			<SortedDescendingHeaderStyle BackColor="#575357" />
		</asp:GridView>--%>
    </div>
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
                    window.location.href = 'EditTag.aspx?tagId=<%=Request["tagId"]%>';
                }
            });

            $("#sortable").sortable({
                connectWith: "#sortable",
                start: function (event, ui) {
                    var start_pos = ui.item.index();
                    ui.item.data('start_pos', start_pos);
                },

                stop: function (event, ui) {
                    var start_pos = ui.item.data('start_pos');
                    var end_pos = ui.item.index();
                    var args = start_pos + ', ' + end_pos;
                    $.ajax({
                        type: "POST",
                        url: "ajax/OrderImages.aspx",
                        data: { TagId: '<%=Request["TagId"]%>', start: start_pos, end: end_pos },
                        success: onSuccess,
                        fail: onFail
                    });

                }
            });
            $("#sortable").disableSelection();
            $('#Repeater1').sortable('serialize');


        });

        function onSuccess(response) {
            $("#ContentPlaceHolder1_messageOrderSaved").show();
            var t = setTimeout("hideMessage()", 2000);
        }


        function hideMessage() {
            $("#ContentPlaceHolder1_messageOrderSaved").hide();
        }

        function onFail(response) {
            alert("An error has occurred while updating order.");
        }

        function SaveImageOrder() {
            $.ajax({
                type: "POST",
                url: "EditTag.aspx",
                data: { SaveOrder: true },
                success: onSuccess,
                fail: onFail
            });
        }

    </script>
</asp:Content>
