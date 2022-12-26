<%@ Page Title="Applicants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Applicants.aspx.cs" Inherits="KennedyAccess.users.Applicant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image:url('images/kagimg10.jpg'); filter:blur(4px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%;top:20px">&nbsp;
    </div>

    <h2>Applicants</h2>
    <div class="jumbotron" style="width:900px;">
    <asp:Table ID="Table1" runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left">
                <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearchApplicant_Click" />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Right">
                <asp:Button ID="btnNewApplicant" runat="server" class="btn btn-primary" Text="New Applicant" OnClick="btnNewApplicant_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:GridView ID="gvApplicants" runat="server" AutoGenerateColumns="False" Width="100%" 
                    GridLines="None" class="table table-hover" onrowcommand="ApplicantGridview_RowCommand" AllowSorting="True" OnSorting="gvApplicants_Sorting">
                    <Columns>
                        <asp:TemplateField HeaderText="Applicant Id" Visible="true" SortExpression="ApplicantId">
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
