<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNewImage.aspx.cs" Inherits="Westgate.Web.Admin.addNewImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField runat="server" ID="BeforeImageWidth" />
<asp:HiddenField runat="server" ID="BeforeImageHeight" />
<asp:HiddenField runat="server" ID="AfterImageWidth" />
<asp:HiddenField runat="server" ID="AfterImageHeight" />
<asp:HiddenField runat="server" ID="ActualBeforeImageWidth" />
<asp:HiddenField runat="server" ID="ActualBeforeImageHeight" />
<asp:HiddenField runat="server" ID="ActualAfterImageWidth" />
<asp:HiddenField runat="server" ID="ActualAfterImageHeight" />
<asp:HiddenField runat="server" ID="BeforeImageX1"/>
<asp:HiddenField runat="server" ID="BeforeImageX2"/>
<asp:HiddenField runat="server" ID="BeforeImageY1"/>
<asp:HiddenField runat="server" ID="BeforeImageY2"/>
<asp:HiddenField runat="server" ID="AfterImageX1" />
<asp:HiddenField runat="server" ID="AfterImageX2" />
<asp:HiddenField runat="server" ID="AfterImageY1" />
<asp:HiddenField runat="server" ID="AfterImageY2" />
    <div style="width:100%;">
    <asp:Label runat="server" ID="ErrorLabel" Visible="false" style="Color:Red" Text="Image size exceeded by 10MB Restriction."></asp:Label>
    </div>
    <div><asp:Label ID="Label1" runat="server" Text="Category:" Width="200px"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
            DataSourceID="edsCategory" DataTextField="Name" DataValueField="CategoryId" OnDataBound="ddlCategories_DataBound">
        </asp:DropDownList>
    </div>
<div><asp:Label ID="Label2" runat="server" Text="Subcategory:" Width="200px"></asp:Label>
    <asp:DropDownList ID="ddlSubcategories" runat="server" AutoPostBack="True" 
        DataSourceID="edsSubcategory" DataTextField="Name" 
        DataValueField="SubcategoryId" OnDataBound="ddlSubcategories_DataBound">
    </asp:DropDownList>
    </div>
<div><asp:Label ID="Label3" runat="server" Text="Story:" Width="200px"></asp:Label>
    <asp:DropDownList ID="ddlStories" runat="server" DataSourceID="edsStory" 
        DataTextField="Name" DataValueField="StoryId" OnDataBound="ddlStories_DataBound">
    </asp:DropDownList>
</div>
<div>
    <asp:Label ID="Label6" runat="server" Text="Name:" Width="200px"></asp:Label>
    <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbName"
          ErrorMessage="*" Display="Dynamic" Style="color: Red"> 
    </asp:RequiredFieldValidator>
</div>
<div>
    <asp:Label ID="Label8" runat="server" Text="Description:" Width="200px"></asp:Label>
    <asp:TextBox runat="server" ID="tbDescription" TextMode="MultiLine" Rows="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbDescription"
          ErrorMessage="*" Display="Dynamic" Style="color: Red"> 
    </asp:RequiredFieldValidator>
</div>
<div>
    <asp:Label ID="Label4" runat="server" Text="Before Image:" Width="200px"></asp:Label>
    <asp:FileUpload ID="fileBeforeImage" runat="server" />
</div>
<div>
    <asp:Label ID="Label5" runat="server" Text="After Image:" Width="200px"></asp:Label>
    <asp:FileUpload ID="fileAfterImage" runat="server" />
</div>
    <asp:HiddenField ID="BeforeAcutalImage" runat="server"/>
<div style="float:left; width:470px">
    <div>Before Image:</div>
    <div><asp:Image ID="imgBefore" runat="server" Visible="false"/></div>

</div>
<div id="beforeCrop" style="float:left; width:0px"></div>
    <asp:HiddenField ID="AfterActualImage" runat="server"/>
<div style="float:left; width:500px">
    <div>After Image:</div>  
    <div><asp:Image ID="imgAfter" runat="server" Visible="false"/></div>
</div>
<div id="afterCrop"></div>
<div style="clear:both">
    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" 
        Text="Add Image" />
    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
        Text="Update Image" Visible="false" />
<asp:Button ID="btnDelete" runat="server" Text="Delete Image" Visible="false" OnClick="btnDelete_Click"/>
</div>
<div style="clear:both">
    <div>Combined Image:</div>
    <div>
        <asp:Image ID="imgCombined" runat="server" Visible="false" />
    </div>
</div>
<div>    

</div>
    <asp:EntityDataSource ID="edsCategory" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Categories" EntityTypeFilter="Category">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsSubcategory" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Subcategories" Where="" AutoGenerateWhereClause="True" 
        EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCategory" DefaultValue="0" 
                Name="CategoryId" PropertyName="SelectedValue" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsStory" runat="server" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Stories" Where="" AutoGenerateWhereClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlSubcategories" DefaultValue="0" 
                Name="SubcategoryId" PropertyName="SelectedValue" DbType="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
        </div>
    </form>
</body>
</html>
