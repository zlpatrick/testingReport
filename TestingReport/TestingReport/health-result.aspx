<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="health-result.aspx.cs" Inherits="TestingReport.health_result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>健康测试 - 原来打网球的人更健康!</title>
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
        <div style="width:500px;color:white;background-color:rgba(34,205,193,1);text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">健康指数测试
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
             <div style="text-align:center;clear:both">
                      <span style="color:rgba(34,205,193,1);font-size:40px;text-align:center">完整的健康由四个因素组成</span>
                      <hr />
                      <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                          <div style="float:left;margin-bottom:30px; color:lightgreen;width:25%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:lightgreen;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">身体<Br />健康</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:skyblue;width:25%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:skyblue;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">心理<Br />健康</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orange;width:25%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orange;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">居住<Br />环境</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orangered;width:25%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orangered;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">社会<Br />适应</div>
                            </div>
                        

                          </div>
                  </div>
        </div>
         
          <div style="text-align:center;font-size:40px;">
            <img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/>&nbsp;我的得分&nbsp;&nbsp;&nbsp;
            <span class="glyphicon glyphicon-user" aria-hidden="true" style="opacity:0.6"></span><span  style="opacity:0.6" class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;平均得分
        </div>

        <div style="margin-top:30px;margin-left:80px;margin-right:80px;background-color:rgba(252,251,252,1)">
            <div style="border-top:2px dashed #213c4c;border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">身体健康指数</div>
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


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">心理健康指数</div>

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
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">居住环境指数</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;"></div>
                   <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[2]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                    <div style="float:right;padding-right:20px;"></div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(215,249,247,1);line-height:100px;text-align:center;font-size:40px;color:#999">低</div></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[2]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[2]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                                              <div style="width:100%;background:linear-gradient(to right,rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                                     </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(34,205,193,1);line-height:100px;text-align:center;font-size:40px;color:white">高</div></div>
                </div>

               <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[2]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>


            <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">社会适应指数</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;"></div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[3]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>
                    <div style="float:right;padding-right:20px;"></div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(215,249,247,1);line-height:100px;text-align:center;font-size:40px;color:#999">低</div></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[3]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[3]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                                             <div style="width:100%;background:linear-gradient(to right,rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                  
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(34,205,193,1);line-height:100px;text-align:center;font-size:40px;color:white">高</div></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[3]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
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
            <div style="float:right;font-size:40px;color:grey;"><a href="find-life-health-hepai.aspx?userid=<%=Request["userid"] %>" style="color:grey">查看更多..</a></div>
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
                <div class="mylist happyList allList">
                    <div class="mylist-img"><img src="assets/articles/6.png" /></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=7&sn=088b94eb20a08ff59b97e2bf064aac9e&chksm=e97848bcde0fc1aa707623308e93004c0721ad764a7500ca2a26b38c113a3393b9d212fb1385&scene=4#wechat_redirect">TED:幸福是什么?</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 763人
                        </p>
                    </div>
                </div>
            
                <div class="mylist happyList allList">
                    <div class="mylist-img"><img src="assets/articles/11.png" /></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=2&sn=4f35eff21b3f531666f2bf6c167d7709&chksm=e97848bcde0fc1aa9368bbf07d096031ffc8e770d3c63019c3ef3ce9fc3a9948aff8ae275775&scene=4#wechat_redirect">提升你的幸福竞争力</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 597人
                        </p>
                    </div>
                </div>
            </div>
        </div>     

   <div style="width:60%;margin:30px auto 200px auto;border-radius:10px;border:none;text-align:center !important;font-size:36px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white"><a href="#" style="color:white" data-toggle="modal" data-target="#confirmationDialog">觉得结果不准确？再测一次</a></div>

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
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
                        <a href="vote.aspx?id=11&userid=<%=Request["userid"] %>" style="color:white">继续测试</a>

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
                        color: [[0.25, 'lightgreen'], [0.5, 'orange'], [0.75, 'skyblue'], [1, '#ff4500']],
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
                            case '10': return '非常健康';
                            case '40': return '比较健康';
                            case '60': return '不太健康';
                            case '90': return '很不健康';
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
                    formatter: '结果分布',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize: 30
                    }
                },
                data: [{ value: '<%=totalChartValue%>' , name:'健康指数' }],
                
            },
            {
                data: [{ value: 80, name: '测试结果', }],
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
                data: ['非常健康', '比较健康', '不太健康', '很不健康'],
                
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
                              'lightgreen', 'orange', 'skyblue', '#ff4500'
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
                data: [15,35,31,19],
              
            }
        ]
    };

        myChart1.setOption(option1);
</script>