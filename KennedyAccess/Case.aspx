<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="KennedyAccess.Case" %>

<%@ Register Src="~/Controls/DropDownCheckBox.ascx" TagPrefix="uc1" TagName="DropDownCheckBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:table runat="server" Width="900px">
        <asp:TableRow>
            <asp:TableCell>
                <div class="mb-3;" style="width: 220px">
                    <uc1:DropDownCheckBox runat="server" id="DropDownEmployers" ControlLabel="Employers"/>
                </div>
            </asp:TableCell>
            <asp:TableCell>
                <div class="mb-3;" style="width: 220px">
                    <uc1:DropDownCheckBox runat="server" id="DropDownCampaigns" ControlLabel="Campaigns"/>
                </div>
            </asp:TableCell>
            <asp:TableCell>
                <div class="mb-3;" style="width: 220px">
                    <uc1:DropDownCheckBox runat="server" id="DropDownStatuses" ControlLabel="Statuses"/>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:table>
    <asp:Button ID="btnSearch" runat="server" Text="Save Search" OnClick="Search_Click" />
    <asp:Button ID="btnSaveSearch" runat="server" Text="Save Search" OnClick="SaveSearch_Click" />


    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" Width="450px">
        <ajaxToolkit:TabPanel ID="tab1" runat="server" ScrollBars="Auto" HeaderText="tab 1">
            <ContentTemplate>
                Tab 1
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel  ID="tab2" runat="server" ScrollBars="Auto" HeaderText="tab 2">
            <ContentTemplate>
                Tab 2
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>


</asp:Content>
