<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserFiles.ascx.cs" Inherits="KennedyAccess.Controls.UserFiles" %>
<script src="../Scripts/dropzone.min.js" type="text/javascript"></script>
    
    <asp:Label ID="LabReferenceID" runat="server" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="labRecordTypeID" Visible="false"></asp:Label>

    <asp:Table ID="tblAttachment" runat="server" class="table" Width="850px">
        <asp:TableRow BackColor="#B5B5B5" Height="30px">
            <asp:TableCell Width="300px" HorizontalAlign="Right">
                <button id="btnNewFolder" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myNewFolderModal">New</button>&nbsp;
                <button id="btnRenameFolder" runat="server" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myRenameFolderModal">Rename</button>&nbsp;
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
                <div id="dZUpload" class="container dropzone" >
                    <div class="dz-default dz-message" style="width:100%;height:100%;vertical-align:middle;align-content:center;"><span>Drop Files Here</span></div>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <div style="width:750px">
        <div class="modal fade" id="myNewFolderModal">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width:450px">
                    <div class="modal-header">
                        <div class="modal-body">
                            <asp:table runat="server">
                                <asp:TableFooterRow>
                                    <asp:TableCell >
                                        <h3 class="modal-title">Create a new folder</h3><br />
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </asp:TableCell>
                                </asp:TableFooterRow>
                                <asp:tableRow>
                                    <asp:tablecell><asp:Label ID="labNewFolder" runat="server"></asp:Label></asp:tablecell>
                                </asp:tableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <asp:Label runat="server" Text="Please enter the name of the new folder." /><br />
                                        <div class="form-floating mb-3;" style="width: 240px">
                                            <asp:TextBox ID="txtFolderNmae" runat="server" class="form-control" ValidationGroup="NewFolderResponse" placeholder="New folder name"></asp:TextBox>
                                            <label for="txtNewFolder">Folder Name</label>
                                            <asp:RequiredFieldValidator ID="rfvtxtFolderNmae" runat="server" ControlToValidate="txtFolderNmae" forecolor="red"
                                                ValidationGroup="NewFolderResponse" ErrorMessage="A new folder name is required"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button ID="btnCreate" runat="server" class="btn btn-primary" ValidationGroup="NewFolderResponse" Text="Create" OnClick="btnCreate_Click"/>
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
    <div style="width:750px">
        <div class="modal fade" id="myRenameFolderModal">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="width:450px">
                    <div class="modal-header">
                        <div class="modal-body">
                            <asp:table runat="server">
                                <asp:TableFooterRow>
                                    <asp:TableCell >
                                        <h3 class="modal-title">Rename folder</h3><br />
                                    </asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </asp:TableCell>
                                </asp:TableFooterRow>
                                <asp:tableRow>
                                    <asp:tablecell><asp:Label ID="Label1" runat="server"></asp:Label></asp:tablecell>
                                </asp:tableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <asp:Label runat="server" Text="Please enter a new name of the folder." /><br />
                                        <div class="form-floating mb-3;" style="width: 240px">
                                            <asp:TextBox ID="txtRenameFolder" runat="server" class="form-control" ValidationGroup="RenFolderResponse" placeholder="New folder name"></asp:TextBox>
                                            <label for="labRenameFolder">Folder Name</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRenameFolder" forecolor="red"
                                                ValidationGroup="RenFolderResponse" ErrorMessage="A new folder name is required"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button ID="Button1" runat="server" class="btn btn-primary" ValidationGroup="RenFolderResponse" Text="Rename" OnClick="btnRename_Click"/>
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