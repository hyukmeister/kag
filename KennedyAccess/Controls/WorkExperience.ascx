<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkExperience.ascx.cs" Inherits="KennedyAccess.Controls.WorkExperience" %>
<%@ Register Src="~/Controls/Contact.ascx" TagPrefix="uc1" TagName="Contact" %>
<asp:Label runat="server" id="txtApplicantID" Visible="false"></asp:Label>
<asp:Repeater ID="repWorkExperience" runat="server" OnItemDataBound="repWorkExperience_ItemDataBound">
    <ItemTemplate>
        <div>
            <asp:Table ID="tabWorkExperience" runat="server" class="table table-hover" Width="100%" >
                <asp:TableRow BackColor="#66FFFF" ID="trWorkExperience">
                    <asp:TableCell>                        
                        <asp:Label runat="server" Text="Work Experience ID"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblWorkExperienceID" runat="server" Text='<%#Eval("WorkExperienceID") %>'></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                        <asp:Button ID="btnEditWorkExp" runat="server" class="btn btn-primary" Text="Edit" CausesValidation="false" OnClick="btnEditWorkExp_Click" />
                        <asp:Button ID="btnSaveWorkExp" runat="server" class="btn btn-primary" Text="Save" ValidationGroup="ContactInfo" OnClick="btnSaveWorkExperience_Click" Visible="false"/>&nbsp;
                        <asp:Button ID="btnDeleteWorkExp" runat="server" class="btn btn-primary" Text="Delete" ValidationGroup="ContactInfo" OnClick="btnDeleteWorkExp_Click" Visible="false"/>&nbsp;
                        <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" CausesValidation="false" ValidationGroup="ContactInfo" OnClick="btnCancel_Click" Visible="false"/>
                    </asp:TableCell>
                </asp:TableRow>
    
                <asp:TableRow ID="TREmployerName">
                    <asp:TableCell ColumnSpan="4">
                        <div class="form-floating mb-3;" style="width:420px">
                        <asp:TextBox ID="txtEmployerName" class="form-control" runat="server" placeholder="Employer Name" Text='<%#Eval("EmployerName") %>'  ReadOnly="true" ValidationGroup="ContactInfo"></asp:TextBox>
                        <label for="txtEmployerName">Employer Name</label></div>
                        <asp:Label runat="server" ID="EmployerID" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4"><br />
                        <div class="form-floating mb-3;" style="width:420px">
                            <asp:TextBox ID="txtAddress1" class="form-control" runat="server" placeholder="Address 1" Text='<%#Eval("Address1") %>' ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="Address 1 is required"></asp:TextBox>
                            <label for="txtAddress1" class="form-label">Address 1</label>
                            <div class="invalid-feedback">Please provide a valid Address 1.</div>
                        </div>            
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <div class="form-floating mb-3;" style="width:420px">
                        <asp:TextBox ID="txtAddress2" class="form-control" runat="server" placeholder="Address 2"  Text='<%#Eval("Address2") %>' ReadOnly="true" ></asp:TextBox>
                        <label for="txtAddress2">Address 2</label></div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="form-floating mb-3;" style="width:420px">
                        <asp:TextBox ID="txtCity" class="form-control" runat="server" placeholder="City"  Text='<%#Eval("City") %>' ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="City is required"></asp:TextBox>
                        <label for="txtCity">City</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <div class="form-floating mb-3;" style="width:350px">
                        <asp:TextBox ID="txtStateProvince" class="form-control" runat="server" placeholder="State" Text='<%#Eval("StateProvince") %>' ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="State/Province is required"></asp:TextBox>
                        <label for="txtCity">State</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <div class="form-floating mb-3;" style="width:240px">
                        <asp:TextBox ID="txtPostalCode" runat="server" class="form-control" placeholder="Postal Code"  Text='<%#Eval("PostalCode") %>' ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="Postal Code is required"></asp:TextBox>
                        <label for="txtPostalCode">Postal Code</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <div class="mb-3;" style="width:350px">
                            <label for="ddlCountry" class="form-label">Country</label><br />
                            <asp:DropDownList ID="ddlCountry" class="form-select"  runat="server" Width="300px" ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="Country is required" ></asp:DropDownList>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <div class="form-floating mb-3;" style="width:240px">
                        <asp:TextBox ID="txtPhoneNumber" class="form-control" runat="server" placeholder="Phone number"  Text='<%#Eval("PhoneNumber") %>' ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="Phone Number is required"></asp:TextBox>
                        <label for="txtPhoneNumber">Phone number</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell Width="200px" HorizontalAlign="Left">
                        <div class="form-floating mb-3;" style="width:100px">
                        <asp:TextBox ID="txtExtention" class="form-control" runat="server" placeholder="Extension"  Text='<%#Eval("Extention") %>' ReadOnly="true" ></asp:TextBox>
                        <label for="txtExtention">Extension</label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <div class="form-floating mb-3;" style="width:350px">
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" TextMode="Email" placeholder="Email"  Text='<%#Eval("Email") %>' ReadOnly="true" ValidationGroup="ContactInfo" requiredrequired="Email is required"></asp:TextBox>
                        <label for="txtEmail">Email</label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label runat="server" Text="Type of Business"></asp:Label><br />
                        <asp:Textbox ID="txtTypeOfBusiness" runat="server" Text='<%#Eval("TypeOfBusiness") %>' ReadOnly="true" BorderStyle="None"></asp:Textbox>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label runat="server" Text="Job Title"></asp:Label><br />
                        <asp:Textbox ID="txtJobTitle" runat="server" Text='<%#Eval("JobTitle") %>' ReadOnly="true" BorderStyle="None" with="300px"></asp:Textbox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" Text="Start Date"></asp:Label><br />
                        <asp:Textbox ID="txtDateFrom" runat="server" TextMode="Date" Text='<%#Eval("DateFrom") %>' ReadOnly="true" BorderStyle="None"></asp:Textbox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" Text="End Date"></asp:Label><br />
                        <asp:Textbox ID="txtDateThru" runat="server" TextMode="Date" Text='<%#Eval("DateThru") %>' ReadOnly="true" BorderStyle="None"></asp:Textbox>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Label runat="server" Text="Number of hours worked per week"></asp:Label><br />
                        <asp:Textbox ID="txtHoursPerWeek" runat="server" TextMode="Number" Text='<%#Eval("HoursPerWeek") %>' ReadOnly="true" BorderStyle="None"></asp:Textbox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <asp:Label runat="server" Text="Job details (duties performed, use of tools, machines, equipment, skills, qualifications, certifications, licenses, etc.
                        Include the phone number of the employer and the name of the alien’s supervisor.)"></asp:Label><br />
                        <asp:Textbox ID="txtJobDescription" runat="server" Width="100%" TextMode="MultiLine" Rows="2" ReadOnly="true" BorderStyle="None" Text='<%#Eval("JobDescription") %>'></asp:Textbox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Button ID="btnNewWorkExperience" runat="server" class="btn btn-primary" Text="New Work Experience" OnClick="btnNewWorkExperience_Click" />

