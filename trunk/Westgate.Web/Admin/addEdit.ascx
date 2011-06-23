<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addEdit.ascx.cs" Inherits="Westgate.Web.Admin.addEdit" %>
<div class="labelStyle">
<asp:Label ID="ShowMessage" Visible="false" runat="server" Text="Changes Saved" style="color:red"  ></asp:Label>
</div>
<div class="labelStyle">
<asp:Label  ID="Category" runat="server" Text="Category List" Visible="false"  Width="100px"></asp:Label>
<asp:DropDownList ID="CategoryList" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
</div>
<div class="labelStyle">
<asp:Label  ID="SubCategory" runat="server" Text="Subcategory List" Visible="false" Width="100px"></asp:Label>
<asp:DropDownList ID="SubCategoryList" runat="server" Visible="false"></asp:DropDownList>

</div>
<div>
</div>
<div class="labelStyle">
<asp:Label  ID="Name" runat="server" Text="Name"  Width="100px"></asp:Label>
<asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px" ></asp:TextBox>
</div>
<div class="labelStyle">
<asp:Label  ID="Description" runat="server" Text="Description"  ></asp:Label>
</div>
<div>
<asp:TextBox ID="DescriptionText" runat="server" TextMode="MultiLine" Height="100px" Width="97%"></asp:TextBox>
</div>
<div>
<asp:Button ID="AddButton" runat="server" Text="Add Record" 
    onclick="AddButton_Click" CssClass="buttonStyle"/>
<asp:Button ID="EditButton" runat="server" Text="Save Changes" 
    onclick="EditButton_Click" CssClass="buttonStyle"/>
</div>