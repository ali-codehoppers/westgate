<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="EditCategory.aspx.cs" Inherits="Westgate.Web.Admin.EditCategory" %>


<%@ Register src="addEdit.ascx" tagname="addEdit" tagprefix="uc1" %>
    
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            function addSubcategory() {
                $("#dFrame").attr("src", 'AddSubcategory.aspx?categoryId=<%=Request["categoryId"]%>');
                $("#dialog").dialog("open");
            }
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
Edit Category
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <uc1:addEdit ID="addEdit1" runat="server" />
    </div>
    <div style="width:97%">
        <hr />
    </div>
    <div style="height:50px">
        <div class="labelStyle" style="float:left;width:445px;text-align:left;padding-top:5px;font-size:14pt;">
            List of Subcategories
        </div>
        <div style="float:left;">
            <div class="linkButtonStyle">
                <a href='javascript:addSubcategory();'>Add Subcategory</a>
            </div>            
        </div>
    </div>
    <div>
        <asp:GridView ID="gvSubcategories" runat="server" AllowPaging="false" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="SubcategoryId" 
            EmptyDataText="No Subcategories Defined" ForeColor="Black" GridLines="Vertical"
            Width="97%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SubcategoryId" HeaderText="SubcategoryId" Visible="false"
                    ReadOnly="True" SortExpression="SubcategoryId" />
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" Visible="false" SortExpression="CategoryId" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="DefaultStoryId" HeaderText="DefaultStoryId" Visible="false"
                    SortExpression="DefaultStoryId" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="width: 80px;">
                            <div style="float: left; padding-left: 10px">
                                <a href="javascript:editSubCategory('<%# Eval("SubCategoryId")%>')" style="text-decoration:none"><img src="../images/edit.png" style="border:0px;"/></a>
                            </div>
                            <div style="float: left; padding-left: 10px">
                                 <a href="javascript:deleteSubCategory('<%# Eval("SubCategoryId")%>','<%# Eval("CategoryId")%>')" style="text-decoration:none" onclick="return confirm('Are you sure you want to delete this record?');"><img src="../images/icon_cancel.png" style="border:0px;"/></a>
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
        </asp:GridView>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                bgiframe: true, autoOpen: false, height: 350, width: 520, modal: true, resizable: false, closeText: 'show', close: function (ev, ui) { document.forms[0].submit(); }
            });
        });
	</script>
</asp:Content>
