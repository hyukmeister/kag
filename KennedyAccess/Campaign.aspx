<%@ Page Title="Campaign" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Campaign.aspx.cs" Inherits="KennedyAccess.Campaign" %>

<%@ Register Src="~/Controls/WorkExperience.ascx" TagPrefix="uc1" TagName="WorkExperience" %>
<%@ Register Src="~/Controls/Questionnaire.ascx" TagPrefix="uc2" TagName="Questionnaire" %>
<%@ Register Src="~/Controls/PrevWage.ascx" TagPrefix="uc3" TagName="PrevWage" %>
<%@ Register Src="~/Controls/Attachments.ascx" TagPrefix="uc4" TagName="Attachments" %>
<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc5" TagName="Toggle" %>
<%@ Register Src="~/Controls/CampaignInfo.ascx" TagPrefix="uc6" TagName="CampaignInfo" %>
<%@ Register Src="~/Controls/JobOpportunityInfo.ascx" TagPrefix="uc7" TagName="JobOpportunityInfo" %>



<asp:Content ID="Campaign" ContentPlaceHolderID="MainContent" runat="server">

    <div style="background-image: url('images/kagimg10.jpg'); filter: blur(3px); height: 100px; width: 900px; background-size: cover; background-position: center; position: relative; opacity: 55%; top: 20px">&nbsp;</div>

    <asp:CheckBox ID="cbkJobOpportunityChanged" runat="server" Checked="false" Visible="false" />
   // <asp:CheckBox ID="cbkCampaignChanged" runat="server" Checked="false" Visible="false" />
    <asp:CheckBox ID="cbkPostJobValue" runat="server" Visible="false" />
   <%-- <h2>
        <asp:Label ID="labTitle" runat="server" Text="Campaign & Job Information"></asp:Label></h2>--%>
    <div class="jumbotron" style="width: 900px;">
        <asp:Label ID="lblJobListingID" runat="server" Visible="false">0</asp:Label>
        <asp:Label ID="labCampaignID" runat="server" Visible="false">0</asp:Label>
        <asp:Label ID="labEmployerID" runat="server" Visible="false">0</asp:Label>
        <asp:Label ID="txtEmployerName" runat="server"></asp:Label>

        <asp:CheckBox ID="cbActive" runat="server" Visible="false" />
        <asp:Table ID="tabCampainControl" runat="server" class="table table-hover">

        </asp:Table>
         <uc6:CampaignInfo runat="server" ID="CampaignInfo" />
        <br />
        <br />
       
        <!----- accordion ------>
        <div class="accordion" runat="server" id="accordionFlushCampaign">

            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        <h5>Prevailing Wage</h5>
                    </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushCampaign">
                    <div class="accordion-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <asp:Table ID="Table1" runat="server" class="table table-hover">
                            <asp:TableRow>
                                <asp:TableCell Width="450px" HorizontalAlign="Left">
                                    <asp:DropDownList ID="ddlPrevailingWages" runat="server" Width="220px" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" AutoPostBack="True" Style="border-radius: 8px;" OnSelectedIndexChanged="ddlPrevailingWages_Change" Enabled="false"></asp:DropDownList><br />
                                </asp:TableCell>
                                <asp:TableCell  Width="450px" HorizontalAlign="Right">
                                    <asp:Button ID="btnSavePrevWage" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="CampaginGroup" OnClick="btnSavePrevWage_Click" Visible="false"/>&nbsp;
                                    <asp:Button ID="btnEditPrevWage" runat="server" class="btn btn-primary" CausesValidation="false" Text="Edit" OnClick="btnEditPrevWage_Click" />
                                    <asp:Button ID="btnCancelPrevWage" runat="server" class="btn btn-primary" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancelPrevWage_Click" Visible="false" /><br />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                            <uc3:PrevWage runat="server" ID="contPrevWage" width="100%" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                        <h5>Job Opportunity Information</h5>
                    </button>
                </h2>
                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushCampaign">
                    <div class="accordion-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <uc7:JobOpportunityInfo runat="server" ID="JobOpportunityInfo" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        <h5>Attachments</h5>
                    </button>
                </h2>
                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushCampaign">
                    <div class="accordion-body">
                        <uc4:Attachments runat="server" ID="contAttachments" />
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                        <h5>Questionnaire</h5>
                    </button>
                </h2>
                <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushCampaign">
                    <div class="accordion-body">
                        <uc2:Questionnaire runat="server" ID="Questionnaire" Width="100%" />
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h5 class="accordion-header" id="flush-headingSix">
                    <asp:Button runat="server" ID="btnApplications" OnClick="btnApplications_Click" BorderStyle="None" BackColor="Transparent" Height="70px" CausesValidation="false" Text="  Applications" Font-Bold="True" />
                </h5>
            </div>

            <div id="divOL" runat="server" visible="false"><br />
                <h5><b>&nbsp;&nbsp;&nbsp;Offer Letter</b></h5>
                <asp:TextBox ID="txtOfferLetter" runat="server" Width="100%" TextMode="MultiLine" Rows="8"></asp:TextBox>
                <asp:Button ID="btnSaveOfferLetter" runat="server" class="btn btn-primary" Text="Save Offer Letter" CausesValidation="false" OnClick="btnSaveOfferLetter_Click" /><br />
                <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server"  DisplaySourceTab="true" TargetControlID="txtOfferLetter"></ajaxToolkit:HtmlEditorExtender>
            </div>
        </div>
            
    </div>

</asp:Content>
