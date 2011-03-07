<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="SubcategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.SubcategoryContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="gallery" style="min-height: 90px; width: 95%">
                     
        <ul class="subImages">  
            <asp:repeater runat="server" ID="rptImageCategories">
                <ItemTemplate>
                    <li>
                       <asp:HyperLink runat='server' ID='ImageLink1' NavigateUrl='<%# Eval("AfterImagePath").ToString().Replace("~/","")%>'>                       <asp:Image ID='Image2' runat='server' ImageUrl='<%# Eval("AfterImagePath").ToString().Replace("~/","")%>' AlternateText='<%# Eval("Name")%>'></asp:Image> 
                        
                       </asp:HyperLink> 
                    </li>
                </ItemTemplate>            
            </asp:repeater>
        </ul>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#gallery a').lightBox();
        });
    </script>
    <div style="text-align: left">
        <div style="width: 100%">
            <h1 align="left">
                <span style="color: #faa01d">
                    <asp:label runat="server" text="Label" id="SubcategoryName"></asp:label>
                </span>
            </h1>
        </div>
        <div style="width: 100%">
            <asp:label runat="server" text="Label" id="SubcategoryDescription" style="float: left"></asp:label>
        </div>
        <div style="float:left;width:100%">
            <asp:repeater runat="server" id="rptStoryCategories" datasourceid="edsStories">
            <ItemTemplate>
                <div style="padding:5px;clear:both">
                    <img src="images/tick_icon.jpg" alt="" width="16" height="16" align="left" style="padding-right:10px;"/>
                    <asp:HyperLink runat="server" ID="Link2" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnStoryClick("+Eval("StoryId")+")"%>' CssClass="black_link"></asp:HyperLink>
                </div>
            </ItemTemplate>            
        </asp:repeater>
        </div>
    </div>
    <div style="clear:both">
    </div>
    <asp:entitydatasource runat="server" id="edsStories" connectionstring="name=WestgateEntities"
        defaultcontainername="WestgateEntities" enableflattening="False" entitysetname="Stories"
        autogeneratewhereclause="True" where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="SubcategoryId" 
                QueryStringField="SubcategoryId" />
        </WhereParameters>
        
    </asp:entitydatasource>
</asp:Content>
