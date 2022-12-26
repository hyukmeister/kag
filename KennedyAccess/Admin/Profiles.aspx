<%@ Page Title="Profiles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profiles.aspx.cs" Inherits="KennedyAccess.Admin.Profiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Profiles</h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="Table1" runat="server" Width="840px">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearch_Click" />
                </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
            </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:GridView ID="gvProfiles" runat="server" AutoGenerateColumns="False" class="table table-hover"
                        GridLines="None" CellPadding="4" OnRowCancelingEdit="gvProfiles_RowCancelingEdit" EmptyDataText="No Prevailing Wages found"
                        OnRowEditing="gvProfiles_RowEditing" OnRowUpdating="gvProfiles_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Role ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleSetID" runat="server" Text='<%# Eval("RoleSetID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active" ItemStyle-Width="50px" >
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbkActive" Runat="server" Checked='<%# Eval("Active") %>' Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Profile Name" ItemStyle-Width="10px">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleSetName" runat="server" Text='<%# Eval("RoleSetName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRoleSetName" Runat="server" Width="150px" Text='<%# Eval("RoleSetName") %>'></asp:TextBox>
                                </EditItemTemplate>
                             </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True"  ItemStyle-Width="80px"/>
                        </Columns>
                        <HeaderStyle BackColor="dimgray" ForeColor="White" />
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:Table Id="tabNewRole" runat="server" Width="100%">
                        <asp:TableRow>
                            <asp:TableCell Width="10%">&nbsp;</asp:TableCell>
                            <asp:TableCell Width="185px">
                                <asp:TextBox ID="txtNewProfileName" runat="server" MaxLength="32" Width="180px" ValidationGroup="SaveNew" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="rfvProfileName" runat="server" ControlToValidate="txtNewProfileName" ForeColor="Red" ValidationGroup="SaveNew" ErrorMessage="New Profile Name required"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            <asp:TableCell Width="80px"><asp:Button ID="btnSaveNewProfile" runat="server" Text="Save" class="btn btn-primary" ValidationGroup="SaveNew" OnClick="btnSaveNewProfile_Click"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2"><asp:Label ID="labError" runat="server" ForeColor="Red"></asp:Label></asp:TableCell>
                            <asp:TableCell>&nbsp;</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
