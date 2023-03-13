<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicantFamily.ascx.cs" Inherits="KennedyAccess.Controls.ApplicantFamily" %>
<asp:HiddenField runat="server" ID="hidApplicantID" />
<asp:CheckBox ID="cbkApplicantFamilyChanged" runat="server" Checked="false" Visible="false" />


<asp:Table ID="Table2" runat="server" Width="100%" class="table table-responsive table-hover" >
    <asp:TableRow >
        <asp:TableCell ColumnSpan="2"> 
            <div class="mb-3;" style="width: 350px">
                <label for="ddlFamilyMember" class="form-label">Family Member</label><br />
                <asp:DropDownList ID="ddlFamilyMember" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" AutoPostBack="true" OnSelectedIndexChanged="ddlFamilyMember_SelectedIndexChanged" ></asp:DropDownList>
            </div>        
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2" HorizontalAlign="Right" VerticalAlign="Bottom">
            <asp:Button ID="btnNewFamilyMember" runat="server" class="btn btn-primary" Text="New Member" CausesValidation="false" OnClick="btnNewFamilyMember_Click" />&nbsp;
            <asp:Button ID="btnEditMember" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false" OnClick="btnEditMember_Click" />&nbsp;
            <asp:Button ID="btnSaveMember" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="FamilyMember" OnClick="btnSaveMember_Click" Visible="false"/>&nbsp;
            <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" CausesValidation="false" OnClientClick="return confirm('Cancel without saving?');" OnClick="btnCancel_Click" Visible="false"/>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow >
        <asp:TableCell ColumnSpan="2"> 
            <div class="mb-3;" style="width: 350px">
                <label for="ddlRelationship" class="form-label">Relationship</label><br />
                <asp:DropDownList ID="ddlRelationship" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" AutoPostBack="true" OnSelectedIndexChanged="ApplicantFamilyChanged"></asp:DropDownList>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2"> 
            <div class="form-floating mb-3;">
            <asp:TextBox ID="txtFirstName" class="form-control" runat="server" placeholder="First Name" Width="300px" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtFirstName">First Name</label></div>
            <asp:RequiredFieldValidator ID="rfvtxttxtFirstName" runat="server" ControlToValidate="txtFirstName" ValidationGroup="FamilyMember" ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator>

        </asp:TableCell>
        <asp:TableCell >
            <div class="form-floating mb-3;">
            <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtLastName">Last Name</label></div>
            <asp:RequiredFieldValidator ID="rfvtxtLastName" runat="server" ControlToValidate="txtLastName" ValidationGroup="FamilyMember" ErrorMessage="Last Name is required" ForeColor="Red"></asp:RequiredFieldValidator>

        </asp:TableCell>
        <asp:TableCell>
            <div class="form-floating mb-3;">
            <asp:TextBox ID="txtMI" class="form-control" runat="server" placeholder="MI" Width="50px" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtMI">M.I.</label></div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Gender:&nbsp;&nbsp;</label>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="ApplicantFamilyChanged">
                <asp:ListItem Enabled="True" Text="Male " Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Female " Value="0" style="margin-right: 20px;" />
            </asp:RadioButtonList><br />
            <asp:RequiredFieldValidator ID="rfvrblGender" runat="server" ErrorMessage="rquired" ForeColor="Red" ControlToValidate="rblGender" ValidationGroup="FamilyMember"></asp:RequiredFieldValidator>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtDateOfBirth" class="form-control" runat="server" placeholder="Date of Birth:" TextMode="Date" Width="300px" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
                <label for="txtDateOfBirth">Date of Birth: Birth Certificate with translation </label>
                <asp:RequiredFieldValidator ID="rfvtxtDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ValidationGroup="FamilyMember" ErrorMessage="Date of birth is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </asp:TableCell>
    </asp:TableRow>
        <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Applying with</label><br />
            <asp:RadioButtonList ID="rblApplyingWith" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="ApplicantFamilyChanged">
                <asp:ListItem Enabled="True" Text="Yes" Value="True" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="No" Value="False" style="margin-right: 20px;" />
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvrblApplyingWith" runat="server" ErrorMessage="rquired" ForeColor="Red" ControlToValidate="rblApplyingWith" ValidationGroup="FamilyMember"></asp:RequiredFieldValidator>

        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Currently Living</label><br />
            <asp:RadioButtonList ID="rblCurrentRegidence" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None" OnSelectedIndexChanged="ApplicantFamilyChanged">
                <asp:ListItem Enabled="True" Text="In U.S." Value="True" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Out of U.S." Value="False" style="margin-right: 20px;" />
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvCurrentRegidence" runat="server" ErrorMessage="rquired" ForeColor="Red" ControlToValidate="rblCurrentRegidence" ValidationGroup="FamilyMember"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4"><br />
            <h5>Current Address</h5>
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtAddress1" class="form-control" runat="server" placeholder="Address 1" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
                <label for="txtAddress1" class="form-label">Address 1</label>
            </div>            
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtAddress2" class="form-control" runat="server" placeholder="Address 2" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtAddress2">Address 2</label></div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtCity" class="form-control" runat="server" placeholder="City" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtCity">City</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:350px">
            <asp:TextBox ID="txtStateProvince" class="form-control" runat="server" placeholder="State" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtStateProvince">State</label>
            <asp:RequiredFieldValidator ID="rfvtxtStateProvince" runat="server" ControlToValidate="txtStateProvince" ValidationGroup="FamilyMember" ErrorMessage="State/Province is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:240px">
            <asp:TextBox ID="txtPostalCode" runat="server" class="form-control" placeholder="Postal Code" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtPostalCode">Postal Code</label>
            <asp:RequiredFieldValidator ID="rfvtxtPostalCode" runat="server" ControlToValidate="txtPostalCode" ValidationGroup="FamilyMember" ErrorMessage="Postal Code is required" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width:350px">
                <label for="ddlCountry" class="form-label">Country</label><br />
                <asp:DropDownList ID="ddlCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" OnSelectedIndexChanged="ApplicantFamilyChanged"></asp:DropDownList>
                <asp:RangeValidator ID="rvddlCountry" runat="server" ControlToValidate="ddlCountry" ValidationGroup="FamilyMember" ErrorMessage="Country is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>

                </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4"><br />
            <h5>Foreign Address</h5>
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtForeignAddress1" class="form-control" runat="server" placeholder="Address 1" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
                <label for="txtForeignAddress1" class="form-label">Address 1</label>
            </div>            
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtForeignAddress2" class="form-control" runat="server" placeholder="Address 2" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtForeignAddress2">Address 2</label></div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtForeignCity" class="form-control" runat="server" placeholder="City" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtForeignCity">City</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:350px">
            <asp:TextBox ID="txtForeignState" class="form-control" runat="server" placeholder="State" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtForeignState">State</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:240px">
            <asp:TextBox ID="txtForeignPostalCode" runat="server" class="form-control" placeholder="Postal Code" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
            <label for="txtForeignPostalCode">Postal Code</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width:350px">
                <label for="ddlForeignCountry" class="form-label">Country</label><br />
                <asp:DropDownList ID="ddlForeignCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" OnSelectedIndexChanged="ApplicantFamilyChanged"></asp:DropDownList>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width: 420px">
                <label for="ddlCitizenshipCountry" class="form-label">Country of Citizenship</label><br />
                <asp:DropDownList ID="ddlCitizenshipCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px"></asp:DropDownList>
                <asp:RangeValidator ID="rvddlCitizenshipCountry" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of citizenship is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red" ValidationGroup="FamilyMember" OnSelectedIndexChanged="ApplicantFamilyChanged"></asp:RangeValidator>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width: 420px">
                <label for="ddlBirthCountry" class="form-label">Country of Birth</label><br />
                <asp:DropDownList ID="ddlBirthCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px"></asp:DropDownList>
                <asp:RangeValidator ID="rvddlBirthCountry" runat="server" ControlToValidate="ddlBirthCountry" ErrorMessage="Country of birth is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red" ValidationGroup="FamilyMember" OnSelectedIndexChanged="ApplicantFamilyChanged"></asp:RangeValidator>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2"><br />
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtPassportNumber" class="form-control" runat="server" placeholder="Passport Number" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
                <label for="txtPassportNumber" class="form-label">Passport Number</label>
                <%--<div class="invalid-feedback">Please provide a valid Passport Number.</div>--%>
            </div>            
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2"><br />
            <div class="mb-3;" style="width: 420px">
                <label for="ddlPassportCountry" class="form-label">Country of Passport Issued</label><br />
                <asp:DropDownList ID="ddlPassportCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" Width="300px" runat="server" OnSelectedIndexChanged="ApplicantFamilyChanged"></asp:DropDownList>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtDateIssued" class="form-control" runat="server" placeholder="Date of Passport Issued" TextMode="Date" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
                <label for="txtDateIssued">Date of Passport Issued</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtDateExpiry" class="form-control" runat="server" placeholder="Date of Expiry Passport" TextMode="Date" onTextChanged="ApplicantFamilyChanged"></asp:TextBox>
                <label for="txtDateExpiry">Date of Expiry Passport</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>