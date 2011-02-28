<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="Images.aspx.cs" Inherits="Westgate.Web.ajax.Images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="rptImages" runat="server">
            <ItemTemplate>
                <li>
                    <asp:Image runat="server" ImageUrl='<%#Eval("AfterImagePath")%>' AlternateText='<%#Eval("Name")%>'></asp:Image>
                           
			        <div class="panel-content">
                        <asp:Image runat="server" ImageUrl='<%#Eval("CombinedImagePath")%>' AlternateText='<%#Eval("Name")%>'></asp:Image>
			        </div>
                    <div class="panel-overlay">
                        <h3><%#Eval("Name")%></h3>                        
                    </div>
                </li>    
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>
