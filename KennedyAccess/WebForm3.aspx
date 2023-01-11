<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="KennedyAccess.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="~/Scripts/dropzone.min.js" type="text/javascript"></script>

    <asp:Table ID="tblAttachment" runat="server" class="table table-hover" Width="800px">
        <asp:TableRow BackColor="#B5B5B5" Height="30px">
            <asp:TableCell Width="300px" HorizontalAlign="Right">
                <asp:ImageButton ID="lnkBtnCreate" runat="server" OnClick="lnkBtnCreate_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/arr017.svg" Visible="false"/>&nbsp;
                <asp:ImageButton ID="lnkBtnDelete" runat="server" OnClick="lnkBtnDelete_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/gen027.svg" Visible="false"/>
            </asp:TableCell>
            <asp:TableCell Width="500px">
                &nbsp;<asp:Label ID="labDirectory" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow VerticalAlign="Top" BackColor="#edf2f2" CssClass="dropzone">
            <asp:TableCell Width="300px">
                <asp:TreeView ID="tvUserFolders" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" 
                    Height="100%" OnSelectedNodeChanged="tvUserFolders_SelectedNodeChanged">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                        VerticalPadding="0px" />
                </asp:TreeView>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Top" Width="500px">
                <asp:TreeView ID="tvUserFiles" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" >
                    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                </asp:TreeView>
                <div id="dZUpload" class="container dropzone">
                    <div class="dz-default dz-message"><span>Drop Files Here</span></div>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
