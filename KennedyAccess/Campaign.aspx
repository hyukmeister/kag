<%@ Page Title="Campaign" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Campaign.aspx.cs" Inherits="KennedyAccess.Campaign" %>

<%@ Register Src="~/Controls/WorkExperience.ascx" TagPrefix="uc1" TagName="WorkExperience" %>
<%@ Register Src="~/Controls/Questionnaire.ascx" TagPrefix="uc2" TagName="Questionnaire" %>
<%@ Register Src="~/Controls/PrevWage.ascx" TagPrefix="uc3" TagName="PrevWage" %>
<%@ Register Src="~/Controls/Attachments.ascx" TagPrefix="uc4" TagName="Attachments" %>

<asp:Content ID="Campaign" ContentPlaceHolderID="MainContent" runat="server">

    <div style="background-image:url('images/kagimg10.jpg'); filter:blur(3px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%; top:20px">&nbsp;</div>

    <asp:CheckBox ID="cbkJobOpportunityChanged" runat="server" Checked="false" Visible="false" />
    <h2>
        <asp:Label ID="labTitle" runat="server" Text="Campaign & Job Information"></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Label ID="lblJobListingID" runat="server" Visible="false">0</asp:Label>
        <asp:CheckBox ID="cbActive" runat="server" Visible="false" />

        <asp:Table ID="tabCampaign" runat="server" class="table table-hover">
            <asp:TableRow BackColor="dimgray">
                <asp:TableCell ColumnSpan="2" Width="450px">
                    <div class="mb-3;">
                    <label class="form-label" HorizontalAlign="Left" style="font-size:22px; color:white;">&nbsp;Campaign Information</label>
                    </div>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2" Width="450px" HorizontalAlign="Right">
                    <asp:Button ID="btnEditCampaign" runat="server" class="btn btn-primary" CausesValidation="false" Text="Edit" OnClick="btnEditCampaign_Click" />
                    <asp:Button ID="btnSaveCampaign" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="CampaginGroup" OnClick="btnSaveCampaign_Click" Visible="false" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancel_Click" Visible="false" /><br />
                </asp:TableCell>  
            </asp:TableRow>
            <asp:TableRow ID="trEmployerList">
                <asp:TableCell HorizontalAlign="Left" Width="225px">
                    <div class="mb-3;"><br />  
                    <asp:label class="form-label" runat="server" id="labEmployerList" HorizontalAlign="Left" >Employer List</asp:label><br />
                    </div>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="3" ><br />  
                    <asp:DropDownList ID="ddlEmployerList" runat="server" ValidationGroup="CampaginGroup" Style="border-radius: 8px;"
                        OnSelectedIndexChanged="ddlEmployerList_SelectedIndexChanged" Width="440px" AutoPostBack="true"></asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rvEmployerList" runat="server" ValidationGroup="CampaginGroup" ControlToValidate="ddlEmployerList" 
                            InitialValue="0" ErrorMessage="Employer selection is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><br />
                    <asp:Label runat="server" Text="Employer Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="3"><br />
                    <asp:Label ID="labCampaignID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="labEmployerID" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="txtEmployerName" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;">
                        <asp:TextBox ID="txtCampaignDesc" class="form-control" runat="server" TextMode="MultiLine" Rows="5" placeholder="Campaign Description" Width="100%" ValidationGroup="CampaginGroup" BorderStyle="None"></asp:TextBox>
                        <label for="txtCampaignDesc">Campaign Description</label>
                        <asp:RequiredFieldValidator ID="rfvCampaignDesc" runat="server" ErrorMessage="Campaign Description is rquired" ForeColor="Red" ControlToValidate="txtCampaignDesc" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;" id="divCampaignStartDate" Width="450px">
                        <asp:TextBox ID="txtCampaignStartDate" class="form-control" runat="server" placeholder="Campaign Start Date" BorderStyle="None" TextMode="Date" 
                            ValidationGroup="CampaginGroup" AutoPostBack="true" OnTextChanged="txtCampaignStartDate_TextChanged" ></asp:TextBox>
                        <label for="txtCampaignStartDate">Campaign Start Date</label>
                        <asp:RequiredFieldValidator ID="rfvCampaignStartDate" runat="server" ErrorMessage="Campaign Start Date is rquired" ForeColor="Red" ControlToValidate="txtCampaignStartDate" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
                    </div>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;" Width="450px">
                        <asp:TextBox ID="txtCampaignEndDate" class="form-control" runat="server" placeholder="Campaign End Date" BorderStyle="None" TextMode="Date" 
                            ValidationGroup="CampaginGroup" ></asp:TextBox>
                        <label for="txtCampaignEndDate">Campaign End Date</label>
                        <asp:RequiredFieldValidator ID="rfvCampaignEndDate" runat="server" ErrorMessage="Campaign End Date is rquired" ForeColor="Red" ControlToValidate="txtCampaignEndDate" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
                    </div>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;">
                        <asp:TextBox ID="txtOfferWageFrom" class="form-control" runat="server" placeholder="Offer Wage From" BorderStyle="None"
                            TextMode="Number" step="0.01" OnTextChanged="JobOpportunityChanged">0</asp:TextBox>
                        <label for="txtOfferWageFrom">Offer Wage From</label>
                    </div>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;" >
                        <asp:TextBox ID="txtOfferWageTo" class="form-control" runat="server" placeholder="Offer Wage To (Optional)" BorderStyle="None"
                            TextMode="Number" step="0.01" OnTextChanged="JobOpportunityChanged">0</asp:TextBox>
                        <label for="txtOfferWageTo">Offer Wage To (Optional)</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <asp:Label runat="server" Text="&nbsp;&nbsp;Per: &nbsp; "></asp:Label>
                    <asp:RadioButtonList ID="rblOfferWagePeriod" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" OnSelectedIndexChanged="JobOpportunityChanged" Enabled="false" BorderStyle="None">
                        <asp:ListItem Enabled="True" Text="Hour" Value="h" style="margin-right: 20px;" />
                        <asp:ListItem Enabled="True" Text="Week" Value="w" style="margin-right: 20px;" />
                        <asp:ListItem Enabled="True" Text="Bi-Week" Value="b" style="margin-right: 20px;" />
                        <asp:ListItem Enabled="True" Text="Month" Value="m" style="margin-right: 20px;" />
                        <asp:ListItem Enabled="True" Text="Year" Value="y" style="margin-right: 20px;" />
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvOfferWagePeriod" runat="server" ErrorMessage="Wage Period is rquired" ForeColor="Red" ControlToValidate="rblOfferWagePeriod" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table><br /><br />    
        
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
                        <asp:Table ID="Table1" runat="server" class="table table-hover">
                            <asp:TableRow>
                                <asp:TableCell Width="450px" HorizontalAlign="Left">
                                    <asp:DropDownList ID="ddlPrevailingWages" runat="server" Width="220px" AutoPostBack="True" Style="border-radius: 8px;" OnSelectedIndexChanged="ddlPrevailingWages_Change"></asp:DropDownList><br />
                                </asp:TableCell>
                                <asp:TableCell  Width="450px" HorizontalAlign="Right">
                                    <asp:Button ID="btnSavePrevWage" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="CampaginGroup" OnClick="btnSavePrevWage_Click" />&nbsp;
                                    <asp:Button ID="btnEditPrevWage" runat="server" class="btn btn-primary" CausesValidation="false" Text="Edit" OnClick="btnEditPrevWage_Click" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <uc3:PrevWage runat="server" ID="contPrevWage" width="100%" />
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
                        <asp:Panel ID="panJobOpportunity" runat="server">
                            <asp:Table ID="tabJobOpportunity" runat="server" class="table table-hover">
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <label for="floatingInputGrid">Post Job Opportunity</label>
                                        <asp:RadioButtonList ID="rblI_34_ListJob" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None">
                                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;"/>
                                        </asp:RadioButtonList><br />
                                     </asp:TableCell>
                                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                        <asp:Button ID="btnSaveJobOpportunity" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSaveJobOpportunity_Click" Visible="false" />
                                        <asp:Button ID="btnCancelJobOpportunity" runat="server" class="btn btn-default" CausesValidation="false" Text="Cancel" OnClick="btnCancelJobOpportunity_Click" Visible="false" />&nbsp;
                                        <asp:Button ID="btnEditJobOpportunity" runat="server" class="btn btn-primary" CausesValidation="false" Text="Edit" OnClick="btnEditJobOpportunity_Click" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <br />
                                        <div class="form-floating mb-3;" >
                                            <asp:TextBox ID="txtWorkAddress1" class="form-control" runat="server" placeholder="Work Address 1" OnTextChanged="JobOpportunityChanged" ></asp:TextBox>
                                            <label for="txtWorkAddress1" class="form-label">Work Address 1</label>
                                            <div class="invalid-feedback">Please provide a valid Work Address 1.</div>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="2">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 420px">
                                            <asp:TextBox ID="txtWorkAddress2" class="form-control" runat="server" placeholder="Work Address 2" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtWorkAddress2" class="form-label">Work Address 2</label>
                                            <div class="invalid-feedback">Please provide a valid Work Address 2.</div>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 400px">
                                            <asp:TextBox ID="txtWorkCity" class="form-control" runat="server" placeholder="City" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtWorkCity">City</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="1">
                                        <br />
                                        <asp:Label runat="server" Text="State"></asp:Label><br />
                                        <asp:DropDownList ID="ddlWorkState" runat="server" Style="border-radius: 8px;" OnSelectedIndexChanged="JobOpportunityChanged"></asp:DropDownList>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="1">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 190px">
                                            <asp:TextBox ID="txtWorkPostalCode" class="form-control" runat="server" placeholder="Postal Code" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtWorkPostalCode">Postal Code</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2" Width="50%" >
                                        <br />
                                        <div class="form-floating mb-3;" Width="100%">
                                            <asp:TextBox ID="txtI_6_StartDateForSWA" class="form-control" runat="server" placeholder="Start date for the SWA job order" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_6_StartDateForSWA">Start date for the SWA job order</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="2">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 420px">
                                            <asp:TextBox ID="txtI_7_EndDateForSWA" class="form-control" runat="server" placeholder="End date for the SWA job order" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_7_EndDateForSWA">End date for the SWA job order</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 420px">
                                            <asp:TextBox ID="txtFilingDatePosted" class="form-control" runat="server" placeholder="Notice of Filing - Date Posted" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtFilingDatePosted">Notice of Filing - Date Posted</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="2">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 420px">
                                            <asp:TextBox ID="txtFilingDateRemoved" class="form-control" runat="server" placeholder="Date removed" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtFilingDateRemoved">Date removed</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                              <%--  <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="TextBox1" class="form-control" runat="server" TextMode="MultiLine" Rows="5" placeholder="Campaign Description" Width="100%" ValidationGroup="JOValidation" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                                            <label for="txtCampaignDesc">Campaign Description</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>--%>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <label for="floatingInputGrid">Is there a Sunday edition of the newspaper in the area of intended employment?</label><br />
                                        <asp:RadioButtonList ID="rblI_8_SundayNewspaper" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None">
                                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                                        </asp:RadioButtonList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" >
                                            <asp:TextBox ID="txtI_9_NameOfNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (of general circulation) in which the first advertisement was placed: " OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_9_NameOfNewspaper" class="form-label">Name of newspaper in which the Sunday advertisement was placed. </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 350px">
                                            <asp:TextBox ID="txtI_10_FirstAdvertisementDate" class="form-control" runat="server" placeholder="Date of first advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_10_FirstAdvertisementDate">Date of Sunday advertisement: </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>


                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <asp:Label runat="server" Text="Professional journal (if applicable) in which second advertisement was placed"></asp:Label><br />
                                        <asp:RadioButtonList ID="rblI_11_SecondAdvertisement" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="JobOpportunityChanged">
                                            <asp:ListItem Enabled="True" Text="Newspaper" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="Journal" Value="0" />
                                        </asp:RadioButtonList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" >
                                            <asp:TextBox ID="txtI_27_NameOfSecondNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (if applicable) in which the second advertisement was placed." OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_27_NameOfSecondNewspaper" class="form-label">Name of newspaper (if applicable) in which the second advertisement was placed.</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 350px">
                                            <asp:TextBox ID="txtI_12_DateOfSecondAdvertisement" class="form-control" runat="server" placeholder="Date of second advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_12_DateOfSecondAdvertisement">Date of second advertisement </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <label for="floatingInputGrid">Is there a Saturday edition of the newspaper in the area of intended employment?</label><br />
                                        <asp:RadioButtonList ID="rblI_28_SaturdayNewspaper" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None">
                                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                                        </asp:RadioButtonList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" >
                                            <asp:TextBox ID="txtI_29_NameOfSaturdayNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (if applicable) in which the Saturday advertisement was placed." OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_29_NameOfSaturdayNewspaper" class="form-label">Name of newspaper (if applicable) in which the Saturday advertisement was placed.</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 350px">
                                            <asp:TextBox ID="txtI_30_SaturdayAdvertisementDate" class="form-control" runat="server" placeholder="Date of second advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_30_SaturdayAdvertisementDate">Date of Saturday advertisement </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <asp:Label runat="server" Text="Professional journal (if applicable) in which second Satuday advertisement was placed"></asp:Label><br />
                                        <asp:RadioButtonList ID="rblI_31_SecondSatAdvertisement" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="JobOpportunityChanged">
                                            <asp:ListItem Enabled="True" Text="Newspaper" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="Journal" Value="0" />
                                        </asp:RadioButtonList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" >
                                            <asp:TextBox ID="txtI_33_NameOfSecondSatNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (if applicable) in which the second advertisement was placed." OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_33_NameOfSecondSatNewspaper" class="form-label">Name of newspaper (if applicable) in which the second Saturday advertisement was placed.</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;" style="width: 350px">
                                            <asp:TextBox ID="txtI_32_DateOfSecondSatAdvertisement" class="form-control" runat="server" placeholder="Date of second advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityChanged"></asp:TextBox>
                                            <label for="txtI_32_DateOfSecondSatAdvertisement">Date of second Saturday advertisement </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:Panel>
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
