<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="happy-feeling-result.aspx.cs" Inherits="TestingReport.happy_feeling_result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>幸福ABC - 认识自我</title>
      <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
  .glyphicon 
 {
     color:black;
 }
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
        width:25%;
        padding:20px;
    }
    .mylist-intro
    {
        float:left;
        width:75%;
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
        <div style="width:500px;color:white;background-color:#1d3d4c;opacity:0.6;text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">幸福感测试
            <div style="float:left;width:5px;background-color:white;margin-left:15px;">&nbsp;</div>
             <div style="float:right;width:5px;background-color:white;margin-right:15px;">&nbsp;</div>
        </div>
    </div>


    <div style="margin-top:30px">
            <div id="main" style="height:680px;background-color:white;border:none;padding:80px;font-size:36px !important;line-height:initial !important"></div>
        </div>

        <div style="margin-top:30px;margin-left:80px;margin-right:80px;background-color:rgba(252,251,252,1)">
            <div style="border-top:2px dashed #213c4c;border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">身心投入</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[1]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/1-left.png" style="width:100px;"/></div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[1]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[1]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                        
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>

                  
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/1-right.png" style="width:100px;" /></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[1]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">积极情绪</div>

                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[0]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                    
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/2-left.png"  style="width:100px;"/></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[0]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[0]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                        
                         <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>

                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/2-right.png" style="width:100px;" /></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[0]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">人际关系</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                   <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[2]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/3-left.png"  style="width:100px;"/></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[2]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[2]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                                              <div style="width:100%;background:linear-gradient(to right,rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                                     </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/3-right.png" style="width:100px;" /></div>
                </div>

               <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[2]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">人生意义</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[3]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/4-left.png" style="width:100px;" /></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[3]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[3]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                                             <div style="width:100%;background:linear-gradient(to right,rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                  
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/4-right.png"  style="width:100px;"/></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[3]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>

             <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">生活成就</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[4]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:0;top:-18px;z-index:1"><img src="img/5-left.png"  style="width:100px;"/></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[4]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[4]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                    
                    </div>
                    <div style="position:absolute;right:0;top:-18px;z-index:1"><img src="img/5-right.png" style="width:100px;" /></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[4]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>
        </div>
        <div style="color:white;margin-top:50px;margin-bottom:100px;overflow:hidden">
            <div style="float:left;width:40%;margin-left:10%;text-align:center">
                <div onclick="document.getElementById('mcover').style.display='block';" style="width:85%;border-radius:10px;border:none;text-align:center !important;margin:auto;font-size:30px !important;height:100px;background-color:#3d585f;cursor:pointer;line-height:100px">让好友猜猜你的性格</div>
            </div>
            <div style="float:left;width:40%;text-align:center">
                <div onclick="document.getElementById('mcover').style.display='block';" style="width:85%;border-radius:10px;border:none;text-align:center !important;margin:auto;font-size:30px !important;height:100px;background-color:#b84737;cursor:pointer;line-height:100px">分享至朋友圈</div>
            </div>
        </div>

        
     
    <div style="padding:80px">
            <div style="overflow:hidden">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">合拍榜</div>
            <div style="float:right;font-size:40px;color:grey;"><a href="find-life-happy-hepai.aspx?userid=<%=Request["userid"] %>" style="color:grey">查看更多..</a></div>
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

        <div style="padding:30px 80px;margin-bottom:100px;">
            <div style="overflow:hidden">
                 <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">好文推荐</div>
                <div style="float:right;font-size:40px;color:grey;"><a href="learn-self-links.aspx?userid=<%=Request["userid"] %>" style="color:grey">查看更多..</a></div>
            </div>

            <div style="margin-top:30px;">
                <div class="mylist">
                    <div class="mylist-img"><img src="assets/way-1.jpg" /></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzA4MDMwOTY1OQ==&mid=210725268&idx=1&sn=f888046adfb765806c819289c8d8fe17#rd">如何养成感恩的习惯？</a></p>
                        <p class="mylist-subtitle">为什么我们总是抱怨，忘记感恩 ；如何养成感恩的好习惯。</p>
                    </div>
                </div>
            
                <div class="mylist">
                    <div class="mylist-img"><img src="assets/knowledge-4.jpg" /></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzA4MDMwOTY1OQ==&mid=210772157&idx=1&sn=54233f661a7562a4d50a753f9b9a4bcc#rd">幸福“跑步机”</a></p>
                        <p class="mylist-subtitle">“幸福跑步机”虽然看不见摸不着，但是它却一直在影响着我们的幸福</p>
                    </div>
                </div>
            </div>
        </div>     

   <div style="width:60%;margin:30px auto 200px auto;border-radius:10px;border:none;text-align:center !important;font-size:36px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white"><a href="#" style="color:white" data-toggle="modal" data-target="#confirmationDialog">觉得结果不准确？再测一次</a></div>

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="happiness.aspx?userid=<%=Request["userid"] %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=Request["userid"] %>" style="color:white">个人中心</a></div>
       
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
                        <a href="vote.aspx?id=2&userid=<%=Request["userid"] %>" style="color:white">继续测试</a>

                    </div>
                </div>
                    
            </div>
		</div>
		</td></tr>
		</tbody></table>
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
               { text: '<%=radarDimNames[0] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: '#213c4c' } }, max: 10 },
               { text: '<%=radarDimNames[1] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: '#213c4c' } }, max: 10 },
               { text: '<%=radarDimNames[2] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: '#213c4c' } }, max: 10 },
               { text: '<%=radarDimNames[3] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: '#213c4c' } }, max: 10 },
               { text: '<%=radarDimNames[4] %>', axisLabel: { show: true, textStyle: { fontSize: 40, color: '#213c4c' } }, max: 10 }
           ],
       }
    ],
    legend: {
        data: ['我的得分', '平均得分'],
        textStyle: { fontSize: 30, color: "grey" },
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
