<%@ Page Title="Job Listings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListings.aspx.cs" Inherits="KennedyAccess.JobListings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image:url('images/kagimg25.jpg'); filter:blur(3px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%; top:20px">&nbsp;</div>
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
                    <asp:GridView ID="gvJobListings" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                        GridLines="None" class="table table-hover rounded-corners" OnRowDataBound="gvJobListings_RowDataBound"
                        CellPadding="4" OnRowCommand="gvJobListings_RowCommand" AllowSorting="True" OnSorting="gvJobListings_Sorting">
                        <Columns>
                            <asp:TemplateField HeaderText="JobListing ID" SortExpression="JobListingID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblJobListingID" runat="server" Text='<%# Eval("JobListingID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employer Name" SortExpression="EmployerName">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployerName" runat="server" Text='<%# Eval("EmployerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Starting Date" SortExpression="I_6_StartDateForSWA">
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDateForSWA" runat="server" Text='<%# Eval("I_6_StartDateForSWA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Job Applied" SortExpression="Job Applied">
                                <ItemTemplate>
                                    <asp:Label ID="lblJobApplied" runat="server" Text='<%# Eval("Job Applied") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Employer Accepted" SortExpression="Employer Accepted">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployerAccepted" runat="server" Text='<%# Eval("Employer Accepted") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employer Approved" SortExpression="Employer Approved">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployerApproved" runat="server" Text='<%# Eval("Employer Approved") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="Offer Accepted" SortExpression="Offer Accepted">
                                <ItemTemplate>
                                    <asp:Label ID="lblOfferAccepted" runat="server" Text='<%# Eval("Job Offer Accepted") %>'></asp:Label>
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
