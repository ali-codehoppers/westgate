<%@ Page Title="" Language="C#" MasterPageFile="~/master/mainMaster.Master" AutoEventWireup="true" CodeBehind="subDefault.aspx.cs" Inherits="WGate.services.subDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplace" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(function () {
            $('#gallery a').lightBox();

        });
    </script>
   	<style type="text/css">
	/* jQuery lightBox plugin - Gallery style */
	#gallery {
		background-color: #444;
		padding: 10px;
		width: 520px;
	}
	#gallery ul { list-style: none; }
	#gallery ul li { display: inline; }
	#gallery ul img {
		border: 5px solid #3e3e3e;
		border-width: 5px 5px 20px;
	}
	#gallery ul a:hover img {
		border: 5px solid #fff;
		border-width: 5px 5px 20px;
		color: #fff;
	}
	#gallery ul a:hover { color: #fff; }
	</style>
<div style="width:100%;">
    <div id="gallery" style="min-height:90px;width:95%">
        <ul class="subImages">
            <li>
                <a href="<%=this.ResolveClientUrl("~/images/image1.jpg")%>">
                    <img src="<%=this.ResolveClientUrl("~/images/img_thumb1.jpg")%>" alt="" /></a></li>
            <li>
                <a href="<%=this.ResolveClientUrl("~/images/image1.jpg")%>">
                <img src="<%=this.ResolveClientUrl("~/images/img_thumb1.jpg")%>" alt="" /></a></li>
            <li>
                <a href="<%=this.ResolveClientUrl("~/images/image1.jpg")%>">
                <img src="<%=this.ResolveClientUrl("~/images/img_thumb1.jpg")%>" alt="" /></a></li>
            <li>
                <a href="<%=this.ResolveClientUrl("~/images/image1.jpg")%>">
                <img src="<%=this.ResolveClientUrl("~/images/img_thumb1.jpg")%>" alt="" /></a></li>
        </ul>
    </div>
    
    <div style="width: 95%; min-height: 400px; padding-top: 10px;clear:both" class="grey_welcome">
        <h1 align="left"><span style="color: #faa01d">WEST</span> <span style="color: #4f5456">GATE Architects</span></h1>
        <p style="text-align: justify">
            asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
            asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
            asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
            asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
            asd asd asd asd
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="30" colspan="2" align="left">
                    <h2>Architects</h2>
                </td>
            </tr>
            <tr>
                <td width="5%" align="left" valign="top">
                    <img src="../images/tick_icon.jpg" alt="" width="16" height="16" />
                </td>
                <td width="45%" align="left" valign="top">
                    Architects, Designers &amp; Planning
                </td>
            </tr>
        </table>
        <p style="text-align: justify; padding-top:10px;">
                        asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
                        asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
                        asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
                        asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd
                        asd asd asd asd
         </p>
    </div>
</div>
</asp:Content>
