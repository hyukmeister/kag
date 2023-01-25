<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="KennedyAccess.Case" %>

<%@ Register Src="~/Controls/DropDownCheckBox.ascx" TagPrefix="uc1" TagName="DropDownCheckBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mb-3;" style="width: 220px">
        <uc1:DropDownCheckBox runat="server" id="DropDownEmployers" ControlLabel="Employers"/>
    </div>
    <div class="mb-3;" style="width: 220px">
        <uc1:DropDownCheckBox runat="server" id="DropDownCampaigns" ControlLabel="Campaigns"/>
    </div>

    

</asp:Content>
