<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="SiteMapContents.aspx.cs" Inherits="Westgate.Web.ajax.SiteMapContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%;float:left">
        <div style="width: 81%; float: left; ">
            <asp:repeater id="TagRepeater" runat="server" onitemdatabound="TagRepeater_ItemCommand">
                 <ItemTemplate>
                     <div style="float:left;width:33%; text-align:left;">
                           <strong>
                               <asp:HyperLink CssClass="black_link_down" runat="server" ID="Link1" Text='<%#Eval("Name") %>'
                                                                    NavigateUrl='<%#"javascript:OnTagClick(" + Eval("TagId") + ")"%>'></asp:HyperLink>
                            </strong>
                           
                           <asp:Label runat="server" ID="TagId" Text='<%#Eval("TagId")%>' Visible="false"></asp:Label>
                      </div>
                      
                 </ItemTemplate>
             </asp:repeater>
        </div>
    </div>

</asp:Content>
