<%@ Page Title="Application" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Application.aspx.cs" Inherits="KennedyAccess.Application" %>
<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>
<%@ Register Src="~/Controls/WorkExperience.ascx" TagPrefix="uc2" TagName="WorkExperience" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Label id="labApplication" runat="server" Text=""></asp:Label></h2>
    <div class="jumbotron" style="width:900px;">
        <asp:Label ID="labApplicationID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="labJobListingID" runat="server" Visible="false"></asp:Label>

        <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="tblJobListing" runat="server" class="table table-hover" Width="100%">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <asp:Button ID="btnApprove" runat="server" class="btn btn-primary" Text="Approve" OnClick="btnApprove_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;">
                        <asp:TextBox ID="txtH_3_JobTitle" class="form-control" runat="server" placeholder="Job Title" ReadOnly="true" BorderStyle="None" Width="100%"></asp:TextBox>
                        <label for="txtH_3_JobTitle">Job Title</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;">
                        <asp:TextBox ID="txtH_11_JobDuties" class="form-control" runat="server" placeholder="Job Title" ReadOnly="true" BorderStyle="None" Width="100%" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        <label for="txtH_11_JobDuties">Job Duties</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" Style="width: 350px">
                    <div class="form-floating mb-3;" style="width: 350px">
                        <asp:TextBox ID="txtG_1A_OfferedWageFrom" class="form-control" runat="server" placeholder="Offered Wage From" ReadOnly="true" BorderStyle="None" Width="350px" TextMode="Number"></asp:TextBox>
                        <label for="txtG_1A_OfferedWageFrom">Offered Wage From</label>
                    </div>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2" Style="width: 350px">
                    <div class="form-floating mb-3;" style="width: 350px">
                        <asp:TextBox ID="txtG_1B_OfferedWageTo" class="form-control" runat="server" placeholder="Offered Wage To" ReadOnly="true" BorderStyle="None" Width="350px" TextMode="Number"></asp:TextBox>
                        <label for="txtG_1B_OfferedWageTo">Offered Wage To</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="1">
                       <div class="mb-3;" style="width:300px">
                       <label class="form-label" HorizontalAlign="Left">&nbsp; Per</label>
                       </div>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="3">

                    <asp:RadioButtonList class="form-check-input" ID="rblRatePeriod" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None">
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Hour" Value="h" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Week" Value="w" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Bi-Weekly" Value="b" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Month" Value="m" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Year" Value="y" style="margin-right: 20px;" />
                    </asp:RadioButtonList>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;" style="width: 800px">
                        <asp:TextBox ID="txtH_1_Address1" class="form-control" runat="server" placeholder="Address 1" ReadOnly="True" BorderStyle="None" Width="100%"></asp:TextBox>
                        <label for="txtH_1_Address1" class="form-label">Address 1</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;" style="width: 800px">
                        <asp:TextBox ID="txtH_1A_Address2" class="form-control" runat="server" placeholder="Address 2" ReadOnly="True" BorderStyle="None" Width="100%"></asp:TextBox>
                        <label for="txtH_1A_Address2" class="form-label">Address 2</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;" style="width: 420px">
                        <asp:TextBox ID="txtH_2A_City" class="form-control" runat="server" placeholder="City" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                        <label for="txtH_2A_City">City</label>
                    </div>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="State"></asp:Label><br />
                    <asp:DropDownList ID="ddlState" runat="server" Enabled="false"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="1">
                    <div class="form-floating mb-3;" style="width: 240px">
                        <asp:TextBox ID="txtH_2C_Postalcode" runat="server" class="form-control" ReadOnly placeholder="Postal Code"></asp:TextBox>
                        <label for="txtH_2C_Postalcode">Postal Code</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>

        <div class="accordion" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        <h4>Contacts</h4>
                    </button>
                </h2>
                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">

                        <asp:Table ID="tabApplicant" runat="server" class="table table-responsive table-hover" >
                            <asp:TableRow>
                                <asp:TableCell><asp:Label runat="server" Text="Agent Name"></asp:Label></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Label ID="labApplicantID" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="labWebForm" runat="server" Visible="false"></asp:Label>
                                    <asp:CheckBox ID="cbkProfileCompleted" runat="server" Visible="false"/>
                                    <asp:TextBox ID="labAgentName" runat="server" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <div class="mb-3;" style="width: 420px">
                                        <label for="ddlCitizenshipCountry" class="form-label">Country of citizenship</label><br />
                                        <asp:DropDownList ID="ddlCitizenshipCountry" class="form-select" ValidationGroup="ApplicantInfo" runat="server" Readonly="true"  Width="300px"></asp:DropDownList>
                                        <asp:RangeValidator ID="rvddlCitizenshipCountry" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of citizenship is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="2">
                                    <div class="mb-3;" style="width: 420px">
                                        <label for="ddlBirthCountry" class="form-label">Country of birth</label><br />
                                        <asp:DropDownList ID="ddlBirthCountry" class="form-select" runat="server" ValidationGroup="ApplicantInfo" Readonly="true"  Width="300px"></asp:DropDownList>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of birth is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <div class="mb-3;" style="width: 300px">
                                        <label for="txtDateOfBirth" class="form-label">Date of Birth</label><br />
                                        <asp:TextBox ID="txtDateOfBirth" class="form-control" TextMode="Date" runat="server" ValidationGroup="ApplicantInfo" Readonly="true" placeholder="Date of Birth"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Date of birth is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </asp:TableCell>

                                <asp:TableCell ColumnSpan="2">&nbsp;
                                    <div class="form-floating mb-3;" style="width: 300px">
                                        <asp:TextBox ID="txtAdmissionClass" class="form-control" runat="server" ValidationGroup="ApplicantInfo" Readonly="true" placeholder="Class of admission"></asp:TextBox>
                                        <label for="txtAdmissionClass">Class of admission</label>
                                        <asp:RequiredFieldValidator ID="rfvtxtAdmissionClass" runat="server" ControlToValidate="txtAdmissionClass" ErrorMessage="Class of admission is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <div class="form-floating mb-3;" style="width: 300px">
                                        <asp:TextBox ID="txtAlienRegistration" class="form-control" runat="server" ValidationGroup="ApplicantInfo" Readonly="true" placeholder="Alien registration number (A#)"></asp:TextBox>
                                        <label for="txtAlienRegistration">Alien registration number (A#)</label>
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="2">
                                    <div class="form-floating mb-3;" style="width: 300px">
                                        <asp:TextBox ID="txtAlienAdmission" class="form-control" runat="server" ValidationGroup="ApplicantInfo" Readonly="true" placeholder="Alien admission number (I-94)"></asp:TextBox>
                                        <label for="txtAlienAdmission">Alien registration number (A#)</label>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>

                        <div class="accordion" id="accordApplicant">
                          <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                <h5>Current Address</h5>
                              </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordApplicant">
                              <div class="accordion-body">
                                <uc1:Contact runat="server" ID="contApplicantContact" ContactType="Applicant" ApplicantID=""/>
                              </div>
                            </div>
                          </div>
                          <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <h5>Foreign Address</h5>
                              </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordApplicant">
                              <div class="accordion-body">
                                <uc1:Contact runat="server" ID="contApplicantOversea" ContactType="ApplicantOversea" ApplicantID=""/>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                    <h4>Work Experience</h4>
                    </button>
                </h2>
                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <uc2:WorkExperience runat="server" ID="WorkExperience" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
