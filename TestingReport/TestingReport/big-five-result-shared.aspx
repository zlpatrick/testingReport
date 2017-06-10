<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="big-five-result-shared.aspx.cs" Inherits="TestingReport.big_five_result_shared" %>

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
        
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
    
    </div>
    
    
     <div style="text-align:center;color:white;padding-top:120px;padding-bottom:30px;background-color:rgba(34,205,193,1)">
        <div style="margin:0px 20px;padding:0px 50px;"><span><%=userNickName %></span></div>
        <div style="padding:20px 40px;margin-left:80px;margin-right:80px;text-align:center;font-size:50px;font-weight:bold;margin-top:10px;"><span>大五性格测试报告</span>
           </div>
        <div style="text-align:center;margin:0px 80px;padding-left:50px;padding-right:50px">
               <span style="padding:10px;border:2px solid white;font-size:36px;">生活再发现心理测试系列</span>

        </div>
          <div style="overflow:hidden;padding:40px 60px;text-align:center;font-size:36px;">
               <div style="float:left;width:33%;padding-left:40px;padding-right:40px;">
                   <span style="font-weight:bold">权威</span><hr style="margin-top:10px;margin-bottom:10px;" />
                   <span style="font-size:32px">专业团队制作</span>
               </div>
               <div style="float:left;width:33%;padding-left:40px;padding-right:40px;">
                   <span style="font-weight:bold">准确</span><hr style="margin-top:10px;margin-bottom:10px;" />
                   <span style="font-size:32px">信度85%以上</span>
               </div>
               <div style="float:left;width:33%;padding-left:40px;padding-right:40px;">
                   <span style="font-weight:bold">客观</span><hr  style="margin-top:10px;margin-bottom:10px;"/>
                   <span style="font-size:32px">网友好友比较</span>
               </div>
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
    <div style="width:60%;margin:60px auto 100px auto;border-radius:10px;border:none;text-align:center !important;font-size:36px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white"><a href="middle.aspx?id=1" style="color:white" >我也要测</a></div>
       
  <section  style="width:100%;margin:1em auto;text-align: center;"><section  style="width: 10px; height: 10px; border-radius: 50%; opacity: 0.5; border: 1px solid white; display: inline-block; vertical-align: top; margin-top: 0.56em; background-color: rgb(78, 153, 223);"></section><section class="" style="width: 15px; height: 15px; border-radius: 50%; border: 2px solid white; display: inline-block; vertical-align: top; margin-top: 0.4em; background-color: rgb(78, 153, 223);"></section><p style="display: inline-block;margin-left: 0.5em;"><span style="color: rgb(0, 176, 240);"><strong>END</strong></span></p><section class="" style="margin-left: 0.5em; width: 15px; height: 15px; border-radius: 50%; display: inline-block; border: 2px solid white; vertical-align: top; margin-top: 0.4em; background-color: rgb(78, 153, 223);"></section><section class="" style="width: 10px; height: 10px; border-radius: 50%; vertical-align: top; opacity: 0.5; display: inline-block; border: 1px solid white; margin-top: 0.56em; background-color: rgb(78, 153, 223);"></section></section>

        <div style="margin-left:50px;margin-right:50px;">
        <img data-src="assets/bottom-1.jpg" src="assets/bottom-1.png" title="assets/try.jpg" style="width:100%;"/></div>

        <div style="margin-left:50px;margin-right:50px;text-align:center;margin-top:50px;">
        <img data-src="assets/bottom-1.jpg" src="assets/bottom-2.png" title="assets/try.jpg" style="width:60%;"/></div>
   <div style="margin-left:80px;margin-right:80px;font-size:36px;margin-top:40px;">
         
       <div style="padding-left:50px;padding-right:50px;color:grey;font-size:28px;margin-bottom:100px;">

          <p>公众号所有原创内容归“生活再发现”版权所有，
包括测试量表、内容说明、相关文章等。</p> 

<p>任何组织、机构和个人不得擅自转载或二次修改。</p> 

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
