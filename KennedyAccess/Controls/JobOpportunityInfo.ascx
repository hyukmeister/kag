<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobOpportunityInfo.ascx.cs" Inherits="KennedyAccess.Controls.JobOpportunityInfo" %>
<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc5" TagName="Toggle" %>
<asp:CheckBox ID="cbkJobOpportunityInfoChanged" runat="server" Checked="false" Visible="false" />
<asp:CheckBox ID="cbkPostJobValue" runat="server" Visible="false" />
<asp:CheckBox ID="cbActive" runat="server" Visible="false" />
<asp:Label ID="labCampaignID" runat="server" Visible="false"></asp:Label>
<asp:Label ID="labJobListingInfoID" runat="server" Visible="false">0</asp:Label>

<asp:Table ID="tabJobOpportunityInfo" runat="server" Width="100%" class="table table-hover">
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Post Job Opportunity</label>
            <uc5:Toggle runat="server" ID="cbkI_34_ListJob" ControlLabel="PostJob" CheckedText="Post" UncheckedText="Pending" />
            <br />
        </asp:TableCell>
        <asp:TableCell HorizontalAlign="Right" ColumnSpan="2">
            <asp:Button ID="btnSaveJobOpportunity" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSaveJobOpportunity_Click" Visible="false" />
            <asp:Button ID="btnCancelJobOpportunity" runat="server" class="btn btn-default" CausesValidation="false" Text="Cancel" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancelJobOpportunity_Click" Visible="false" />&nbsp;
            <asp:Button ID="btnEditJobOpportunity" runat="server" class="btn btn-primary" CausesValidation="false" Text="Edit" OnClick="btnEditJobOpportunity_Click" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <br />
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtWorkAddress1" class="form-control" runat="server" placeholder="Work Address 1" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtWorkAddress1" class="form-label">Work Address 1</label>
                <div class="invalid-feedback">Please provide a valid Work Address 1.</div>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <br />
            <div class="form-floating mb-3;" style="width: 420px">
                <asp:TextBox ID="txtWorkAddress2" class="form-control" runat="server" placeholder="Work Address 2" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtWorkAddress2" class="form-label">Work Address 2</label>
                <div class="invalid-feedback">Please provide a valid Work Address 2.</div>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <br />
            <div class="form-floating mb-3;" style="width: 400px">
                <asp:TextBox ID="txtWorkCity" class="form-control" runat="server" placeholder="City" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtWorkCity">City</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="1">
            <br />
            <asp:Label runat="server" Text="State"></asp:Label><br />
            <asp:DropDownList ID="ddlWorkState" runat="server" Style="border-radius: 8px;" OnSelectedIndexChanged="JobOpportunityInfoChanged"></asp:DropDownList>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="1">
            <br />
            <div class="form-floating mb-3;" style="width: 190px">
                <asp:TextBox ID="txtWorkPostalCode" class="form-control" runat="server" placeholder="Postal Code" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtWorkPostalCode">Postal Code</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Width="50%">
            <br />
            <div class="form-floating mb-3;" width="100%">
                <asp:TextBox ID="txtI_6_StartDateForSWA" class="form-control" runat="server" placeholder="Start date for the SWA job order" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_6_StartDateForSWA">Start date for the SWA job order</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <br />
            <div class="form-floating mb-3;" style="width: 420px">
                <asp:TextBox ID="txtI_7_EndDateForSWA" class="form-control" runat="server" placeholder="End date for the SWA job order" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_7_EndDateForSWA">End date for the SWA job order</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <br />
            <div class="form-floating mb-3;" style="width: 420px">
                <asp:TextBox ID="txtFilingDatePosted" class="form-control" runat="server" placeholder="Notice of Filing - Date Posted" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtFilingDatePosted">Notice of Filing - Date Posted</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <br />
            <div class="form-floating mb-3;" style="width: 420px">
                <asp:TextBox ID="txtFilingDateRemoved" class="form-control" runat="server" placeholder="Date removed" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtFilingDateRemoved">Date removed</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>

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
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtI_9_NameOfNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (of general circulation) in which the first advertisement was placed: " OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_9_NameOfNewspaper" class="form-label">Name of newspaper in which the Sunday advertisement was placed. </label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <br />
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtI_10_FirstAdvertisementDate" class="form-control" runat="server" placeholder="Date of first advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_10_FirstAdvertisementDate">Date of Sunday advertisement: </label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <asp:Label runat="server" Text="Professional journal (if applicable) in which second advertisement was placed"></asp:Label><br />
            <asp:RadioButtonList ID="rblI_11_SecondAdvertisement" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="JobOpportunityInfoChanged">
                <asp:ListItem Enabled="True" Text="Newspaper" Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Journal" Value="0" />
            </asp:RadioButtonList><br />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <br />
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtI_27_NameOfSecondNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (if applicable) in which the second advertisement was placed." OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_27_NameOfSecondNewspaper" class="form-label">Name of newspaper (if applicable) in which the second advertisement was placed.</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <br />
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtI_12_DateOfSecondAdvertisement" class="form-control" runat="server" placeholder="Date of second advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
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
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtI_29_NameOfSaturdayNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (if applicable) in which the Saturday advertisement was placed." OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_29_NameOfSaturdayNewspaper" class="form-label">Name of newspaper (if applicable) in which the Saturday advertisement was placed.</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <br />
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtI_30_SaturdayAdvertisementDate" class="form-control" runat="server" placeholder="Date of second advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_30_SaturdayAdvertisementDate">Date of Saturday advertisement </label>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <asp:Label runat="server" Text="Professional journal (if applicable) in which second Satuday advertisement was placed"></asp:Label><br />
            <asp:RadioButtonList ID="rblI_31_SecondSatAdvertisement" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="JobOpportunityInfoChanged">
                <asp:ListItem Enabled="True" Text="Newspaper" Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Journal" Value="0" />
            </asp:RadioButtonList><br />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <br />
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtI_33_NameOfSecondSatNewspaper" class="form-control" runat="server" placeholder="Name of newspaper (if applicable) in which the second advertisement was placed." OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_33_NameOfSecondSatNewspaper" class="form-label">Name of newspaper (if applicable) in which the second Saturday advertisement was placed.</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <br />
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtI_32_DateOfSecondSatAdvertisement" class="form-control" runat="server" placeholder="Date of second advertisement: " ReadOnly="true" BorderStyle="None" TextMode="Date" OnTextChanged="JobOpportunityInfoChanged"></asp:TextBox>
                <label for="txtI_32_DateOfSecondSatAdvertisement">Date of second Saturday advertisement </label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
