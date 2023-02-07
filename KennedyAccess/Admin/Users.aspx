<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="KennedyAccess.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image: url('../images/kagimg10.jpg'); filter: blur(4px); height: 100px; width: 900px; background-size: cover; background-position: center; position: relative; opacity: 55%; top: 20px">
        &nbsp;
    </div>

    <h2>Users</h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="Table1" runat="server" Width="840px">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchUser_Click" />
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Right">
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" class="table table-hover"
                        GridLines="None" Style="border-radius: 15px;" CellPadding="4" OnRowCommand="gvUser_RowCommand"
                        AllowSorting="True" OnSorting="gvUsers_Sorting">
                        <Columns>
                            <asp:TemplateField HeaderText="User ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUsersID" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblActive" runat="server" Text='<%# Eval("Active") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User Name" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valid From" SortExpression="ValidFrom">
                                <ItemTemplate>
                                    <asp:Label ID="lblValidFrom" runat="server" Text='<%# Eval("ValidFrom") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valid Thru" SortExpression="ValidThru">
                                <ItemTemplate>
                                    <asp:Label ID="lblValidThru" runat="server" Text='<%# Eval("ValidThru") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonField>
                        </Columns>
                        <HeaderStyle BackColor="dimgray" ForeColor="White"/>
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
