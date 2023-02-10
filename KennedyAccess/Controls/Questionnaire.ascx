<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Questionnaire.ascx.cs" Inherits="KennedyAccess.Controls.Questionnaire" %>
<asp:CheckBox runat="server" ID="cbkGeneral" Visible="false"></asp:CheckBox>
<asp:Label runat="server" ID="labEmployerID" Visible="false"></asp:Label>
<asp:Label runat="server" ID="labCampaignID" Visible="false"></asp:Label>
<asp:GridView ID="gvQuestionnaire" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvQuestionnaire_RowDataBound" 
    class="table table-bordered table-hover" style="border-radius:15px;" CellPadding="4" HeaderStyle-BackColor="gainsboro"
    GridLines="None" ShowHeaderWhenEmpty="true" EmptyDataText="Questionnaires not found">
    <Columns>
        <asp:TemplateField HeaderText="Sort" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" Visible="false">
            <ItemTemplate>
                <asp:Label ID="labSort" runat="server" Text='<%# Eval("Sort") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle BorderStyle="None"></HeaderStyle>
            <ItemStyle BorderStyle="None"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="QuestionnaireID" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" Visible="false">
            <ItemTemplate>
                <asp:Label ID="labQuestionnaireID" runat="server" Text='<%# Eval("QuestionnaireID") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle BorderStyle="None"></HeaderStyle>
            <ItemStyle BorderStyle="None"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Question" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:TextBox ID="txtQuestion" runat="server" BorderWidth="0" BorderStyle="None" Text='<%# Eval("Question") %>' Width="550px" MaxLength="255" CssClass="form-control"></asp:TextBox>
            </ItemTemplate>
            <HeaderStyle BorderStyle="None"></HeaderStyle>
            <ItemStyle BorderStyle="None"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Question Type" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:RadioButtonList ID="rblQustionType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="150px">
                    <asp:ListItem Enabled="True" Text="Yes/No" Value="0" style="margin-right: 20px;" />
                    <asp:ListItem Enabled="True" Text="Text" Value="1" style="margin-right: 20px;" />
                </asp:RadioButtonList>
            </ItemTemplate>
            <HeaderStyle BorderStyle="None"></HeaderStyle>
            <ItemStyle BorderStyle="None"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top">
            <ItemTemplate>
                <asp:ImageButton ID="lnkBtnUpdate" runat="server" OnClick="lnkBtnUpdate_OnClik" AlternateText="Save" ImageAlign="Top" Height="22px" ImageUrl="~/images/save.png"/>
                <asp:ImageButton ID="lnkBtnDelete" runat="server" OnClick="lnkBtnDelete_Click" AlternateText="Delete" ImageAlign="Top" Height="25px" ImageUrl="~/images/gen027.png" OnClientClick="return confirm('Are you sure?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<table style="width:100%">
    <tr style="height:25px; background-color:gainsboro; vertical-align:middle">
        <td Width="14px"></td>
        <td Width="550px"><br />
            <asp:TextBox ID="txtNewQuestion" runat="server" BorderWidth="0" BorderStyle="None" Text=" " Width="540px" MaxLength="255" ForeColor="Navy" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQuestinnaire" runat="server" ValidationGroup="QuestionnaireGroup" ControlToValidate="txtNewQuestion" ErrorMessage="Questionnaire is required field" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td Width="30px"></td>
        <td Width="170px"><br />
            <asp:RadioButtonList ID="rblNewQustionType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem Enabled="True" Text="Yes/No" Value="0" style="margin-right: 20px;" Selected="True" />
                <asp:ListItem Enabled="True" Text="Text" Value="1" style="margin-right: 20px;" />
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvQType" runat="server" ValidationGroup="QuestionnaireGroup" ControlToValidate="rblNewQustionType" ErrorMessage="Type is required" ForeColor="Red"></asp:RequiredFieldValidator></td>
        <td style="align-content:end">
            <asp:ImageButton ID="lnkBtnAddNew" runat="server" OnClick="lnkBtnAddNew_OnClik" Alt="Add" ImageUrl="~/images/arr017.svg"/>            
        <td>
    </tr>
</table>
