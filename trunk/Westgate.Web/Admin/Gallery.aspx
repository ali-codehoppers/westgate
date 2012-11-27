<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="Gallery.aspx.cs" Inherits="Westgate.Web.Admin.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="EditCategoryLabel" runat="server">Gallery</asp:Label>
    <script src="<%=this.ResolveClientUrl("~/script/jquery-1.5.1.min.js")%>" type="text/javascript"></script>
    <script src="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.js")%>"
        type="text/javascript"></script>
    <link href="<%=this.ResolveClientUrl("~/script/lightbox/jquery.lightbox-0.5.css")%>"
        rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 20px;">
        <div style="width: 20%; border: 2px solid #CCC; min-height: 200px; float: left; display:none">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="gallery_repeater" style="float: center; height: 38px;">
                        <div style="padding-top: 10px;">
                            <%#Eval("Name")=="All" ? "<b>" : ""%>
                            <asp:HyperLink ID="Linking1" class="grey_top" runat="server" NavigateUrl='<%# "Gallery.aspx?tagId="+Eval("TagId")+""%>'
                                Text='<%# Eval("Name")%>'></asp:HyperLink>
                            <%#Eval("Name")=="All" ? "</b>" : ""%>
                        </div>
                        <%#Eval("Name") == "All" ? "<hr style=\" border: 1.5px solid #ccc;\" />" : ""%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="width: 98%; float: left">
            <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
            <div id="Searchresult" style="margin: 5px; padding-bottom: 10px">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div id='imageContainer_<%#Container.ItemIndex%>' style="margin: 3px; padding: 5px; padding-right:0px;
                            float: left; border: 1px solid #ccc; min-width: 130px; min-height: 110px; max-width: 125px;
                            max-height: 110px;">
                            <div style="float: left">
                                <asp:HyperLink runat="server" ID="link1" NavigateUrl='<%#"AddImageNew.aspx?imageId="+Eval("ImageId")%>'>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#GetThumbnailPath(Eval("ImageId").ToString())%>'
                                        AlternateText='<%#Eval("Name")%>' Style="border-style: none; min-width: 98px;
                                        max-width: 100px; min-height: 98px; max-height: 100px; "
                                        OnMouseOver="SelectImage(id)" onMouseOut="DeSelectImage(id)"></asp:Image>
                                </asp:HyperLink>
                            </div>
                            <div style="" id='<%#Container.ItemIndex%>'>
                                <div style="padding-bottom:10px;">
                                    <img style="max-width: 15px;cursor:pointer" src="../images/icon_cancel.png" onclick='javascript:DeleteImage(<%#Container.ItemIndex%>,<%#Eval("ImageId")%> )' />
                                </div>
                                <div>
                                    <img id='<%#Container.ItemIndex%>Img' style="max-width: 15px;cursor:pointer" src="<%# (Eval("HomeImage")).ToString().Equals("False")?"../images/unsave_home.png":"../images/save_home.png"%>" onclick='javascript:SelectImageHome(<%#Container.ItemIndex%>,<%#Eval("ImageId")%>)'/>
                                </div>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function SelectImage(id) {
            var image = document.getElementById(id);
            image.setAttribute("style", "border-style:solid;  border-color:#fab647; min-width:98px; max-width:105px; min-height:98px; max-height:105px");

        }

        function DeSelectImage(id) {
            var image = document.getElementById(id);
            image.setAttribute("style", "border-style:none;  border-color:#fab647; min-width:98px; max-width:105px; min-height:98px; max-height:105px");

        }

        function ShowImage(id) {
            var image = document.getElementById(id);
            image.setAttribute("style", "max-width:15px; padding:1px; margin:0px; position:relative; top:25px; left:80px; display:block");
            //image.setAttribute("style", "padding:0px; margin:0px; top:15px; left:90px;");
            //$('#' + id).show();
        }

        function DeShowImage(id) {
            var image = document.getElementById(id);
            image.setAttribute("style", "max-width:15px; padding:1px; margin:0px; position:relative; top:25px; left:80px; display:none");
            //image.setAttribute("style", "padding:0px; margin:0px; top:15px; left:90px;");
            //$('#' + id).hide();
        }

        function DeleteImage(id, imgId) {
            var answer=false;
            var tagId =  parseInt(<%=Request["tagId"]%>);
            if(isNaN(tagId) ||  tagId<1)
            {
                answer = confirm("This will remove the image from database and from all its associated tags.");
            }
            else
                answer = confirm("This will remove the image from current tag.");

            if (answer) {
                var imageContainer = document.getElementById("imageContainer_" + id);
                $('#imageContainer_' + id).remove();

                $.ajax({
                    type: "POST",
                    url: "ajax/DeleteImage.aspx",
                    data: { tagId: '<%=Request["tagId"]%>', imageId: imgId },
                    success: onSuccess,
                    fail: onFail
                });
            }
        }

        function onSuccess(response) {

        }

        function onFail(response) {
            alert("An error has occurred while updating order.");
        }
        function SelectImageHome(itemId,imgId) {

            $.ajax({
                type: "POST",
                url: "ajax/SelectHomeImage.aspx",
                data: { imageId: imgId },
                success: function(data){
                    if($("#"+itemId+"Img").attr("src")!="undefined" && $("#"+itemId+"Img").attr("src")!="../images/save_home.png"){
                        $("#"+itemId+"Img").attr("src","../images/save_home.png");
                    }else if($("#"+itemId+"Img").attr("src")!="undefined" && $("#"+itemId+"Img").attr("src")=="../images/save_home.png"){
                        $("#"+itemId+"Img").attr("src","../images/unsave_home.png");
                    }
                },
                fail: function(data){
       
                }
            });
        }
    </script>
</asp:Content>
