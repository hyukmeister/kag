<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicantInfo.ascx.cs" Inherits="KennedyAccess.Controls.ApplicantInfo" %>
<%@ Register Src="~/Controls/ProfilePicture.ascx" TagPrefix="us3" TagName="ProfilePicture" %>
    <asp:CheckBox ID="cbkApplicantChanged" runat="server" Checked="false" Visible="false"/>
    <asp:Label ID="labWebForm" runat="server" Visible="false"></asp:Label>
    
    <asp:CheckBox ID="cbkProfileCompleted" runat="server" Visible="false"/>

    <asp:Table ID="tabApplicant" runat="server" class="table table-responsive table-hover" style="width: 900px;">
        <asp:TableRow>
            <asp:TableCell><asp:Label runat="server" Text="Agent Name"></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="labApplicantID" runat="server" Visible="false"></asp:Label>
                <asp:TextBox ID="labAgentName" runat="server" ReadOnly="true" BorderStyle="None"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" RowSpan="4">
                <center>
                <us3:ProfilePicture runat="server" ID="ProfilePicture" />
                </center>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="2">
               <div class="mb-3;" style="width: 420px">
                    <label for="ddlCitizenshipCountry" class="form-label">Country of Citizenship</label><br />
                    <asp:DropDownList ID="ddlCitizenshipCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" ValidationGroup="ApplicantInfo" runat="server" OnSelectedIndexChanged="ApplicantChanged" Width="300px"></asp:DropDownList>
                    <asp:RangeValidator ID="rvddlCitizenshipCountry" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of citizenship is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">&nbsp;
                <div class="mb-3;" style="width: 420px">
                    <label for="ddlBirthCountry" class="form-label">Country of Birth</label><br />
                    <asp:DropDownList ID="ddlBirthCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" ValidationGroup="ApplicantInfo" OnSelectedIndexChanged="ApplicantChanged" Width="300px"></asp:DropDownList>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of birth is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">&nbsp;
                <div class="mb-3;" style="width: 300px">
                    <label for="txtDateOfBirth" class="form-label">Date of Birth</label><br />
                    <asp:TextBox ID="txtDateOfBirth" class="form-control" TextMode="Date" runat="server" ValidationGroup="ApplicantInfo" placeholder="Date of Birth" OnTextChanged="ApplicantChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Date of birth is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">&nbsp;
                <div class="form-floating mb-3;" style="width: 300px">
                    <asp:TextBox ID="txtAdmissionClass" class="form-control" runat="server" ValidationGroup="ApplicantInfo" placeholder="Class of admission" OnTextChanged="ApplicantChanged"></asp:TextBox>
                    <label for="txtAdmissionClass">Class of Admission</label>
                    <asp:RequiredFieldValidator ID="rfvtxtAdmissionClass" runat="server" ControlToValidate="txtAdmissionClass" ErrorMessage="Class of admission is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <div class="form-floating mb-3;" style="width: 300px">
                    <asp:TextBox ID="txtAlienRegistration" class="form-control" runat="server" ValidationGroup="ApplicantInfo" placeholder="Alien registration number (A#)" OnTextChanged="ApplicantChanged"></asp:TextBox>
                    <label for="txtAlienRegistration">Alien Registration Number (A#)</label>
                </div>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="2">
                <div class="form-floating mb-3;" style="width: 300px">
                    <asp:TextBox ID="txtAlienAdmission" class="form-control" runat="server" ValidationGroup="ApplicantInfo" placeholder="Alien admission number (I-94)" OnTextChanged="ApplicantChanged"></asp:TextBox>
                    <label for="txtAlienAdmission">Alien Admission Number (I-94)</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
