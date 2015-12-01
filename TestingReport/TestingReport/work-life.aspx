<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="work-life.aspx.cs" Inherits="TestingReport.work_life" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC - 工作 & 生活</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/Chart.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
</head>
<body style="background-color:#eee">
    <form id="form1" runat="server">
    <div>
        <a href="person.aspx">
            <div style="overflow:hidden;padding:50px;background-color:white">
                <div style="float:left;width:20%"><img src="<%=userImageUrl %>" style="width:100%;border-radius:10px;"/></div>
                <div style="float:left;padding:50px;color:#555">昵称: <%=userNickName %></div>
                <div style="float:right;padding:50px 20px;color:#555"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></div>
            </div>
        </a>
        <hr style="margin:0;border-bottom:1px solid #AAA"/>
    </div>
    <div style="padding-top:40px;padding-bottom:40px;">
        <div style="text-align:center">工作状态 &nbsp;&nbsp;|&nbsp;&nbsp; <a href="life-work.aspx">生活状态</a></div>
    </div>
    <div style="background-color:White;border-top:1px solid #AAA;border-bottom:1px solid #AAA">
        <div style="padding-top:30px;padding-bottom:30px;text-align:center;color:orangered">关爱指数：<span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
        </div>
        <div>
            <div style="padding-left:50px">
                <span class="glyphicon glyphicon-user"></span> 工作健康大数据
            </div>
            <a href="profile.aspx?id=5&userid=<%=Request["userid"] %>">
            <div style="overflow:hidden;padding:50px;color:#bbb">
                <div style="width:50%;float:left">
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:80px 50px 50px 50px;padding:30px;">
                        <% =measureNames[0]%><br /><%=measureScores[0] %>分<br />击败<%=measureBeats[0] %>%网友
                        
                    </div>
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:50px;padding:30px;">
                        <% =measureNames[1]%><br /><%=measureScores[1] %>分<br />击败<%=measureBeats[1] %>%网友
                        
                    </div>
                </div>
                <div style="width:50%;float:left">
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:30px 50px 50px 50px;padding:30px;">
                        <% =measureNames[2]%><br /><%=measureScores[2] %>分<br />击败<%=measureBeats[2] %>%网友
                        
                    </div>
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:50px;padding:30px;">
                        <% =measureNames[3]%><br /><%=measureScores[3] %>分<br />击败<%=measureBeats[3] %>%网友
                        
                    </div>
                </div>
            </div>
            </a>
        </div>
        <div>
            <div style="padding-left:50px">
                <span class="glyphicon glyphicon-user"></span> 历史记录
                <div>
				<canvas id="canvas" height="450" width="600" style="margin-bottom:40px;margin-top:30px;"></canvas>
			</div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

<% if(toolBar != null && (!toolBar.Equals("")))
   { %>
<script>

    var lineChartData = {
        labels: [<%=toolBar%>],
        datasets: [
            {
                label: "<%=dimName[0]%>",
                fillColor: "rgba(198,220,220,0.2)",
                strokeColor: "rgba(198,220,220,1)",
                pointColor: "rgba(198,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(198,220,220,1)",
                data: [<%=scoreLabels[dimName[0]]%>]
            },
            {
                label: "<%=dimName[1]%>",
                fillColor: "rgba(220,198,220,0.2)",
                strokeColor: "rgba(220,198,220,1)",
                pointColor: "rgba(220,198,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,198,220,1)",
                data: [<%=scoreLabels[dimName[1]].Substring(0,scoreLabels[dimName[1]].Length-1)%>]
            },
            {
                label: "<%=dimName[2]%>",
                fillColor: "rgba(220,220,198,0.2)",
                strokeColor: "rgba(220,220,198,1)",
                pointColor: "rgba(220,220,198,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,198,1)",
                data: [<%=scoreLabels[dimName[2]].Substring(0,scoreLabels[dimName[2]].Length-1)%>]
            },
            {
                label: "<%=dimName[3]%>",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [<%=scoreLabels[dimName[3]].Substring(0,scoreLabels[dimName[3]].Length-1)%>]
            }
        ]

    }

        window.onload = function () {
            var ctx = document.getElementById("canvas").getContext("2d");
            window.myLine = new Chart(ctx).Line(lineChartData, {
                responsive: true
            });
        }


	</script>
<% 
}
%>
