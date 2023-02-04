<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="KennedyAccess.Case" %>

<%@ Register Src="~/Controls/DropDownCheckBox.ascx" TagPrefix="uc1" TagName="DropDownCheckBox" %>
<%@ Register Src="~/Controls/ApplicantInfo.ascx" TagPrefix="uc2" TagName="ApplicantInfo" %>
<%@ Register Src="~/Controls/UserFiles.ascx" TagPrefix="uc3" TagName="UserFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="labApplicantID" runat="server" Visible="false"></asp:Label>
    <h2><asp:Label ID="labApplicant" runat="server" Text=""></asp:Label></h2>
    <uc2:ApplicantInfo runat="server" ID="ApplicantInfo" />

    <div class="accordion" id="accordionFlush" runat="server">
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                <h5>ETA 9089</h5>
                </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush">
                <div class="accordion-body">Pending</div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                <h5>I 140</h5>
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush">
                <div class="accordion-body">Pending</div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                <h5>DS 260</h5>
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush">
                <div class="accordion-body">Pending</div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                <h5>I 485</h5>
                </button>
            </h2>
            <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush">
                <div class="accordion-body">Pending</div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFive">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                <h5>Files</h5>
                </button>
            </h2>
            <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlush">
                <div class="accordion-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <uc3:UserFiles runat="server" ID="UserFiles" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
