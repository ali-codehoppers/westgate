<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Blank.Master" AutoEventWireup="true" CodeBehind="StoryContents.aspx.cs" Inherits="Westgate.Web.ajax.StoryContents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div style="text-align:left">
   <div style="width:100%">        
        <h1><asp:label runat="server" text="Label" ID="StorycategoryName"></asp:label></h1>
    </div>
    <div>
        <asp:label runat="server" text="Label" ID="StorycategoryDescription"></asp:label>
    </div>
    <div id="gallery" style="min-height:90px;width:95%">
        <ul class="subImages">
            <asp:repeater runat="server" ID="rptCategories" DataSourceID="edsStorycategories">
                <ItemTemplate>
                    <li>
                        <a href='<%#Eval("BeforeImagePath")%>'>
                            <img src='<%#Eval("BeforeImagePath")%>' alt="" width="70" height="70"/>
                        </a>
                     </li>
                     <li>
                        <a href='<%#Eval("AfterImagePath")%>'>
                            <img src='<%#Eval("AfterImagePath")%>' alt=""  width="70" height="70"/>
                        </a>
                     </li>          
                </ItemTemplate>            
            </asp:repeater>
        </ul>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#gallery a').lightBox();
        });
    </script>
    </div>
    <asp:entitydatasource runat="server" ID="edsStorycategories" 
        ConnectionString="name=WestgateEntities" 
        DefaultContainerName="WestgateEntities" EnableFlattening="False" 
        EntitySetName="Images" AutoGenerateWhereClause="True" Where="">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="StoryId" 
                QueryStringField="StoryId" />
        </WhereParameters>
    </asp:entitydatasource>
</asp:Content>
