﻿<%@ Page Title="System Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="KennedyAccess.SystemSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>System Settings</h2>
    <div class="jumbotron" style="width:900px;">
    <asp:Table ID="Table1" runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchSetting_Click" />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
                <asp:Button ID="btnNewSetting" runat="server" class="btn btn-default" Text="New Setting" OnClick="btnNewSetting_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:GridView ID="gvSettings" runat="server" AutoGenerateColumns="False" 
                    GridLines="None" class="table table-hover" 
                    style="border-radius:15px;" CellPadding="4" OnRowCancelingEdit="gvSettings_RowCancelingEdit" 
                    OnRowEditing="gvSettings_RowEditing" OnRowUpdated="gvSettings_RowUpdated" OnRowUpdating="gvSettings_RowUpdating" >
                    <Columns>
                        <asp:TemplateField HeaderText="SettingId" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblSettingId" runat="server" Text='<%# Eval("SystemSettingID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Setting Name">
                            <ItemTemplate>
                                <asp:Label ID="lblFName" runat="server" Text='<%# Eval("SystemSettingName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Setting (Date)">
                            <ItemTemplate>
                                <asp:Label ID="lblSystemSettingDate" runat="server" Text='<%# Eval("SystemSettingDate") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSystemSettingDate" Runat="server" Width="100px" Text='<%# Eval("SystemSettingValue") %>' TextMode="Date"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Setting (Number)" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label ID="lblSystemSettingValue" runat="server" Text='<%# Eval("SystemSettingValue") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSystemSettingValue" Runat="server" Width="100px" Text='<%# Eval("SystemSettingValue") %>' TextMode="Number" ></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Setting (String)">
                            <ItemTemplate>
                                <asp:Label ID="lblSystemSettingString" runat="server" Text='<%# Eval("SystemSettingString") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSystemSettingString" Runat="server" Width="100px" Text='<%# Eval("SystemSettingString") %>' MaxLength="32"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Setting Description">
                            <ItemTemplate>
                                <asp:Label ID="lblSystemSettingDescription" runat="server" Text='<%# Eval("SystemSettingDesc") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSystemSettingDescription" Runat="server" Width="140px" Text='<%# Eval("SystemSettingDesc") %>' MaxLength="250"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="dimgray" ForeColor="White" />
                </asp:GridView>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
</asp:Content>
