<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KennedyAccess.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="align-content:center; width: 360px;"><center>

        <img alt="Kennedy Access Group" class="modal-lg" longdesc="Kennedy Access Group" src="images/kag_logo.jpg" style="height: 280px; width: 343px" />
        <br/><br/>
        <asp:Table ID="Table1" runat="server" Class="table-responsive" Width="270px" BorderWidth="0px">
        <asp:TableRow VerticalAlign="Top">
            <asp:TableCell><img alt="User Name" longdesc="User Name" src="images/user.png" style="width: 50px; height: 50px" /></asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3">
                    <asp:TextBox ID="txtUserName" class="form-control" runat="server" placeholder="User Name"></asp:TextBox>
                    <label for="txtUserName">User Name</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
            
         <asp:TableRow VerticalAlign="Top">
            <asp:TableCell><img alt="Password" longdesc="Password" src="images/lock.jpg" style="width: 50px; height: 50px"/></asp:TableCell>
            <asp:TableCell>                
                <div class="form-floating mb-3">
                <asp:TextBox ID="txtPassword" class="form-control" type="password" runat="server" placeholder="Password"></asp:TextBox>
                <label for="txtPassword">Password</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary" OnClick="btnLogin_Click" ></asp:Button></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="drError" Visible="false">
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><asp:Label runat="server" Text="Incorrect user name or password. Please try again." ForeColor="Red"></asp:Label></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow >
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><p><a  href="../Login/ForgotPassword.aspx" >Forgot Password &raquo;</a></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell><p>Don't have an account? <a href="../Login/Register.aspx" >Register &raquo;</a></asp:TableCell>
        </asp:TableRow>
   </asp:Table>
        </center>
   </div>
</asp:Content>
