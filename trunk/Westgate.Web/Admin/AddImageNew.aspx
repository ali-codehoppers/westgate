<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="AddImageNew.aspx.cs" Inherits="Westgate.Web.Admin.AddImageNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .BlockContainer
        {
            background: white;
            cursor: default;
            color: #2A2A2A;
            border: solid 1px #AAAAAA;
            width: 200px;
            min-height: 30px;
        }
        
        .Block
        {
            background-color: #F3F7FD;
            border: solid 1px #BBD8FB;
            padding-bottom: 2px;
            padding-top: 2px;
            padding-left: 7px;
            padding-right: 5px;
            margin: 1px !important;
            width: 182px;
            border-radius: 3px;
        }
        
        
        .BlockName
        {
            color: #2a2a2a;
            padding-left: .2em;
            border: 0px;
            width: 150px;
            min-width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="server">
    <asp:Label ID="EditCategoryLabel" runat="server">Add New Image</asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialog">
        <iframe id="catFrame" width="650" height="430" frameborder="0"></iframe>
    </div>
    <asp:HiddenField runat="server" ID="BeforeImageWidth" />
    <asp:HiddenField runat="server" ID="BeforeImageHeight" />
    <asp:HiddenField runat="server" ID="AfterImageWidth" />
    <asp:HiddenField runat="server" ID="AfterImageHeight" />
    <asp:HiddenField runat="server" ID="ActualBeforeImageWidth" />
    <asp:HiddenField runat="server" ID="ActualBeforeImageHeight" />
    <asp:HiddenField runat="server" ID="ActualAfterImageWidth" />
    <asp:HiddenField runat="server" ID="ActualAfterImageHeight" />
    <asp:HiddenField runat="server" ID="BeforeImageX1" />
    <asp:HiddenField runat="server" ID="BeforeImageX2" />
    <asp:HiddenField runat="server" ID="BeforeImageY1" />
    <asp:HiddenField runat="server" ID="BeforeImageY2" />
    <asp:HiddenField runat="server" ID="AfterImageX1" />
    <asp:HiddenField runat="server" ID="AfterImageX2" />
    <asp:HiddenField runat="server" ID="AfterImageY1" />
    <asp:HiddenField runat="server" ID="AfterImageY2" />
    <div style="width: auto">
        <div style="width: 100%;">
            <asp:Label runat="server" ID="ErrorLabel" Visible="false" Style="color: Red" Text="Image size exceeded by 10MB Restriction."></asp:Label>
        </div>
        <div style="padding: 5px;">
            <asp:Label runat="server" ID="ErrorMsg" Visible="false" Style="color: Red" Text="Before or After image is missing."></asp:Label>
        </div>
        <div class="labelStyle">
            <asp:Label ID="Label6" runat="server" Text="Name:" Width="200px"></asp:Label>
            <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbName"
                ErrorMessage="*" Display="Dynamic" Style="color: Red"> 
            </asp:RequiredFieldValidator>
        </div>
        <div class="labelStyle">
            <asp:Label ID="Label8" runat="server" Text="Description:" Width="200px"></asp:Label>
            <asp:TextBox runat="server" ID="tbDescription" TextMode="MultiLine" Rows="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbDescription"
                ErrorMessage="*" Display="Dynamic" Style="color: Red"> 
            </asp:RequiredFieldValidator>
        </div>
        <div class="labelStyle">
            <asp:Label ID="Label1" runat="server" Text="Tags:" Width="200px"></asp:Label>
            <input id="tags" type="text" />
        </div>
        <div class="labelStyle">
            <div style="width: 200px; float: left">
                <asp:Label ID="Label2" runat="server" Text="Selected Tags:" Width="200px"></asp:Label>
            </div>
            <div id="selectedTagsDiv" class="BlockContainer" style="float: left; margin-left: 5px">
            </div>
        </div>
        <div style="clear: both">
        </div>
        <asp:TextBox ID="textTags" runat="server" Style="visibility: hidden" />
        <div class="labelStyle">
            <asp:Label ID="Label4" runat="server" Text="Before Image:" Width="200px"></asp:Label>
            <asp:FileUpload ID="fileBeforeImage" runat="server" />
        </div>
        <div class="labelStyle">
            <asp:Label ID="Label5" runat="server" Text="After Image:" Width="200px"></asp:Label>
            <asp:FileUpload ID="fileAfterImage" runat="server" />
        </div>
        <asp:HiddenField ID="BeforeAcutalImage" runat="server" />
        <div style="float: left; width: 470px">
            <div class="labelStyle">
                Before Image:</div>
            <div>
                <asp:Image ID="imgBefore" runat="server" Visible="false" /></div>
        </div>
        <div id="beforeCrop" style="float: left; width: 0px">
        </div>
        <asp:HiddenField ID="AfterActualImage" runat="server" />
        <div style="float: left; width: 500px">
            <div class="labelStyle">
                After Image:</div>
            <div>
                <asp:Image ID="imgAfter" runat="server" Visible="false" /></div>
        </div>
        <div id="afterCrop">
        </div>
        <div style="clear: both">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Add Image" />
            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update Image"
                Visible="false" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete Image" Visible="false" OnClick="btnDelete_Click" />
        </div>
        <div style="clear: both">
            <div class="labelStyle">
                Combined Image:</div>
            <div>
                <asp:Image ID="imgCombined" runat="server" Visible="false" />
            </div>
        </div>
        <div>
        </div>
    </div>
    <script type="text/javascript">
        var data;
        var orgData;

        $("#dialog").dialog({
            bgiframe: true,
            autoOpen: false,
            height: 500,
            width: 700,
            modal: true,
            resizable: false,
            closeText: 'show',
            close: function (ev, ui) { //document.forms[0].submit();
                $.ajax({
                    type: "POST",
                    url: "AutoCompleteTags.aspx",
                    data: { SaveOrder: true },
                    success: onSuccess,
                    fail: onFail
                });
                refreshTags();
            }
        });

        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "AutoCompleteTags.aspx",
                data: { SaveOrder: true },
                success: onSuccess,
                fail: onFail
            });
            refreshTags();
        });




        function onSuccess(response) {
            data = response.split('\n');
            orgData = response.split('\n');
            $("#tags")
           .bind("keydown", function (event) {
               if (event.keyCode === $.ui.keyCode.TAB &&
			    $(this).data("autocomplete").menu.active) {
                   event.preventDefault();
               }
           })
           .autocomplete({
               minLength: 0,
               source: function (request, response) {
                   // delegate back to autocomplete, but extract the last term
                   response($.ui.autocomplete.filter(
						data, extractLast(request.term)));
               },
               focus: function () {
                   // prevent value inserted on focus
                   return true;
               },
               select: function (event, ui) {
                   if (this.value != "")
                       addItem(ui.item.value);
                   this.value = "";
                   return false;
               }
           });
           refreshTags();
        }


        $("#tags").keyup(function (event) {
            if (event.keyCode == 13) {
                var text = this.value
                if (orgData.indexOf(text) != -1) {
                    if (this.value != "")
                        addItem(text);
                    this.value = "";
                }
                else {
                    $("#catFrame").attr("src", "AddTag.aspx?tagName=" + text);
                    $("#dialog").dialog("open");
                }
            }
        });

        function onFail(response) {
        }

        function split(val) {
            return val.split(/,\s*/);
        }

        function extractLast(term) {
            return split(term).pop();
        }

        function removeTag(tag) {

            var txtboxId = "<%= textTags.ClientID%>";
            var textBox = document.getElementById(txtboxId);

            var terms = split(textBox.value);

            if (terms.indexOf(tag) != -1) {
                terms.splice(terms.indexOf(tag), 1);
                data.push(tag);
            }
            refreshTags();
            var newValue = terms.join(",");
            textBox.value = newValue;
//            var selectedTags = document.getElementById("selectedTagsDiv");
//            selectedTags.innerHTML = "";

//            for (var i = 0; i < terms.length; i++) {
//                selectedTagsDiv.innerHTML += getItemHtml(terms[i]);
//            }

        }

        function getItemHtml(item) {
            return "<div class=\"Block\">   <span class=\"BlockName\">" + item + "</span>  <div style=\"float:right; height:inherit;padding:7px\" > <img alt=\"Remove this tag\" title=\"Remove this tag\" border=\"0\" src=\"../images/delete.gif\"  onclick=\"javascript: removeTag('" + item + "');\"/></div></div>"
        }

        function addItem(item) {
            var txtboxId = "<%= textTags.ClientID%>";
            var textBox = document.getElementById(txtboxId);

            var terms = split(textBox.value);
            // remove the current input
            if (terms[0].length < 1)
                terms.pop();


            if (terms.indexOf(item) == -1) {
                // add the selected item
                terms.push(item);
                data.splice(data.indexOf(item), 1);
                // add placeholder to get the comma-and-space at the end
                //                   this.value = terms.join(", ");
                textBox.value = terms.join(",");

                var selectedTags = document.getElementById("selectedTagsDiv");
                selectedTagsDiv.innerHTML += getItemHtml(item);
            }
        }

        function refreshTags() {
            var txtboxId = "<%= textTags.ClientID%>";
            var textBox = document.getElementById(txtboxId);

            var terms = split(textBox.value);

            var newValue = terms.join(",");
            textBox.value = newValue;
            var selectedTags = document.getElementById("selectedTagsDiv");
            selectedTags.innerHTML = "";

            for (var i = 0; i < terms.length; i++) {
                if (terms[i].length > 0) {
                    selectedTagsDiv.innerHTML += getItemHtml(terms[i]);
                    if (data.indexOf(terms[i]) != -1) {
                        data.splice(data.indexOf(terms[i]), 1);
                    }
                }
            }
        }


    </script>
</asp:Content>
