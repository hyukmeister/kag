﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserFiles.ascx.cs" Inherits="KennedyAccess.Controls.UserFiles" %>
    <link href="Content/dropzone.min.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/dropzone.min.js" type="text/javascript"></script>
    <asp:Label ID="LabReferenceID" runat="server" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="labRecordTypeID" Visible="false"></asp:Label>

    <asp:Table ID="tblAttachment" runat="server" class="table table-hover" Width="850px">
        <asp:TableRow BackColor="#B5B5B5" Height="30px">
            <asp:TableCell Width="300px" HorizontalAlign="Right">
                <asp:ImageButton ID="lnkBtnCreate" runat="server" OnClick="lnkBtnCreate_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/arr017.svg" Visible="false"/>&nbsp;
                <asp:ImageButton ID="lnkBtnDelete" runat="server" OnClick="lnkBtnDelete_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/gen027.svg" Visible="false"/>
            </asp:TableCell>
            <asp:TableCell Width="500px">
                &nbsp;<asp:Label ID="labDirectory" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow VerticalAlign="Top" BackColor="#edf2f2">
            <asp:TableCell Width="300px">
                <asp:TreeView ID="tvUserFolders" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" 
                    Height="100%" OnSelectedNodeChanged="tvUserFolders_SelectedNodeChanged">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="2px"
                        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                        VerticalPadding="0px" />
                </asp:TreeView>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Top" Width="500px">
                <asp:TreeView ID="tvUserFiles" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" >
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="2px"
                        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                </asp:TreeView>
                <div id="dZUpload" class="dropzone">
                    <div class="dz-default dz-message"></div>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>