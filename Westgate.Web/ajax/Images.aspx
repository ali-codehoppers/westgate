<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="Images.aspx.cs" Inherits="Westgate.Web.ajax.Images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul id="photos" class="galleryview">
        <asp:Repeater ID="rptImages" runat="server">
            <ItemTemplate>
                <li>
                    <img src='<%#Eval("AfterImagePath")%>' alt='<%#Eval("Name")%>' />                    
			        <div class="panel-content">
                        <img src='<%#Eval("CombinedImagePath")%>' alt='<%#Eval("Name")%>' />				        
			        </div>
                    <div class="panel-overlay">
                        <h3><%#Eval("Name")%></h3>                        
                    </div>
                </li>    
            </ItemTemplate>
        </asp:Repeater>
    </ul>

</asp:Content>
