<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="big-five.aspx.cs" Inherits="TestingReport.big_five" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>大五性格测试</title>
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

     #mcover {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.7);
        display: none;
        z-index: 20000;
     }
     #mcover img {
        position: fixed;
        right: 18px;
        top: 5px;
        width: 530px!important;
        height: auto !important;
        z-index: 20001;
     }
    </style>
</head>
<body style="background-color:#3facad">
    <form id="form1" runat="server">
    <div>
        <div style="text-align:center;padding:30px;">
            <img src="img/big-five-title.png" style="max-width:700px;"/>
        </div>
        <div style="width:800px;margin:auto;overflow:hidden">
            <div style="float:left"><img src="<%=userImageUrl %>" style="width: 200px;border-radius: 100px;border-radius: 100px;"/></div>
            <div style="float:left;color:white;padding-left:20px;font-size:42px;padding-top:40px;"><%=userNickName %>
                <br />测试结果：ABCD-E型人格
            </div>
        </div>


        <div style="margin-top:30px">
            <div id="main" style="height:680px;background-color:white;border:none;padding:80px;font-size:36px !important;line-height:initial !important"></div>
        </div>

        <div style="margin-top:30px;margin-left:80px;margin-right:80px;background-color:#419c9c">
            <div style="border-top:2px dashed #213c4c;border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">外倾性 Extraversion</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:absolute;left:<%=radarDimScores[1]*10-3 %>%;color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/1-left.png" style="width:100px;"/></div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[1]*10 %>%">&nbsp;</div>
                        
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[1]*10 %>%;opacity:0.6">&nbsp;</div>
                        
                        <div style="width:100%;background:linear-gradient(to right, #e7c169, #cf6649);float:left;height:60px">&nbsp;</div>

                        <!--
                        <div style="width:<%=radarDimScores[1]*10 %>%;background-color:#e7c169;float:left;height:60px">&nbsp;</div>
                        <div style="width:<%=(100-radarDimScores[1]*10) %>%;background-color:#cf6649;float:left;height:60px">&nbsp;</div> -->
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/1-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">喜欢独处<br />安静、被动、缄默</div>
                    <div style="position:absolute;left:<%=radarAveScores[1]*10 -2 %>%;color:white;opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    <div style="float:right;text-align:right">喜欢群体活动<br />热情、主动、健谈</div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">神经质 Neuroticism</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:absolute;left:<%=radarDimScores[0]*10-2 %>%;color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/2-left.png"  style="width:100px;"/></div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[0]*10 %>%">&nbsp;</div>
                        
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[0]*10 %>%;opacity:0.6">&nbsp;</div>
                        <div style="width:100%;background:linear-gradient(to right, #e7c169, #cf6649);float:left;height:60px">&nbsp;</div>
                        <!--<div style="width:<%=radarDimScores[0]*10 %>%;background-color:#e7c169;float:left;height:60px">&nbsp;</div>
                        <div style="width:<%=(100-radarDimScores[0]*10) %>%;background-color:#cf6649;float:left;height:60px">&nbsp;</div>-->
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/2-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">情绪稳定、冷静<br />自信、不温不火</div>
                    <div style="position:absolute;left:<%=radarAveScores[0]*10-2 %>%;color:white;opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    <div style="float:right;text-align:right">情绪易起伏<br />易忧虑、紧张、自卑</div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">开放性 Openness</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:absolute;left:<%=radarDimScores[2]*10-2 %>%;color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/3-left.png"  style="width:100px;"/></div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[2]*10 %>%">&nbsp;</div>
                        
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[2]*10 %>%;opacity:0.6">&nbsp;</div>
                        <div style="width:100%;background:linear-gradient(to right, #e7c169, #cf6649);float:left;height:60px">&nbsp;</div>
                     <!--   <div style="width:<%=radarDimScores[2]*10 %>%;background-color:#e7c169;float:left;height:60px">&nbsp;</div>
                        <div style="width:<%=(100-radarDimScores[2]*10) %>%;background-color:#cf6649;float:left;height:60px">&nbsp;</div>  -->
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/3-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">讲究实际<br />偏爱常规、传统保守</div>
                    <div style="position:absolute;left:<%=radarAveScores[2]*10-2 %>%;color:white;opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    <div style="float:right;text-align:right">富于想象<br />兴趣广泛、喜好新奇</div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">宜人性 Agreeableness</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:absolute;left:<%=radarDimScores[3]*10 -2 %>%;color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/4-left.png" style="width:100px;" /></div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[3]*10 %>%">&nbsp;</div>
                        
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[3]*10 %>%;opacity:0.6">&nbsp;</div>
                        <div style="width:100%;background:linear-gradient(to right, #e7c169, #cf6649);float:left;height:60px">&nbsp;</div>
                     <!--   <div style="width:<%=radarDimScores[3]*10 %>%;background-color:#e7c169;float:left;height:60px">&nbsp;</div>
                        <div style="width:<%=(100-radarDimScores[3]*10) %>%;background-color:#cf6649;float:left;height:60px">&nbsp;</div>  -->
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/4-right.png"  style="width:100px;"/></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">倔强、骄傲<br />固执己见、多疑</div>
                    <div style="position:absolute;left:<%=radarAveScores[3]*10-2 %>%;color:white;opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    <div style="float:right;text-align:right">宽容、友好<br />顺从、谦虚</div>
                </div>
            </div>

             <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">尽责性 Conscientiousness</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:absolute;left:<%=radarDimScores[4]*10 -2 %>%;color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/5-left.png"  style="width:100px;"/></div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[4]*10 %>%">&nbsp;</div>
                        
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[4]*10 %>%;opacity:0.6">&nbsp;</div>
                        <div style="width:100%;background:linear-gradient(to right, #e7c169, #cf6649);float:left;height:60px">&nbsp;</div>
                      <!--  <div style="width:<%=radarDimScores[4]*10 %>%;background-color:#e7c169;float:left;height:60px">&nbsp;</div>
                        <div style="width:<%=(100-radarDimScores[4]*10) %>%;background-color:#cf6649;float:left;height:60px">&nbsp;</div> -->
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/5-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">率性散漫<br />特立独行、少条理性</div>
                    <div style="position:absolute;left:<%=radarAveScores[4]*10-2 %>%;color:white;opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    <div style="float:right;text-align:right">认真、勤奋<br />精确、井井有条</div>
                </div>
            </div>
        </div>

        <div style="color:white;margin-top:50px;margin-bottom:50px;overflow:hidden">
            <div style="float:left;width:40%;margin-left:10%;text-align:center">
                <div onclick="document.getElementById('mcover').style.display='block';" style="width:85%;border-radius:10px;border:none;text-align:center !important;margin:auto;font-size:30px !important;height:100px;background-color:#3d585f;cursor:pointer;line-height:100px">让好友猜猜你的性格</div>
            </div>
            <div style="float:left;width:40%;text-align:center">
                <div onclick="document.getElementById('mcover').style.display='block';" style="width:85%;border-radius:10px;border:none;text-align:center !important;margin:auto;font-size:30px !important;height:100px;background-color:#b84737;cursor:pointer;line-height:100px">分享至朋友圈</div>
            </div>
        </div>


    </div>
    </form>

    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>
</body>
    <script src="Scripts/echarts.min.js"></script>
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
               { text: '<%=radarDimNames[0] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '<%=radarDimNames[1] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '<%=radarDimNames[2] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '<%=radarDimNames[3] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 },
               { text: '<%=radarDimNames[4] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: 'white' } }, max: 10 }
           ],
       }
    ],
    legend: {
        data: ['我的得分', '平均得分'],
        textStyle: { fontSize: 30, color: "white" },
        orient: 'vertical',
        x: 'right',
        y: 'top',


    },
    calculable: true,
    series: [
        {
            type: 'radar',
            data: [
                {
                    value: [<%=radarDimScores[0] %>, <%=radarDimScores[1] %>, <%=radarDimScores[2] %>, <%=radarDimScores[3] %>, <%=radarDimScores[4] %>],
                    name: '我的得分',
                    itemStyle: { fontSize: 40, color: 'white' }
                },
                {
                    value: [<%=radarAveScores[0] %>, <%=radarAveScores[1] %>, <%=radarAveScores[2] %>, <%=radarAveScores[3] %>, <%=radarAveScores[4] %>],
                    name: '平均得分',
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
