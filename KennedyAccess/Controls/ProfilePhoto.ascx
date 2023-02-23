<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfilePhoto.ascx.cs" Inherits="KennedyAccess.Controls.ProfilePhoto" %>
<script src="../Scripts/dropzone.min.js" type="text/javascript"></script>
<div class="card" style="width:380px; height:460px; align-items:center; border:none; border-block-color:white"><br />
    <asp:Label ID="labObject" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="labObjectID" runat="server" Visible="false"></asp:Label>
    <asp:Image ID="imgProfilePhoto" runat="server" CssClass="rounded-5 card-img" Width="370px" Height="380px" ImageUrl="/images/blank.png" BorderWidth="0" BorderStyle="None"/><br />

    <div id="dZUpload" runat="server" class="container dropzone" style="position: absolute; width:370px; height:420px;top:10px;">
        <div class="dz-default dz-message" style="width:100%;height:100%;vertical-align:middle;align-content:center;"><span></span></div>
    </div>
</div>