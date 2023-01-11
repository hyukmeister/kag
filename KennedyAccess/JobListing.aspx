<%@ Page Title="Job Listing" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="KennedyAccess.JobListing" %>

<%@ Register Src="~/Controls/ProfilePicture.ascx" TagPrefix="uc1" TagName="ProfilePicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label ID="lblJobListing" runat="server" Text=""></asp:Label>
    </h2>
    <asp:Label ID="lblJobListingID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblCampaignID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblRecordType" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="labApplicationID" runat="server" Visible="false"></asp:Label>

    <div class="jumbotron" style="width: 900px;">
        <asp:Table ID="tblJobListing" runat="server" class="table table-hover" Width="100%">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4" HorizontalAlign="Right">
                    <button id="btnApply" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myQuestionnaireModal">Apply</button>&nbsp;
                    <button id="btnOfferLetter" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myOfferLetterModal">Review Offer Letter</button>&nbsp;
                    <asp:Button runat="server" ID="btnWithdraw" class="btn btn-primary" Text="Withdraw Application" OnClick="btnWithdraw_Click" />&nbsp;
                    <%--<asp:Button ID="btnGoBack" runat="server" class="btn btn-default" Text="Go Back" CausesValidation="false" Visible="True" />--%>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                 <asp:TableCell ColumnSpan="2" RowSpan="5">
                     <uc1:ProfilePicture runat="server" ID="ProfilePicture" />
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;">
                        <asp:TextBox ID="txtH_3_JobTitle" class="form-control" runat="server" placeholder="Job Title" ReadOnly="true" BorderStyle="None" Width="100%"></asp:TextBox>
                        <label for="txtH_3_JobTitle">Job Title</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;">
                        <asp:TextBox ID="txtH_11_JobDuties" class="form-control" runat="server" placeholder="Job Title" ReadOnly="true" BorderStyle="None" Width="100%" Rows="7" TextMode="MultiLine"></asp:TextBox>
                        <label for="txtH_11_JobDuties">Job Duties</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" Style="width: 350px">
                    <div class="form-floating mb-3;" style="width: 350px">
                        <asp:TextBox ID="txtG_1A_OfferedWageFrom" class="form-control" runat="server" placeholder="Offered Wage From" ReadOnly="true" BorderStyle="None" Width="350px" TextMode="Number"></asp:TextBox>
                        <label for="txtG_1A_OfferedWageFrom">Offered Wage From</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" Style="width: 350px">
                    <div class="form-floating mb-3;" style="width: 350px">
                        <asp:TextBox ID="txtG_1B_OfferedWageTo" class="form-control" runat="server" placeholder="Offered Wage To" ReadOnly="true" BorderStyle="None" Width="350px" TextMode="Number"></asp:TextBox>
                        <label for="txtG_1B_OfferedWageTo">Offered Wage To</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <label class="form-label" HorizontalAlign="Left">&nbsp; Per</label><br />
                    <asp:RadioButtonList class="form-check-input" ID="rblRatePeriod" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false" BorderStyle="None">
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Hour" Value="h" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Week" Value="w" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Bi-Weekly" Value="b" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Month" Value="m" style="margin-right: 20px;" />
                        <asp:ListItem class="form-check-input" Enabled="True" Text="Year" Value="y" style="margin-right: 20px;" />
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;" style="width: 800px">
                        <asp:TextBox ID="txtH_1_Address1" class="form-control" runat="server" placeholder="Address 1" ReadOnly="True" BorderStyle="None" Width="100%"></asp:TextBox>
                        <label for="txtH_1_Address1" class="form-label">Address 1</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <div class="form-floating mb-3;" style="width: 800px">
                        <asp:TextBox ID="txtH_1A_Address2" class="form-control" runat="server" placeholder="Address 2" ReadOnly="True" BorderStyle="None" Width="100%"></asp:TextBox>
                        <label for="txtH_1A_Address2" class="form-label">Address 2</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <div class="form-floating mb-3;" style="width: 420px">
                        <asp:TextBox ID="txtH_2A_City" class="form-control" runat="server" placeholder="City" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                        <label for="txtH_2A_City">City</label>
                    </div>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" Text="State"></asp:Label><br />
                    <asp:DropDownList ID="ddlState" runat="server" Enabled="false"></asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="1">
                    <div class="form-floating mb-3;" style="width: 240px">
                        <asp:TextBox ID="txtH_2C_Postalcode" runat="server" class="form-control" ReadOnly="true" placeholder="Postal Code"></asp:TextBox>
                        <label for="txtH_2C_Postalcode">Postal Code</label>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <asp:panel id="panQuestionnaire" runat="server">
    <div style="width:750px">
        <div class="modal fade" id="myQuestionnaireModal">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width:750px">
                    <div class="modal-header">
                        <div class="modal-body">
                            <asp:table runat="server">
                                <asp:TableFooterRow>
                                    <asp:TableCell >
                                       <h3 class="modal-title">Questionnaire</h3><br />
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </asp:TableCell>
                                </asp:TableFooterRow>
                                <asp:tableRow>
                                    <asp:tablecell><asp:Label ID="Label0" runat="server" Text="Employer: "></asp:Label></asp:tablecell>
                                    <asp:tablecell><asp:Label ID="Label2" runat="server" Text="xxxx "></asp:Label></asp:tablecell>
                                </asp:tableRow>
                                <asp:tableRow>
                                    <asp:tablecell><asp:Label ID="Label3" runat="server" Text="Job Title: "></asp:Label></asp:tablecell>
                                    <asp:tablecell><asp:Label ID="labJobTitle_QR" runat="server" ></asp:Label><BR /><BR /></asp:tablecell>
                                </asp:tableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <asp:GridView ID="gvQuestionnaire" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvQuestionnaire_RowDataBound"
                                            class="table table-bordered table-hover" style="border-radius:15px;" CellPadding="4"
                                            GridLines="None" ShowHeaderWhenEmpty="true" Width="100%">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="QuestionnaireID" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labQuestionnaireID" runat="server" Text='<%# Eval("QuestionnaireID") %>'></asp:Label>
                                                        <asp:Label ID="labQuestionnaireResponseID" runat="server" Text='<%# Eval("QuestionnaireResponseID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Questions" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labQuestionType" runat="server" Visible="false" Text='<%# Eval("QuestionType") %>'></asp:Label>
                                                        <asp:Label ID="labQuestion" runat="server" BorderWidth="0" BorderStyle="None" Text='<%# Eval("Question") %>' Width="550px" MaxLength="255" ></asp:Label><br />
                                                        <asp:RadioButtonList ID="rblResponse" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="150px" Visible="false">
                                                            <asp:ListItem Enabled="True" Text="&nbsp;Yes" Value="1" style="margin-right: 20px;" />
                                                            <asp:ListItem Enabled="True" Text="&nbsp;No" Value="0" style="margin-right: 20px;" />
                                                        </asp:RadioButtonList>
                                                        <asp:TextBox ID="txtResponse" runat="server" Visible="false" Width="100%"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvrblResponse" runat="server" ControlToValidate="rblResponse" ValidationGroup="QuestionnaireResponse" Enabled="false" ErrorMessage="Your response is requred" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="rfvtxtResponse" runat="server" ControlToValidate="txtResponse" ValidationGroup="QuestionnaireResponse" Enabled="false" ErrorMessage="Your response is requred" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                    <HeaderStyle BorderStyle="None"></HeaderStyle>
                                                    <ItemStyle BorderStyle="None"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        </asp:GridView><br />
                                        <asp:Label runat="server" Text="By submitting this questionnaire, you are applying this job and will not be able to apply other jobs while this applicaiton is being processed." /><br />
                                        <asp:Button ID="btnSubmitQuestionnaire" runat="server" class="btn btn-primary" 
                                            ValidationGroup="QuestionnaireResponse" Text="Submit" OnClick="btnSubmitQuestionnaire_Click" />

                                     </asp:TableCell>
                                </asp:TableRow>
                            </asp:table>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="width:750px">
        <div class="modal fade" id="myOfferLetterModal">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width:750px">
                    <div class="modal-header">
                        <div class="modal-body">
                            <asp:table runat="server">
                                <asp:TableFooterRow>
                                    <asp:TableCell >
                                        <h3 class="modal-title">Offer Letter</h3><br />
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </asp:TableCell>
                                </asp:TableFooterRow>
                                <asp:tableRow>
                                    <asp:tablecell><asp:Label ID="labOfferLetter" runat="server"></asp:Label></asp:tablecell>
                                </asp:tableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <asp:Label runat="server" Text="Please review the offer letter carefully. If you acceept the offer, type your name below and click submit. By submitting this, you are agreeing and accepting this offer." /><br />
                                        <div class="form-floating mb-3;" style="width: 240px">
                                            <asp:TextBox ID="txtAcceptance" runat="server" class="form-control" ValidationGroup="OfferLetterResponse" placeholder="Type your full name"></asp:TextBox>
                                            <label for="txtAcceptance">Full Name</label>
                                            <asp:RequiredFieldValidator ID="rfvtxtAcceptance" runat="server" ControlToValidate="txtAcceptance" forecolor="red"
                                                ValidationGroup="OfferLetterResponse" ErrorMessage="Your full name is required"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button ID="btnAccept" runat="server" class="btn btn-primary" 
                                            ValidationGroup="OfferLetterResponse" Text="I Accept" OnClick="btnAccept_Click"/>
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" value="Close">Close</button>
                                        </asp:TableCell>
                                </asp:TableRow>
                            </asp:table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </div>


   </asp:panel>
</asp:Content>
