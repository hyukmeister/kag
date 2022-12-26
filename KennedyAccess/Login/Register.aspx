<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KennedyAccess.users.Register11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <img alt="Kennedy Access Group" class="modal-lg" longdesc="Kennedy Access Group" src="../images/kag_logo.jpg" style="height: 280px; width: 343px" />
    <br/><br/>
    <div class="jumbotron" style="width:800px;">
    <asp:Table ID="Table1" runat="server" class="table table-hover" Width="100%">
        <asp:TableRow>
            <asp:TableCell Width="150px">Franchise</asp:TableCell>
            <asp:TableCell>
            <asp:DropDownList ID="ddlFranchise" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>User Type</asp:TableCell>
            <asp:TableCell>
            <asp:DropDownList ID="ddlUserType" runat="server"></asp:DropDownList>*
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>User Name</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtUserName" runat="server" class="input-sm"></asp:TextBox>*<br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="User Name is required" ControlToValidate="txtUserName" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>            
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Password</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPassword" runat="server" class="input-sm" ControlToCompare="txtPassword" MaxLength="16" TextMode="Password"></asp:TextBox>*<br />
                <asp:RegularExpressionValidator runat="server" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" ControlToValidate="txtPassword"
                    ErrorMessage="Please include minimum eight characters, at least one uppercase letter, one lowercase letter and one number, and one special character." ForeColor="red"></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Confirm Password</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtConfirm" runat="server" class="input-sm" MaxLength="16"  TextMode="Password"></asp:TextBox>*<br />
                <asp:CompareValidator runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ForeColor="Red"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>First Name</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFirstName" type="text" runat="server" class="input-sm"></asp:TextBox>*<br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="First Name is required" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Last Name</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtLastName" type="text" runat="server" class="input-sm"></asp:TextBox>*<br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Mobile Phone</asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlCountry" runat="server" Enabled="true"></asp:DropDownList><br />
                <asp:TextBox ID="txtMobilephone" runat="server" class="input-sm" TextMode="Phone"></asp:TextBox>*<br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Mobile Phone is required" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:CheckBox runat="server" ID="cbkAgreeToTextMsg" Text=" By Checking this box, I agree to receive important text messages." />
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Email</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtEmail" runat="server" class="input-sm" TextMode="Email"></asp:TextBox>*<br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><p/>
                <asp:Label runat="server" id="txtError" Text="" ForeColor="#CC3300"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><p/>
                <asp:Button ID="btnRegister" runat="server" Text="Register" class="btn btn-primary btn" OnClick="btnRegister_Click" ></asp:Button>
            </asp:TableCell>
        </asp:TableRow>
   </asp:Table>
   </div>
</asp:Content>
