<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Attachments.ascx.cs" Inherits="KennedyAccess.Controls.Attachments" %>

<asp:Label runat="server" ID="labRecordTypeID" Visible="false"></asp:Label>
<asp:Label ID="LabReferenceID" runat="server" Visible="false"></asp:Label>
<asp:GridView ID="gvAttachments" runat="server" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0"
    class="table table-bordered table-hover" 
    style="border-radius:15px;" CellPadding="4" OnRowCommand="gvAttachment_RowCommand" >
    <Columns>
        <asp:TemplateField HeaderText="Owner" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" Visible="false">
            <ItemTemplate>
                <asp:Label ID="labAttachmentID" runat="server" Text='<%# Eval("AttachmentID") %>' Visible="false"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date Uploaded" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:Label ID="labCreateDate" runat="server" Text='<%# Eval("CreateDate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File Size" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:Label ID="labFileName" runat="server" Text='<%# Eval("FileSize") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File Name" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
            <ItemTemplate>
                <asp:Label ID="labFileName" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:ButtonField CommandName="Open" ItemStyle-HorizontalAlign="Center" ButtonType="Link" Text="Open" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None">
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:ButtonField>
    </Columns>
</asp:GridView>

<div class="mb-3">
    <table>
        <tr>
            <td><asp:FileUpload ID="fileUpload" class="form-control" runat="server" width="300px"/></td>
            <td><asp:Button ID="Upload" class="btn btn-primary" runat="server" Text="Upload File" CausesValidation="false" OnClick="Upload_Click" /></td>
        </tr>
    </table>
</div>


