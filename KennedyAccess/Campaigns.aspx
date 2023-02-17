<%@ Page Title="Campaigns" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Campaigns.aspx.cs" Inherits="KennedyAccess.Campaigns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image:url('images/kagimg10.jpg'); filter:blur(3px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%; top:20px">&nbsp;</div>

    <h2><asp:Label id="labCampaigns" runat="server">Campaigns</asp:Label></h2>
    <div class="jumbotron" style="width:900px;">
        <asp:Table ID="tabCampaigns" runat="server" BorderStyle="None" Width="100%">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">
                    <asp:TextBox ID="txtSearch" runat="server" Style="border-radius: 8px; border-style:none; background-color:#edf2f2"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearch_Click" />
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="Right">
                    <asp:Button ID="btnNew" runat="server" class="btn btn-primary" Text="New Campaign" OnClick="btnNew_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:Panel runat="server" ID="panCampaigns" Height="600px" ScrollBars="Vertical">
                        <asp:GridView ID="gvCampaigns" runat="server" AutoGenerateColumns="False" 
                            class="table table-hover rounded-corners" GridLines="None" ShowFooter="true"
                            CellPadding="4" OnRowCommand="gvCampaign_RowCommand" EmptyDataText="No Campaign found" 
                            AllowSorting="True" OnSorting="gvCampaigns_Sorting">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" SortExpression="CampaignID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCampaignID" runat="server" Text='<%# Eval("CampaignID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employer Name" SortExpression="EmployerName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployerName" runat="server" Text='<%# Eval("EmployerName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="300px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Campaign Description" SortExpression="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Date" SortExpression="DateFrom">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateFrom" runat="server" Text='<%# Eval("DateFrom") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Date" SortExpression="DateThru">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateThru" runat="server" Text='<%# Eval("DateThru") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open" >
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:ButtonField>
                            </Columns>
                            <HeaderStyle BackColor="dimgray" ForeColor="White"/>
                            <FooterStyle BackColor="dimgray"/>
                        </asp:GridView>
                    </asp:Panel>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
