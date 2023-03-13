<%@ Page Title="Case Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="KennedyAccess.Case" %>

<%@ Register Src="~/Controls/DropDownCheckBox.ascx" TagPrefix="uc1" TagName="DropDownCheckBox" %>
<%@ Register Src="~/Controls/ApplicantInfo.ascx" TagPrefix="uc2" TagName="ApplicantInfo" %>
<%@ Register Src="~/Controls/UserFiles.ascx" TagPrefix="uc3" TagName="UserFiles" %>
<%@ Register Src="~/Controls/DS260.ascx" TagPrefix="uc4" TagName="DS260" %>
<%@ Register Src="~/Controls/I485.ascx" TagPrefix="uc5" TagName="i485" %>
<%@ Register Src="~/Controls/I140CheckList.ascx" TagPrefix="uc6" TagName="I140CheckList" %>
<%@ Register Src="~/Controls/CampaignInfo.ascx" TagPrefix="uc7" TagName="CampaignInfo" %>
<%@ Register Src="~/Controls/JobOpportunityInfo.ascx" TagPrefix="uc8" TagName="JobOpportunityInfo" %>
<%@ Register Src="~/Controls/ApplicantFamily.ascx" TagPrefix="uc9" TagName="ApplicantFamily" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="labApplicantID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="guid" runat="server" Visible="false"></asp:Label>
    <h2><asp:Label ID="labApplicant" runat="server" Text=""></asp:Label></h2>
    <uc2:ApplicantInfo runat="server" ID="ApplicantInfo" /><br />

    <h2><asp:Label ID="Label1" runat="server" Text="Forms & Files"></asp:Label></h2>
    <div class="accordion" id="accordionFlush" runat="server">
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingSix">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                <h5>Family Members</h5>
                </button>
            </h2>
            <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlush">
                <div class="accordion-body">
                    <uc9:ApplicantFamily runat="server" ID="ApplicantFamily" />
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                <h5>ETA 9089 Application for Permanent Employment Certification</h5>
                </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlush">
                <div class="accordion-body">
                    <uc7:CampaignInfo runat="server" ID="CampaignInfo" /><br />
                    <uc8:JobOpportunityInfo runat="server" ID="JobOpportunityInfo" />
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                <h5>I-140 Immigrant Petition for Alien Workers</h5>
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlush">
                <div class="accordion-body">
                    <uc6:I140CheckList runat="server" id="I140CheckList" />
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                <h5>DS-260 Immigrant Visa Electronic Application</h5>
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlush">
                <div class="accordion-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <uc4:DS260 runat="server" id="DS260" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                <h5>I-485 Application to Register Permanent Residence</h5>
                </button>
            </h2>
            <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlush">
                <div class="accordion-body">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <uc5:i485 runat="server" id="I485" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
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
        </div><br /><br />
    </div>
    
</asp:Content>
