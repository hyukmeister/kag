<%@ Page Title="Agent" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agent.aspx.cs" Inherits="KennedyAccess.Agent" %>

<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <h2>
        <asp:Label ID="labAgent" runat="server" Text=""></asp:Label>
    </h2>
    <asp:CheckBox ID="cbkUserChanged" runat="server" Checked="false" Visible="false" />
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="tabAgent" runat="server" class="table table-hover" Width="100%">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <asp:Button ID="btnEditAgent" runat="server" class="btn btn-default" Text="Edit" CausesValidation="false" OnClick="btnEditAgent_Click" />
                    <asp:Button ID="btnSaveAgent" runat="server" class="btn btn-default" Text="Save" OnClick="btnSaveAgent_Click" Visible="false" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" Visible="false" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
                <asp:TableCell>
                    <asp:Label runat="server" Text="Agent ID"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblAgentID" runat="server"></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" Text="Record Type"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblRecordType" runat="server"></asp:Label>
                </asp:TableCell>
                <asp:TableCell><asp:Label runat="server" Text="Franchise"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="txtFranchise" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="User ID"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblUserID" runat="server"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Active"></asp:Label>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="left">
                    <asp:CheckBox ID="cbkActive" runat="server" Enabled="false"></asp:CheckBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Left" BackColor="#202060" ForeColor="#66FFFF">
                    <asp:Label runat="server" Text="Agent's Information"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <uc1:Contact runat="server" ID="AgentContact" ContactType="Agent" AgentID="" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
