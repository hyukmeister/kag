<%@ Page Title="Employer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employer.aspx.cs" Inherits="KennedyAccess.Employer" %>

<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>
<%@ Register Src="~/Controls/Questionnaire.ascx" TagPrefix="uc2" TagName="Questionnaire" %>
<%@ Register Src="~/Controls/Attachments.ascx" TagPrefix="uc3" TagName="Attachments" %>
<%@ Register Src="~/Controls/UserFiles.ascx" TagPrefix="uc5" TagName="UserFiles" %>
<%@ Register Src="~/Controls/EmployerInfo.ascx" TagPrefix="uc6" TagName="EmployerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CheckBox ID="cbkEmployerChanged" runat="server" Checked="false" Visible="false" />
    <h2>
        <asp:Label ID="labEmployer" runat="server" Text=""></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="Table2" runat="server" class="table"
            Style="border-radius: 15px;" CellPadding="4" GridLines="None" Width="100%">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Table ID="tabEmployer" runat="server" class="table table-responsive table-hover">
                        <asp:TableRow>

                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Button ID="btnEditEmployer" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnEditEmployer_Click" />
                                <asp:Button ID="btnSaveEmployer" runat="server" class="btn btn-primary" Text="Save" OnClick="btnSaveEmployer_Click" Visible="false" />&nbsp;
                                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnCancel_Click" Visible="false" />
                            </asp:TableCell>
                        </asp:TableRow>
                       <asp:TableRow Visible="false">
                            <asp:TableCell><asp:Label runat="server" Text="Employer ID"></asp:Label></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="txtEmployerID" runat="server"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:Label runat="server" Text="Record Type"></asp:Label></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="txtRecordType" runat="server"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell><asp:Label runat="server" Text="Franchise"></asp:Label></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="txtFranchise" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="4" RowSpan="4">
                                <uc6:EmployerInfo runat="server" id="EmployerInfo" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    
        <div class="accordion" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingZero">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseZero" aria-expanded="false" aria-controls="flush-collapseZero">
                        <h5>Contacts</h5>
                    </button>
                </h2>
                <div id="flush-collapseZero" class="accordion-collapse" aria-labelledby="flush-headingZero" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <div class="accordion" id="accordEmployer">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <h5>Employer Information (Headquarters or Main Office)</h5>
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <uc1:Contact runat="server" ID="Headquarter" ContactType="Headquarter" EmployerID="" />
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <h5>Employer Contact Information</h5>
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <uc1:Contact runat="server" ID="EmployerContact" ContactType="Employer" EmployerID="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="panStep2" runat="server">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                            <h5>Prevailing Wages<asp:Label ID="labPrevWage" runat="server" Text=""></asp:Label></h5>
                        </button>
                    </h2>
                    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <asp:GridView ID="gvPrevailingWages" runat="server" AutoGenerateColumns="False"
                                class="table table-hover" GridLines="None" Style="border-radius: 15px;" CellPadding="4"
                                OnRowCommand="gvPrevailingWages_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="PrevailingWagesID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrevailingWagesID" runat="server" Text='<%# Eval("PrevailingWageID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Wages Tracking">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("F_1_WageTracking") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Occupation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("F_3_Occupation") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Determination Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDateFrom" runat="server" Text='<%# Eval("F_7_DeterminationDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Expiration Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDateThru" runat="server" Text='<%# Eval("F_8_ExpirationDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:ButtonField>
                                </Columns>
                                <HeaderStyle BackColor="dimgray" ForeColor="White" />
                            </asp:GridView>
                            <asp:Button ID="btnNewPrevailingWage" runat="server" class="btn btn-primary" Text="New Prevailing Wage" OnClick="btnNewPrevailingWage_Click" />
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            <h5>Campaigns<asp:Label ID="labNumCampaign" runat="server" Text=""></asp:Label></h5>
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <asp:GridView ID="gvCampaigns" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCampaign_RowCommand"
                                class="table table-bordered table-hover" Style="border-radius: 15px;" CellPadding="4"
                                GridLines="None" ShowHeaderWhenEmpty="true" EmptyDataText="Campaigns not found">
                                <Columns>
                                    <asp:TemplateField HeaderText="Campaign Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderStyle="None"></HeaderStyle>
                                        <ItemStyle BorderStyle="None"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Campaign Start Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDateFrom" runat="server" Text='<%# Eval("DateFrom") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderStyle="None"></HeaderStyle>
                                        <ItemStyle BorderStyle="None"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Campaign End Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDateThru" runat="server" Text='<%# Eval("DateThru") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle BorderStyle="None"></HeaderStyle>
                                        <ItemStyle BorderStyle="None"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CampaignID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCampaignID" runat="server" Text='<%# Eval("CampaignID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle BorderStyle="None"></HeaderStyle>
                                        <ItemStyle BorderStyle="None"></ItemStyle>
                                    </asp:ButtonField>
                                </Columns>
                            </asp:GridView>
                            <asp:Button ID="btnNewCampaign" runat="server" class="btn btn-primary" Text="New Campaign" OnClick="btnNewCampaign_Click" />
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            <h5>Questionnaires</h5>
                        </button>
                    </h2>
                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <uc2:Questionnaire runat="server" ID="Questionnaire" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>

                <asp:Panel ID="panFiles" runat="server">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingFive">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                            <h5>Files</h5>
                        </button>
                    </h2>
                    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <uc5:UserFiles runat="server" ID="UserFiles" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                </asp:Panel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

