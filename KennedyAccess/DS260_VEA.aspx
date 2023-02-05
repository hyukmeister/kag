<%@ Page Title="DS260 Immigrant Visa Electronic Application " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DS260_VEA.aspx.cs" Inherits="KennedyAccess.DS260_VEA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label ID="labDS260_VEA" runat="server" Text="DS260 Immigrant Visa Electronic Application"></asp:Label></h2>
    <div class="jumbotron" style="width: 900px;">
        <asp:Label ID="labDS260ID" runat="server" Visible="false"></asp:Label>
        <div class="jumbotron" style="width: 900px;">
            <asp:Table ID="tblDS260_VEA" runat="server" class="table table-hover" Width="100%">
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt1_Surname" class="form-control" runat="server" placeholder="Surname"></asp:TextBox>
                            <label for="txt1_Surname" class="form-label">Full Name in English Surname: </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt1_1_GivenName" class="form-control" runat="server" placeholder="Given Name"></asp:TextBox>
                            <label for="txt1_1_GivenName" class="form-label">Given Name: </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt1_2_FullNameInNative" class="form-control" runat="server" placeholder="Full Name in Native Language: "></asp:TextBox>
                            <label for="txt1_2_FullNameInNative" class="form-label">Full Name in Native Language: </label>
                        </div>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Have you ever used Another Name? &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl2_AnotherName" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt2_1_AnotherSurname" class="form-control" runat="server" placeholder="Surname"></asp:TextBox>
                            <label for="txt2_1_AnotherSurname" class="form-label">If yes, Surname of another name used: </label>
                        </div>
                        <br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt" class="form-control" runat="server" placeholder="Given Name"></asp:TextBox>
                            <label for="txt2_2_AnotherGivenName" class="form-label">Given Name: </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Gender:&nbsp;&nbsp;</label>
                        <asp:RadioButtonList ID="rbl3_Gender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Male " Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Female " Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <asp:Label runat="server" Text="Current Marital Status: &nbsp;&nbsp; "></asp:Label>
                        <asp:RadioButtonList ID="rbl4_MaritalStatus" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Single " Value="h" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Married " Value="w" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Divorced " Value="b" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="Other " Value="m" style="margin-right: 20px;" />
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;" style="width: 450px">
                            <asp:TextBox ID="txt5_DateOfBirth" class="form-control" runat="server" placeholder="Date of Birth:" TextMode="Date"></asp:TextBox>
                            <label for="txt5_DateOfBirth">Date of Birth: </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt6_CityOfBirth" class="form-control" runat="server" placeholder="City of Birth: "></asp:TextBox>
                            <label for="txt6_CityOfBirth" class="form-label">City of Birth:  </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="1">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt7_StateOfBirth" class="form-control" runat="server" placeholder="State Of Birth"></asp:TextBox>
                            <label for="txt7_StateOfBirth" class="form-label">State / Province of Birth: </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="lab8_CountryOfBirth" HorizontalAlign="Left">Country / Region of Birth:  </asp:Label><br />
                        <asp:DropDownList ID="ddl8_CountryOfBirth" runat="server" Style="border-radius: 8px;"
                            Width="440px" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="lab9_Nationality" HorizontalAlign="Left">Nationality: </asp:Label><br />
                        <asp:DropDownList ID="ddl9_Nationality" runat="server" Style="border-radius: 8px;"
                            Width="440px" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt10_CurrPPNo" class="form-control" runat="server" placeholder="Passport Number"></asp:TextBox>
                            <label for="txt10_CurrPPNo" class="form-label">Current Passport Number: </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Label class="form-label" runat="server" ID="Label1" HorizontalAlign="Left">Country of Issuance:</asp:Label><br />
                        <asp:DropDownList ID="ddl10_1_CountryPPIssued" runat="server" Style="border-radius: 8px;"
                            Width="440px" AutoPostBack="true">
                        </asp:DropDownList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;" style="width: 450px">
                            <asp:TextBox ID="txt10_2_DatePPIssued" class="form-control" runat="server" placeholder="Date PP Issued:" TextMode="Date"></asp:TextBox>
                            <label for="10_2_DatePPIssued">Passport Issuance Date: </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;" style="width: 450px">
                            <asp:TextBox ID="txt10_3_DatePPExpires" class="form-control" runat="server" placeholder="Date PP Expires" TextMode="Date"></asp:TextBox>
                            <label for="txt10_3_DatePPExpires">Passport Expiration Date: </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Do you hold or have you held any nationality other than the one you have indicated above?  &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl11_HavePrevNationalities" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt14_PrimaryPhone" class="form-control" runat="server" placeholder="Primary Phone"></asp:TextBox>
                            <label for="txt14_PrimaryPhone" class="form-label">Primary Phone Number:  </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt15_SecondaryPhone" class="form-control" runat="server" placeholder="Secondary Phone"></asp:TextBox>
                            <label for="txt15_SecondaryPhone" class="form-label">Secondary Phone Number: </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt16_WorkPhone" class="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                            <label for="txt16_WorkPhone" class="form-label">Work Phone Number: </label>
                        </div>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Have you used any other telephone number during the last 5 years? &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl16_1_AnyUsedPhone" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt16_2_UsedPrevPhone" class="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                            <label for="txt16_1_AnyUsedPrevPhone" class="form-label">Other telephone number : </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt17_PrimaryEmail" class="form-control" runat="server" placeholder="Primary Email"></asp:TextBox>
                            <label for="txt17_PrimaryEmail" class="form-label">Primary Email Address:  </label>
                        </div>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Have you used any other email address during the last 5 years?  &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl17_1_AnyUsedEmail" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt17_1_AnyUsedPrevEmail" class="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                            <label for="txt17_2_UsedPrevEmail" class="form-label">Other Email Address:  </label>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt18_SocialMediasUserID" class="form-control" runat="server" placeholder="Social Medias & UserID"></asp:TextBox>
                            <label for="txt18_SocialMediasUserID" class="form-label">Provide all the Social Medias with User ID that you used past five years. (Example: Facebook, Instagram, Twitter, Snapchat) </label>
                        </div>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">
                            Do you wish to provide information about your presence on any other websites or 
                            applications you have used within the last five years to create or share content (photos, videos, status updates, etc.)? 
                            If yes, Please provide the name of the platform and the associated unique social media identifier 
                            for each social media platform you would like to list. This does not include private 
                            messaging on person-to-person messaging services, such as WhatsApp. &nbsp;&nbsp;
                        </label>
                        <asp:RadioButtonList ID="rbl18_1_ShareInfoSocialMedia" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt18_2_OtherSocialMedias" class="form-control" runat="server" placeholder="Other Social Media Provider"></asp:TextBox>
                            <label for="txt18_2_OtherSocialMedias" class="form-label">Other Social Media Provider/Platform: </label>
                        </div>
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <div class="form-floating mb-3;">
                            <asp:TextBox ID="txt18_3_OtherUserID" class="form-control" runat="server" placeholder="Other Social Media Identifier"></asp:TextBox>
                            <label for="txt18_3_OtherUserID" class="form-label">Other Social Media Identifier: </label>
                        </div>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Is your Mailing Address the same as your Current Address?  &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl19_CurrAddSameMailingAdd" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Do you have an address in the United States where you intend to live?  &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl20_HaveAddInUS" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">If you do not have an U.S. address, do you want to use KAG’s Address? &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl20_1_UseKAGAddress" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4">
                        <label for="floatingInputGrid">Is this the address where you want your Permanent Residence Card (Green card) to be mailed to? &nbsp;&nbsp; </label>
                        <asp:RadioButtonList ID="rbl21_MailingAddSame" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" BorderStyle="None">
                            <asp:ListItem Enabled="True" Text="Yes" Value="1" style="margin-right: 20px;" />
                            <asp:ListItem Enabled="True" Text="No" Value="0" style="margin-right: 20px;" />
                        </asp:RadioButtonList><br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
</asp:Content>
