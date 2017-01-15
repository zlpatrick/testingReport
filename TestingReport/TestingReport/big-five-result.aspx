<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="big-five-result.aspx.cs" Inherits="TestingReport.big_five_result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生活再发现 - 大五性格测试</title>
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
        <div style="width:500px;color:white;background-color:rgba(34,205,193,1);text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">BIG-FIVE性格测试
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
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1);margin-bottom:30px;">维度分析</div>

             <div style="text-align:center;clear:both;">
                      <div style="color:rgba(34,205,193,1);font-size:40px;text-align:center;margin:0px 80px">性格包含以下五个因素</div>
                      <hr />
                      <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                          <div style="float:left;margin-bottom:30px; color:lightgreen;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:lightgreen;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">外向<Br />性</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:skyblue;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:skyblue;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">宜人<Br />性</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orange;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orange;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">尽职<Br />性</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orangered;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orangered;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">神经<Br />质</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:#6d3353;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:#6d3353;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">开放<Br />性</div>
                            </div>

                          </div>
                  </div>
        </div>
 <div style="text-align:center;font-size:36px;padding-left:50px;padding-right:50px;margin:0px 60px;">
            <img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/>&nbsp;我的得分&nbsp;&nbsp;&nbsp;
            <span class="glyphicon glyphicon-user" aria-hidden="true" style="opacity:0.6"></span><span  style="opacity:0.6" class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;平均得分
        </div>

        <div style="margin-top:30px;margin-left:80px;margin-right:80px;background-color:rgba(252,251,252,1)">
            <div style="border-top:2px dashed #213c4c;border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">外倾性 Extraversion</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[1]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><img src="img/1-left.png" style="width:100px;"/></div>
					 <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[1]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[1]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                    
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><img src="img/1-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">喜欢独处<br />安静、被动、缄默</div>
					<div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[1]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                    <div style="float:right;text-align:right">喜欢群体活动<br />热情、主动、健谈</div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">神经质 Neuroticism</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[0]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                   
					<div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><img src="img/2-left.png"  style="width:100px;"/></div>
					<div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[0]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[0]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                      
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                    
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><img src="img/2-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">情绪稳定、冷静<br />自信、不温不火</div>
					<div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[0]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                    <div style="float:right;text-align:right">情绪易起伏<br />易忧虑、紧张、自卑</div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">开放性 Openness</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
					<div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[2]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
                    <div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><img src="img/3-left.png"  style="width:100px;"/></div>
					 <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[2]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[2]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                   
                        <div style="width:100%;background:linear-gradient(to right,rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>

                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><img src="img/3-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">讲究实际<br />偏爱常规、传统保守</div>
					<div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[2]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                    <div style="float:right;text-align:right">富于想象<br />兴趣广泛、喜好新奇</div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">宜人性 Agreeableness</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[3]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
					<div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><img src="img/4-left.png" style="width:100px;" /></div>
					 <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[3]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[3]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                   
                        <div style="width:100%;background:linear-gradient(to right,rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                 
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><img src="img/4-right.png"  style="width:100px;"/></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">倔强、骄傲<br />固执己见、多疑</div>
                     <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[3]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                    <div style="float:right;text-align:right">宽容、友好<br />顺从、谦虚</div>
                </div>
            </div>

             <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">尽责性 Conscientiousness</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;">低</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[4]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
					<div style="float:right;padding-right:20px;">高</div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><img src="img/5-left.png"  style="width:100px;"/></div>
					 <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[4]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[4]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
               
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                  
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><img src="img/5-right.png" style="width:100px;" /></div>
                </div>

                <div style="overflow:hidden;font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="float:left">率性散漫<br />特立独行、少条理性</div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[4]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                    <div style="float:right;text-align:right">认真、勤奋<br />精确、井井有条</div>
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
            <div style="float:right;font-size:40px;color:grey;"><a href="learn-self-hepai.aspx?userid=<%=Request["userid"] %>" style="color:grey">查看更多..</a></div>
                </div>
            <div style="margin-top:40px;margin-bottom:20px;font-size:40px;margin-left:50px;margin-right:50px;">和你测试结果最相近的好友排名</div>
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
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="knowledge.aspx?userid=<%=Request["userid"] %>" style="color:white">幸福宝典</a></div>
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
                        <a href="vote.aspx?id=1&userid=<%=Request["userid"] %>" style="color:white">继续测试</a>

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
