<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="KennedyAccess.Controls.Contact" %>
<asp:Label runat="server" ID="labContactID" Visible="false"></asp:Label>
<asp:Label runat="server" ID="labObjectID" Visible="false"></asp:Label>
<asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="false" />
<asp:CheckBox ID="cbkContactChanged" runat="server" Checked="false" Visible="false" />

<asp:Table ID="Table2" runat="server" Width="100%">
    <asp:TableRow ID="TREmployerName">
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtEmployerName" class="form-control" runat="server" placeholder="Employer Name" ValidationGroup="ContactInfo" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtEmployerName">Employer Name</label></div>
            <asp:Label runat="server" ID="EmployerID" Text=""></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow ID="TRContactName">
        <asp:TableCell > 
            <div class="form-floating mb-3;" style="width:250px">
            <asp:TextBox ID="txtFirstName" class="form-control" runat="server" placeholder="First Name" ValidationGroup="ContactInfo" required="First Name is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtFirstName">First Name</label></div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:250px">
            <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name" ValidationGroup="ContactInfo" required="Last Name is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtLastName">Last Name</label></div>
        </asp:TableCell>
        <asp:TableCell>
            <div class="form-floating mb-3;" style="width:150px">
            <asp:TextBox ID="txtMI" class="form-control" runat="server" placeholder="Middle initial" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtMI">Middle initial</label></div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4"><br />
            <div class="form-floating mb-3;" style="width:420px">
                <asp:TextBox ID="txtAddress1" class="form-control" runat="server" placeholder="Address 1" ValidationGroup="ContactInfo" required="Address 1 is required" OnTextChanged="Contact_Changed"></asp:TextBox>
                <label for="txtAddress1" class="form-label">Address 1</label>
                <div class="invalid-feedback">Please provide a valid Address 1.</div>
            </div>            
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtAddress2" class="form-control" runat="server" placeholder="Address 2" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtAddress2">Address 2</label></div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:420px">
            <asp:TextBox ID="txtCity" class="form-control" runat="server" placeholder="City" ValidationGroup="ContactInfo" required="City is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtCity">City</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:350px">
            <asp:TextBox ID="txtStateProvince" class="form-control" runat="server" placeholder="State" ValidationGroup="ContactInfo" required="State/Province is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtCity">State</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:240px">
            <asp:TextBox ID="txtPostalCode" runat="server" class="form-control" placeholder="Postal Code" ValidationGroup="ContactInfo" required="Postal Code is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtPostalCode">Postal Code</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="mb-3;" style="width:350px">
                <label for="ddlCountry" class="form-label">Country</label><br />
                <asp:DropDownList ID="ddlCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" ValidationGroup="ContactInfo" required="Country is required" OnSelectedIndexChanged="Contact_Changed"></asp:DropDownList>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            <div class="form-floating mb-3;" style="width:240px">
            <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server" placeholder="Phone number" ValidationGroup="ContactInfo" required="Phone Number is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtPhoneNumber">Phone number</label>
            </div>
        </asp:TableCell>
        <asp:TableCell Width="200px" HorizontalAlign="Left">
            <div class="form-floating mb-3;" style="width:100px">
            <asp:TextBox ID="txtExtention" class="form-control" runat="server" placeholder="Extension" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtExtention">Extension</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" style="width:350px">
            <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" placeholder="Email" ValidationGroup="ContactInfo" required="Email is required" OnTextChanged="Contact_Changed"></asp:TextBox>
            <label for="txtEmail">Email</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
