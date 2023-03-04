<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrevWage.ascx.cs" Inherits="KennedyAccess.Controls.PrevWage" %>
<asp:TextBox ID="txtPrevailingWageID" runat="server" Visible="false"></asp:TextBox>
<asp:Label ID="labEmployerID" runat="server" Visible="false"></asp:Label>
<asp:CheckBox ID ="cbkPreWageChanged" runat="server" Checked="false" Visible="false" />
<asp:Table ID="tabMain" runat="server" Width="100%" class="table table-hover">
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtJobTitle" class="form-control" runat="server" placeholder="Job Title" ReadOnly="true" BorderStyle="None" Width="100%" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtJobTitle">Job Title</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ErrorMessage="Job Title is required" ControlToValidate="txtJobTitle" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtJobDuties" class="form-control" runat="server" placeholder="Job Duties" ReadOnly="true" BorderStyle="None" Width="100%" Rows="5" TextMode="MultiLine" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtJobDuties">Job Duties</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvJobDuties" runat="server" ErrorMessage="Job Duties are required" ControlToValidate="txtJobDuties" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 350px">
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtWageTrackingNum" class="form-control" runat="server" placeholder="Wage Tracking Number" ReadOnly="true" BorderStyle="None" Width="350px" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtWageTrackingNum">Wage Tracking Number</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvWageTrackingNum" runat="server" ControlToValidate="txtWageTrackingNum" ErrorMessage="Wage Tracking Number is required" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2" Style="width: 350px">
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtSOCOESCode" class="form-control" runat="server" placeholder="SOCOES Code" ReadOnly="true" BorderStyle="None" Width="350px" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtSOCOESCode">SOCOES Code</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvSOCOESCode" runat="server" ControlToValidate="txtSOCOESCode" ErrorMessage="SOCOES Code is required" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 350px">
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtOccupationTitle" class="form-control" runat="server" placeholder="Occupation Title" ReadOnly="true" BorderStyle="None" Width="350px" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtOccupationTitle">Occupation Title</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvOccupationTitle" runat="server" ControlToValidate="txtOccupationTitle" ErrorMessage="Occupation Title is required" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2" Style="width: 350px">
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtSkillLevel" class="form-control" runat="server" placeholder="Skill Level" ReadOnly="true" BorderStyle="None" Width="350px" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtSkillLevel">Skill Level</label>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSkillLevel" ErrorMessage="Skill Level is required" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtPrevailingWage" class="form-control" runat="server" placeholder="Prevailing Wage" ReadOnly="true" BorderStyle="None" TextMode="Number" step="0.01" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtPrevailingWage">Prevailing Wage</label>
                 <asp:RequiredFieldValidator ID="rfvPrevailingWage" runat="server" ControlToValidate="txtPrevailingWage" ErrorMessage="Prevailing Wage is required" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" Text="&nbsp;&nbsp;Per: "></asp:Label>
            <asp:RadioButtonList ID="rblRatePeriod" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None" OnSelectedIndexChanged="PreWage_Changed">
                <asp:ListItem Enabled="True" Text="Hour" Value="h" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Week" Value="w" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Bi-Week" Value="b" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Month" Value="m" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Year" Value="y" style="margin-right: 20px;" />
            </asp:RadioButtonList>
            <br />
            <asp:RequiredFieldValidator ID="rfvrblRatePeriod" runat="server" ErrorMessage="Rate Period is required" ControlToValidate="rblRatePeriod" ValidationGroup="ValidatePrefWage" ForeColor="Red" ></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <label for="floatingInputGrid">&nbsp;&nbsp;Prevailing Wage Source</label> <br />
           <br />
            <asp:RadioButtonList ID="rblWageSource" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None" OnSelectedIndexChanged="PreWage_Changed">
                <asp:ListItem Enabled="True" Text="OES" Value="o" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="CBA" Value="c" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Empployer Conducted Survey" Value="e" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="DBA" Value="d" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="SCA" Value="s" style="margin-right: 20px;" />
                <asp:ListItem Enabled="True" Text="Other" Value="t" style="margin-right: 20px;" />
            </asp:RadioButtonList><br />
            <asp:RequiredFieldValidator ID="rfvrblWageSource" runat="server" ErrorMessage="Prevailing Wage Source is required" ControlToValidate="rblWageSource" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtSource" class="form-control" runat="server" placeholder="If Other is indicated, specify" ReadOnly="true" BorderStyle="None" Width="100%" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtSource">If Other is indicated, specify</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>

    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" Style="width: 350px">
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtDateDetermined" class="form-control" runat="server" placeholder="Date Determined" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtDateDetermined">Date Determined</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvtxtDateDetermined" runat="server" ErrorMessage="Date Determined is required" ControlToValidate="txtDateDetermined" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
        <asp:TableCell ColumnSpan="2" Style="width: 350px">
            <div class="form-floating mb-3;" style="width: 350px">
                <asp:TextBox ID="txtDateExpiration" class="form-control" runat="server" placeholder="Expiration Date" ReadOnly="true" BorderStyle="None" TextMode="Date" Width="350px" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtDateExpiration">Expiration Date</label>
            </div>
            <asp:RequiredFieldValidator ID="rfvtxtDateExpiration" runat="server" ErrorMessage="Expiration Date is required" ControlToValidate="txtDateExpiration" ValidationGroup="ValidatePrefWage" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="4">
            <div class="form-floating mb-3;">
                <asp:TextBox ID="txtI_5_AdditionalRecruitment" class="form-control" runat="server" placeholder="Specify additional recruitment information in this space. Add an attachment if necessary."
                    ReadOnly="true" BorderStyle="None" Width="100%" Rows="5" TextMode="MultiLine" OnTextChanged="PreWage_Changed"></asp:TextBox>
                <label for="txtI_5_AdditionalRecruitment">Specify additional recruitment information in this space. Add an attachment if necessary.</label>
            </div>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
