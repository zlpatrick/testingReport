<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="life-work.aspx.cs" Inherits="TestingReport.life_work" %>

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
    
        <a href="person.aspx?userid=<%=Request["userid"] %>">
    <div style="background-color:rgba(117,197,240,1);height:300px;position:relative;">
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
    </div>
    </a>
    
    <div style="text-align:center;color:#555;padding-top:120px;padding-bottom:30px;background-color:white">
        <div><%=userNickName %></div>
        <div class="user-tag">
            <span><%=age %></span><span><%=industry %></span><span><%=region %></span>
        </div>
        <div style="font-size:40px;margin-top:30px;color:grey">
            <ul style="padding:0">
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:rgba(117,197,240,1)"><%=testTimes %>次</span><br />测试次数</li>
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:rgba(117,197,240,1)"><%=toolTimes %>天</span><br />使用工具</li>
                <li style="display:inline-block;width:32%"><span style="color:rgba(117,197,240,1)"><%=selfPercent %>%</span><br />认识自我</li>
            </ul>
        </div>
    </div>
        <hr style="margin:0;border-color:#AAA;"/>

    <div style="padding-top:40px;padding-bottom:40px;">
        <div style="text-align:center"><a href="work-life.aspx?userid=<%=Request["userid"] %>">工作状态</a> &nbsp;&nbsp;|&nbsp;&nbsp; 生活状态</div>
    </div>
    <div style="background-color:White;border-top:1px solid #AAA;border-bottom:1px solid #AAA">
        <div style="position:relative;border:none">
            <div style="width: 0;height: 0;border-bottom: 300px solid rgba(117,197,240,1);border-left: 0 solid transparent;z-index:-1" id="triangle"></div>
            <div style="position:absolute;left:50px;bottom:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
            <div style="position:absolute;left:60px;bottom:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white">生活状态大数据</div>
        </div>









        <!--
        <div style="padding-top:30px;padding-bottom:30px;text-align:center;color:orangered">关爱指数：
       <% for (int index = 1; index <= totalStars; index++)
               {%>
            <span class="glyphicon glyphicon-star"></span>
            <% }
                for (int index = 1; index <= 5-totalStars; index++){
                 %>
           
            <span class="glyphicon glyphicon-star-empty"></span>
            <%} %>
        </div>-->
        <div style="background-color:rgba(117,197,240,1)">
            <div style="padding-left:50px">
                
            </div>

            <a href="profile.aspx?id=2&userid=<%=Request["userid"] %>">
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
                <% if (toolBar != null && (!toolBar.Equals("")))
                   { %>
                   <div style="font-size:40px;margin-bottom:40px;">
                        <span style="color:orangered">— <%=dimName[0]%></span>
                        <span style="color:lightblue">— <%=dimName[1]%></span>
                        <span style="color:green">— <%=dimName[2]%></span>
                        <span style="color:purple">— <%=dimName[3]%></span>

                   </div>
   <%
                    } %>
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
                fillColor: "transparent",
                strokeColor: "orangered",
                pointColor: "orangered",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "orangered",
                data: [<%=scoreLabels[dimName[0]]%>]
            },
            {
                label: "<%=dimName[1]%>",
                fillColor: "transparent",
                strokeColor: "lightblue",
                pointColor: "lightblue",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "lightblue",
                data: [<%=scoreLabels[dimName[1]].Substring(0,scoreLabels[dimName[1]].Length-1)%>]
            },
            {
                label: "<%=dimName[2]%>",
                fillColor: "transparent",
                strokeColor: "green",
                pointColor: "green",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "green",
                data: [<%=scoreLabels[dimName[2]].Substring(0,scoreLabels[dimName[2]].Length-1)%>]
            },
            {
                label: "<%=dimName[3]%>",
                fillColor: "transparent",
                strokeColor: "purple",
                pointColor: "purple",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "purple",
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

    $(document).ready(function () {
        $("#triangle").css("border-left", window.innerWidth + "px solid transparent");
    });

	</script>
<% 
}
%>