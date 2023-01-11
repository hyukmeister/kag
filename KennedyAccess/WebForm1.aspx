<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="KennedyAccess.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chart & File Drag Drop</title>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link href="~/Content/dropzone.min.css" rel="stylesheet" />
    <script src="Scripts/dropzone.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" method="post" class="dropzone" enctype="multipart/form-data">

        <div>
          <canvas id="myChart" style="max-width:500px;max-height:300px;"></canvas>
        </div>


       <script>
            const ctx = document.getElementById('myChart');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                        label: 'Monthly Trend',
                        data: [22, 19, 3, 5, 52, 10, 15, 24, 17, 16, 18,20],
                        borderWidth: 1
                    }]
                },
                options: {
                    
                    scales: {
                        y: {
                            beginAtZero: false
                        }
                    }

                }
            });
        </script>
        <asp:Table ID="tblAttachment" runat="server" class="table table-hover" Width="800px">
            <asp:TableRow BackColor="#B5B5B5" Height="30px">
                <asp:TableCell Width="300px" HorizontalAlign="Right">
                    <asp:ImageButton ID="lnkBtnCreate" runat="server" OnClick="lnkBtnCreate_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/arr017.svg" Visible="true"/>&nbsp;
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
                    <div id="dZUpload" class="container dropzone" >
                        <div class="dz-default dz-message" ><span style="font-family:Calibri">Drag and Drop Files Here</span></div>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
</body>
</html>
