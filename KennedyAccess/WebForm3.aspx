<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="KennedyAccess.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $(function () {
                $('.toggle').bootstrapToggle();
            });
        });
    </script>
    <h2><asp:Label ID="labUser" runat="server" Text=""></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <input type="checkbox" checked data-toggle="toggle" data-style="toggle" runat="server" id="toggledemo">
                <input runat="server" id="cbkMyActive" type="checkbox" checked data-toggle="toggle" data-onstyle="secondary" data-offstyle="warning" data-style="pill" data-on="Active" data-off="Inactive" data-height="30">
                <asp:Button ID="btnEnabled" runat="server" class="btn btn-primary" OnClick="btnEnabled_Click" Text="Switch"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
</asp:Content>

