<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="TagsList.aspx.cs" Inherits="Westgate.Web.Admin.TagsList" %>

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
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="CategoryLabel" runat="server">Tags List</asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog">
        <iframe id="catFrame" width="650" height="430" frameborder="0"></iframe>
    </div>
    <asp:Panel runat="server" ID="message" Style="display: none;">
        <asp:Label CssClass="successStyle" ID="successMessage" runat="server" Text="Tags order have been saved sucessfully.."></asp:Label>
    </asp:Panel>
    <div style="margin-right: 60px; margin-bottom: 10px; float: right">
        <div class="linkButtonStyle">
            <a href="javascript:addTag()">Add Tag</a>
        </div>
    </div>
    <div>
        <asp:Repeater ID="RepeaterTags" runat="server">
            <HeaderTemplate>
                <table class="listTableHeader" style="width: 90%; margin-left: 40px;">
                    <tr>
                        <td style="padding-left: 10px; min-width: 150px;">
                            <b>Name</b>
                        </td>
                        <td style="min-width: 20px">
                        </td>
                        <td style="min-width: 450px">
                            <b>Description</b>
                        </td>
                        <td style="width: 20px">
                        </td>
                        <td style="min-width: 80px" align="center">
                            <b>Show in
                                <br>
                                Tabs</b>
                        </td>
                        <td style="width: 20px">
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
                            <td style="padding-left: 10px; min-width: 150px">
                                <%#Eval("Name") %>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="min-width: 450px">
                                <%#Eval("Description")%>
                            </td>
                            <td style="min-width: 20px">
                            </td>
                            <td style="width: 50px">
                                <%#Eval("ShowInTabs")%>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td width="100px">
                                <div style="width: 80px;">
                                    <div style="float: left; padding-left: 10px">
                                        <a href="EditTag.aspx?TagId=<%# Eval("TagId")%>" style="text-decoration: none">
                                            <img src="../images/edit.png" style="border: 0px;" /></a>
                                    </div>
                                    <div style="float: left; padding-left: 10px">
                                        <a href="javascript:deleteTag('<%# Eval("TagId")%>')" style="text-decoration: none"
                                            onclick="return confirm('Are you sure you want to delete this record?');">
                                            <img src="../images/icon_cancel.png" style="border: 0px;" /></a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        <%--        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="false"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="TagId" EmptyDataText="No Tag Defined"
            ForeColor="Black" GridLines="Vertical" Width="97%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TagID" HeaderText="TagId" Visible="false" SortExpression="TagId"
                    ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="ShowInTabs" HeaderText="Show In Tabs" SortExpression="ShowInTabs" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="width: 80px;">
                            <div style="float: left; padding-left: 10px">
                                <a href="EditTag.aspx?TagId=<%# Eval("TagId")%>" style="text-decoration: none">
                                    <img src="../images/edit.png" style="border: 0px;" /></a>
                            </div>
                            <div style="float: left; padding-left: 10px">
                                <a href="javascript:deleteTag('<%# Eval("TagId")%>')" style="text-decoration: none"
                                    onclick="return confirm('Are you sure you want to delete this record?');">
                                    <img src="../images/icon_cancel.png" style="border: 0px;" /></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
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
                    window.location.href = "TagsList.aspx";
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
                        url: "ajax/OrderTags.aspx",
                        data: { start: start_pos, end: end_pos },
                        success: onSuccess,
                        fail: onFail
                    });

                }
            });
            $("#sortable").disableSelection();
            $('#RepeaterTags').sortable('serialize');
        });

        function onSuccess(response) {
            $("#ContentPlaceHolder1_message").show();
            var t = setTimeout("hideMessage()", 2000);
        }


        function hideMessage() {
            $("#ContentPlaceHolder1_message").hide();
        }



        function onFail(response) {
            alert("An error has occurred while updating order.");
        }
    </script>
</asp:Content>
