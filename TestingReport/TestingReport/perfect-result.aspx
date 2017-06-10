<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfect-result.aspx.cs" Inherits="TestingReport.perfect_result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生活再发现 - 完美主义测试</title>
      <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
 
         a:hover
    {
        text-decoration:none;
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
       .mylist
    {
        overflow:hidden;
        border-bottom:2px dashed lightgrey;
    }
    .mylist-img
    {
        float:left;
        width:35%;
        padding:20px;
    }
    .mylist-intro
    {
        float:left;
        width:65%;
        padding:30px;
    }
    .mylist-img img
    {
        width:100%;
        height:100%;
    }
    .mylist-title
    {
        text-align:left;
        font-size:40px;
    }

    .mylist-title a
    {
        color:#333;
        font-weight:bold;
    }

    .mylist-subtitle
    {
        color:grey;
        text-align:left;
        font-size:40px;
    }

    .glyphicon-star
    {
        color:rgba(34,205,193,1);
    }
    </style>
    
</head>
<body style="background-color:white">
    <form id="form1" runat="server">

         
    <div style="background-color:rgba(34,205,193,1);height:150px;position:relative;">
        <a href="person.aspx?userid=<%=Request["userid"] %>">
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
    </a>
    </div>
    
    
    <div style="text-align:center;color:white;padding-top:120px;padding-bottom:30px;background-color:rgba(34,205,193,1)">
        <div><%=userNickName %></div>
        <div class="user-tag">
            <span><%=age %></span><span><%=industry %></span><span><%=region %></span>
        </div>
        <div style="font-size:40px;margin-top:30px;color:white">
            <ul style="padding:0">
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:yellow"><%=testTimes %>%</span><br />认识自我</li>
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:yellow"><%=toolTimes %>%</span><br />发现生活</li>
                <li style="display:inline-block;width:32%"><span style="color:yellow"><%=selfPercent %>%</span><br />信息完整度</li>
            </ul>
        </div>
    </div>

   

    <div>
        <div style="width:500px;color:white;background-color:rgba(34,205,193,1);text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">完美主义测试
            <div style="float:left;width:5px;background-color:white;margin-left:15px;">&nbsp;</div>
             <div style="float:right;width:5px;background-color:white;margin-right:15px;">&nbsp;</div>
        </div>
    </div>


    <div style="margin-top:30px">
        <div style="overflow:hidden;margin-bottom:40px;margin-left:80px;margin-right:80px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">测试结果</div>
        </div>
            <div id="main" style="height:680px;background-color:white;border:none;padding:80px;font-size:36px !important;line-height:initial !important"></div>
        </div>
         <div style="overflow:hidden;margin-bottom:40px;margin-left:80px;margin-right:80px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1);margin-bottom:80px;">用户比例</div>
            
            <div id="main1" style="margin-bottom:80px;height:500px;background-color:white;border:none;padding:0px;font-size:36px !important;line-height:initial !important"></div>
        </div>
        <div style="overflow:hidden;margin-bottom:40px;margin-left:80px;margin-right:80px;margin-top:80px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1);margin-bottom:30px;">维度分析</div>
            <div style="text-align:center;overflow:hidden;clear:both">
                      <div style="float:left;width:50%">
                        
                          <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                                <div style="float:left;margin-bottom:30px; color:lightgreen;width:100%;line-height:150px;">
                                    <div style="margin-left:calc((100% - 150px)/2);float:left;text-align:center;background-color:orangered;color:white;width:150px;border-radius:75px;line-height:30px;height:150px;font-size:32px;font-weight:bold;padding-top:45px;">神经质<Br />完美主义</div>
                                </div>
                           </div>
                          <hr />
                            <div style="color:rgba(34,205,193,1);font-size:34px;text-align:center;padding-left:50px;padding-right:50px;">过度追求完美直至神经质和强迫症</div>
                          
                        </div>

                      <div style="float:left;width:50%">
                          
                          <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                              <div style="float:left;margin-bottom:30px; color:lightgreen;width:100%;line-height:150px;">
                                    <div style="margin-left:calc((100% - 150px)/2);float:left;text-align:center;background-color:orange;color:white;width:150px;border-radius:75px;line-height:30px;height:150px;font-size:32px;font-weight:bold;padding-top:45px;">积极<Br />完美主义</div>
                                </div>
                              
                           </div>
                            <hr />
                          <div style="color:rgba(34,205,193,1);font-size:34px;text-align:center;padding-left:50px;padding-right:50px;">适度追求完美承认瑕疵的存在</div>
                        
                        </div>

                  </div>
        </div>

       

          <div style="text-align:center;font-size:40px;">
            <img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/>&nbsp;我的得分&nbsp;&nbsp;&nbsp;
        <span class="glyphicon glyphicon-user" aria-hidden="true" style="opacity:0.6"></span><span  style="opacity:0.6" class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;平均得分

               </div>
        <div style="margin-top:30px;margin-left:80px;margin-right:80px;background-color:rgba(252,251,252,1)">
            <div style="border-top:2px dashed #213c4c;border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">神经质完美主义</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;"></div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[1]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>

                    <div style="float:right;padding-right:20px;"></div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(215,249,247,1);line-height:100px;text-align:center;font-size:40px;color:#999">低</div></div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[1]*10 %>%">&nbsp;</div>
                    </div>
                   <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[1]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                        
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>

                  
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(34,205,193,1);line-height:100px;text-align:center;font-size:40px;color:white">高</div></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        
                         <div style="position:absolute;left:calc(<%=radarAveScores[1]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    
                     </div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">积极完美主义</div>

                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;"></div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[0]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                    
                    <div style="float:right;padding-right:20px;"></div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(215,249,247,1);line-height:100px;text-align:center;font-size:40px;color:#999">低</div></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[0]*10 %>%">&nbsp;</div>
                    </div>
                  <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[0]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                        
                         <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>

                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(34,205,193,1);line-height:100px;text-align:center;font-size:40px;color:white">高</div></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                    
                         <div style="position:absolute;left:calc(<%=radarAveScores[0]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                
                     </div>
                </div>
            </div>



          
            
        </div>
         <div style="color:white;margin-top:50px;margin-bottom:100px;">
         
            <div style="text-align:center;padding-left:80px;padding-right:80px;">
                <div onclick="document.getElementById('mcover').style.display='block';" style="width:85%;border-radius:10px;border:none;text-align:center !important;margin:auto;font-size:30px !important;height:100px;background-color:#b84737;cursor:pointer;line-height:100px">分享至朋友圈</div>
            </div>
        </div>
        
     <!--
    <div style="padding:80px">
            <div style="overflow:hidden">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">合拍榜</div>
            <div style="float:right;font-size:40px;color:grey;"><a href="learn-self-perfect-hepai.aspx?userid=<%=Request["userid"] %>" style="color:grey">查看更多..</a></div>
                </div>
            <div style="margin-top:40px;margin-bottom:20px;font-size:40px">和你测试结果最相近的好友排名</div>
            <div style="margin-top:40px;overflow:hidden;font-size:40px">
                <div style="width:33%;float:left;text-align:center">
                    <img src="img/5-left.png"  style="width:70%;"/><br />90%
                </div>
                <div style="width:33%;float:left;text-align:center">
                    <img src="img/5-right.png"  style="width:70%;"/><br />78%
                </div>
                <div style="width:33%;float:left;text-align:center">
                    <img src="img/4-left.png"  style="width:70%;"/><br />65%
                </div>
            </div>
           
        </div>
        -->
        <div style="padding:30px 80px;margin-bottom:100px;">
            <div style="overflow:hidden">
                 <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">好文推荐</div>
                <div style="float:right;font-size:40px;color:grey;"><a href="knowledge.aspx?userid=<%=Request["userid"] %>" style="color:grey">查看更多..</a></div>
            </div>

            <div style="margin-top:30px;">
               <div class="mylist characterList allList">
                    <div class="mylist-img"><img src="assets/articles/1.png" /></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="https://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=5&sn=73667dc4baa1df6592923564b9172f20&chksm=e97848bcde0fc1aa4b1428165d774086e2376bb02340f211c9fb86b3847124a423d6a10f1bfd&mpshare=1&scene=1&srcid=0113qJvFnm3apWrzXRKjAu77&key=ccfc08d959bf1c02691f9ad9104bfe7ef9263c6bd9e05318130de785f935930bd6240738eaa19ca065da0f572ad2f332ac2aa839bd3338ed50510e9d467d99aebb2b70f6e57552752304e83f1e3f322d&ascene=0&uin=MzA3MDE3OTk1&devicetype=iMac+MacBookPro11%2C5+OSX+OSX+10.12.1+build(16B2659)&version=12010110&nettype=WIFI&fontScale=100&pass_ticket=LGP3W%2F6nCtg%2BXDpZzECN08vDJJ0UZ9A%2B959SOMg6j9VdKoxbegYdJp7SHTgkGo00">内向性格的力量</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 859人
                        </p>
                    </div>
                </div>
            
                <div class="mylist characterList allList">
                    <div class="mylist-img"><img src="assets/articles/3.png" /></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=1&sn=08321a17f5bc3ac3287a292e52cf8254&chksm=e97848bcde0fc1aa75a5941daf19f7fa038d6c0ea5ab7840b693f15533d762bdeb416485a108&scene=4#wechat_redirect">可怕的完美主义</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 687人
                        </p>
                    </div>
                </div>
            </div>
        </div>     

   <div style="width:60%;margin:30px auto 200px auto;border-radius:10px;border:none;text-align:center !important;font-size:36px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white"><a href="#" style="color:white" data-toggle="modal" data-target="#confirmationDialog">觉得结果不准确？再测一次</a></div>

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="knowledge.aspx?userid=<%=Request["userid"] %>" style="color:white">知识点滴</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=Request["userid"] %>" style="color:white">用户中心</a></div>
       
    </div>
    </form>
    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>

    <div id="confirmationDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:80%">
			<div class="modal-content" style="padding:50px;">
               <div style="color:rgba(34,205,193,1);margin-bottom:50px;">为了保持测试结果的客观性，建议不要连续重复测试</div>
                <div style="overflow:hidden">
                    <div style="width:40%;float:left;border-radius:10px;border:none;text-align:center !important;font-size:30px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white">
                        <a href="#" style="color:white" onclick="$('#confirmationDialog').modal('hide');">以后再测</a>

                    </div>

                    <div style="width:40%;float:right;border-radius:10px;border:none;text-align:center !important;font-size:30px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white">
                        <a href="vote.aspx?id=10&userid=<%=Request["userid"] %>" style="color:white">继续测试</a>

                    </div>
                </div>
                    
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>
</body>
    <script src="Scripts/echarts-all.js"></script>
</html>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts图表
    var myChart = echarts.init(document.getElementById('main'));

  
    var option = {
        tooltip: {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            show: false,
            feature: {
                mark: { show: true },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        series: [
            {
                name: '个性化仪表盘',
                type: 'gauge',
                center: ['50%', '50%'],    // 默认全局居中
                radius: [0, '100%'],
                startAngle: 140,
                endAngle: -140,
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.33, 'lightgreen'], [0.67, 'orange'], [1, 'skyblue']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length: 8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    formatter: function (v) {
                        switch (v + '') {
                            case '10': return '神经质型';
                            case '50': return '积极型';
                            case '90': return '顺其自然型';
                     
                            default: return '';
                        }
                    },
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333',
                        fontSize: "28",
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length: 30,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer: {
                    length: '80%',
                    width: 8,
                    color: 'auto'
                },
                title: {
                    show: true,
                    offsetCenter: ['-65%', -10],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333',
                        fontSize: 30
                    }
                },
                detail: {
                    show: true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: ['-60%', 10],       // x, y，单位px
                    formatter: '完美主义程度',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'orangered',
                        fontSize: 30
                    }
                },
                data: [{ value: <%=totalChartValue%>, name: '测试结果', }],
                
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
            trigger: 'item'
        },
      
        calculable: true,
        grid: {
            borderWidth: 0,
            y: 80,
            y2: 60
        },
        xAxis: [
            {
                type: 'category',
                show: false,
                data: ['顺其自然型', '神经质型', '积极型'],
                
            }
        ],
        yAxis: [
            {
                type: 'value',
                show: false
            }
        ],
        series: [
            {              
                type: 'bar',
                barWidth: 70,
                itemStyle: {
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                              'lightgreen','orange','skyblue'
                            ];
                            return colorList[params.dataIndex]
                        },
                        label: {
                            show: true,
                            position: 'top',
                            formatter: '{b}\n{c}%',
                            textStyle: {fontSize:32},
                        }
                    }
                },
                data: [27,32,41],
              
            }
        ]
    };

        myChart1.setOption(option1);
</script>