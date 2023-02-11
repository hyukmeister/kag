<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="I485.ascx.cs" Inherits="KennedyAccess.Controls.I485" %>
<%--<asp:Content ID="I485Content" ContentPlaceHolderID="MainContent" runat="server">--%>
<div class="accordion-group" id="I485AccordionParent">
    <asp:Label ID="labI485ID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="labApplicantID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="labReferenceID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="labRelationshipID" runat="server" Visible="false"></asp:Label>

    <div class="accordion-item">
        <asp:CheckBox ID="cbkApplicantInfoChanged" runat="server" Checked="false" />
        <h2 class="accordion-header" id="headingI485_One">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI485_One" aria-expanded="false" aria-controls="collapseI485_One">
                <b>Applicant Information</b>
            </button>
        </h2>
        <div id="collapseI485_One" class="accordion-collapse collapse" aria-labelledby="headingI485_One" data-bs-parent="#I485AccordionParent">
            <div class="accordion-body">
                <asp:Panel ID="panJobOpportunity" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Table ID="tblI485_ClientApplication1" runat="server" class="table table-hover" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2" Width="450px">
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                                        <asp:Button ID="btnEdit1" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false" OnClick="btnEdit_AppInfoClick" />
                                        <asp:Button ID="btnSave1" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_AppInfoClick" Visible="false" />&nbsp;
                                        <asp:Button ID="btnCancel1" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancel_AppInfoClick" Visible="false" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtLastName" class="form-label">Last Name</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtFirstName" class="form-control" runat="server" placeholder="First Name" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtFirstName" class="form-label">First Name</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtMiddleName" class="form-control" runat="server" placeholder="Last Name" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtMiddleName" class="form-label">Middle Name </label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtMaidenName" class="form-control" runat="server" placeholder="First Name " OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtMaidenName" class="form-label">Other Names (Maiden Name) </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtDateOfBirth" class="form-control" runat="server" placeholder="Date of Birth" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtDateOfBirth" class="form-label">Date of Birth</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtCityOfBirth" class="form-control" runat="server" placeholder="City of Birth" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtCityOfBirth" class="form-label">City of Birth</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <asp:Label class="form-label" runat="server" ID="labCountryOfBirth" HorizontalAlign="Left">Country of Birth</asp:Label><br />
                                        <asp:DropDownList ID="ddlCountryOfBirth" runat="server" Style="border-radius: 8px;" AutoPostBack="true" OnSelectedIndexChanged="ApplicantInfo_Changed">
                                        </asp:DropDownList><br />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <asp:Label class="form-label" runat="server" ID="labCitizenship" HorizontalAlign="Left">Country of Citizenship</asp:Label><br />
                                        <asp:DropDownList ID="ddlCitizenship" runat="server" Style="border-radius: 8px;" AutoPostBack="true" OnSelectedIndexChanged="ApplicantInfo_Changed">
                                        </asp:DropDownList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server" placeholder="Phone Number" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtPhoneNumber" class="form-label">Phone (Cell) Number</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtEmailAddress" class="form-control" runat="server" placeholder="Email Address" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtEmailAddress" class="form-label">Email Address</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtPassportNumber" class="form-control" runat="server" placeholder="Passport Number" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtPassportNumber" class="form-label">Passport Number</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtIssuingCountry" class="form-control" runat="server" placeholder="Issuing Country" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="," class="form-label">Issuing Country</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtDateOfIssue" class="form-control" runat="server" placeholder="Date Of Issue" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtDateOfIssue" class="form-label">Date Of Issue </label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtDateOfExpiry" class="form-control" runat="server" placeholder="Date Of Expiry" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtDateOfExpiry" class="form-label">Date Of Expiry</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtAlienNumber" class="form-control" runat="server" placeholder="Alien Number" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtAlienNumber" class="form-label">Alien Number (if any)</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtSSN" class="form-control" runat="server" placeholder="SSN" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtSSN" class="form-label">Social Security Number </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtCurrLegalStatus" class="form-control" runat="server" placeholder="Current Legal Status" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtCurrLegalStatus" class="form-label">Current Legal Status (Type of Visa)</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtCurrVisaIssued" class="form-control" runat="server" placeholder="Current Visa Issued" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtCurrVisaIssued" class="form-label">Current Visa Issued on</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtCurrVisaExpires" class="form-control" runat="server" placeholder="Current Visa Expires" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtCurrVisaExpires" class="form-label">Current Visa Expires on</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtVisaNumber" class="form-control" runat="server" placeholder="Visa Number" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtVisaNumber" class="form-label">Visa Number </label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtConsulateVisaIssued" class="form-control" runat="server" placeholder="SSN" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtConsulateVisaIssued" class="form-label">Consulate where visa was issued  </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtI94Number" class="form-control" runat="server" placeholder="I-94 Number" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtI94Number" class="form-label">I-94 Number</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtExactNameOnI94" class="form-control" runat="server" placeholder="Your Name exactly as it appears on your I-94 " OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtExactNameOnI94" class="form-label">Your Name exactly as it appears on your I-94 </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtMostRecentEntry" class="form-control" runat="server" placeholder="Date of Most Recent Entry" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtMostRecentEntry" class="form-label">Date of Most Recent Entry</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtPortOfEntry" class="form-control" runat="server" placeholder="Port of Most Recent Entry" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtPortOfEntry" class="form-label">Port of Most Recent Entry</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtStatusOfEntry" class="form-control" runat="server" placeholder="Status of Most Recent Entry" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtStatusOfEntry" class="form-label">Status of Most Recent Entry   </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtNameOfMilitary" class="form-control" runat="server" placeholder="Name of Military Organization" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtNameOfMilitary" class="form-label">Name of Military Organization</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtCityOfMil" class="form-control" runat="server" placeholder="City or Town" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtCityOfMil" class="form-label">City or Town of Military </label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtStateOfMil" class="form-control" runat="server" placeholder="Name of Military Organization" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtStateOfMil" class="form-label">State of Military </label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <asp:Label class="form-label" runat="server" ID="Label4" HorizontalAlign="Left">Country of Military </asp:Label><br />
                                        <asp:DropDownList ID="ddlCountryOfMil" runat="server" Style="border-radius: 8px;" AutoPostBack="true" OnSelectedIndexChanged="ApplicantInfo_Changed"></asp:DropDownList><br />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtNatureOfGroup" class="form-control" runat="server" placeholder="Nature Of Group" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtNatureOfGroup" class="form-label">Nature Of Group</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtInvolvementFrom" class="form-control" runat="server" placeholder="Involvement From" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtInvolvementFrom" class="form-label">Military Involvement From</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtInvolvementTo" class="form-control" runat="server" placeholder="Involvement To" TextMode="Date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtInvolvementTo" class="form-label">Military Involvement To</label>
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
                                        <asp:RadioButtonList ID="rblAppliedVisa" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="ApplicantInfo_Changed">
                                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                                        </asp:RadioButtonList><br />
                                        <label for="floatingInputGrid">If yes, location of U.S. Embassy or U.S. Consulate.</label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtCityOfConsulate" class="form-control" runat="server" placeholder="City of U.S. Embassy" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtCityOfConsulate" class="form-label">City of U.S. Embassy</label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <asp:Label class="form-label" runat="server" ID="labCountryOfConsulate" HorizontalAlign="Left">Country of U.S. Embassy</asp:Label><br />
                                        <asp:DropDownList ID="ddlCountryOfConsulate" runat="server" Style="border-radius: 8px;" AutoPostBack="true" OnSelectedIndexChanged="ApplicantInfo_Changed">
                                        </asp:DropDownList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <label for="floatingInputGrid">Decision</label>
                                        <br />
                                        <asp:RadioButtonList ID="rblVisaDecision" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="ApplicantInfo_Changed">
                                            <asp:ListItem Enabled="True" Text="approval" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="refused" Value="2" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="denied" Value="3" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="withdrawn" Value="4" style="margin-right: 20px;" />
                                        </asp:RadioButtonList><br />
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtDecisionDate" class="form-control" runat="server" placeholder="Decision Date" TextMode="date" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtDecisionDate" class="form-label">Decision Date</label>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="4">
                                        <br />
                                        <label for="floatingInputGrid">Have you ever applied for work authorization (EAD)?</label>
                                        <br />
                                        <asp:RadioButtonList ID="rblHaveAppliedEAD" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="ApplicantInfo_Changed">
                                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                                        </asp:RadioButtonList><br />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtUSCISOffice" class="form-control" runat="server" placeholder="Which USCIS Office was the application sent to:" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtUSCISOffice" class="form-label">Which USCIS Office was the application sent to </label>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <br />
                                        <div class="form-floating mb-3;">
                                            <asp:TextBox ID="txtEADDecision" class="form-control" runat="server" placeholder="EAD Decision" OnTextChanged="ApplicantInfo_Changed"></asp:TextBox>
                                            <label for="txtEADDecision" class="form-label">Decision</label>
                                        </div>
                                        <br />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
        </div>
    </div>
    <%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
    <div class="accordion-item">
         <asp:CheckBox ID="cbkInterpInfoChanged" runat="server" Checked="false" />
        <h2 class="accordion-header" id="headingI485_Two">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI485_Two" aria-expanded="false" aria-controls="collapseI485_Two">
                <b>Interprer's information (If you need)</b>
            </button>
        </h2>
        <div id="collapseI485_Two" class="accordion-collapse collapse" aria-labelledby="headingI485_Two" data-bs-parent="#I485AccordionParent">
            <div class="accordion-body">
                <asp:Table ID="tblI485_ClientApplication2" runat="server" class="table table-hover" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" Width="450px">
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                            <asp:Button ID="btnEdit2" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false"  OnClick="btnEdit_InterpInfoClick" />
                            <asp:Button ID="btnSave2" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_InterpInfoClick" Visible="false" />&nbsp;
                            <asp:Button ID="btnCancel2" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancel_InterpInfoClick" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                            <label for="floatingInputGrid">Can you read and understand English and every question on I_485 Form?</label>
                            <br />
                            <asp:RadioButtonList ID="rblUnderstandEngOnI_485" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="InterpInfo_Changed">
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
                                <asp:TextBox ID="txtLastNameOfInterp" class="form-control" runat="server" placeholder="Last Name" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtLastNameOfInterp" class="form-label">Last Name</label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtGivenNameOfInterp" class="form-control" runat="server" placeholder="Given Name" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtGivenNameOfInterp" class="form-label">Given Name </label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtBusinessOfInterp" class="form-control" runat="server" placeholder="Business Or Organization Name" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtBusinessOfInterp" class="form-label">Business Or Organization Name </label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtStreetOfInterp" class="form-control" runat="server" placeholder="Street Number" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtStreetOfInterp" class="form-label">Street Number</label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtCityInterp" class="form-control" runat="server" placeholder="City or Town" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtCityInterp" class="form-label">City or Town</label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtStateOfInterp" class="form-control" runat="server" placeholder="City or Town" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtStateOfInterp" class="form-label">State</label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtZipCodeOfInterp" class="form-control" runat="server" placeholder="Zip Code" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtZipCodeOfInterp" class="form-label">Zip Code</label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <asp:Label class="form-label" runat="server" ID="Label5" HorizontalAlign="Left">Country</asp:Label><br />
                            <asp:DropDownList ID="ddlCountryOfInterp" runat="server" Style="border-radius: 8px;" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="InterpInfo_Changed">
                            </asp:DropDownList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtPhoneOfInterp" class="form-control" runat="server" placeholder="Telephone" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtPhoneOfInterp" class="form-label">Daytime Telephone and Cell phone</label>
                            </div>
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtEmailOfInterp" class="form-control" runat="server" placeholder="Email Address" OnTextChanged="InterpInfo_Changed"></asp:TextBox>
                                <label for="txtEmailOfInterp" class="form-label">Email Address</label>
                            </div>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
    <%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
    <div class="accordion-item">
         <asp:CheckBox ID="cbkBioInfoChanged" runat="server" Checked="false" />
        <h2 class="accordion-header" id="headingI485_Three">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI485_Three" aria-expanded="false" aria-controls="collapseI485_Three">
                <b>Biographic Information</b>
            </button>
        </h2>
        <div id="collapseI485_Three" class="accordion-collapse collapse" aria-labelledby="headingI485_Three" data-bs-parent="#I485AccordionParent">
            <div class="accordion-body">
                <asp:Table ID="tblI485_ClientApplication3" runat="server" class="table table-hover" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" Width="450px">
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                            <asp:Button ID="btnEdit3" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false"  OnClick="btnEdit_BioInfoClick" />
                            <asp:Button ID="btnSave3" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_BioInfoClick" Visible="false" />&nbsp;
                            <asp:Button ID="btnCancel3" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancel_BioInfoClick" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="4">
                            <br />
                            <label for="floatingInputGrid">Ethnicity (Select one)</label>
                            <br />
                            <br />
                            <asp:RadioButtonList ID="rblEthnicity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="BioInfo_Changed">
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
                            <asp:RadioButtonList ID="rblRace" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="BioInfo_Changed">
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
                                <asp:TextBox ID="txtHeightFt" class="form-control" runat="server" placeholder="ft" OnTextChanged="BioInfo_Changed"></asp:TextBox>
                                <label for="txtHeightFt" class="form-label">ft.</label>
                            </div>
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtHeightIn" class="form-control" runat="server" placeholder="cm" OnTextChanged="BioInfo_Changed"></asp:TextBox>
                                <label for="txtHeightIn" class="form-label">in.</label>
                            </div>
                            <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <br />
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtHeightCm" class="form-control" runat="server" placeholder="cm" OnTextChanged="BioInfo_Changed"></asp:TextBox>
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
                                <asp:TextBox ID="txtWeightLbs" class="form-control" runat="server" placeholder="lbs" OnTextChanged="BioInfo_Changed"></asp:TextBox>
                                <label for="txtWeightLbs" class="form-label">lbs.</label>
                            </div>
                            <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <br />
                            <br />
                            <div class="form-floating mb-3;">
                                <asp:TextBox ID="txtWeightKg" class="form-control" runat="server" placeholder="kg" OnTextChanged="BioInfo_Changed"></asp:TextBox>
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
                            <asp:RadioButtonList ID="rblEyeColor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="BioInfo_Changed">
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
                            <asp:RadioButtonList ID="rblHairColor" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="BioInfo_Changed">
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
            </div>
        </div>
    </div>
    <%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
    <div class="accordion-item">
        <asp:CheckBox ID="cbkDocInfoChanged" runat="server" Checked="false" />
        <h2 class="accordion-header" id="headinghI485_Four">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI485_Four" aria-expanded="false" aria-controls="collapseI485_Four">
                <b>Documentation (Mandatory)</b>
            </button>
        </h2>
        <div id="collapseI485_Four" class="accordion-collapse collapse" aria-labelledby="headingI485_Four" data-bs-parent="#I485AccordionParent">
            <div class="accordion-body">
                <asp:Table ID="tblI485_ClientApplication4" runat="server" class="table table-hover" Width="100%">

                  <%-- <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" Width="450px">
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                            <asp:Button ID="btnEdit4" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false"  OnClick="btnEdit_DocInfoClick" />
                            <asp:Button ID="btnSave4" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_DocInfoClick" Visible="false" />&nbsp;
                            <asp:Button ID="btnCancel4" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancel_DocInfoClick" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>--%>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 200px;" >Item: FOR MAIN APPLICANT AND EACH DEPENDENT</label>
                        </asp:TableCell>
                        <asp:TableCell>
                           <br />
                        <label for="floatingInputGrid">Original File <br />(Check off if attached)</label>
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
                                <asp:ListItem Enabled="False" Text="N/A" Value="0" />
                            </asp:CheckBoxList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid" style="margin-right: 100px;">Family Relations Certificate OR Birth Certificate of<br />
                            Main Applicant and Birth Certificate of each Dependent Child</label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <br />
                            <asp:CheckBoxList ID="cbxFamilyRelCert_Original" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 150px;" />
                            </asp:CheckBoxList>
                            <asp:CheckBoxList ID="cbxFamilyRelCert_Translated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" />
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
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" />
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
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" />
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
    </div>
    <%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
    <div class="accordion-item">
         <asp:CheckBox ID="cbkApplicantInfoChanged5" runat="server" Checked="false" />
        <h2 class="accordion-header" id="headingI485_Five">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI485_Five" aria-expanded="false" aria-controls="collapseI485_Five">
                <b>Your Background Information (Yes/No Questions)</b>
                ==>If you answer &quot;Yes,&quot; please describe the details (When, Where, Why, How, final outcome, etc.)
            </button>
        </h2>
        <div id="collapseI485_Five" class="accordion-collapse collapse" aria-labelledby="headingI485_Five" data-bs-parent="#I485AccordionParent">
            <div class="accordion-body">
                <asp:Table ID="tblI485_ClientApplication5" runat="server" class="table table-hover" Width="100%">
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                            <%--<asp:Button ID="btnEdit5" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnEdit_Click" />
                            <asp:Button ID="btnSave5" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSave_Click" Visible="false" />&nbsp;
                        <asp:Button ID="btnCancel5" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnCancel_Click" Visible="false" />--%>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <br />
                        <label for="floatingInputGrid"><b>Questions</b></label>
                        </asp:TableCell>
                        <asp:TableCell>
                           <br />
                        <label for="floatingInputGrid"><b>Check One</b></label> <br />
                        <label for="floatingInputGrid"><b>Yes</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="floatingInputGrid" style="margin-right: 20px;" ><b>No</b></label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">1. Have you EVER been denied admission to the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl1_AdmissionDeniedToUS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">2. Have you EVER been denied a visa to the United States?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl2_VisaDeniedToUS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">3. Have you EVER worked in the United States without authorization?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl3_WorkedUSWithoutAuthz" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">4. Have you EVER violated the terms or conditions of your nonimmigrant status?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl4_ViolatedTerms" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">5. Are you presently or have you EVER been in removal, exclusion, rescission,<br /> or deportation proceedings?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="1">
                            <asp:RadioButtonList ID="rbl5_InExclusion" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">6. Have you EVER been issued a final order of exclusion, deportation, or removal? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl6_IssuedFinalOrderExcl" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">7. Have you EVER had a prior final order of exclusion, deportation,<br /> or removal reinstated? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl7_HadPriorFinalOrderExcl" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">8. Have you EVER held lawful permanent resident status which was later rescinded? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl8_LawfulResident" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">9. Have you EVER been granted voluntary departure by an immigrant officer<br /> or an immigrant judge
                            but failed to depart within the allotted time? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl9_GrantedDeparture" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">10. Have you EVER applied for any kind of relief or protection from removal, <br />
                            exclusion, or deportation?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl10_AppliedProtection" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">11a. Have you EVER been a J nonimmigrant exchange visitor 
                            who was subject  <br /> to the two-year foreign residence requirement? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl11_A_BeenNonimmigrant" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">&nbsp;&nbsp;&nbsp;&nbsp; 11b. Have you complied with the foreign residence requirement?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl11_B_CompliedRequirement" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">&nbsp;&nbsp;&nbsp;&nbsp; 11c. Have you been granted a waiver or has Department 
                            of State issued <br />&nbsp;&nbsp;&nbsp;&nbsp; a favorable waiver recommendation letter for you? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl11_C_BeenGrantedWaiver" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">12. Have you EVER been arrested, cited, charged, or detained for any reason by 
                            any law <br />  enforcement official (including but not limited to any U.S. immigration official <br />
                            or any official of the U.S. armed forces or U.S. Coast Guard)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl12_BeenArrested" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">13. Have you EVER committed a crime of any kind (even if you were not arrested, cited, <br />
                            charged with, or tired for that crime)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl13_CommittedCrime" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">14. Have you EVER pled guilty to or been convicted of a crime or offense (even if  <br />
                            the violation as subsequently expunged or sealed by a court, or if you were granted <br />
                            a pardon, amnesty, a rehabilitation decree, or other act of clemency)?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl14_PledGuilty" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">15. Have you EVER been ordered punished by a judge or had conditions imposed <br />
                            on you that restrained your liberty (such as a prison sentence, suspended sentence, <br />
                            house arrest, parole,alternative sentencing, drug or alcohol treatment, rehabilitative <br />
                            programs or classes, probation, or community service)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl15_BeenOrderedPunished" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">16. Have you EVER been a defendant or the accused in a criminal proceedings (including <br />
                            pre-trial diversion, deferred prosecution, deferred adjudication, <br />or any withheld adjudication)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl16_BeenDefendant" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">17. Have you EVER violated (or attempted or conspired to violate) any controlled substance <br />
                            law or regulation of a state, the United States, or a foreign country? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl17_ViolatedRegulation" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">18. Have you EVER been convicted of two or more offenses (other than purely political <br />
                            offenses) for which the combined sentences to confinement were five years or more? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl18_ConvictedForOffenses" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">19. Have you EVER illicitly (illegally) trafficked or benefited from the trafficking of any <br />
                            controlled substances, such as chemicals, illegal drugs, or narcotics? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl19_TraffickedSubstances" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">20. Have you EVER knowingly aided, abetted, assisted, conspired, or colluded in the illicit  <br />
                            trafficking of any illegal narcotic or other controlled substances? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl20_AidedTrafficking" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">21. Are you the spouse, son or daughter of a foreign national who illicitly trafficked or <br />
                            aided (or otherwise abetted, assisted, conspired, or colluded) in the illicit trafficking  of <br />
                            a controlled substance, such as chemicals, illegal drugs, or narcotics and you obtained, <br />
                            within the last five years any financial or other benefit from the illegal activity of your  <br />
                            spouse or parent, although you knew or reasonably should have known that the financial <br /> 
                            or other benefit resulted from the illicit activity of your spouse or parent? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl21_FamilyTrafficked" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">22. Have you <b>EVER</b> engaged in prostitution or are you coming to the United States  <br />
                            to engage in prostitution? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl22_EngagedInProstitution" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">23. Have you <b>EVER</b> directly or indirectly procured (or attempted to procure)  <br />
                            or imported prostitutes or persons for the purpose of prostitution?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl23_ProcuredProstitutes" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">24. Have you <b>EVER</b> received any proceeds or money from prostitution? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl24_ReceiveMoneyProstitution" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">25. Do you intend to engage in illegal gambling or any other form of 
                            commercialized <br />vice, such as prostitution, bootlegging, or the sale of child pornography, <br />
                            while in the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl25_IntendToEngageGambling" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">26. Have you <b>EVER</b> exercised immunity (diplomatic or otherwise) to avoid  <br />
                            being prosecuted for a criminal offense in the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl26_ExercisedImmunity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">27. Have you <b>EVER</b>, while serving as a foreign government official, been responsible for or<br />
                            directly carried out violations of religious freedoms? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl27_ReligiousViolations" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">28. Have you <b>EVER</b> induced by force, fraud, or coercion (or otherwise been involved in) <br />
                            the trafficking of persons for commercial sex acts? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl28_InducedTrafficking" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">29. Have you <b>EVER</b> trafficked a person into involuntary servitude, peonage, debt bondage,  <br />
                            or slavery? Trafficking includes recruiting, harboring, transporting, providing, or obtaining  <br />
                            a person for labor or services through the use of force, fraud, or coercion. </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl29_TraffickedServitude" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">30. Have you <b>EVER</b> knowingly aided, abetted, assisted, conspired, or colluded  <br />
                            with others in trafficking persons for commercial sex acts or involuntary servitude,  <br />
                            peonage, debt bondage, or slavery? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl30_AbettedSexActs" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">31. Are you the spouse, son or daughter of a foreign national who engaged in the trafficking  <br /> 
                            of persons and have received or obtained, within the last five years,  any financial or
                            other  <br />benefits from the illicit activity of your spouse or your parent, although
                            you knew or <br />reasonably should have known that this benefit resulted from
                            the illicit activity  <br />of your spouse or parent? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl31_FamilyTrafficking" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">32. Have you <b>EVER</b> engaged in money laundering or have you <b>EVER</b> knowingly aided,  <br /> assisted, 
                            conspired, or colluded with others in money laundering or do you seek  <br /> 
                            to enter the United States to engage in such activity? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl32_MoneyLaundering" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">33. Do you intend to engage in any activity that violates or evades any law relating <br />
                            to espionage (including spying) or sabotage in the United States?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl33_ViolatesEspionage" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                        <label for="floatingInputGrid">34. Do you intend to engage in any activity in the United States that violates 
                            or evades <br />any law prohibiting the export from the United States of goods, technology, <br />or sensitive information? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl34_ProhibitingExport" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">35. Do you intend to engage in any activity whose purpose includes opposing,<br /> 
                        controlling, or overthrowing the U.S. Government by force, violence, <br /> 
                        or other unlawful means while in the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl35_OverthrowingUSGov" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">36. Do you intend to engage in any activity that could endanger the welfare, <br /> 
                           safety, or security of the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl36_EndangerWelfare" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">37. Do you intend to engage in any other unlawful activity? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl37_UnlawfulActivity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">38. Are you engaged in or, upon your entry into the United States, do you intend  <br /> 
                           to engage in any activity that could have potentially serious adverse foreign  <br /> 
                           policy consequences for the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl38_InAdversePolicy" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">39. Have you <b>EVER</b> committed, threatened to commit, attempted to commit,
                           conspired <br /> to commit, incited, endorsed, advocated, planned, or prepared any of the following:<br /> 
                           hijacking, sabotage, kidnapping, political assassination, or use of a weapon or explosive <br /> 
                           to harm another individual or cause substantial damage to property?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl39_CommittedCrime" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">40. Have you <b>EVER</b> participated in, or been a member of, a group or organization 
                           that  <br /> did any of the activities described in <b>Item Number 39?</b></label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl40_ParticipatedInGroup" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">41. Have you <b>EVER</b> recruited members or asked for money or things of value for a 
                           group <br />or organization that did any of the activities described in <b>Item Number 39?</b></label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl41_RecruitedMembers" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">42. Have you <b>EVER</b> provided money, a thing of value, services or labor, 
                           or any other <br />assistance or support for any of the activities described in <b>Item Number 39?</b></label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl42_SupportActivities" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">43. Have you <b>EVER</b> provided money, a thing of value, services or labor, or 
                           any other <br />assistance or support for an individual, group, or organization who <br />
                           did any of the activities described in <b>Item Number 39?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl43_SupportIndividual" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">44. Have you <b>EVER</b> received any type of military, paramilitary, or weapons training?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl44_MilitaryTraining" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">45. Do you intend to engage in any of the activities listed in any part of <br />
                           <b>Item Numbers 39 - 45?</b></label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl45_IntendToEngageQ39To45" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">46. Are you the spouse or child of an individual who <b>EVER</b> committed, threatened 
                           to <br />commit, attempted to commit, conspired to commit, incited, endorsed, advocated,   <br />
                           planned, or prepared any of the following: hijacking, sabotage, kidnapping,  
                           political  <br />assassination, or use of a weapon or explosive to harm another  
                           individual or cause  <br />substantial damage to property? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl46_FamilyCommitted" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">47. Are you the spouse or child of an individual who <b>EVER</b> participated in, or been <br />
                           a member or a representative of a group or organization that did any of  <br />the activities described in <b>Item Number 46?</b> </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl47_FamilyParticipated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">48. Are you the spouse or child of an individual who <b>EVER</b> recruited members, or <br />
                           asked for money or things of value, for a group or organization that did <br />
                           any of the activities described in <b>Item Number 46?</b> </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl48_FamilyRecruited" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">49. Are you the spouse or child of an individual who <b>EVER</b> provided money, a thing <br />
                           of value, services or labor, or any other assistance or support for any of <br />
                           the activities described in <b>Item Number 46?</b></label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl49_FamilySupportActivity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">50. Are you the spouse or child of an individual who <b>EVER</b> provided money, a thing 
                           of <br />value, services or labor, or any other assistance or support to an individual,
                           group, or <br />organization who did any of the activities described in <b>Item Number 46?</b></label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl50_FamilySupportIndividual" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">51. Are you the spouse or child of an individual who <b>EVER</b> received any type of <br />
                           military, paramilitary, or weapons training from a group or organization that <br />
                           did any of the activities described in <b>Item Number 46?</b> </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl51_FamilyMilitaryTraining" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">52. Have you <b>EVER</b>  assisted or participated in selling, providing, or transporting 
                           weapons<br /> to any person who, to your knowledge, used them against another person?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl52_SellingWeapons" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">53. Have you <b>EVER</b>  worked, volunteered, or otherwise served in any prison, jail, <br />
                           prison camp, detention facility, labor camp, or any other situation that <br />involved detaining persons? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl53_WorkedInPrison" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">54. Have you <b>EVER</b>  been a member of, assisted, or participated in any group, unit, or <br />
                           organization of any kind in which you or other persons used any type of weapon against<br />
                           any person or threatened to do so?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl54_AssistedUsingWeapon" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">55. Have you <b>EVER</b>  served in, been a member of, assisted, or participated in any <br />
                           military unit, paramilitary unit, police unit, self-defense unit, vigilante unit, rebel group, <br />
                           guerilla group, militia, insurgent organization, or any other armed group?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl55_ServedInArmedGroup" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">56. Have you <b>EVER</b>  been a member of, or in any way affiliated with, the Communist <br />
                           Party or any other totalitarian party (in the United States or abroad)?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl56_AffiliatedCommunist" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">57. During the period from March 23, 1933 to May 8, 1945, did you ever order, incite, <br />
                           assist, or otherwise participate in the persecution of any person because of race, religion, <br />
                           national origin, or political opinion, in association with either the Nazi government of <br />
                           Germany or any organization or government associated or allied with the <br />
                           Nazi government of Germany?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl57_IncitePersecution" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">58. Have you EVER ordered, incited, called for, committed, assisted, helped with, or <br />
                           otherwise participated in any of the following: <br />
                           &nbsp;&nbsp; &nbsp;&nbsp;a. Acts involving torture or genocide? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl58_A_InvolvingGenocide" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid"> &nbsp; &nbsp;&nbsp;&nbsp;b. Killing any person? b. Killing any person?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl58_B_KillingPerson" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">&nbsp; &nbsp;&nbsp;&nbsp;c. Intentionally and severely injuring any person?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl58_C_InjuringPerson" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">&nbsp; &nbsp;&nbsp;&nbsp;d. Engaging in any kind of sexual contact or relations with any person who was being <br />
                          &nbsp;&nbsp;&nbsp; &nbsp;forced or threatened?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl58_D_SexualContact" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">&nbsp; &nbsp;&nbsp;&nbsp;e. Limiting or denying any person’s ability to exercise religious beliefs?  </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl58_E_LimitingAbility" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">59. Have you <b>EVER</b>  recruited, enlisted, conscripted, or used any person under 15 years <br />
                           of age to serve in or help an armed force or group? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl59_RecruitedPersUnder15" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">60. Have you <b>EVER</b>  used any person under 15 years of age to take part in hostilities, or <br />
                           to help or provide services to people in combat? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl60_UsedPersUnder15" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">61. Have you received public assistance in the United States from any source, including <br />
                           the U.S. Government or any state, county, city, or municipality (other than emergency <br />medical treatment)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl61_ReceivedUSAsst" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">62. Are you likely to receive public assistance in the future in the United States from any <br />
                           source, including the U.S. Government or any state, county, city, or municipality (other <br />than emergency medical treatment)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl62_LikelyToReceiveAsst" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">63.Have you <b>EVER</b>  failed or refused to attend or to remain in attendance at any removal <br />
                           proceeding filed against you on or after April 1, 1997? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl63_FailedToAttend" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">64. If your answer to <b>Item Number 63</b> is "Yes," do you believe you had  <br />reasonable cause? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl64_ReasonableCause" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">65. If your answer to <b>Item Number 64</b> is "Yes," attach a written statement explaining <br />
                           why you had reasonable cause. </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl65_AttachWrittenStatement" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">66. Have you <b>EVER</b>  submitted fraudulent or counterfeit documentation to any U.S. <br />
                           Government official to obtain or attempt to obtain any immigration benefit, <br />
                           including a visa or entry into the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl66_SubmittedFraudulentDoc" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">67. Have you <b>EVER</b>  lied about, concealed, or misrepresented any information on an <br />
                           application or petition to obtain a visa, other documentation required for entry into the <br />
                           United States, admission to the United States, or any other kind of immigration benefit? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl67_LiedOnApplication" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">68. Have you <b>EVER</b>  falsely claimed to be a U.S. citizen (in writing or any other way)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl68_ClaimedUSCitizen" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">69. Have you <b>EVER</b>  been a stowaway on a vessel or aircraft arriving in the<br /> United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl69_StowawayOnVessel" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">70. Have you <b>EVER</b>  knowingly encouraged, induced, assisted, abetted, or aided any 
                           <br />foreign national to enter or to try to enter the United States illegally (alien smuggling)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl70_EncouragedSmuggling" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">71. Are you under a final order of civil penalty for violating INA section 274C for use of <br />fraudulent documents? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl71_UnderPenaltyForViolating" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">72. Have you <b>EVER</b>  been excluded, deported, or removed from the United States or <br />
                           have you ever departed the United States on your own after having been ordered <br />
                           excluded, deported, or removed from the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl72_BeenExcludedFromUS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">73. Have you <b>EVER</b>  entered the United States without being inspected and <br />admitted or paroled? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl73_EnteredUSWithoutInsp" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">74. Since April 1, 1997, have you been unlawfully present in the United States: <br />
                            &nbsp;&nbsp;&nbsp;&nbsp; a. For more than 180 days but less than a year, and then departed the United States?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl74_A_UnlawfullyInUS180Days" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">&nbsp;&nbsp;&nbsp;&nbsp; b. For one year or more and then departed the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl74_B_UnlawfullyInUS1Year" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">75. Since April 1, 1997, have you <b>EVER</b>  reentered or attempted to reenter the United  <br />
                           States without being inspected and admitted or paroled after:  <br />
                           &nbsp;&nbsp;&nbsp;&nbsp;  a. Having been unlawfully present in the United States for more than one year  <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; in the aggregate?</label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl75_A_ReenteredWOInspection" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">&nbsp;&nbsp;&nbsp;&nbsp;b. Having been deported, excluded, or removed from the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl75_B_BeenDeported" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">76. Do you plan to practice polygamy in the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl76_PlanPolygamy" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">77. Are you accompanying another foreign national who requires your protection or <br />
                           guardianship but who is inadmissible after being certified by a medical officer as being <br />
                           helpless from sickness, physical or mental disability, or infancy, as described in <br />INA section 232(c)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl77_AccompanyForeigner" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">78. Have you <b>EVER</b>  assisted in detaining, retaining, or withholding custody of a U.S. <br />
                           citizen child outside the United States from a U.S. citizen who has been granted <br />custody of the child? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl78_AssistedInDetaining" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">79. Have you <b>EVER</b>  voted in violation of any Federal, state, or local constitutional <br />
                           provision, statute, ordinance, or regulation in the United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl79_VotedInViolation" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">80. Have you <b>EVER</b>  renounced U.S. citizenship to avoid being taxed by the <br />United States? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl80_RenouncedUSCitizenship" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">81. Have you <b>EVER</b>  applied for exemption or discharge from training or service in the<br />
                           U.S. armed forces or in the U.S. National Security Training Corps on the ground that <br />
                           you are a foreign national? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl81_AppliedExemption" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">82. Have you <b>EVER</b>  been relieved or discharged from such training or service on the <br />
                           ground that you are a foreign national? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl82_RelievedFromService" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">83. Have you <b>EVER</b>  been convicted of desertion from the U.S. armed forces? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl83_ConvictedDesertion" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">84. Have you <b>EVER</b>  left or remained outside the United States to avoid or evade training <br />
                           or service in the U.S. armed forces in time of war or a period declared by the President to <br />be a national emergency? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl84_RemainedOutsideUS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                       <label for="floatingInputGrid">85. If your answer to <b>Item Number 84</b> is “Yes,” what was your nationality or <br />
                           immigration status immediately before you left (for example, U.S. citizen or national, <br />
                           lawful permanent resident, nonimmigrant, parolee, present without admission or <br />parole, or any other status)? </label>
                        <br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rbl85_ImmigrationStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                            </asp:RadioButtonList><br />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</div>

<%--</asp:Content>--%>