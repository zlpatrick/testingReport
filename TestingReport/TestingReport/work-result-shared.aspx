<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="work-result-shared.aspx.cs" Inherits="TestingReport.work_result_shared" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生活再发现 - 工作满意度测试</title>
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
        <div style="padding:20px 40px;margin-left:80px;margin-right:80px;text-align:center;font-size:50px;font-weight:bold;margin-top:10px;"><span>工作满意度测试报告</span>
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
        <div style="width:500px;color:white;background-color:rgba(34,205,193,1);text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">工作满意度测试
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
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1);margin-bottom:80px">用户比例</div>
            
            <div id="main1" style="margin-bottom:80px;height:500px;background-color:white;border:none;padding:0px;font-size:36px !important;line-height:initial !important"></div>
        </div>
        <div style="overflow:hidden;margin-top:80px;margin-bottom:40px;margin-left:80px;margin-right:80px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1);margin-bottom:30px;">维度分析</div>
            <div style="text-align:center;clear:both">
                      <div style="color:rgba(34,205,193,1);font-size:40px;text-align:center;margin:0px 80px;">工作满意度由五个因素组成</div>
                      <hr />
                      <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                          <div style="float:left;margin-bottom:30px; color:lightgreen;width:20%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:lightgreen;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:32px;font-weight:bold;padding-top:30px;">内容<Br />自由度</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:skyblue;width:20%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:skyblue;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:32px;font-weight:bold;padding-top:30px;">环境<Br />氛围</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orange;width:20%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:orange;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:32px;font-weight:bold;padding-top:30px;">发展<Br />提升</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orangered;width:20%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:orangered;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:32px;font-weight:bold;padding-top:30px;">收入<Br />成就感</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:#6d3353;width:20%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:#6d3353;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:32px;font-weight:bold;padding-top:30px;">压力<Br />工作量</div>
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
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">内容&自由度</div>
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
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">环境&氛围</div>

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
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">发展&提升</div>
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
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">收入&成就感</div>
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

             <div style="border-bottom:2px dashed #213c4c;padding-top:20px;padding-bottom:40px;padding-left:30px;padding-right:30px;">
                <div style="text-align:center;color:#213c4c;margin-bottom:20px;font-size:30px;font-weight:bold">工作量&压力</div>
                <div style="overflow:hidden;font-size:28px;margin-bottom:15px;color:#213c4c;position:relative;height:60px">
                    <div style="float:left;padding-left:20px;"></div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;">
                        <div style="position:absolute;left:calc(<%=radarDimScores[4]*10 %>% - 30px);color:white"><img src="<%=userImageUrl %>" style="width: 60px;border-radius: 30px;border-radius: 30px;border:2px solid #ddd"/></div>
                    </div>                    <div style="float:right;padding-right:20px;"></div>
                </div>
                <div style="position:relative;clear:both;height:71px;">
                    <div style="position:absolute;left:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(215,249,247,1);line-height:100px;text-align:center;font-size:40px;color:#999">低</div></div>
                      <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarDimScores[4]*10 %>%">&nbsp;</div>
                    </div>
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="width:5px;height:60px;background-color:white;position:absolute;left:<%=radarAveScores[4]*10 %>%;opacity:0.6">&nbsp;</div>
                    </div>
                    <div style="width:94%;margin:auto;position:relative">
                        <div style="width:100%;background:linear-gradient(to right, rgba(215,249,247,1), rgba(34,205,193,1));float:left;height:60px">&nbsp;</div>
                    
                    </div>
                    <div style="position:absolute;right:-30px;top:-18px;z-index:1"><div style="width:100px;border-radius:50px;height:100px;background-color:rgba(34,205,193,1);line-height:100px;text-align:center;font-size:40px;color:white">高</div></div>
                </div>

                <div style="font-size:30px;color:#213c4c;margin-top:10px;">
                    <div style="position:relative;margin-left:100px;margin-right:100px;z-index:1">
                        <div style="position:absolute;left:calc(<%=radarAveScores[4]*10 %>% - 30px);opacity:0.6"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                    </div>
                </div>
            </div>







        </div>
  
     <div style="width:60%;margin:60px auto 100px auto;border-radius:10px;border:none;text-align:center !important;font-size:36px !important;height:100px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:100px;color:white"><a href="middle.aspx?id=5" style="color:white" >我也要测</a></div>
       
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
                            case '10': return '非常满意';
                            case '40': return '比较满意';
                            case '60': return '不太满意';
                            case '90': return '很不满意';
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
                data: [{ value: <%=totalChartValue%>, name: '工作满意度', }],
                
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
                data: ['非常满意', '比较满意', '不太满意', '很不满意'],
                
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
                              'lightgreen','orange','skyblue','#ff4500'
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
                data: [9,38,31,22],
              
            }
        ]
    };

        myChart1.setOption(option1);
</script>
