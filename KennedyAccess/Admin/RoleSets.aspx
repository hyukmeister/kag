﻿<%@ Page Title="Role Sets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoleSets.aspx.cs" Inherits="KennedyAccess.Admin.RoleSets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Role Sets</h2>
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
                    <asp:GridView ID="gvRoleSets" runat="server" AutoGenerateColumns="False" class="table table-hover"
                        GridLines="None" CellPadding="4" OnRowCancelingEdit="gvRoleSets_RowCancelingEdit" 
                        OnRowEditing="gvRoleSets_RowEditing" OnRowUpdating="gvRoleSets_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Active" >
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbkActive" Runat="server" Checked='<%# Eval("Active") %>' Enabled="false" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="labRoleSetRoleRelID" runat="server" Text='<%# Eval("RoleSetRoleRelID") %>' Visible="false"></asp:Label>
                                    <asp:CheckBox ID="cbkActive" Runat="server" Checked='<%# Eval("Active") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Profile Name" >
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleSetName" runat="server" Text='<%# Eval("RoleSetName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role Name" ItemStyle-Width="10px">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleName" runat="server" Text='<%# Eval("RoleName") %>'></asp:Label>
                                </ItemTemplate>
                             </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleDescription" runat="server" Text='<%# Eval("RoleDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valid From">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ValidFrom") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtValidFrom" Runat="server" Width="100px" Text='<%# Eval("ValidFrom") %>' TextMode="Date"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valid Thru">
                                <ItemTemplate>
                                    <asp:Label ID="labValidThru" runat="server" Text='<%# Eval("ValidThru") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtValidThru" Runat="server" Width="100px" Text='<%# Eval("ValidThru") %>' TextMode="Date"></asp:TextBox>
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
                        <asp:TableRow VerticalAlign="Top">
                            <asp:TableCell Width="10%"><asp:DropDownList ID="ddlRoleSet" runat="server"></asp:DropDownList></asp:TableCell>
                            <asp:TableCell Width="10%"><asp:DropDownList ID="ddlRole" runat="server"></asp:DropDownList></asp:TableCell>
                            <asp:TableCell Width="185px">
                                <asp:TextBox ID="txtValidFrom" runat="server" TextMode="Date"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="rfvtxtValidFrom" runat="server" ControlToValidate="txtValidFrom" ErrorMessage="Valid From Date is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            
                            <asp:TableCell Width="300px">
                                <asp:TextBox ID="txtValidThru" runat="server" TextMode="Date"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="rfvlabValidThru" runat="server" ControlToValidate="txtValidThru" ErrorMessage="Valid Thru Date is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </asp:TableCell>
                            <asp:TableCell Width="80px"><asp:Button ID="btnSaveRoleSet" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSaveRoleSet_Click"/></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
