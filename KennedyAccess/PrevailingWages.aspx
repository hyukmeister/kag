<%@ Page Title="Prevailing Wages" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrevailingWages.aspx.cs" Inherits="KennedyAccess.PrevailingWages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image:url('images/kagimg2.jpg'); filter:blur(2px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%; top:20px">&nbsp;</div>

    <h2><asp:Label id="labPrevailingWages" runat="server">Prevailing Wages</asp:Label></h2>
    <div class="jumbotron" style="width:900px;">
        <asp:Table ID="tabPrevailingWages" runat="server" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>&nbsp;
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearch_Click" />
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Button ID="btnNew" runat="server" class="btn btn-primary" Text="New Prevailing Wage" OnClick="btnNew_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:GridView ID="gvPrevailingWages" runat="server" AutoGenerateColumns="False" 
                        class="table table-hover rounded-corners" GridLines="None" CellPadding="4"
                        OnRowCommand="gvPrevailingWages_RowCommand" EmptyDataText="No Prevailing Wages found"
                        AllowSorting="True" OnSorting="gvPrevailingWages_Sorting" >
                        <Columns>
                            <asp:TemplateField HeaderText="PrevailingWagesID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrevailingWagesID" runat="server" Text='<%# Eval("PrevailingWageID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wages Tracking" SortExpression="F_1_WageTracking">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("F_1_WageTracking") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Occupation" SortExpression="F_3_Occupation">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("F_3_Occupation") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Determination Date" SortExpression="F_7_DeterminationDate">
                                <ItemTemplate>
                                    <asp:Label ID="lblDateFrom" runat="server" Text='<%# Eval("F_7_DeterminationDate") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expiration Date" SortExpression="F_8_ExpirationDate">
                                <ItemTemplate>
                                    <asp:Label ID="lblDateThru" runat="server" Text='<%# Eval("F_8_ExpirationDate") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
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
    </div></asp:Content>
