<%@ Page Title="Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="KennedyAccess.Admin.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Roles</h2>
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
                    <asp:GridView ID="gvRoles" runat="server" AutoGenerateColumns="False" class="table table-hover"
                        GridLines="None" CellPadding="4" OnRowCancelingEdit="gvRoles_RowCancelingEdit" 
                        AllowSorting="True" OnSorting="gvRoles_Sorting"
                        OnRowEditing="gvRoles_RowEditing" OnRowUpdating="gvRoles_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Role ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleID" runat="server" Text='<%# Eval("RoleID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active" ItemStyle-Width="50px" SortExpression="Active">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbkActive" Runat="server" Checked='<%# Eval("Active") %>' Enabled="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role Name" ItemStyle-Width="10px" SortExpression="RoleName">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleName" runat="server" Text='<%# Eval("RoleName") %>'></asp:Label>
                                </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRoleName" Runat="server" Width="150px" Text='<%# Eval("RoleName") %>'></asp:TextBox>
                            </EditItemTemplate>
                             </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role Description" ItemStyle-Width="300px" SortExpression="RoleDescription">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleDescription" runat="server" Text='<%# Eval("RoleDescription") %>'></asp:Label>
                                </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRoleDescription" Runat="server" Width="300px" Text='<%# Eval("RoleDescription") %>'></asp:TextBox>
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
                            <asp:TableCell Width="185px"><asp:TextBox ID="txtNewRoleName" runat="server" MaxLength="32" Width="180px" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox></asp:TableCell>
                            <asp:TableCell Width="300px"><asp:TextBox ID="txtNewRoleDescription" runat="server" MaxLength="132" Width="280px" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox></asp:TableCell>
                            <asp:TableCell Width="80px"><asp:Button ID="btnSaveNewRole" runat="server" Text="Save" class="btn btn-primary" OnClick="btnSaveNewRole_Click"/></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
