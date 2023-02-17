<%@ Page Title="Agents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agents.aspx.cs" Inherits="KennedyAccess.Agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Agents</h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="Table1" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchAgent_Click" />
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Button ID="btnNewAgent" runat="server" class="btn btn-primary" Text="New Agent" OnClick="btnNewAgent_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:GridView ID="gvAgents" runat="server" AutoGenerateColumns="False" class="table table-hover rounded-corners"
                       GridLines="None" OnRowCommand="gvAgents_RowCommand" ShowFooter="true">

                        <Columns>
                            <asp:TemplateField HeaderText="Agent ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblAgentID" runat="server" Text='<%# Eval("AgentID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastNamee" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonField>
                        </Columns>
                        <HeaderStyle BackColor="dimgray" ForeColor="White"/>
                        <FooterStyle BackColor="dimgray"/>
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
