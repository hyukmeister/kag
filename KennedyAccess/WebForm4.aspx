<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="KennedyAccess.WebForm4" %>

<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc1" TagName="Toggle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>                
                <uc1:Toggle runat="server" ID="Toggle1" EnableViewState="true" />
                <uc1:Toggle runat="server" ID="Toggle2" EnableViewState="true" />
            </ContentTemplate>
        </asp:UpdatePanel>

    <asp:Button ID="Button1" runat="server" Text="Enable" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Switch" OnClick="Button2_Click" />
</asp:Content>

