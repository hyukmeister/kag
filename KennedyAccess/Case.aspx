﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="KennedyAccess.Case" %>

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
            <asp:TableCell>
                <div class="mb-3;" style="width: 220px">
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:table>

    <asp:Button ID="btnSearch" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" text="Search" />
    <button id="btnSaveSearch" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Save Filters</button>
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="staticBackdropLabel">New Search Profile</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="form-floating mb-3;" style="width:300px">
                <asp:TextBox ID="txtSearchProfileName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                <label for="txtLastName">Enter Profile Name</label>
            </div>
            <div class="form-floating mb-3;" style="width:280px">
                <label for="rblDefaultSearchProfile">Make this default Search Profile</label><br /><br />
                <asp:RadioButtonList ID="rblDefaultSearchProfile" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                    <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                    <asp:ListItem Enabled="True" Text="No" Value="0" Selected="True" style="margin-right: 20px;" />
                </asp:RadioButtonList>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="SaveSearch_Click"/>
          </div>
        </div>
      </div>
    </div>



</asp:Content>
