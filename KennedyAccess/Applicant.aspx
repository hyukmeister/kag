<%@ Page Title="Applicant" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Applicant.aspx.cs" Inherits="KennedyAccess.Applicant" %>

<%@ Register Src="~/Controls/WorkExperience.ascx" TagPrefix="uc2" TagName="WorkExperience" %>
<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>
<%@ Register Src="~/Controls/Attachments.ascx" TagPrefix="att" TagName="Attachments" %>
<%@ Register Src="~/Controls/ApplicantInfo.ascx" TagPrefix="uc4" TagName="ApplicantInfo" %>
<%@ Register Src="~/Controls/ApplicantFamily.ascx" TagPrefix="uc5" TagName="ApplicantFamily" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label ID="labApplicantID" runat="server" Visible="false"></asp:Label>

    <script src="https://www.paypal.com/sdk/js?client-id=AepfpfwepHHb_K-Ob9k_ocTwZqHQGYpKa8HUnDDnUtwv7qZHhg30N6kW0dQo7BIUq3CE6iQ0oztHezNz&components=buttons"></script>
    <table border="0" style="width:900px;">
        <tr>
            <td><h2><asp:Label id="labApplicant" runat="server" Text="Applicant Profile"></asp:Label></h2></td>
            <td style="align-content:end"><asp:Image ID="imgApplicantProgress" runat="server" Width="600px" Height="35px"/></td>
        </tr>
    </table>

    <asp:Table ID="tabApplicant" runat="server" class="table table-responsive table-hover" style="width: 900px;">
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
            </asp:TableCell>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                <asp:Button ID="btnEditApplicant" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false" OnClick="btnEditApplicant_Click" />
                <asp:Button ID="btnSaveApplicant" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="ApplicantInfo" OnClick="btnSaveApplicant_Click" Visible="false"/>&nbsp;
                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnCancel_Click" Visible="false"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <uc4:ApplicantInfo runat="server" id="ApplicantInfo" />

    <div class="accordion" id="accordionFlushExample" style="width: 900px;">
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                <h5>Contacts</h5>
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="accordion" id="accordApplicant">
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            <h5>Current Address</h5>
                          </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordApplicant">
                          <div class="accordion-body">
                            <uc1:Contact runat="server" ID="contApplicantContact" ContactType="Applicant" ApplicantID=""/>
                          </div>
                        </div>
                      </div>
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <h5>Foreign Address</h5>
                          </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordApplicant">
                          <div class="accordion-body">
                            <uc1:Contact runat="server" ID="contApplicantOversea" ContactType="ApplicantOversea" ApplicantID=""/>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:Panel ID="panStep2" runat="server">

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingSix">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                <h5>Family Members</h5>
                </button>
            </h2>
            <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <uc5:ApplicantFamily runat="server" id="ApplicantFamily" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                <h5>Work Experience</h5>
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <uc2:WorkExperience runat="server" ID="WorkExperience" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                <h5>Payment Schedule</h5>
                </button>
            </h2>
            <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <asp:Table ID="Table4" runat="server" BorderStyle="None" Width="100%">
                        <asp:TableRow runat="server" ID="trPaymentHeader">
                            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                                <asp:Panel ID="pamPayment" runat="server">
                                <asp:Table runat="server">
                                    <asp:TableRow id="trPaymentButton">
                                        <asp:TableCell ColumnSpan="4">
                                            <asp:Table ID="tabPaymentSchedule" runat="server" BorderStyle="None" class="table" Width="100%">
                                                <asp:TableRow BorderStyle="None">
                                                    <asp:TableCell ColumnSpan="3" BorderStyle="None">Please select a payment plan below:</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow BackColor="dimgray" ForeColor="White">
                                                    <asp:TableCell>&nbsp;</asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:RadioButton GroupName="PaymentPlan" ID="rb2022A" runat="server" Text="2022A Payment Plan"/>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:RadioButton GroupName="PaymentPlan" ID="rb2022M" runat="server" Text="2022M Payment Plan"/>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>Installment</asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022AInstallment" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022MInstallment" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>Monthly Payment</asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022AMonthlyPayment" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022MMonthlyPayment" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>Filing Fee</asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022AFilingFee" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022MFilingFee" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow BackColor="#cccccc">
                                                    <asp:TableCell>Final Amount</asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022AFinalAmount" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="lab2022MFinalAmount" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow BackColor="dimgray" ForeColor="White">
                                                    <asp:TableCell>Total Payment</asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="labLumpSumPlanTotal" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell HorizontalAlign="Center">
                                                        <asp:Label ID="labMontlyPlanTotal" runat="server"></asp:Label>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:Button ID="btnSchedulePayment" runat="server" class="btn btn-primary" Text="Select Payment Plan" OnClick="btnSchedulePayment_Click"/>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow id="trPaymentSchedule">
                                        <asp:TableCell ColumnSpan="4">
                                            <div ID="divPayment" style="width:100%">

                                                <p style="align-content:center;">
                                                    Please open and sign the service agreement to proceed.
                                                    <asp:LinkButton ID="lbServiceAgreement" runat="server" Text="Sign Agreement" CssClass="btn btn-primary" OnClientClick="openAgreement(); return false;" ></asp:LinkButton>
                                                </p>

                                                <asp:GridView ID="gvPaymentSchedule" runat="server" AutoGenerateColumns="False" style="width:100%"
                                                    BorderStyle="None" class="table table-hover" OnRowDataBound="gvPaymentSchedule_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Payment ID">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaymentID" runat="server" Text='<%# Eval("PaymentID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Due Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbPaymentDate" runat="server" Text=''></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaymentAmount" runat="server" Text='<%# Eval("PaymentAmount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payment Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblStatusText" runat="server" Text='<%# Eval("StatusText") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date Paid">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaymentDate" runat="server" Text='<%# Eval("DatePaid") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Transaction Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTransactionID" runat="server" Text='<%# Eval("TransactionID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#ccffff" />
                                                </asp:GridView>
                                                <button id="btnPayNow" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myPaymentModal">Pay Now</button>
                                            </div>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:Panel>
                        </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFive">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                <h5>Attachements</h5>
                </button>
            </h2>
            <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">

                    <att:Attachments runat="server" id="contAttachments" ReferenceID=""/>

                </div>
            </div>
        </div><br />
        </asp:Panel>
    </div>

    <div>
        <div class="modal fade" id="myPaymentModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width:450px; position: relative; align-items:center">
                    <div class="modal-header">
                        <h4 class="modal-title">Payment Details</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:Label ID="Label0" runat="server" Text="Payment No: "></asp:Label>
                            <asp:Label ID="lblPaymentID" runat="server" Text=""></asp:Label>
                        </div><br />
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Due Date"></asp:Label>
                            <asp:Label ID="lblDueDate" runat="server" Text=""></asp:Label>
                        </div><br />
                        <asp:Table ID="Table1" runat="server" class="table table-hover" Width="340px" >
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BackColor="#202060" ForeColor="#66FFFF">
                                    <asp:Label runat="server" Text="">Description</asp:Label>
                                </asp:TableCell>
                                <asp:TableCell BackColor="#202060" ForeColor="#66FFFF" HorizontalAlign="Center">
                                    <asp:Label runat="server" Text="">Amount</asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><asp:Label runat="server" Text="Due Amount"></asp:Label></asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right"><asp:Label ID="lblDueAmount" runat="server"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><asp:Label ID="labProcessingFeeRate" runat="server" Text=""></asp:Label></asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right"><asp:Label ID="lblProcessingFee" runat="server"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><asp:Label runat="server" Text="Total Amount" Font-Bold="true"></asp:Label></asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right"><asp:Label ID="blbDueTotal" runat="server" Font-Bold="true"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="modal-footer" ID="panPayPal" style="width:120px;">
                    </div>
                </div>
            </div>
            <script type='text/javascript'>
                function openPayment() {
                    $('[id*=myPaymentModal]').modal('show');
                }
                function OnSuccess(response, userContext, methodName) {
                    alert(response);
                }
                function onFail(response, userContext, methodName) {
                    alert(response);
                }
                function openAgreement() {
                    $('[id*=myAgreementModal]').modal('show');
                }
            </script>
        </div>

        <div class="modal fade" id="myAgreementModal"style="width:100%">
            <div class="modal-dialog">
                
                <div class="modal-content" style="width:1000px;position: relative; left: -200px;top:28px;">
                    <div class="modal-header">
                        <h4 class="modal-title">Service Agreement</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <iframe src='https://na4.documents.adobe.com/public/esignWidget?wid=<%=((Label)ApplicantInfo.FindControl("labWebForm")).Text%>&hosted=false' 
                            frameborder="0" style="width:100%;border: 0; overflow: hidden; min-height: 600px;"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        paypal.Buttons({
            createOrder: function (data, actions) {
                // Set up the transaction
                return actions.order.create(
                    {
                        purchase_units: [{
                            amount: { value: '<%=blbDueTotal.Text.Replace(",","").Replace("$","")%>' }
                        }]
                    });
            },
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (orderData) {
                    var transaction = orderData.purchase_units[0].payments.captures[0];
                    window.location.href = "Applicant.aspx?status=success&pid=<%=((Label)ApplicantInfo.FindControl("labWebForm")).Text%>&authcode=" + transaction.id;
                });
            },
            onError: function (err) {
                window.location.href = "Transaction/TransactionFailure.aspx";
            },
            style: {
                layout: 'vertical',
                color: 'blue',
                shape: 'pill',
                label: 'paypal'
            }
        }).render('#panPayPal');
    </script>
</asp:Content>
