<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="KennedyAccess.WebForm3" %>

<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc1" TagName="Toggle" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/bootstrap4-toggle.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                $(function () {
                    $('.toggle').bootstrapToggle();
                });
            });

            $(function () {
                $CheckboxClick();
            });
        });

        Sys.Application.add_load(function () {
            $(function () {
                $CheckboxClick();
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //find all checkboxes
            var tb1 = document.getElementById('<%=cbkActive.ClientID%>');
            var tb2 = document.getElementById('labCheckbox');
            tb2.textContent = tb1.checked ? 'Active' : 'Inactive'; 
        });

        function CheckboxClick(sender) {
            //var tb1 = document.getElementById('<%=cbkActive.ClientID%>');
            var tb2 = document.getElementById('labCheckbox');
            tb2.textContent = sender.checked ? 'Active' : 'Inactive'; 
        }
    </script>
    <h2><asp:Label ID="labUser" runat="server" Text="Toggle Checkbox"></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <input type="checkbox" checked data-toggle="toggle" data-style="toggle" runat="server" id="toggledemo">
                <input runat="server" id="cbkMyActive" type="checkbox" checked data-toggle="toggle" data-onstyle="secondary" data-offstyle="warning" data-style="pill" data-on="Active" data-off="Inactive" data-height="30">
                <asp:CheckBox ID="cbkMyToggle" runat="server" CssClass="toggle" Checked="true" data-toggle="toggle" data-onstyle="secondary" data-offstyle="warning" data-style="pill" data-on="Active" data-off="Inactive" data-height="30"/>
                
                <div class="form-switch">
                    <input runat="Server" id="cbkActive" class="form-check-input" type="checkbox" role="switch" style="width:80px;height:35px" onclick="CheckboxClick(this)" />
                    <div class="not-clickable" style="pointer-events: none;left:-25px;top:-30px;position:relative;" >
                    <label id="labCheckbox" class="form-check-label" for="cbkActive" />
                    </div>
                </div>
                <br />
                <uc1:Toggle runat="server" id="Toggle1" />
                <asp:Button ID="btnEnabled" runat="server" class="btn btn-primary" OnClick="btnEnabled_Click" Text="Switch"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

