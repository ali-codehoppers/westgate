<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true"
    CodeBehind="Images.aspx.cs" Inherits="Westgate.Web.ajax.Images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Repeater ID="rptImages" runat="server">
            <ItemTemplate>
                <li>
                    <img id='<%#"i" + Eval("ImageId")%>'  src='<%#Eval("AfterImagePath")%>' alt='<%#Eval("Name")%>' />                    
			        <div class="panel-content">
                        <img id='<%#"c" + Eval("ImageId")%>' src='<%#Eval("CombinedImagePath")%>' alt='<%#Eval("Name")%>' />				        
			        </div>
                    <div class="panel-overlay">
                        <h3><%#Eval("Name")%></h3>                        
                    </div>
                </li>    
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>
