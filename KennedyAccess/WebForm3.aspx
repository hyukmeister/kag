<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="KennedyAccess.WebForm3" %>

<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>
<%@ Register Src="~/Controls/Questionnaire.ascx" TagPrefix="uc2" TagName="Questionnaire" %>
<%@ Register Src="~/Controls/Attachments.ascx" TagPrefix="uc3" TagName="Attachments" %>
<%@ Register Src="~/Controls/ProfilePicture.ascx" TagPrefix="uc4" TagName="ProfilePicture" %>
<%@ Register Src="~/Controls/UserFiles.ascx" TagPrefix="uc5" TagName="UserFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<script type='text/javascript'>
    $('#btnAddNew').click(function () {
        $('#divAddNew').modal('show');
    })
</script>



    <h2><asp:Label ID="labUser" runat="server" Text=""></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">


        <%--=======================================================================================================--%>
        <input type="checkbox" checked data-toggle="toggle" data-style="pill">
        <input runat="server" id="toggledemo" type="checkbox" checked data-toggle="toggle" data-style="pill" data-on="Active" data-off="Inactive">
        <asp:Button ID="btnEnabled" runat="server" OnClick="btnEnabled_Click" Text="Switch"/>


        <asp:Label id="labTime" runat="server" Text=""></asp:Label>
        <asp:Label id="ajaxTime" runat="server" Text=""></asp:Label>
        <asp:Table ID="tabUser" runat="server" class="table table-hover" Width="840px">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <asp:TextBox ID="txtError" runat="server"  Visible="false" ForeColor="Red" BorderStyle="None" BackColor="Transparent" Width="450px"></asp:TextBox>
                    <asp:Button ID="btnEditUser" runat="server" class="btn btn-default" Text="Edit" OnClick="btnEditUser_Click" />
                    <asp:Button ID="btnSaveUser" runat="server" class="btn btn-default" Text="Save" OnClick="btnSaveUser_Click" Visible="false"/>&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" OnClick="btnCancel_Click" Visible="false"/>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Record Type" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblRecordType" runat="server" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Franchise" Visible="false"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblFranchise" runat="server" Visible="false"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Left" BackColor="dimgray" ForeColor="white">
                    <h4><asp:Label ID="Label3" runat="server" Text="User Information"></asp:Label></h4>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="User ID"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblUserID" runat="server"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Active"></asp:Label>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="left">
                    <div class="form-check form-switch">
                        <input runat="server" class="form-check-input" type="checkbox" role="switch" id="cbkActive" >
                        <label class="form-check-label" for="cbkActive">Default switch checkbox input</label>
                    </div>
                    <input runat="server" id="cbkUserActive" type="checkbox" checked data-toggle="toggle" data-style="pill" data-on="Active" data-off="Inactive">
                </asp:TableCell>
            </asp:TableRow>
            <%--=======================================================================================================--%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="User Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtUserName" ReadOnly="true" Style="text-align: Left" runat="server" BorderStyle="NotSet"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Authenticated"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rblAuthenticated" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" enabled="false">
                        <asp:ListItem Enabled="True" Text="Yes" Value="True" style="margin-right: 20px;"  />
                        <asp:ListItem Enabled="True" Text="No" Value="False" style="margin-right: 20px;" />
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="FirstName"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstName" ReadOnly="true" Style="text-align: Left" runat="server" BorderStyle="NotSet"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Last Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastName" ReadOnly="true" Style="text-align: Left" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Email"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" ReadOnly="true" Style="text-align: Left" runat="server" TextMode="Email" BorderStyle="NotSet"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Mobilephone"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMobilephone" ReadOnly="true" Style="text-align: Left" runat="server" TextMode="Phone"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Valid From"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtValidFrom" ReadOnly="true" Style="text-align: right" runat="server" TextMode="Date" BorderStyle="NotSet"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Valid Thru"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtValidThru" ReadOnly="true" Style="text-align: right" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="User Profile"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlUserType" runat="server"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Authentication Code"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAuthenticationCode" ReadOnly="true" Style="text-align: Left" runat="server" BorderStyle="None"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Created Date"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCreateDate" ReadOnly="true" Style="text-align: right" runat="server" TextMode="Date" BorderStyle="NotSet"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Modified Date"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtModifiedDate" ReadOnly="true" Style="text-align: right" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Note"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="3">
                    <asp:TextBox ID="txtNote" ReadOnly="true" Style="text-align: Left" runat="server" TextMode="MultiLine" Width="100%" BorderStyle="NotSet"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        
        <br /><br />

    </div>
    <button class="btn btn-primary m-2" id="btnAddNew">add new</button>
    <div class="modal fade modal" id="divAddNew">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="text-center modal-title">Add New</h1>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
</asp:Content>
