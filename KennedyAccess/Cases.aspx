<%@ Page Title="Cases" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cases.aspx.cs" Inherits="KennedyAccess.Cases" %>

<%@ Register Src="~/Controls/UserSearchProfiles.ascx" TagPrefix="uc1" TagName="UserSearchProfiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image: url('images/kagimg10.jpg'); filter: blur(4px); height: 100px; width: 900px; background-size: cover; background-position: center; position: relative; opacity: 55%; top: 20px">
        &nbsp;
    </div>

    <h2>Case Management</h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="Table1" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style: none; background-color: #edf2f2"></asp:TextBox>&nbsp;
                <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchCase_Click"/>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:GridView ID="gvCases" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="CaseGridview_RowCommand"
                        GridLines="None" class="table table-hover rounded-corners" AllowSorting="True" OnSorting="gvCases_Sorting">
                        <Columns>
                            <asp:TemplateField HeaderText="Case Id" Visible="true" SortExpression="CaseId">
                                <ItemTemplate>
                                    <asp:Label ID="lblApplicantId" runat="server" Text='<%# Eval("ApplicantId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                                <ItemTemplate>
                                    <asp:Label ID="lblFName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                                <ItemTemplate>
                                    <asp:Label ID="lblLName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Citizenship Country" SortExpression="CitizenshipCountry">
                                <ItemTemplate>
                                    <asp:Label ID="lblCitizenshipCountry" runat="server" Text='<%# Eval("CitizenshipCountry") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Agent Name" SortExpression="AgentName">
                                <ItemTemplate>
                                    <asp:Label ID="EducationLevel" runat="server" Text='<%# Eval("AgentName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonField>
                        </Columns>
                        <HeaderStyle BackColor="dimgray" ForeColor="White" />
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
