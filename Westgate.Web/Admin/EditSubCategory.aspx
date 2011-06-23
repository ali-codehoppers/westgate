<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master"  CodeBehind="EditSubCategory.aspx.cs" Inherits="Westgate.Web.Admin.EditSubCategory" %>
<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function addStory() {
        $("#dFrame").attr("src", 'AddStory.aspx?subcategoryId=<%=Request["subcategoryId"]%>');
        $("#dialog").dialog("open");
    }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
Edit Subcategory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog" title="Add Story">
        <iframe id="dFrame" width="480" height="300" frameborder="0"></iframe>
    </div>    
    <div>
        <uc1:addEdit ID="addEdit1" runat="server" />    
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
                <a href='javascript:addStory();'>Add Story</a>
            </div>            
        </div>
        <div style="clear:both"></div>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
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
                            <asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" ImageUrl="~/images/icon_cancel.png"
                                CommandName="Delete" AlternateText="Delete"/>
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
        EnableDelete="True" AutoGenerateWhereClause="True"
        Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="SubcategoryId" 
                QueryStringField="subcategoryId" />
        </WhereParameters>
    </asp:EntityDataSource>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true, autoOpen: false, height: 350, width: 520, modal: true, resizable: false, closeText: 'show', close: function (ev, ui) { document.forms[0].submit(); }
            });
        });
	</script>
</asp:Content>

