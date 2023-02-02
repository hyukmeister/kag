<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Questionnaires.aspx.cs" Inherits="KennedyAccess.Questionnaires" %>

<%@ Register Src="~/Controls/Questionnaire.ascx" TagPrefix="uc1" TagName="Questionnaire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CheckBox ID="cbkQuestionnaireChanged" runat="server" Checked="false" Visible="false" />
    <h2>
        <asp:Label ID="labSystemQuestionnaires" runat="server" Text="System Questionnaires"></asp:Label>
    </h2><br />
    <div class="jumbotron" style="width: 900px;">
        <uc1:Questionnaire runat="server" ID="Questionnaire" />
    </div>
    
</asp:Content>
