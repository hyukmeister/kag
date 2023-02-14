<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="KennedyAccess.WebForm3" %>

<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc1" TagName="Toggle" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="checkbox"]').each(function () {
                CheckboxClick(this);
            });
        });
        function CheckboxClick(sender) {
            var tb2 = document.getElementById('<%=labCheckbox.ClientID%>');
            tb2.textContent = sender.checked ? 'Active' : 'Inactive';
        }
    </script>

    <h2><asp:Label ID="labUser" runat="server" Text="Toggle Checkbox"></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>                
                <div class="form-switch">
                    <input runat="Server" id="cbkActive" class="form-check-input" type="checkbox" role="switch" style="width:80px;height:35px" onclick="CheckboxClick(this)" />
                    <div class="not-clickable" style="pointer-events: none;left:-25px;top:-30px;position:relative;" >
                        <label id="labCheckbox" runat="server" class="form-check-label" for="cbkActive" />
                    </div>
                </div>
                <br />
                <asp:Button ID="btnEnabled" runat="server" class="btn btn-primary" OnClick="btnEnabled_Click" Text="Switch"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

