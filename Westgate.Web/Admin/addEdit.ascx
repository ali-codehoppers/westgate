<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="addEdit.ascx.cs" Inherits="Westgate.Web.Admin.addEdit" %>
<asp:Label ID="Category" runat="server" Text="Category List" Visible="false"></asp:Label>
<br />
<asp:DropDownList ID="CategoryList" runat="server" Visible="false"></asp:DropDownList>
<br />
<asp:Label ID="SubCategory" runat="server" Text="Subcategory List" Visible="false"></asp:Label>
<br />
<asp:DropDownList ID="SubCategoryList" runat="server" Visible="false"></asp:DropDownList>
<br />
<asp:Label ID="Name" runat="server" Text="Name"></asp:Label>
<br />
<asp:TextBox ID="NameText" runat="server" TextMode="SingleLine" Height="23px" Width="213px" ></asp:TextBox>
<br />
<asp:Label ID="Description" runat="server" Text="Description"></asp:Label>
<br />
<asp:TextBox ID="DescriptionText" runat="server" TextMode="MultiLine" Height="205px" Width="627px"></asp:TextBox>
<br />
<asp:Button ID="AddButton" runat="server" Text="Add" 
    onclick="AddButton_Click" />
<asp:Button ID="EditButton" runat="server" Text="Edit" 
    onclick="EditButton_Click" />