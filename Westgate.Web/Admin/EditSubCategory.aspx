<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master"  CodeBehind="EditSubCategory.aspx.cs" Inherits="Westgate.Web.Admin.EditSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="EditSubcategoryLabel" runat="server">Edit Subcategory</asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog" title="Add Story">
        <iframe id="dFrame" width="480" height="300" frameborder="0"></iframe>
    </div>    

       <asp:Panel runat="server" ID="message" Visible="false">
            <asp:Label CssClass="successStyle" ID="successMessage" runat="server" Text="Subcategory Saved."></asp:Label>
        </asp:Panel>
    <div>
        <div class="labelStyle">
            <asp:Label ID="Name" runat="server" Text="Name" Width="100px"></asp:Label>
            <asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px"></asp:TextBox>
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

    <div style="width:97%">
        <hr />
    </div>
    <div style="height:50px">
        <div class="labelStyle" style="float:left;width:445px;text-align:left;padding-top:5px;font-size:14pt;">
            List of Stories
        </div>
        <div style="float:left;">
            <div class="linkButtonStyle">
                <a href="javascript:addStory('<%=Request["subcategoryId"]%>');">Add Story</a>
            </div>            
        </div>
        <div style="clear:both"></div>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="false"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="StoryId" DataSourceID="edsStories"
            EmptyDataText="No Categories Defined" ForeColor="Black" GridLines="Vertical"
            Width="97%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="StoryId" HeaderText="StoryId" Visible="false" SortExpression="StoryId"
                    ReadOnly="True" />
                <asp:BoundField DataField="SubcategoryId" HeaderText="SubcategoryId" Visible="false"
                    SortExpression="SubcategoryId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField>
                    <ItemTemplate>
                    <div style="width:80px;">
                        <div style="float:left;padding-left:10px">
                            <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl='<%#"~/Admin/EditStory.aspx?StoryId=" + Eval("StoryId") %>' ImageUrl="~/images/edit.png" AlternateText="Edit"/>
                        </div>
                        <div style="float:left;padding-left:10px">
                            <a href="javascript:deleteStory('<%# Eval("StoryId")%>','<%# Eval("SubCategoryId")%>')" onclick="return confirm('Are you sure you want to delete this record?');"><img src="../images/icon_cancel.png" style="border:0px;"/></a>
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
        </asp:GridView>
    </div>
    <asp:EntityDataSource ID="edsStories" runat="server" ConnectionString="name=WestgateEntities"
        DefaultContainerName="WestgateEntities" EnableFlattening="False" EntitySetName="Stories"
        AutoGenerateWhereClause="True"
        Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="SubcategoryId" 
                QueryStringField="subcategoryId" />
        </WhereParameters>
    </asp:EntityDataSource>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true,
                autoOpen: false,
                height: 350,
                width: 520,
                modal: true,
                resizable: false,
                closeText: 'show',
                close: function (ev, ui) {
                   // document.forms[0].submit(); 
                    window.location.href = 'EditSubCategory.aspx?SubcategoryId=<%=Request["subcategoryId"]%>';
                }
            });
        });
	</script>
</asp:Content>

