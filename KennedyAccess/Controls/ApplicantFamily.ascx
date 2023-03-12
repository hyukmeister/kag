<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicantFamily.ascx.cs" Inherits="KennedyAccess.Controls.ApplicantFamily" %>
<asp:HiddenField runat="server" ID="hidApplicantID" />

<asp:Table ID="Table2" runat="server" Width="100%" class="table table-responsive table-hover" >
    <asp:TableRow >
        <asp:TableCell ColumnSpan="2"> 
            <div class="mb-3;" style="width: 350px">
                <label for="ddlFamilyMember" class="form-label">Family Member</label><br />
                <asp:DropDownList ID="ddlFamilyMember" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" AutoPostBack="true" ></asp:DropDownList>
            </div>        
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2" HorizontalAlign="Right" VerticalAlign="Bottom">
            <asp:Button ID="btnNewFamilyMember" runat="server" class="btn btn-primary" Text="New Member" CausesValidation="false" OnClick="btnNewFamilyMember_Click" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow >
        <asp:TableCell ColumnSpan="2"> 
            <div class="mb-3;" style="width: 350px">
                <label for="ddlRelationship" class="form-label">Relationship</label><br />
                <asp:DropDownList ID="ddlRelationship" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" AutoPostBack="true" ></asp:DropDownList>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2"> 
            <div class="form-floating mb-3;">
            <asp:TextBox ID="txtFirstName" class="form-control" runat="server" placeholder="First Name" required="First Name is required" Width="300px" ></asp:TextBox>
            <label for="txtFirstName">First Name</label></div>
        </asp:TableCell>
        <asp:TableCell >
            <div class="form-floating mb-3;">
            <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name" required="Last Name is required" ></asp:TextBox>
            <label for="txtLastName">Last Name</label></div>
        </asp:TableCell>
        <asp:TableCell>
            <div class="form-floating mb-3;">
            <asp:TextBox ID="txtMI" class="form-control" runat="server" placeholder="MI" Width="50px" ></asp:TextBox>
            <label for="txtMI">M.I.</label></div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Gender:&nbsp;&nbsp;</label>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                <asp:ListItem Enabled="True" Text="Male " Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Female " Value="0" style="margin-right: 20px;" />
            </asp:RadioButtonList><br />
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtDateOfBirth" class="form-control" runat="server" placeholder="Date of Birth:" TextMode="Date" Width="300px"></asp:TextBox>
                <label for="txtDateOfBirth">Date of Birth: Birth Certificate with translation </label>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width: 420px">
                <label for="ddlCitizenshipCountry" class="form-label">Country of Citizenship</label><br />
                <asp:DropDownList ID="ddlCitizenshipCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px"></asp:DropDownList>
                <asp:RangeValidator ID="rvddlCitizenshipCountry" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of citizenship is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width: 420px">
                <label for="ddlBirthCountry" class="form-label">Country of Birth</label><br />
                <asp:DropDownList ID="ddlBirthCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px"></asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ddlCitizenshipCountry" ErrorMessage="Country of birth is required" MinimumValue="10000" MaximumValue="10250" ForeColor="Red"></asp:RangeValidator>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="4"><br />
            <h5>Current Address</h5>
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtAddress1" class="form-control" runat="server" placeholder="Address 1" required="Address 1 is required" ></asp:TextBox>
                <label for="txtAddress1" class="form-label">Address 1</label>
            </div>            
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtAddress2" class="form-control" runat="server" placeholder="Address 2" ></asp:TextBox>
            <label for="txtAddress2">Address 2</label></div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtCity" class="form-control" runat="server" placeholder="City" required="City is required" ></asp:TextBox>
            <label for="txtCity">City</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:350px">
            <asp:TextBox ID="txtStateProvince" class="form-control" runat="server" placeholder="State" required="State/Province is required" ></asp:TextBox>
            <label for="txtStateProvince">State</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:240px">
            <asp:TextBox ID="txtPostalCode" runat="server" class="form-control" placeholder="Postal Code" required="Postal Code is required" ></asp:TextBox>
            <label for="txtPostalCode">Postal Code</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width:350px">
                <label for="ddlCountry" class="form-label">Country</label><br />
                <asp:DropDownList ID="ddlCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" required="Country is required" ></asp:DropDownList>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Applying with</label><br />
            <asp:RadioButtonList ID="rblApplyingWith" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
            </asp:RadioButtonList>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <label for="floatingInputGrid">Currently Living</label><br />
            <asp:RadioButtonList ID="rblCurrentRegidence" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                <asp:ListItem Enabled="True" Text="In U.S." Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Out of U.S." Value="0" style="margin-right: 20px;" />
            </asp:RadioButtonList><br />
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="4"><br />
            <h5>Foreign Address</h5>
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtForeignAddress1" class="form-control" runat="server" placeholder="Address 1" ></asp:TextBox>
                <label for="txtForeignAddress1" class="form-label">Address 1</label>
            </div>            
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtForeignAddress2" class="form-control" runat="server" placeholder="Address 2" ></asp:TextBox>
            <label for="txtForeignAddress2">Address 2</label></div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtForeignCity" class="form-control" runat="server" placeholder="City" ></asp:TextBox>
            <label for="txtForeignCity">City</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:350px">
            <asp:TextBox ID="txtForeignState" class="form-control" runat="server" placeholder="State" ></asp:TextBox>
            <label for="txtForeignState">State</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:240px">
            <asp:TextBox ID="txtForeignPostalCode" runat="server" class="form-control" placeholder="Postal Code" ></asp:TextBox>
            <label for="txtForeignPostalCode">Postal Code</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width:350px">
                <label for="ddlForeignCountry" class="form-label">Country</label><br />
                <asp:DropDownList ID="ddlForeignCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" ></asp:DropDownList>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2"><br />
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtPassportNumber" class="form-control" runat="server" placeholder="Passport Number" ></asp:TextBox>
                <label for="txtPassportNumber" class="form-label">Passport Number</label>
                <div class="invalid-feedback">Please provide a valid Passport Number.</div>
            </div>            
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2"><br />
            <div class="mb-3;" style="width: 420px">
                <label for="ddlPassportCountry" class="form-label">Country of Passport Issued</label><br />
                <asp:DropDownList ID="ddlPassportCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" Width="300px" runat="server"></asp:DropDownList>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtDateIssued" class="form-control" runat="server" placeholder="Date of Passport Issued" TextMode="Date"></asp:TextBox>
                <label for="txtDateIssued">Date of Passport Issued</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtDateExpiry" class="form-control" runat="server" placeholder="Date of Expiry Passport" TextMode="Date"></asp:TextBox>
                <label for="txtDateExpiry">Date of Expiry Passport</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>