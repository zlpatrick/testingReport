<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="TestingReport.result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
     <script src="Scripts/Chart.js"></script>
     <style>
      a
      {
        color:grey;
        text-decoration:none;
      }
     </style>
</head>
<body>
    <asp:Panel id="titleDiv" runat="server"></asp:Panel>
        <!--<div style="width:90%;margin:auto">
			<canvas id="canvas"  width="100%"></canvas>
		</div>-->

    <form id="form1" runat="server">
    <div>
   
    </div>
    </form>

    <script>
        var radarChartData = {
            labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
            datasets: [
			{
			    label: "My First dataset",
			    fillColor: "rgba(220,220,220,0.2)",
			    strokeColor: "rgba(220,220,220,1)",
			    pointColor: "rgba(220,220,220,1)",
			    pointStrokeColor: "#fff",
			    pointHighlightFill: "#fff",
                pointLabelFontSize:  50,
			    pointHighlightStroke: "rgba(220,220,220,1)",
			    data: [65, 59, 90, 81, 56, 55, 40]
			}
		]
        };

        window.onload = function () {
            window.myRadar = new Chart(document.getElementById("canvas").getContext("2d")).Radar(radarChartData, {
                responsive: true
            });
        }

	</script>
</body>
</html>
