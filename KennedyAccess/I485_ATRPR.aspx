<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="I485_ATRPR.aspx.cs" Inherits="KennedyAccess.I485_ATRPR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label ID="labI485_ATRPR" runat="server" Text="I485, Application to Register Permanent Residence"></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Label ID="labI485_ATRPRID" runat="server" Visible="false"></asp:Label>
        <div class="jumbotron" style="width: 900px;">
            <br />
            <h3>
                <asp:Label ID="Label1" runat="server" Text="Main Applicant Information"></asp:Label></h3>
            <asp:Table ID="tblI485_ATRPR1" runat="server" class="table table-hover" Width="100%">
                <asp:TableRow>
                    <asp:TableCell>
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                            <label for="txtLastName" class="form-label">Last Name</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtFirstName" class="form-control" runat="server" placeholder="First Name "></asp:TextBox>
                            <label for="txtFirstName" class="form-label">First Name</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtMiddleName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                            <label for="txtMiddleName" class="form-label">Middle Name </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtMaidenName" class="form-control" runat="server" placeholder="First Name "></asp:TextBox>
                            <label for="txtMaidenName" class="form-label">Other Names (Maiden Name) </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtDateOfBirth" class="form-control" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                            <label for="txtDateOfBirth" class="form-label">Date of Birth (mm/dd/yyyy) </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCityOfBirth" class="form-control" runat="server" placeholder="City of Birth"></asp:TextBox>
                            <label for="txtCityOfBirth" class="form-label">City of Birth</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="labCountryOfBirth" HorizontalAlign="Left">Country of Birth</asp:Label><br />
                        <asp:DropDownList ID="ddlCountryOfBirth" runat="server" Style="border-radius: 8px;"
                            Width="440px" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="labCitizenship" HorizontalAlign="Left">Country of Citizenship</asp:Label><br />
                        <asp:DropDownList ID="ddlCitizenship" runat="server" Style="border-radius: 8px;"
                            Width="440px" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                            <label for="txtPhoneNumber" class="form-label">Phone (Cell) Number</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtEmailAddress" class="form-control" runat="server" placeholder="Email Address"></asp:TextBox>
                            <label for="txtEmailAddress" class="form-label">Email Address</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtPassportNumber" class="form-control" runat="server" placeholder="Passport Number"></asp:TextBox>
                            <label for="txtPassportNumber" class="form-label">Passport Number</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtIssuingCountry" class="form-control" runat="server" placeholder="Issuing Country"></asp:TextBox>
                            <label for="txtIssuingCountry" class="form-label">Issuing Country</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtDateOfIssue" class="form-control" runat="server" placeholder="Date Of Issue" TextMode="Date"></asp:TextBox>
                            <label for="txtDateOfIssue" class="form-label">Date Of Issue </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtDateOfExpiry" class="form-control" runat="server" placeholder="Date Of Expiry" TextMode="Date"></asp:TextBox>
                            <label for="txtDateOfExpiry" class="form-label">Date Of Expiry</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtAlienNumber" class="form-control" runat="server" placeholder="Alien Number"></asp:TextBox>
                            <label for="txtAlienNumber" class="form-label">Alien Number (if any)</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtSSN" class="form-control" runat="server" placeholder="SSN"></asp:TextBox>
                            <label for="txtSSN" class="form-label">Social Security Number </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCurrLegalStatus" class="form-control" runat="server" placeholder="Current Legal Status"></asp:TextBox>
                            <label for="txtCurrLegalStatus" class="form-label">Current Legal Status (Type of Visa)</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCurrVisaIssued" class="form-control" runat="server" placeholder="Current Visa Issued" TextMode="Date"></asp:TextBox>
                            <label for="txtCurrVisaIssued" class="form-label">Current Visa Issued on (mm/dd/yyyy)</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCurrVisaExpires" class="form-control" runat="server" placeholder="Current Visa Expires" TextMode="Date"></asp:TextBox>
                            <label for="txtCurrVisaExpires" class="form-label">Current Visa Expires on (mm/dd/yyyy)</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtVisaNumber" class="form-control" runat="server" placeholder="Visa Number "></asp:TextBox>
                            <label for="txtVisaNumber" class="form-label">Visa Number </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtConsulateVisaIssued" class="form-control" runat="server" placeholder="SSN"></asp:TextBox>
                            <label for="txtConsulateVisaIssued" class="form-label">Consulate where visa was issued  </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtI94Number" class="form-control" runat="server" placeholder="I-94 Number"></asp:TextBox>
                            <label for="txtI94Number" class="form-label">I-94 Number</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtExactNameOnI94" class="form-control" runat="server" placeholder="Your Name exactly as it appears on your I-94 "></asp:TextBox>
                            <label for="txtExactNameOnI94" class="form-label">Your Name exactly as it appears on your I-94 </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtMostRecentEntry" class="form-control" runat="server" placeholder="Date of Most Recent Entry" TextMode="Date"></asp:TextBox>
                            <label for="txtMostRecentEntry" class="form-label">Date of Most Recent Entry (mm/dd/yyyy)</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtPortOfEntry" class="form-control" runat="server" placeholder="Port of Most Recent Entry"></asp:TextBox>
                            <label for="txtPortOfEntry" class="form-label">Port of Most Recent Entry</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtStatusOfEntry" class="form-control" runat="server" placeholder="Status of Most Recent Entry"></asp:TextBox>
                            <label for="txtStatusOfEntry" class="form-label">Status of Most Recent Entry   </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtNameOfMilitary" class="form-control" runat="server" placeholder="Name of Military Organization"></asp:TextBox>
                            <label for="txtNameOfMilitary" class="form-label">Name of Military Organization</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCityOfMil" class="form-control" runat="server" placeholder="City or Town"></asp:TextBox>
                            <label for="txtCityOfMil" class="form-label">City or Town of Military </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtStateOfMil" class="form-control" runat="server" placeholder="Name of Military Organization"></asp:TextBox>
                            <label for="txtStateOfMil" class="form-label">State of Military </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="Label4" HorizontalAlign="Left">Country of Military </asp:Label><br />
                        <asp:DropDownList ID="ddlCountryOfMil" runat="server" Style="border-radius: 8px;" Width="440px" AutoPostBack="true"></asp:DropDownList><br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtNatureOfGroup" class="form-control" runat="server" placeholder="Nature Of Group"></asp:TextBox>
                            <label for="txtNatureOfGroup" class="form-label">Nature Of Group</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtInvolvementFrom" class="form-control" runat="server" placeholder="Involvement From" TextMode="Date"></asp:TextBox>
                            <label for="txtInvolvementFrom" class="form-label">Date of Military Involvement From</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtInvolvementTo" class="form-control" runat="server" placeholder="Involvement To" TextMode="Date"></asp:TextBox>
                            <label for="txtInvolvementTo" class="form-label">Date of Military Involvement To</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <label for="floatingInputGrid">
                            Have you ever applied for an immigrant visa to obtain permanent resident status at a U.S. Embassy
                            <br />
                            or U.S. Consulate abroad?
                        </label>
                        <br />
                        <asp:RadioButtonList ID="rblAppliedVisa" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                        <label for="floatingInputGrid">
                            If yes, location of U.S. Embassy or U.S. Consulate.
                        </label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCityOfConsulate" class="form-control" runat="server" placeholder="City of U.S. Embassy"></asp:TextBox>
                            <label for="txtCityOfConsulate" class="form-label">City of U.S. Embassy</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="labCountryOfConsulate" HorizontalAlign="Left">Country of U.S. Embassy</asp:Label><br />
                        <asp:DropDownList ID="ddlCountryOfConsulate" runat="server" Style="border-radius: 8px;"
                            Width="440px" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <label for="floatingInputGrid">Decision</label>
                        <br />
                        <asp:RadioButtonList ID="rblVisaDecision" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="approval" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="refused" Value="2" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="denied" Value="3" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="withdrawn" Value="4" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtDecisionDate" class="form-control" runat="server" placeholder="Decision Date" TextMode="date"></asp:TextBox>
                            <label for="txtDecisionDate" class="form-label">Decision Date</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <label for="floatingInputGrid">Have you ever applied for work authorization (EAD)?</label>
                        <br />
                        <asp:RadioButtonList ID="rblHaveAppliedEAD" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtUSCISOffice" class="form-control" runat="server" placeholder="Which USCIS Office was the application sent to:"></asp:TextBox>
                            <label for="txtUSCISOffice" class="form-label">Which USCIS Office was the application sent to </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtEADDecision" class="form-control" runat="server" placeholder="EAD Decision"></asp:TextBox>
                            <label for="txtEADDecision" class="form-label">Decision</label>
                        </div>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <%-----------------------------------------------------------------------------------------------------------------------------------%>
            <br />
            <h3>
                <asp:Label ID="labInterpreterInfo" runat="server" Text="Interprer's information (If you need)"></asp:Label></h3>
            <asp:Table ID="tblI485_ATRPR2" runat="server" class="table table-hover" Width="100%">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Can you read and understand English and every question on I_485 Form?</label>
                        <br />
                        <asp:RadioButtonList ID="rblUnderstandEngOnI_485" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                        <label for="floatingInputGrid">If No, fill in the Interpreter's Information.</label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtLastNameOfInterp" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                            <label for="txtLastNameOfInterp" class="form-label">Last Name</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtGivenNameOfInterp" class="form-control" runat="server" placeholder="Given Name "></asp:TextBox>
                            <label for="txtGivenNameOfInterp" class="form-label">Given Name </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtBusinessOfInterp" class="form-control" runat="server" placeholder="Business Or Organization Name "></asp:TextBox>
                            <label for="txtBusinessOfInterp" class="form-label">Business Or Organization Name </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtStreetOfInterp" class="form-control" runat="server" placeholder="Street Number"></asp:TextBox>
                            <label for="txtStreetOfInterp" class="form-label">Street Number</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtCityInterp" class="form-control" runat="server" placeholder="City or Town"></asp:TextBox>
                            <label for="txtCityInterp" class="form-label">City or Town</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtStateOfInterp" class="form-control" runat="server" placeholder="City or Town"></asp:TextBox>
                            <label for="txtStateOfInterp" class="form-label">State</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtZipCodeOfInterp" class="form-control" runat="server" placeholder="Zip Code"></asp:TextBox>
                            <label for="txtZipCodeOfInterp" class="form-label">Zip Code</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="Label5" HorizontalAlign="Left">Country</asp:Label><br />
                        <asp:DropDownList ID="ddlCountryOfInterp" runat="server" Style="border-radius: 8px;"
                            Width-="100%" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtPhoneOfInterp" class="form-control" runat="server" placeholder="Telephone"></asp:TextBox>
                            <label for="txtPhoneOfInterp" class="form-label">Daytime Telephone and Cell phone</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtEmailOfInterp" class="form-control" runat="server" placeholder="Email Address"></asp:TextBox>
                            <label for="txtEmailOfInterp" class="form-label">Email Address</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <%-----------------------------------------------------------------------------------------------------------------------------------%>
            <br />
            <h3>
                <asp:Label ID="labBiographicInfo" runat="server" Text="Biographic Information"></asp:Label></h3>
            <asp:Table ID="I485_ATRPR3" runat="server" class="table table-hover" Width="100%">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <label for="floatingInputGrid">Ethnicity (Select one)</label>
                        <br />
                        <br />
                        <asp:RadioButtonList ID="rblEthnicity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Enabled="True" Text="Hispanic or Latino " Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Not Hispanic or Latino " Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <label for="floatingInputGrid">Race (Select one)</label>
                        <br />
                        <br />
                        <asp:RadioButtonList ID="rblRace" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Enabled="True" Text="White" Value="1" style="margin-right: 30px;" />
                            <asp:ListItem Enabled="True" Text="Asian" Value="2" style="margin-right: 30px;" />
                            <asp:ListItem Enabled="True" Text="Black or African American" Value="3" style="margin-right: 30px;" />
                            <asp:ListItem Enabled="True" Text="American Indian or Alaska Native" Value="4" style="margin-right: 240px;" />
                            <asp:ListItem Enabled="True" Text="Native Hawaiian or Other Pacific Islander " Value="5" style="margin-right: 30px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <label for="floatingInputGrid">Height (ft. & in. or cm) </label>
                        <br />
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtHeightFt" class="form-control" runat="server" placeholder="ft" Width="150PX"></asp:TextBox>
                            <label for="txtHeightFt" class="form-label">ft.</label>
                        </div>
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtHeightIn" class="form-control" runat="server" placeholder="cm" Width="150PX"></asp:TextBox>
                            <label for="txtHeightIn" class="form-label">in.</label>
                        </div>
                        <br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <br />
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtHeightCm" class="form-control" runat="server" placeholder="cm" Width="150PX"></asp:TextBox>
                            <label for="txtHeightCm" class="form-label">cm</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <label for="floatingInputGrid">Weight (lbs. or kg) </label>
                        <br />
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtWeightLbs" class="form-control" runat="server" placeholder="lbs" Width="150PX"></asp:TextBox>
                            <label for="txtWeightLbs" class="form-label">lbs.</label>
                        </div>
                        <br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <br />
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txtWeightKg" class="form-control" runat="server" placeholder="kg" Width="150PX"></asp:TextBox>
                            <label for="txtWeightKg" class="form-label">kg</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <label for="floatingInputGrid">Eye Color (Select one)</label>
                        <br />
                        <br />
                        <asp:RadioButtonList ID="rblEyeColor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Black" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Blue" Value="2" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Brown" Value="3" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Gray" Value="4" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Green" Value="5" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Hazel" Value="6" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Maroon" Value="7" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Pink" Value="8" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Unknown/other" Value="9" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <label for="floatingInputGrid">Hair Color (Select one)</label>
                        <br />
                        <br />
                        <asp:RadioButtonList ID="rblHairColor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Bald (No hair) " Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Black" Value="2" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Blond" Value="3" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Brown" Value="4" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Gray" Value="5" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Red" Value="6" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Sandy" Value="7" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="White" Value="8" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Unknown/ other" Value="9" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <%-----------------------------------------------------------------------------------------------------------------------------------%>
            <br />
            <h3>
                <asp:Label ID="Label6" runat="server" Text="Documentation (Mandatory)"></asp:Label></h3>
            <asp:Table ID="Table1" runat="server" class="table table-hover" Width="100%">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid">Item: FOR MAIN APPLICANT AND EACH DEPENDENT</label>
                    </asp:TableCell>
                    <asp:TableCell>
                           <br />
                        <label for="floatingInputGrid">Original File <br />(Check off if attached)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="floatingInputGrid" style="margin-right: 20px;" >Translated Into English <br />(Check off if attached)</label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid">Filing fee $1,225 USD for each person 14 and over</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxFilingFee14over" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;" >Filing Fee $750 USD for each person under 14</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxFilingFeeUnder14" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;" >6 Passport Sized photos (2in. x 2in.) for each person</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxSixPassportPhotos" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">I-693 Medical Exam for each person</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxI693MedicalExam" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">Family Relations Certificate OR Birth Certificate of Main <br />Applicant and 
                            Birth Certificate of each Dependent Child</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxFamilyRelCert_Original" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                        </asp:CheckBoxList>
                        <asp:CheckBoxList ID="cbxFamilyRelCert_Translated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">Marriage Certificate</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxMarriageCert_Original" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                             </asp:CheckBoxList>
                             <asp:CheckBoxList ID="cbxMarriageCert_Translated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">Background Check result (except minors)</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxBackgroundCheck_Original" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                             </asp:CheckBoxList>
                             <asp:CheckBoxList ID="cbxBackgroundCheck_Translated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">Current I-94</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxCurrI_94" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">Current Visa and all past visas</label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxCurrVisaPastVisas" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">If Applicable:<br />(1)	Personal tax returns for past three (3) years
                            <br /> (2)	All I-20s </label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:CheckBoxList ID="cbxTaxReturnsPast3Yrs" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            <asp:ListItem Enabled="false" Text="N/A" Value="0" />
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>



            </asp:Table>
        </div>
    </div>
</asp:Content>
