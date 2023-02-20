<%@ Page Title="Attorney" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attorney.aspx.cs" Inherits="KennedyAccess.Attorney" %>

<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label ID="lblAttorney" runat="server" Text=""></asp:Label>
    </h2>
    <asp:CheckBox ID="cbkAttorneyChanged" runat="server" Checked="false" Visible="false" />
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="tabAttorney" runat="server" class="table table-hover" Width="100%">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <asp:Button ID="btnEditAttorney" runat="server" class="btn btn-default" Text="Edit" CausesValidation="false" OnClick="btnEditAttorney_Click" />
                    <asp:Button ID="btnSaveAttorney" runat="server" class="btn btn-default" Text="Save" OnClick="btnSaveAttorney_Click" Visible="false" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" Visible="false" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
                <asp:TableCell>
                    <asp:Label runat="server" Text="Attorney ID"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblAttorneyID" runat="server"></asp:Label>
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
                    <asp:Label ID="lblFranchise" runat="server"></asp:Label>
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
                    <asp:Label runat="server" Text="Attorney's Information"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <uc1:Contact runat="server" ID="AttorneyContact" ContactType="Attorney" AttorneyID="" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" Text="FEIN"></asp:Label></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFEIN" runat="server" OnTextChanged="Attorney_Changed"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                </asp:TableCell>
                <asp:TableCell >
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
