<%@ Page Title="Prevailing Wage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrevailingWage.aspx.cs" Inherits="KennedyAccess.PrevailingWage" %>

<%@ Register Src="~/Controls/Attachments.ascx" TagPrefix="uc1" TagName="Attachments" %>
<%@ Register Src="~/Controls/PrevWage.ascx" TagPrefix="uc2" TagName="PrevWage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-image:url('images/kagimg2.jpg'); filter:blur(2px);height: 100px;width:900px;background-size:cover;background-position:center;position:relative; opacity:55%; top:20px">&nbsp;</div>

    <h2><asp:Label ID="labTitle" runat="server" Text="PrevailingWage"></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="tabMain" runat="server" Width="100%" class="table" >
            <asp:TableRow BackColor="dimgray">
                <asp:TableCell ColumnSpan="4">
                    <div class="mb-3;" style="width:350px">
                        <label class="form-label" HorizontalAlign="Left" style="font-weight: bold; color: #FFFFFF;">&nbsp;Prevailing Wage Information</label><br /> 
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell >
                    <div class="mb-3;" style="width:100px"><br />  
                        <asp:label id="labEmpList" runat="server" class="form-label" HorizontalAlign="Left">&nbsp;Employer List</asp:label> 
                    </div>
                </asp:TableCell>
                <asp:TableCell ><br />    
                    <asp:DropDownList ID="ddlEmployerList" runat="server" Enabled="false" Style="border-radius: 15px;" Width="350px"
                        DropDownStyle="DropDown" MaxLength="8" RenderMode="Block" OnSelectedIndexChanged="ddlEmployerList_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RangeValidator ID="rvEmployerList" runat="server" ErrorMessage="Employer selection is required" ForeColor="Red"
                        ControlToValidate="ddlEmployerList" MinimumValue="10000" MaximumValue="zzzzz"><br /></asp:RangeValidator>
                </asp:TableCell>
                <asp:TableCell  HorizontalAlign="Right"><br />  
                    <asp:Button ID="btnEditPrevailingWage" runat="server" class="btn btn-default" CausesValidation="false" ValidationGroup="ValidatePrefWage" Visible="false" Text="Edit" OnClick="btnEditPrevailingWage_Click" />
                    <asp:Button ID="btnSavePrevailingWage" runat="server" class="btn btn-default" Text="Save" OnClick="btnSavePrevailingWage_Click" Visible="false" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" Visible="false" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <uc2:PrevWage ID="contPrevWage" runat="server" width="100%" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trAttachementHeader">
                <asp:TableCell ColumnSpan="4">
                    <div class="mb-3;" style="width:350px">
                        <label class="form-label" HorizontalAlign="Left">&nbsp;Attachments</label><br />
                   </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="trAttachementControl">
                <asp:TableCell ColumnSpan="4">
                    <uc1:Attachments runat="server" ID="contAttachments" ReferenceID="" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
