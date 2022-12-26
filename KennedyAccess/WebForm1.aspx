<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="KennedyAccess.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlDropDownTest" runat="server" AutoPostBack="true" EnableViewState="true" ViewStateMode="Enabled" OnSelectedIndexChanged="ddlDropDownTest_SelectedIndexChanged"></asp:DropDownList><br /><br />
            <asp:DropDownList ID="ddlState" runat="server" Enabled="false"></asp:DropDownList>
        </div

        <div>
          <canvas id="myChart" style="max-width:500px;max-height:300px;"></canvas>
        </div>
        <script src="Scripts/mychart.js"></script>

        <script>
            const ctx = document.getElementById('myChart');

            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                        label: 'Monthly Trend',
                        data: [22, 19, 3, 5, 2, 10, 15, 24, 17, 16, 18,20],
                        borderWidth: 1
                    }]
                },
                options: {
                    animations: {
                        tension: {
                            duration: 2000,
                            easing: 'linear',
                            from: 1,
                            to: 0,
                            loop: true
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: false
                        }
                    }

                }
            });
        </script>
    </form>
</body>
</html>
