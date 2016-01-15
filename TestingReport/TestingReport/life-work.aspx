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
    <style>
    a:hover
    {
        text-decoration:none;
    }

    #main div
    {
        font-size:40px !important;
        line-height:initial !important;   
    }
    #main1 div
    {
        font-size:40px !important;
        line-height:initial !important;   
    }
    </style>
</head>
<body>
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

    <div style="padding-top:60px;padding-bottom:150px;background-color:White">
        <div style="color:orangered;text-align:center;margin-bottom:50px;margin-top:20px;">你的幸福指数为90，加油<br /><span style="font-size:40px">击败全国70%网友</span></div>
        <div style="text-align:center"><a href="work-life.aspx?userid=<%=Request["userid"] %>"><span style="border:3px solid lightgrey;color:lightgrey;padding:20px;border-radius:40px;">工作状态</span></a> &nbsp;&nbsp;&nbsp;&nbsp; <span  style="border:3px solid rgba(117,197,240,1);color:rgba(117,197,240,1);padding:20px;border-radius:40px;">生活状态</span></div>
    </div>
    <div style="background-color:rgba(117,197,240,1);border:none;">
        <div style="position:relative;border:none">
            <div style="width: 0;height: 0;border-top: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle"  class="triangle"></div>
            <div style="position:absolute;left:50px;bottom:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
            <div style="position:absolute;left:60px;bottom:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:70px 40px;text-align:center">生活状态大数据</div>
        </div>





        <div style="background-color:rgba(117,197,240,1);border:none">
           

            <a href="profile.aspx?id=2&userid=<%=Request["userid"] %>">
            <div style="overflow:hidden;padding:10px 50px;color:white">
                <div style="width:50%;float:left">
                    <div style="background-color:rgba(175,204,216,1);font-size:40px;border:1px solid white;border-radius:40px;text-align:center;margin:60px 20px 20px 20px;padding:50px 30px;border-bottom-right-radius:0">
                        <% =measureNames[0]%><br /><%=measureScores[0] %>分<br />击败<%=measureBeats[0] %>%网友
                        
                    </div>
                    <div style="background-color:rgba(175,204,216,1);font-size:40px;border:1px solid white;border-radius:40px;text-align:center;margin:50px 20px 20px 20px;padding:50px 30px;border-top-right-radius:0">
                         <% =measureNames[1]%><br /><%=measureScores[1] %>分<br />击败<%=measureBeats[1] %>%网友
                        
                    </div>
                </div>
                <div style="width:50%;float:left">
                    <div style="background-color:rgba(175,204,216,1);font-size:40px;border:1px solid white;border-radius:40px;text-align:center;margin:0px 20px 20px 20px;padding:50px 30px;border-bottom-left-radius:0">
                         <% =measureNames[2]%><br /><%=measureScores[2] %>分<br />击败<%=measureBeats[2] %>%网友
                        
                    </div>
                    <div style="background-color:rgba(175,204,216,1);font-size:40px;border:1px solid white;border-radius:40px;text-align:center;margin:50px 20px 20px 20px;padding:50px 30px;border-top-left-radius:0">
                         <% =measureNames[3]%><br /><%=measureScores[3] %>分<br />击败<%=measureBeats[3] %>%网友
                        
                    </div>
                </div>
            </div>
            </a>
        </div>


        <div>
            <div id="main" style="height:800px;background-color:white;border:none;padding:80px;font-size:40px !important;line-height:initial !important"></div>
        </div>

        <div style="position:relative;border:none">
            <div style="width: 0;height: 0;border-bottom: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle2" class="triangle2"></div>
             <div style="position:absolute;right:50px;top:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
            <div style="position:absolute;right:60px;top:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">对比数据</div>

        </div>

        <div style="padding-top:120px;background:white;padding-bottom:60px;">
            <div style="overflow:hidden">
                <div style="width:40%;float:left;border-right:2px solid rgba(117,197,240,1)">
                    <div class="story"><span class="storytitle">按照年龄</span></div>

                    <div class="story"><span class="storytitle">按照地区</span></div>
                    <div class="story"><span class="storytitle">按照行业</span></div>
                </div>
                <div style="width:60%;float:right">
                    <div class="storyright"><span class="storytitle">击败了66%的同龄人</span></div>
                    <div class="storyright"><span class="storytitle">击败了66%的老乡</span></div>
                    <div class="storyright"><span class="storytitle">击败了66%的同行</span></div>
                </div>
            </div>
        </div>

        <div style="position:relative;border:none;">
            
             <div style="position:absolute;left:50px;top:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
            <div style="position:absolute;left:60px;top:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">历史数据</div>

        </div>

        <div style="background-color:white;padding-top:300px;padding-bottom:100px;">
            <div id="main1" style="height:600px;background-color:white;border:none;font-size:40px !important;line-height:initial !important"></div>
        </div>


        <!--
        <div style="padding-top:300px;background-color:White">
            <div style="padding-left:50px">
                
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

            -->
     
    </div>
    </form>
    <script src="Scripts/echarts.min.js"></script>
</body>
</html>


	<script type="text/javascript">
	    // 基于准备好的dom，初始化echarts图表
	    var myChart = echarts.init(document.getElementById('main'));

	    var
option = {
   
    tooltip: {
        trigger: 'axis'
    }, 
    polar: [
       {
           indicator: [
               { text: '销售', axisLabel: { show: true, textStyle: { fontSize: 45, color: 'white' } }, max: 10 },
               { text: '管理', axisLabel: { show: true, textStyle: { fontSize: 45, color: 'white' } }, max: 10 },
               { text: '信息技术', axisLabel: { show: true, textStyle: { fontSize: 45, color: 'white' } }, max: 10 },
               { text: '客服', axisLabel: { show: true, textStyle: { fontSize: 45, color: 'white' } }, max: 10 },
               { text: '研发', axisLabel: { show: true, textStyle: { fontSize: 45, color: 'white' } }, max: 10 }
           ],
       }
    ],
    calculable: true,
    series: [
        {
            type: 'radar',
            data: [
                {

                    value: [6.6, 7.2, 8.3, 8.9, 8.5],
                    name: '预算分配',
                    itemStyle: { fontSize: 40, color: 'white' },
                }
            ],
            itemStyle: { fontSize: 40, color: 'white' },
        }
    ]
};




	    // 为echarts对象加载数据 
	    myChart.setOption(option);
    </script>


<script>

    var myChart1 = echarts.init(document.getElementById('main1'));

    var option1 = {
      
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['最高气温', '最低气温'],
            textStyle: { fontSize: 40 }
        },
       
        calculable: true,
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
                axisLabel: { show: true, textStyle: { fontSize: 40} }
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLabel: {
                    formatter: '{value}',
                    textStyle: { fontSize: 40 }
                }
            }
        ],
        series: [
            {
                name: '最高气温',
                type: 'line',
                data: [11, 11, 15, 13, 12, 13, 10]
            },
            {
                name: '最低气温',
                type: 'line',
                data: [1, 1, 2, 5, 3, 2, 0]
            },
             {
                 name: '最低气温',
                 type: 'line',
                 data: [6, 7, 8, 6, 5, 4,3]
             }

        ]
    };
    myChart1.setOption(option1);
</script>



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
    /*
    window.onload = function () {
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myLine = new Chart(ctx).Line(lineChartData, {
            responsive: true
        });
    }*/

    $(document).ready(function () {
        $(".triangle").css("border-right", window.innerWidth + "px solid transparent");
        $(".triangle2").css("border-left", window.innerWidth + "px solid transparent");
    });

	</script>
<% 
}
%>