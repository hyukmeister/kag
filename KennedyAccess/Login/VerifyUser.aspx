<%@ Page Title="User Authentication" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyUser.aspx.cs" Inherits="KennedyAccess.VerifyUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Table ID="Table1" runat="server" Height="359px" Width="571px" Class="table-responsive">
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>Great! Thank you for registering at Kennedy Access. We've sent you an email for email verification. Please check your email and enter the authentication code below:</asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Authentication Code</asp:TableCell>
            <asp:TableCell><asp:TextBox ID="txtAuthentication" type="Text" runat="server" class="input-sm"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><p><asp:Button ID="btnVerify" runat="server" Text="Verify" class="btn btn-primary btn" OnClick="btnVerify_Click" ></asp:Button></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><p><asp:Button ID="Button2" runat="server" Text="Send Code &raquo;" class="btn btn-primary btn" OnClick="btnSendOTC_Click" ></asp:Button></asp:TableCell>
        </asp:TableRow>
   </asp:Table>
    
</asp:Content>
