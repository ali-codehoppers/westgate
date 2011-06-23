<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="SubcategoryContents.aspx.cs" Inherits="Westgate.Web.ajax.SubcategoryContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="gallery" style="min-height: 90px; width: 95%">
                     
        <ul class="subImages">  
            <asp:repeater runat="server" ID="rptImageCategories">
                <ItemTemplate>
                     <li>
                       <asp:HyperLink runat='server' ID='ImageLink1' Title='<%# Eval("Name")+"\r\n"+Eval("Description")%>' NavigateUrl='<%# Eval("BeforeImagePath").ToString().Replace("~/","")%>'>
                            <asp:Image ID='Image2' runat='server' ImageUrl='<%#GetThumbnailImagePath(Eval("AfterImagePath").ToString().Replace("~/",""))%>' AlternateText='<%# Eval("Name")%>'></asp:Image> 
                       </asp:HyperLink> 
                    </li>   
                    <li style="display:none">
                       <asp:HyperLink runat='server' ID='ImageLink2' Title='<%# Eval("Name")+"\r\n"+Eval("Description")%>' NavigateUrl='<%# Eval("AfterImagePath").ToString().Replace("~/","")%>'>
                            <asp:Image ID='Image3' runat='server' ImageUrl='<%#GetThumbnailImagePath(Eval("BeforeImagePath").ToString().Replace("~/",""))%>' AlternateText='<%# Eval("Name")%>'></asp:Image>
                       </asp:HyperLink> 
                   </li>
                </ItemTemplate>            
            </asp:repeater>
        </ul>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
                $('#gallery a').lightBox({
                    maxHeight: 500,
                    maxWidth: 600
                });

        });
    </script>
                <div style="width: 100%;padding-top:10px">
                <a href="javascript:OnHomeClick();" class="bread_crump">Home</a>
                <span> > </span>
                <asp:HyperLink runat="server" id="categoryLink" cssclass="bread_crump"></asp:HyperLink>
                <span> > </span>
                <asp:HyperLink runat="server" id="subcategoryLink" cssclass="bread_crump"></asp:HyperLink>
            </div>
    <div style="text-align: left">

        <div style="width: 100%;padding-top:10px">

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
            <HeaderTemplate>
                <table border="0" width="100%" cellpadding="0" cellspacing="0" style="margin-top:10px">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td valign="top" align="center" width="36px"><img src="images/tick_icon.jpg" alt="" /></td>
                    <td><span style="font-weight:bold"><%#Eval("Name") %>:</span>&nbsp;<%#Eval("Description") %></td>
                </tr>                
            </ItemTemplate>   
            <FooterTemplate>
                </table>
            </FooterTemplate>         
        </asp:repeater>
        </div>
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
