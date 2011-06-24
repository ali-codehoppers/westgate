<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="SearchContents.aspx.cs" Inherits="Westgate.Web.ajax.SearchContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:label runat="server" id="SearchItems" visible="true" style="font-size: 14; font-weight: bold"></asp:label>
    <div style="float:left;width:100%;">
    <asp:repeater id="Repeater1" runat="server" >
        <ItemTemplate>    
            <%if (Request["search"] != ""){ %>
                <div style="width:40%; float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                <div>
                <strong >
                <asp:HyperLink runat="server" ID="CategoryID" Text='<%#Eval("CategoryId") %>' visible="false"></asp:HyperLink>
                <asp:HyperLink runat="server" ID="NameLink" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnCategoryClick("+Eval("CategoryId")+")"%>'></asp:HyperLink>
                </strong>
                </div>
                <asp:Label runat="server" ID="Desc" Text='<%#Eval("Description") %>' style="white-space:pre-wrap; wdith:300px"></asp:Label>
                </div>
                <div id="gallery0" style="width:58%;float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                    <ul class="subImages">
                    <asp:Repeater ID="imageCategoryRepeater" runat="server">
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
                    </asp:Repeater>
                    </ul>
                </div>
                <div style="clear:both;padding-bottom:10px;">
                </div>
            <%} %>

        </ItemTemplate>
   </asp:repeater>
   </div>
   <div style="clear:both; ">
   </div>
       <div style="float:left;width:100%">
    <asp:repeater id="Repeater2" runat="server">
        <ItemTemplate>    
            <%if (Request["search"] != "")
              { %>
                <div style="width:40%; float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                <div>
                <strong >
                <asp:HyperLink runat="server" ID="SubcategoryID" Text='<%#Eval("SubcategoryId") %>' visible="false"></asp:HyperLink>
                <asp:HyperLink runat="server" ID="NameLink" Text='<%#Eval("Name") %>' NavigateUrl='<%#  "javascript:OnSubcategoryClick("+Eval("SubcategoryId")+")"%>'></asp:HyperLink>
                </strong>
                </div>
                <asp:Label runat="server" ID="Desc" Text='<%#Eval("Description") %>' style="white-space:pre-wrap; wdith:300px"></asp:Label>
                </div>
                <div id="gallery1" style="width:58%;float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                    <ul class="subImages">
                    <asp:Repeater ID="imageSubcategoryRepeater" runat="server">
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
                    </asp:Repeater>
                    </ul>
                </div>
                <div style="clear:both;padding-bottom:10px;">
                </div>
            <%} %>
        </ItemTemplate>
   </asp:repeater>
      </div>
   <div style="clear:both">
   </div>
       <div style="float:left;width:100%">
    <asp:repeater id="Repeater3" runat="server">
        <ItemTemplate>    
            <%if (Request["search"] != "")
              { %>
                <div style="width:40%; float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                <div>
                <strong >
                <asp:HyperLink runat="server" ID="StoryID" Text='<%#Eval("StoryId") %>' visible="false"></asp:HyperLink>
                <asp:HyperLink runat="server" ID="NameLink" Text='<%#Eval("Name") %>' NavigateUrl='<%# "javascript:OnStoryClick("+Eval("StoryId")+")"%>'></asp:HyperLink>
                </strong>
                </div>
                <asp:Label runat="server" ID="Desc" Text='<%#Eval("Description") %>' style="white-space:pre-wrap; wdith:300px"></asp:Label>
                </div>
                <div id="gallery2" style="width:58%;float:left; text-align:left; padding-top:10px; padding-bottom:10px;">
                    <ul class="subImages">
                    <asp:Repeater ID="imageStoryRepeater" runat="server">
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
                    </asp:Repeater>
                    </ul>
                </div>
                <div style="clear:both;padding-bottom:10px;">
                </div>
            <%} %>
        </ItemTemplate>
   </asp:repeater>
      </div>
   <div style="clear:both">
   </div>
    <div style="clear: both">
    </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#gallery0 a').lightBox({
                    maxHeight: 500,
                    maxWidth: 500
                });
            });
            $(document).ready(function () {
                $('#gallery1 a').lightBox({
                    maxHeight: 500,
                    maxWidth: 500
                });
            });
            $(document).ready(function () {
                $('#gallery2 a').lightBox({
                    maxHeight: 500,
                    maxWidth: 500
                });
            });
    </script>
</asp:Content>
