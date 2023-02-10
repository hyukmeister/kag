<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserSearchProfiles.ascx.cs" Inherits="KennedyAccess.Controls.UserSearchProfiles" %>
<%@ Register Src="~/Controls/DropDownCheckBox.ascx" TagPrefix="uc1" TagName="DropDownCheckBox" %>
    <div class="mb-3;" style="width: 200px">
        <uc1:DropDownCheckBox runat="server" id="ddcbEmployers" ControlLabel="Employers" />
    </div>

    <div class="mb-3;" style="width: 200px">
        <uc1:DropDownCheckBox runat="server" id="ddcbCampaigns" ControlLabel="Campaigns"/>
    </div>

    <div class="mb-3;" style="width: 200px">
        <uc1:DropDownCheckBox runat="server" id="ddcbStatuses" ControlLabel="Statuses"/>
    </div>

    <asp:Button ID="btnSearch" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" text="Search" OnClick="btnSearch_Click"/>
    <button id="btnNewProfile" type="button" class="btn btn-default btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">New Profile</button>
    <asp:Button id="btnSaveProfile" runat="server" class="btn btn-default btn-outline-primary" Text="Save" OnClick="btnSaveProfile_Click" /><br /><br />
    <asp:GridView ID="gvSearchProfiles" runat="server" AutoGenerateColumns="False" Width="100%" OnRowDataBound="gvSearchProfiles_RowDataBound"
        GridLines="None" class="table table-hover" OnRowCommand="gvSearchProfiles_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="UsrSearchID" Visible="false" SortExpression="UsrSearchID">
                <ItemTemplate>
                    <asp:Label ID="UsrSearchID" runat="server" Text='<%# Eval("UsrSearchID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Default" Visible="true" SortExpression="Default">
                <ItemTemplate>
                    <asp:CheckBox ID="cbkDefault" Runat="server" Checked='<%# Eval("Default") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Profile Name" SortExpression="ProfileName">
                <ItemTemplate>
                    <asp:Label ID="lblProfileName" runat="server" Text='<%# Eval("SearchName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open">
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:ButtonField>
        </Columns>
        <HeaderStyle BackColor="dimgray" ForeColor="White" />
    </asp:GridView>

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
