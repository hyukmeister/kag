<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CampaignInfo.ascx.cs" Inherits="KennedyAccess.Controls.CampaignInfo" %>
<asp:CheckBox ID="cbkCampaignInfoChanged" runat="server" Checked="false" Visible="false" />

<asp:Table ID="tabCampaign" runat="server" class="table table-hover">
    <asp:TableRow ID="trEmployerList">
        <asp:TableCell HorizontalAlign="Left" Width="225px">
            <div class="mb-3;">
                <br />
                <asp:Label class="form-label" runat="server" ID="labEmployerList" HorizontalAlign="Left">Employer List</asp:Label><br />
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="3">
            <br />
            <asp:DropDownList ID="ddlEmployerList" runat="server" ValidationGroup="CampaginGroup" Style="border-radius: 8px;"
                OnSelectedIndexChanged="ddlEmployerList_SelectedIndexChanged" Width="440px" AutoPostBack="true">
            </asp:DropDownList><br />
            <asp:RequiredFieldValidator ID="rvEmployerList" runat="server" ValidationGroup="CampaginGroup" ControlToValidate="ddlEmployerList"
                InitialValue="0" ErrorMessage="Employer selection is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2"><br />
                    <asp:Label runat="server" Text="Employer Name"></asp:Label>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <br />
            <asp:Label ID="labCampaignID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="labEmployerID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="txtEmployerName" runat="server"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtCampaignDesc" class="form-control" runat="server" TextMode="MultiLine" Rows="5" placeholder="Campaign Description" Width="100%" ValidationGroup="CampaginGroup" BorderStyle="None" OnTextChanged="CampaignInfoChanged"></asp:TextBox>
                <label for="txtCampaignDesc">Campaign Description</label>
                <asp:RequiredFieldValidator ID="rfvCampaignDesc" runat="server" ErrorMessage="Campaign Description is rquired" ForeColor="Red" ControlToValidate="txtCampaignDesc" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" id="divCampaignStartDate" width="450px">
                <asp:TextBox ID="txtCampaignStartDate" class="form-control" runat="server" placeholder="Campaign Start Date" BorderStyle="None" TextMode="Date"
                    ValidationGroup="CampaginGroup" AutoPostBack="true" OnTextChanged="txtCampaignStartDate_TextChanged"></asp:TextBox>
                <label for="txtCampaignStartDate">Campaign Start Date</label>
                <asp:RequiredFieldValidator ID="rfvCampaignStartDate" runat="server" ErrorMessage="Campaign Start Date is rquired" ForeColor="Red" ControlToValidate="txtCampaignStartDate" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;" width="450px">
                <asp:TextBox ID="txtCampaignEndDate" class="form-control" runat="server" placeholder="Campaign End Date" BorderStyle="None" TextMode="Date"
                    ValidationGroup="CampaginGroup" OnTextChanged="txtCampaignStartDate_TextChanged"></asp:TextBox>
                <label for="txtCampaignEndDate">Campaign End Date</label>
                <asp:RequiredFieldValidator ID="rfvCampaignEndDate" runat="server" ErrorMessage="Campaign End Date is rquired" ForeColor="Red" ControlToValidate="txtCampaignEndDate" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtOfferWageFrom" class="form-control" runat="server" placeholder="Offer Wage From" BorderStyle="None"
                    TextMode="Number" step="0.01" OnTextChanged="CampaignInfoChanged">0</asp:TextBox>
                <label for="txtOfferWageFrom">Offer Wage From</label>
            </div>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtOfferWageTo" class="form-control" runat="server" placeholder="Offer Wage To (Optional)" BorderStyle="None"
                    TextMode="Number" step="0.01" OnTextChanged="CampaignInfoChanged">0</asp:TextBox>
                <label for="txtOfferWageTo">Offer Wage To (Optional)</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <asp:Label runat="server" Text="&nbsp;&nbsp;Per: &nbsp; "></asp:Label>
            <asp:RadioButtonList ID="rblOfferWagePeriod" runat="server" RepeatDirection="Horizontal"
                RepeatLayout="Flow" OnSelectedIndexChanged="CampaignInfoChanged" Enabled="false" BorderStyle="None">
                <asp:ListItem Enabled="True" Text="Hour" Value="h" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Week" Value="w" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Bi-Week" Value="b" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Month" Value="m" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Year" Value="y" style="margin-right: 20px;" />
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvOfferWagePeriod" runat="server" ErrorMessage="Wage Period is rquired" ForeColor="Red" ControlToValidate="rblOfferWagePeriod" ValidationGroup="CampaginGroup"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
