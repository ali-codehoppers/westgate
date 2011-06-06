<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="StoryContents.aspx.cs" Inherits="Westgate.Web.ajax.StoryContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="gallery" style="min-height:90px;width:95%">
        <ul class="subImages">
        
            <asp:repeater runat="server" ID="rptCategories">
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
    <div style="width:100%; padding-top:10px;">
        <div style="width: 100%">
            <a href="javascript:OnHomeClick();" class="bread_crump">Home</a>
            <span> > </span>
            <asp:HyperLink runat="server" id="categoryLink" cssclass="bread_crump"></asp:HyperLink>
            <span> > </span>
            <asp:HyperLink runat="server" id="subcategoryLink" cssclass="bread_crump"></asp:HyperLink>
            <span> > </span>
            <asp:HyperLink runat="server" id="storyLink" cssclass="bread_crump"></asp:HyperLink>
        </div>
        <div style="padding-top:10px">       
            <h1 align="left">
                <span style="color: #faa01d">
                    <asp:label runat="server" text="Label" ID="StorycategoryName"></asp:label>
                </span>
            </h1>
        </div> 
    </div>
    <div style="width:100%">
        <asp:label runat="server" text="Label" ID="StorycategoryDescription" style="float:left"></asp:label>
    </div>

    <script type="text/javascript">
    $(document).ready(function () {
            $('#gallery a').lightBox({
                maxHeight: 500,
                maxWidth: 600
            });
    });
    </script>
</asp:Content>
