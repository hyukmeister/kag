<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="KennedyAccess.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chart & File Drag Drop</title>
    <link href="Content/dropzone.min.css" rel="stylesheet" />
    <script src="Scripts/mychart.js"></script>
    <script src="Scripts/dropzone.min.js"></script>
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


        <asp:TreeView ID="tvUserFiles" runat="server" ImageSet="XPFileExplorer" NodeIndent="15">
            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                VerticalPadding="0px" />
        </asp:TreeView>

        <div>
            <div class="fallback">
                <input name="file" type="file" multiple />
            </div>
        </div>    

    </form>
</body>
</html>
