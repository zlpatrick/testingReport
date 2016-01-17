<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person-self.aspx.cs" Inherits="TestingReport.person_self" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>幸福ABC - 认识自我</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
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
<body style="background-color:#eee">
    <form id="form1" runat="server">
    <div>

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
  
    <div style="background-color:White;padding:100px 200px">
        <div style="overflow:hidden">
                <div style="width:50%;float:left;border-right:2px solid rgba(117,197,240,1)">
                    <div class="story"><span class="storytitle">性格测试</span></div>
                    <div class="story"><span class="storytitle">职业取向</span></div>
                </div>
                <div style="width:50%;float:right">
                    <div class="storyright"><span class="storytitle">已完成</span></div>
                    <div class="storyright"><span class="storytitle">已完成</span></div>
                </div>
            </div>
    </div>
   
    <div style="border:none;background-color:rgba(117,197,240,1);">
        <div style="position:relative;border:none">
            <div style="width: 0;height: 0;border-top: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle"  class="triangle"></div>
            <div style="position:absolute;left:50px;bottom:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
            <div style="position:absolute;left:60px;bottom:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">性格分析</div>
        </div>

        <div>
            <a href="profile.aspx?id=1&userid=<%=Request["userid"] %>">
            <div id="main" style="height:800px;background-color:white;border:none;padding:80px;font-size:40px !important;line-height:initial !important"></div>
            </a>
        </div>

       

        <div style="position:relative;border:none">
            <div style="width: 0;height: 0;border-bottom: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle2" class="triangle2"></div>
             <div style="position:absolute;right:50px;top:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
            <div style="position:absolute;right:60px;top:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">职业取向</div>

        </div>

    

        <div style="background-color:white;padding-top:100px;padding-bottom:100px;">
            <a href="profile.aspx?id=8&userid=<%=Request["userid"] %>">
                <div id="main1" style="height:600px;background-color:white;border:none;font-size:40px !important;line-height:initial !important"></div>
            </a>
        </div>
    </div>

   

    </div>
    </form>
</body>
<script src="Scripts/echarts.min.js"></script>
</html>

<script>
    $(document).ready(function () {
        $(".triangle").css("border-right", window.innerWidth + "px solid transparent");
        $(".triangle2").css("border-left", window.innerWidth + "px solid transparent");
    });
</script>

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
               { text: '神经质', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '外向性', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '开放性', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '顺同性', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '严谨性', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 }
           ],
       }
    ],
    calculable: true,
    series: [
        {
            type: 'radar',
            data: [
                {
                    value: [5,6,7,9,8],
                    name: '大五人格',
                    itemStyle: { fontSize: 40, color: 'white' }
                }
            ],
            itemStyle: { fontSize: 40, color: 'white' }
        }
    ]
};




	    // 为echarts对象加载数据 
	    myChart.setOption(option);
    </script>


<script type="text/javascript">
	    // 基于准备好的dom，初始化echarts图表
	    var myChart1 = echarts.init(document.getElementById('main1'));

	    
var labelRight = {normal: {label : {position: 'right'}}};
var option = {
   
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    
    grid: {
        y: 80,
        y2: 30
    },
    xAxis : [
        {
            type : 'value',
            position: 'top',
            splitLine: {lineStyle:{type:'dashed'}},
            textStyle:{fontSize:40}
        }
    ],
    yAxis : [
        {
            type : 'category',
            axisLine: {show: false},
            axisLabel: {show: false, textStyle:{fontSize:40}},
            axisTick: {show: false},
            splitLine: {show: false},
            data : [
            {
                value:'1',
                textStyle:{fontSize:40}
            },
            {
                value:'2',
                textStyle:{fontSize:40}
            },
            {
                value:'3',
                textStyle:{fontSize:40}
            },
            {
                value:'4',
                textStyle:{fontSize:40}
            },
            ],
           
        }
    ],
    series : [
        {
            name:'生活费',
            type:'bar',
            stack: '总量',
            itemStyle : { normal: {
                color: 'rgba(117,197,240,1)',
                fontSize: 40,
                borderRadius: 5,
                label : {
                    show: true,
                    position: 'left',
                    formatter: '{b}'
                }
            }},
            data:[
                {value:-0.4, itemStyle:labelRight},
                {value:-0.8, itemStyle:labelRight},
                0.4, 0.8, 
                
            ]
        }
    ]
};
                    

	    // 为echarts对象加载数据 
	    myChart1.setOption(option);
    </script>