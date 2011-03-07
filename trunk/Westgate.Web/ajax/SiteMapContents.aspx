<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="SiteMapContents.aspx.cs" Inherits="Westgate.Web.ajax.SiteMapContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%;float:left">
        <div style="float: left; width: 18%; text-align: left;">
            <strong>
                <asp:hyperlink cssclass="black_link_down" runat="server" id="Link1" text='Company'
                    navigateurl="javascript:OnHomeClick()"></asp:hyperlink>
            </strong>
        </div>
        <div style="width: 81%; float: left; ">
            <asp:repeater id="CategoryRepeater" runat="server" onitemdatabound="CategoryRepeater_ItemCommand">
                 <ItemTemplate>
                     <div style="float:left;width:33%; text-align:left;">
                           <strong>
                               <asp:HyperLink CssClass="black_link_down" runat="server" ID="Link1" Text='<%#Eval("Name") %>'
                                                                    NavigateUrl='<%#"javascript:OnCategoryClick(" + Eval("CategoryId") + ")"%>'></asp:HyperLink>
                            </strong>
                           
                           <asp:Label runat="server" ID="CatId" Text='<%#Eval("CategoryId")%>' Visible="false"></asp:Label>
                           <asp:Repeater ID="subCategoryRepeater" runat="server" onitemdatabound="StoryRepeater_ItemCommand">
                                <ItemTemplate>
                                    <div style="margin-left:10px; ">
                                    <asp:HyperLink CssClass="black_link_down" style="padding-left:2px;padding-right:2px;font-weight:bolder" NavigateUrl='<%#"javascript:OnSubcategoryClick(" + Eval("SubcategoryId") + ")"%>'
                                                 runat="server" ID="Link2" Text='<%#Eval("Name") %>'></asp:HyperLink>
                                    
                                    <asp:Label runat="server" ID="SubCatId" Text='<%#Eval("SubcategoryId")%>' Visible="false"></asp:Label>
                                    <asp:Repeater ID="storyRepeater" runat="server">
                                        <ItemTemplate>
                                            <div style="margin-left:15px; ">
                                            <asp:HyperLink CssClass="black_link_down" NavigateUrl='<%#"javascript:OnStoryClick(" + Eval("StoryId") + ")"%>'
                                                         runat="server" ID="Link3" Text='<%#Eval("Name") %>'></asp:HyperLink>
                                            </div>
                                       </ItemTemplate>
                                    </asp:Repeater>
                                    </div>
                                    
                               </ItemTemplate>
                            </asp:Repeater> 

                      </div>
                      
                 </ItemTemplate>
             </asp:repeater>
        </div>
    </div>

</asp:Content>
