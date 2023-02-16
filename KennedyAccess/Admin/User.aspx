<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="KennedyAccess.User1" %>

<%@ Register Src="~/Controls/Toggle.ascx" TagPrefix="uc1" TagName="Toggle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="background-image: url('../images/kagimg10.jpg'); filter: blur(4px); height: 100px; width: 900px; background-size: cover; background-position: center; position: relative; opacity: 55%; top: 20px">
        &nbsp;
    </div>
    
    <h2><asp:Label ID="labUser" runat="server" Text=""></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">

        <asp:Table ID="tabUser" runat="server" class="table table-hover" Width="840px">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <asp:TextBox ID="txtError" runat="server"  Visible="false" ForeColor="Red" BorderStyle="None" BackColor="Transparent" Width="450px"></asp:TextBox>
                    <asp:Button ID="btnEditUser" runat="server" class="btn btn-primary" Text="Edit" OnClick="btnEditUser_Click" />
                    <asp:Button ID="btnSaveUser" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSaveUser_Click" Visible="false"/>&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click"/>
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
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Left" BackColor="dimgray" ForeColor="white" class="rounded-corners">
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
                    <asp:Label runat="server" Text="Status"></asp:Label>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign="left">
                    <uc1:Toggle runat="server" ID="cbkActive" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="User Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtUserName" ReadOnly="true" Style="text-align: Left" runat="server" BorderStyle="NotSet" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Authenticated"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <uc1:Toggle runat="server" ID="cbkAuthenticated" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="FirstName"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirstName" ReadOnly="true" Style="text-align: Left" runat="server" BorderStyle="NotSet" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Last Name"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLastName" ReadOnly="true" Style="text-align: Left" runat="server" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Email"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtEmail" ReadOnly="true" Style="text-align: Left" runat="server" TextMode="Email" BorderStyle="NotSet" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Mobilephone"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMobilephone" ReadOnly="true" Style="text-align: Left" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Valid From"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtValidFrom" ReadOnly="true" Style="text-align: left" runat="server" TextMode="Date" BorderStyle="NotSet" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Valid Thru"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtValidThru" ReadOnly="true" Style="text-align: left" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="User Profile"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="btn btn-default btn-outline-secondary"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Authentication Code"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAuthenticationCode" ReadOnly="true" Style="text-align: Left" runat="server" BorderStyle="None" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Created Date"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCreateDate" ReadOnly="true" Style="text-align: left" runat="server" TextMode="Date" BorderStyle="NotSet" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Last Modified Date"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtModifiedDate" ReadOnly="true" Style="text-align: left" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Note"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="3">
                    <asp:TextBox ID="txtNote" ReadOnly="true" Style="text-align: Left" runat="server" TextMode="MultiLine" Width="100%" BorderStyle="NotSet" CssClass="form-control"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table><br /><br />


        <h3><asp:Label ID="Label2" runat="server" Text="User Roles"></asp:Label></h3>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvRoleSets" runat="server" AutoGenerateColumns="False" class="table table-hover"  
                GridLines="None" CellPadding="4" OnRowEditing="gvRoleSets_RowEditing" ShowFooter="True" 
                OnRowDeleting="gvRoleSets_RowDeleting" OnRowDeleted="gvRoleSets_RowDeleted"
                OnRowCancelingEdit="gvRoleSets_RowCancelingEdit" OnRowUpdating="gvRoleSets_RowUpdating" >
                    <Columns>
                    <asp:TemplateField HeaderText="Active" >
                        <ItemTemplate>
                            <uc1:Toggle runat="server" ID="cbkActive" ControlLabel="RoleStatus" Checked='<%# Eval("Active") %>' CheckedText="Active" UncheckedText="Inactive" Disable="true"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LabRoleID" runat="server" Text='<%# Eval("RoleID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="labRoleRelID" runat="server" Text='<%# Eval("RoleRelID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblRecordType" runat="server" Text='<%# Eval("RecordType") %>' Visible="false"></asp:Label>
                            <asp:CheckBox ID="cbkActive" Runat="server" Checked='<%# Eval("Active") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <uc1:Toggle runat="server" ID="fActive" ControlLabel="RoleStatus" Checked='false' CheckedText="Active" UncheckedText="Inactive" Disable="false"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manual" ItemStyle-HorizontalAlign="Center" >
                        <ItemTemplate>
                            <asp:CheckBox ID="cbkManual" Runat="server" Checked='<%# Eval("Manual") %>' enabled="false"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role Name" ItemStyle-Width="10px">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleName" runat="server" Text='<%# Eval("RoleName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="fRoleName" runat="server" CssClass="btn btn-default btn-outline-primary"></asp:DropDownList>
                            <asp:TextBox ID="txtRoleError" runat="server"  Visible="false" ForeColor="Red" BorderStyle="None" BackColor="Transparent"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role Description">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleDescription" runat="server" Text='<%# Eval("RoleDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Valid From">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ValidFrom") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtValidFrom" Runat="server" Width="100px" Text='<%# Eval("ValidFrom") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="fDateFrom" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Valid Thru" FooterStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="labValidThru" runat="server" Text='<%# Eval("ValidThru") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtValidThru" Runat="server" Width="140px" Text='<%# Eval("ValidThru") %>' TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="fDateThru" runat="server" TextMode="Date" Width="120px" CssClass="form-control"></asp:TextBox>&nbsp;
                            <asp:ImageButton ID="NewRole" runat="server" OnClick="NewRole_Click" AlternateText="Save" ImageAlign="Top" Height="25px" ImageUrl="~/images/save_icon.png"/>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ItemStyle-Width="80px" />
                </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>
