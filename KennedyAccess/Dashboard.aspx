<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KennedyAccess.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <canvas id="myChart1"></canvas>
    </div>
        <div>
        <canvas id="myChart2" style="max-width:800px;max-height:600px;"></canvas>
    </div>
    <script src="Scripts/mychart.js"></script>

    <script>
        var chartLabels;
        var chartData;

        var chartLabels1;
        var chartData1;
    </script>

    <asp:Literal runat="server" ID="ltChartData"></asp:Literal>

    <script>
        const ctx1 = document.getElementById('myChart1');
        const ctx2 = document.getElementById('myChart2');

        new Chart(ctx1, {
            type: 'line',
            data: {
                labels: chartLabels,
                datasets: [{
                    label: 'PY Revenue',
                    data: chartData,
                    borderWidth: 2
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
        new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: chartLabels1,
                datasets: [{
                    label: 'CY Revenue',
                    data: chartData1,
                    borderRadius: 6,
                    borderWidth: 0
                }]
            },
            delay: (context) => {
                let delay = 0;
                if (context.type === 'data' && context.mode === 'default' && !delayed) {
                    delay = context.dataIndex * 300 + context.datasetIndex * 100;
                }
                return delay;
            },
            options: {
                onComplete: () => {
                    delayed = true;
                },
                scales: {
                    y: {
                        beginAtZero: false
                    }
                }

            },
            plugins: {
                title: {
                    display: true,
                    text: 'Custom Chart Title'
                }
            }
        });
    </script>

</asp:Content>
