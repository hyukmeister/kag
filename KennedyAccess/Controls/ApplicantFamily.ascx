<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApplicantFamily.ascx.cs" Inherits="KennedyAccess.Controls.ApplicantFamily" %>
<asp:HiddenField runat="server" ID="hidApplicantID" />

<asp:GridView ID="gvFamilyMembers" runat="server" AutoGenerateColumns="False" class="table table-hover rounded-corners" Width="100%" GridLines="None">

    <Columns>
        <asp:TemplateField HeaderText="First Name">
            <ItemTemplate>
                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Last Name">
            <ItemTemplate>
                <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="MI">
            <ItemTemplate>
                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
