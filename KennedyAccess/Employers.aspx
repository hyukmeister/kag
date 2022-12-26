<%@ Page Title="Employers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employers.aspx.cs" Inherits="KennedyAccess.users.Employer" %>
<asp:Content ID="cntEmployers" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Employers</h2>
    <div class="jumbotron" style="width:900px;">
    <asp:Table ID="Table1" runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                <asp:ImageButton ID="ibSearch" runat="server" ImageUrl="~/images/gen004.svg" />
                <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchEmployer_Click" />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
                <asp:Button ID="btnNewEmployer" runat="server" class="btn btn-primary"  Text="New Employer" OnClick="btnNewEmployer_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:GridView ID="gvEmployers" runat="server" AutoGenerateColumns="False" 
                    GridLines="None" class="table table-hover" AllowSorting="True" OnSorting="gvEmployers_Sorting"
                    style="border-radius:15px;" OnRowCommand="gvEmployers_RowCommand" >
                    <Columns>
                        <asp:TemplateField HeaderText="Employer Id" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployerId" runat="server" Text='<%# Eval("EmployerId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employer Name" ItemStyle-Width="200px" SortExpression="EmployerName">
                            <ItemTemplate>
                                <asp:Label ID="lblFName" runat="server" Text='<%# Eval("EmployerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Number of Employees" SortExpression="NumEmployees" >
                            <ItemTemplate>
                                <asp:Label ID="lblLName" runat="server" CssClass="" Text='<%# Eval("NumEmployees") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Year in Business" SortExpression="YearBusiness">
                            <ItemTemplate>
                                <asp:Label ID="lblCleanStatus" runat="server" Text='<%# Eval("YearBusiness") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FEIN" ItemStyle-Width="120px" SortExpression="FEIN">
                            <ItemTemplate>
                                <asp:Label ID="lblPayment" runat="server" Text='<%# Eval("FEIN") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NAICS Code"  SortExpression="NAICSCode">
                            <ItemTemplate>
                                <asp:Label ID="lblPayment" runat="server" Text='<%# Eval("NAICSCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open" >
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
