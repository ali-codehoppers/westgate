<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddImage.aspx.cs" Inherits="Westgate.Web.Admin.AddImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <script type="text/javascript">
   /* var bfrimgId = '<%= imgBefore.ClientID %>';
    var afrimgId = '<%= imgAfter.ClientID %>';
    if (document.getElementById(bfrimgId) != null && document.getElementById(afrimgId) != null) {
        var beforeWidth = document.getElementById('<%= BeforeImageWidth.ClientID %>').getAttribute('value');
        var beforeHeight = document.getElementById('<%= BeforeImageHeight.ClientID %>').getAttribute('value');
        var beforeQuarterWidth = beforeWidth / 4;
        var beforeQuarterHeight = beforeHeight / 4;
        var AfterWidth = document.getElementById('<%= AfterImageWidth.ClientID %>').getAttribute('value');
        var AfterHeight = document.getElementById('<%= AfterImageHeight.ClientID %>').getAttribute('value');
        var AfterQuarterWidth = AfterWidth / 4;
        var AfterQuarterHeight = AfterHeight / 4;
        var bfrx1 = beforeQuarterWidth;
        if (document.getElementById('<%= BeforeImageX1.ClientID %>').getAttribute('value')!=null && document.getElementById('<%= BeforeImageX1.ClientID %>').getAttribute('value') != "") {
            bfrx1 = document.getElementById('<%= BeforeImageX1.ClientID %>').getAttribute('value');
        }
        var bfrx2 = beforeQuarterWidth*3;
        if (document.getElementById('<%= BeforeImageX2.ClientID %>').getAttribute('value') != null && document.getElementById('<%= BeforeImageX2.ClientID %>').getAttribute('value') != "") {
            bfrx2 = document.getElementById('<%= BeforeImageX2.ClientID %>').getAttribute('value');
        }
        var bfry1 = beforeQuarterHeight;
        if (document.getElementById('<%= BeforeImageY1.ClientID %>').getAttribute('value') != null && document.getElementById('<%= BeforeImageY1.ClientID %>').getAttribute('value') != "") {
            bfry1 = document.getElementById('<%= BeforeImageY1.ClientID %>').getAttribute('value');
        }
        var bfry2 = beforeQuarterHeight*3;
        if (document.getElementById('<%= BeforeImageY2.ClientID %>').getAttribute('value') != null && document.getElementById('<%= BeforeImageY2.ClientID %>').getAttribute('value') != "") {
            bfry2 = document.getElementById('<%= BeforeImageY2.ClientID %>').getAttribute('value');
        }
        var afrx1 = AfterQuarterWidth;
        if (document.getElementById('<%= AfterImageX1.ClientID %>').getAttribute('value') != null && document.getElementById('<%= AfterImageX1.ClientID %>').getAttribute('value') != "") {
            afrx1 = document.getElementById('<%= AfterImageX1.ClientID %>').getAttribute('value');
        }
        var afrx2 = AfterQuarterWidth*3;
        if (document.getElementById('<%= AfterImageX2.ClientID %>').getAttribute('value') != null && document.getElementById('<%= AfterImageX2.ClientID %>').getAttribute('value') != "") {
            afrx2 = document.getElementById('<%= AfterImageX2.ClientID %>').getAttribute('value');
        }
        var afry1 = AfterQuarterHeight;
        if (document.getElementById('<%= AfterImageY1.ClientID %>').getAttribute('value') != null && document.getElementById('<%= AfterImageY1.ClientID %>').getAttribute('value') != "") {
            afry1 = document.getElementById('<%= AfterImageY1.ClientID %>').getAttribute('value');
        }
        var afry2 = AfterQuarterHeight*3;
        if (document.getElementById('<%= AfterImageY2.ClientID %>').getAttribute('value') != null && document.getElementById('<%= AfterImageY2.ClientID %>').getAttribute('value') != "") {
            afry2 = document.getElementById('<%= AfterImageY2.ClientID %>').getAttribute('value');
        }
        function preview(img, selection) {
            var scaleX = document.getElementById('<%=ActualBeforeImageWidth.ClientID %>').getAttribute('value') / (selection.width || 1);
            var scaleY = document.getElementById('<%=ActualBeforeImageHeight.ClientID %>').getAttribute('value') / (selection.height || 1);

            $('#beforeCrop + div > img').css({
                width: Math.round(scaleX * 468) + 'px',
                height: Math.round(scaleY*350) + 'px',
                marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
                marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
            });
            $('input[id=<%= BeforeImageX1.ClientID %>]').val(bfrx1);
            $('input[id=<%= BeforeImageX2.ClientID %>]').val(bfrx2);
            $('input[id=<%= BeforeImageY1.ClientID %>]').val(bfry1);
            $('input[id=<%= BeforeImageY2.ClientID %>]').val(bfry2);
        }
        function preview1(img, selection) {
            var scaleX = AfterWidth / (selection.width || 1);
            var scaleY = AfterHeight / (selection.height || 1);

            $('#afterCrop + div > img').css({
                width: Math.round(scaleX * 468) + 'px',
                height: Math.round(scaleY * 350) + 'px',
                marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
                marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
            });
            $('input[id=<%= AfterImageX1.ClientID %>]').val(afrx1);
            $('input[id=<%= AfterImageX2.ClientID %>]').val(afrx2);
            $('input[id=<%= AfterImageY1.ClientID %>]').val(afry1);
            $('input[id=<%= AfterImageY2.ClientID %>]').val(afry2);
        }
        $(function () {

            $('#<%= imgBefore.ClientID %>').imgAreaSelect({ aspectRatio: '234:175',
                x1: bfrx1, y1: bfry1, x2: bfrx2, y2: bfry2,
                onInit: preview,
                onSelectChange: preview,
                onSelectEnd: function (img, selection) {
                    $('input[id=<%= BeforeImageX1.ClientID %>]').val(selection.x1);
                    $('input[id=<%= BeforeImageX2.ClientID %>]').val(selection.x2);
                    $('input[id=<%= BeforeImageY1.ClientID %>]').val(selection.y1);
                    $('input[id=<%= BeforeImageY2.ClientID %>]').val(selection.y2);
                }
            });
            $('#<%= imgAfter.ClientID %>').imgAreaSelect({ aspectRatio: '234:175',
                x1: afrx1, y1: afry1, x2: afrx2, y2: afry2,
                onInit: preview1,
                onSelectChange: preview1,
                onSelectEnd: function (img, selection) {
                    $('input[id=<%= AfterImageX1.ClientID %>]').val(selection.x1);
                    $('input[id=<%= AfterImageX2.ClientID %>]').val(selection.x2);
                    $('input[id=<%= AfterImageY1.ClientID %>]').val(selection.y1);
                    $('input[id=<%= AfterImageY2.ClientID %>]').val(selection.y2);
                }
            });

        });
    }*/
</script>

</asp:Content>
