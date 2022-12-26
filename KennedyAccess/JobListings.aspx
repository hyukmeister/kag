<%@ Page Title="Job Listings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListings.aspx.cs" Inherits="KennedyAccess.JobListings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Job Listings</h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="Table1" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchJobListing_Click" />
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Right">
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:GridView ID="gvJobListings" runat="server" AutoGenerateColumns="False" 
                        GridLines="None" class="table table-hover" OnRowDataBound="gvJobListings_RowDataBound"
                        Style="border-radius: 15px;" CellPadding="4" OnRowCommand="gvJobListings_RowCommand" 
                        AllowSorting="True" OnSorting="gvJobListings_Sorting">
                        <Columns>
                            <asp:TemplateField HeaderText="JobListing ID" SortExpression="JobListingID">
                                <ItemTemplate>
                                    <asp:Label ID="lblJobListingID" runat="server" Text='<%# Eval("JobListingID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employer Name" SortExpression="EmployerName">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployerName" runat="server" Text='<%# Eval("EmployerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Working Location" SortExpression="H_1_Address1">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress1" runat="server" Text='<%# Eval("H_1_Address1") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Starting Date" SortExpression="I_6_StartDateForSWA">
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDateForSWA" runat="server" Text='<%# Eval("I_6_StartDateForSWA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="# Of Applications" SortExpression="ApplicationCount">
                                <ItemTemplate>
                                    <asp:Label ID="lblApplicationCount" runat="server" Text='<%# Eval("ApplicationCount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="StatusText">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusText") %>'></asp:Label>
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
