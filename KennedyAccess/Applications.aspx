<%@ Page Title="Applications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Applications.aspx.cs" Inherits="KennedyAccess.Applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image:url('images/kagimg2_1.jpg'); filter:blur(3px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%; top:20px">&nbsp;</div>
    <h2><asp:Label id="labCampaigns" runat="server">Applications</asp:Label></h2>
    <div class="jumbotron" style="width:900px;">
        <asp:Table ID="Table1" runat="server" Width="100%">
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
                
                <asp:GridView ID="gvApplications" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                    GridLines="None" class="table table-hover rounded-corners" EmptyDataText="No Application found" 
                    OnRowCommand="gvApplications_RowCommand" AllowSorting="True" OnSorting="gvApplications_Sorting">
                    <Columns>
                        <asp:TemplateField HeaderText="Application Id" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labApplicationId" runat="server" Text='<%# Eval("ApplicationId") %>'></asp:Label>
                                <asp:Label ID="labApplicantId" runat="server" Text='<%# Eval("ApplicantId") %>'></asp:Label>
                                <asp:Label ID="labJobListingID" runat="server" Text='<%# Eval("JobListingID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="left" SortExpression="FirstName">
                            <ItemTemplate>
                                <asp:Label ID="lblFName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" ItemStyle-HorizontalAlign="left" SortExpression="LastName">
                            <ItemTemplate>
                                <asp:Label ID="lblLName" runat="server" CssClass="" Text='<%# Eval("LastName") %>' Width="150px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date of Birth" ItemStyle-HorizontalAlign="left" SortExpression="DateofBirth">
                            <ItemTemplate>
                                <asp:Label ID="lblLName" runat="server" CssClass="" Text='<%# Eval("DateofBirth") %>' Width="150px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="StatusText">
                            <ItemTemplate>
                                <asp:Label ID="lblStatusText" runat="server" CssClass="" Text='<%# Eval("StatusText") %>' Width="200px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                        </asp:TemplateField>
                        <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open" >
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
