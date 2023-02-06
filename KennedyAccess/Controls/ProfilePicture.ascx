<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfilePicture.ascx.cs" Inherits="KennedyAccess.Controls.ProfilePicture" %>
<div class="card" style="width:380px; height:460px; align-items:center; border:none; border-block-color:white"><br />
    <asp:Label ID="labObject" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="labObjectID" runat="server" Visible="false"></asp:Label>
    <asp:Image ID="imgProfilePicture" runat="server" CssClass="rounded-5 card-img" Width="350px" ImageUrl="/images/blank.png" BorderWidth="0" BorderStyle="None"/>
    <div class="card-body" runat="server" id="divUpload">
        <table>
            <tr>
                <td><asp:FileUpload ID="pictureUpload" class="form-control" runat="server" Height="38px" Width="115px" /></td>
                <td><asp:Button ID="btnUpload" class="btn btn-primary" runat="server" Text="Upload" CausesValidation="false" OnClick="btnUpload_Click"/></td>
            </tr>
        </table>
    </div>
</div>