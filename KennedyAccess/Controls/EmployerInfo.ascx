<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployerInfo.ascx.cs" Inherits="KennedyAccess.Controls.EmployerInfo" %>
<%@ Register Src="~/Controls/ProfilePicture.ascx" TagPrefix="uc1" TagName="ProfilePicture" %>
<%--<%@ Register Src="~/Controls/ProfilePhoto.ascx" TagPrefix="uc2" TagName="ProfilePhoto" %>--%>


<asp:CheckBox ID="cbkEmployerInfoChanged" runat="server" Checked="false" Visible="false" />
<asp:HiddenField runat="server" ID="hidEmployerInfoID" />

<asp:Table ID="tabEmployer" runat="server" class="table table-responsive table-hover">
<asp:TableRow>
    <asp:TableCell ColumnSpan="4" HorizontalAlign="right">
        <asp:Label ID="Label1" runat="server" Text="User Name "></asp:Label> &nbsp; &nbsp;
        <asp:DropDownList ID="ddlUserName" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="300px" Enabled="false" OnSelectedIndexChanged="EmployerInfo_Changed"></asp:DropDownList>
    </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 50%" RowSpan="4">
            <uc1:ProfilePicture runat="server" ID="ProfilePicture" />
<%--            <uc2:ProfilePhoto runat="server" id="ProfilePhoto" />--%>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2" Style="width: 50%">
            <div class="form-floating mb-3;" style="width: 100%">
                <asp:TextBox ID="txtFEIN" class="form-control" runat="server" placeholder="Years in Business" OnTextChanged="EmployerInfo_Changed" required="true"></asp:TextBox>
                <label for="txtFEIN">FEIN</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 50%">
            <div class="form-floating mb-3;" style="width: 100%">
                <asp:TextBox ID="txtNAICSCode" class="form-control" runat="server" placeholder="NAICS Code" OnTextChanged="EmployerInfo_Changed" required="true"></asp:TextBox>
                <label for="txtNAICSCode">NAICS Code</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 50%">
            <div class="form-floating mb-3;" style="width: 100%">
                <asp:TextBox ID="txtYearBusiness" class="form-control" runat="server" TextMode="Number" placeholder="Years in Business" OnTextChanged="EmployerInfo_Changed" required></asp:TextBox>
                <label for="txtYearBusiness">Years in Business</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 50%">
            <div class="form-floating mb-3;" style="width: 100%">
                <asp:TextBox ID="txtNumEmployee" class="form-control" runat="server" TextMode="Number" placeholder="Number of Employees" OnTextChanged="EmployerInfo_Changed" required></asp:TextBox>
                <label for="txtNumEmployee">Number of Employees</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="3" Style="width: 75%"><asp:Label runat="server" style="width: 100%" Text="Employer is closely held corporation, partnership, 
                    or sole proprietorship in which the alien has an ownership interest, or there is a familial relationship between the owners,
                    stockholders, corporate officers, incorporators, or partners, and the alien."></asp:Label></asp:TableCell>
        <asp:TableCell HorizontalAlign="Center" Style="width: 25%">
            <br />
            <asp:RadioButtonList ID="rblAlienOwnership" runat="server" RepeatLayout="Flow" Enabled="false" BorderStyle="None" Style="width: 100%" OnSelectedIndexChanged="EmployerInfo_Changed">
                <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" Selected="True" />
            </asp:RadioButtonList><br />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtEmployerDesc" class="form-control" runat="server" TextMode="MultiLine" Rows="5" placeholder="Campaign Description" Width="100%" ReadOnly="true" BorderStyle="None" OnCheckedChanged="EmployerInfo_Changed"></asp:TextBox>
                <label for="txtEmployerDesc">Description</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtWebsiteInfo" class="form-control" runat="server" TextMode="MultiLine" Rows="5" placeholder="Campaign Description" Width="100%" ReadOnly="true" BorderStyle="None" OnCheckedChanged="EmployerInfo_Changed"></asp:TextBox>
                <label for="txtWebsiteInfo">Website Information</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
