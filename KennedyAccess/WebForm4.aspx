<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="KennedyAccess.WebForm4" %>

<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc1" TagName="Toggle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="checkbox"]').each(function () {
                CheckboxClick(this);
            });
        });

        function CheckboxClick(sender) {
            var tb2 = document.getElementById('lab' + sender.id.substring(3, sender.id.length));
            tb2.textContent = sender.checked ? sender.id : 'No';
        }
    </script>

    <uc1:Toggle runat="server" ID="Toggle1" />
    <uc1:Toggle runat="server" ID="Toggle2" />
    <uc1:Toggle runat="server" ID="Toggle3" />
    
    <asp:Button ID="Button1" runat="server" Text="Check" OnClick="Button1_Click" />
</asp:Content>

