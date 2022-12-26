<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="KennedyAccess.users.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="align-content:center; width: 360px;"><center>
        <img alt="Kennedy Access Group" class="modal-lg" longdesc="Kennedy Access Group" src="../images/kag_logo.jpg" style="height: 280px; width: 343px" />
        <br/><br/>
        <asp:Table ID="Table1" runat="server" Height="16px" Class="table-responsive" Width="270px" BorderWidth="0px">
        <asp:TableRow>
            <asp:TableCell Width="100px">Password Reset Code</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtAuthentication" runat="server" class="input-sm" MaxLength="6" Width="160px"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
            
         <asp:TableRow>
            <asp:TableCell>New Password</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPassword" type="password" runat="server" class="input-sm" Width="160px" ControlToValidate="txtPassword" MaxLength="12"></asp:TextBox>*
                <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtPassword" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{6,12}$" runat="server" ErrorMessage="Minimum 6 and Maximum 12 characters required."></asp:RegularExpressionValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Confirm Password</asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtConfirm" type="Password" runat="server" class="input-sm" Width="160px">
            </asp:TextBox>*
            <asp:CompareValidator runat="server" ForeColor="Red" Display = "Dynamic" ErrorMessage="Passwords do not match" ControlToCompare="txtPassword" ControlToValidate="txtConfirm"></asp:CompareValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnLogin" runat="server" Text="Reset Password" class="btn btn-primary btn" OnClick="btnReset_Click" Width="160px"></asp:Button>
                <asp:Label id="labLoginError" runat="server" ForeColor="Red" Visible="false" Text="Incorrect Authentication Code. Please try again."></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
   </asp:Table>
        </center>
   </div>
</asp:Content>
