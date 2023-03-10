<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="I140CheckList.ascx.cs" Inherits="KennedyAccess.Controls.I140CheckList" %>
    <asp:Table ID="tabI140SubmissionCKList" runat="server" class="table table-hover">
        <asp:TableRow BackColor="dimgray" CssClass="rounded-corners">
            <asp:TableCell ColumnSpan="2">
                <label class="form-label" HorizontalAlign="Left" style="font-size:22px; color:white;">I-140 Submission</label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="40%">
                <asp:Label runat="server" Text="Payment and USCIS filing fee"></asp:Label>
            </asp:TableCell>
            <asp:TableCell Width="60%">
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtRecievedDate" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtRecievedDate">Recieved Date</label>
                </div>
                <br />
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtAmount" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Number"></asp:TextBox>
                    <label for="txtRecievedDate">Amount</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Current address"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <br />
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtAddress1" class="form-control" runat="server" placeholder="Address1" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                    <label for="txtRecievedDate">Address</label>
                </div>
                <br />
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtAddress2" class="form-control" runat="server" placeholder="Address 2"></asp:TextBox>
                    <label for="txtAddress2">Address 2</label>
                </div>
                <br />
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtCity" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                    <label for="txtCity">City</label>
                </div>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtStateProvince" class="form-control" runat="server" placeholder="State"></asp:TextBox>
                    <label for="txtCity">State</label>
                </div>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtPostalCode" runat="server" class="form-control" placeholder="Postal Code"></asp:TextBox>
                    <label for="txtPostalCode">Postal Code</label>
                </div>
                <br />
                <div class="mb-3;">
                    <label for="ddlCountry" class="form-label">Country</label><br />
                    <asp:DropDownList ID="ddlCountry" CssClass="btn btn-default btn-outline-secondary align-items-start text-start" runat="server" Width="250px"></asp:DropDownList>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Current Legal Status in US"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtLegalStatus" class="form-control" runat="server" placeholder="Legal Status" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                    <label for="txtLegalStatus">Legal Status</label>
                </div>
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="I-140 Processing Type (Regular or Premium)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtProcessingType" class="form-control" runat="server" placeholder="Processing Type" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                    <label for="txtProcessingType">Processing Type</label>
                </div>
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of Request (Draft Pkg)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;" style="width:200px;">
                    <asp:TextBox ID="txtDateRequest" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateRequest">Date of Request</label>
                </div>
                <asp:Button runat="server" class="btn btn-primary" ID="btnTodayDraft" Text="Today"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of I-140 Pkg sent to Atty"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;" style="width:200px;">
                    <asp:TextBox ID="txtDateI140SentAtty" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateI140SentAtty">Date of I-140 Pkg sent to Atty</label>
                </div>
                <asp:Button runat="server" class="btn btn-primary" ID="btnTodayAtty" Text="Today"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of I-140 Pkg sent to USCIS"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;" style="width:200px;">
                    <asp:TextBox ID="txtDateI140SentUSCIS" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateI140SentUSCIS">Date of I-140 Pkg sent to USCI</label>
                </div>
                <asp:Button runat="server" class="btn btn-primary" ID="btnTodayUSCIS" Text="Today"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of I-140 submission"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateI140Submission" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateI140Submission">Date of I-140 submission</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="I-140 case number"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtI140CaseNumber" class="form-control" runat="server" placeholder="Processing Type" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                    <label for="txtI140CaseNumber">I-140 case number</label>
                </div>
                <br />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of RFE Received (Create 2nd + RFE)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateRFEReceived" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateRFEReceived">Date of RFE Received (Create 2nd + RFE)</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of RFE Expiration (2nd +)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateRFEExpiration" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateRFEExpiration">Date of RFE Expiration (2nd +)</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of RFE Respond (2nd +)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateRFERespond" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateRFERespond">Date of RFE Respond (2nd +)</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="I-140 Approval Date"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateI140Approval" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateI140Approval">I-140 Approval Date</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="I-140 Denial (NOID) date"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateI140Denial" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateI140Denial">I-140 Denial (NOID) date</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="NOID response due date"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateNOIDResponseDue" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateNOIDResponseDue">NOID response due date</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of NOID respond<br/>(Available to Create the NOID appeal)"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateNOIDRespond" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateNOIDRespond">Date of NOID respond (Available to Create the NOID appeal)</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Text="Date of NOID denial"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <div class="form-floating mb-3;">
                    <asp:TextBox ID="txtDateNOIDDenial" class="form-control" runat="server" placeholder="Date" ReadOnly="true" BorderStyle="None" TextMode="Date"></asp:TextBox>
                    <label for="txtDateNOIDDenial">Date of NOID denial</label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
