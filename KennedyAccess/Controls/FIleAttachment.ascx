<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FIleAttachment.ascx.cs" Inherits="KennedyAccess.Controls.FIleAttachment" %>
    <div class="form-floating mb-3;">
    <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Description"></asp:TextBox>
    <label for="txtDescription">Description</label></div>

    <asp:FileUpload ID="fileUpload" class="form-control" runat="server" width="300px"/>
    <asp:Button ID="Upload" class="btn btn-primary" runat="server" Text="Upload File" CausesValidation="false" OnClick="Upload_Click" />
