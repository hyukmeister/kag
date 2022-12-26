<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="KennedyAccess.Login.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="align-content:center; width: 360px;"><center>
        <img alt="Kennedy Access Group" class="modal-lg" longdesc="Kennedy Access Group" src="../images/kag_logo.jpg" style="height: 280px; width: 343px" />
        <br/><br/>
        <asp:Table ID="Table1" runat="server" Height="16px" Class="table-responsive" Width="270px" BorderWidth="0px">
            <asp:TableRow>
                <asp:TableCell Width="40px">&nbsp;</asp:TableCell>
                <asp:TableCell>Please enter your account email address below:</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>    
                <asp:TableCell>&nbsp;</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtUserName" runat="server" class="input-sm"></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="userEmailValidator"
                        runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="invalid email address."
                        ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                        EnableClientScript="true" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>                
                <asp:TableCell ColumnSpan="2">&nbsp;</asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                 <asp:TableCell>&nbsp;</asp:TableCell>
                <asp:TableCell><asp:Button ID="btnResetPassword" runat="server" Text="Reset" class="btn btn-primary btn" OnClick="btnResetPassword_Click" ></asp:Button></asp:TableCell>
            </asp:TableRow>
       </asp:Table>
        </center>
   </div>
</asp:Content>
