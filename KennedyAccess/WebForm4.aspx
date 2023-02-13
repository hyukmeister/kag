<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="KennedyAccess.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap4-toggle.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

	<input type="checkbox" checked data-toggle="toggle" data-style="toggle" runat="server" id="toggledemo">
    <input runat="server" id="cbkMyActive" type="checkbox" checked data-toggle="toggle" data-onstyle="secondary" data-offstyle="warning" data-style="pill" data-on="Active" data-off="Inactive" data-height="30">

    <div class="form-switch">
        <input runat="server" class="form-check-input" type="checkbox" id="cbkActive" style="width:80px;height: 35px">
        <label class="form-check-label" for="cbkActive">Applicant Status</label>
    </div>

</asp:Content>
