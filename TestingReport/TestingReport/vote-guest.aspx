<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vote-guest.aspx.cs" Inherits="TestingReport.vote_guest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
    <title>
    生活再发现

    </title>
   <script src="Scripts/jquery.1.11.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
        .vote-area{
            margin:50px;
            border:1px solid lightgrey;
            background-color:rgba(252,251,252,1);
            text-align:center;
            border-radius:10px;
        }

        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div style="background-color:rgba(34,205,193,1);color:white">
          
         <div style="padding:30px 40px;margin-left:80px;margin-right:80px;text-align:center;font-size:50px;font-weight:bold;"><span><%=topicTitle %></span>
           </div>
           <div style="text-align:center;padding-bottom:10px;margin:0px 80px;padding-left:50px;padding-right:50px;">
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

       <div style="padding-left:90px;padding-right:90px;margin-top:60px;font-size:36px;">
           <div>
           
               <div style="color:#888">
                    <%if("1".Equals(topicIdString)){ %>
                   <div style="text-align:center">
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
                    <%}else if("9".Equals(topicIdString)){ %>
                     <div style="text-align:center;overflow:hidden">
                      <div style="float:left;width:50%">
                          <span style="color:rgba(34,205,193,1);font-size:40px;text-align:center">入世心态</span>
                          <hr />
                          <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                              <div style="float:left;margin-bottom:30px; color:lightgreen;width:50%;line-height:100px;">
                                    <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orangered;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">结果<Br />导向</div>
                                </div>
                              <div style="float:left;margin-bottom:30px; color:skyblue;width:50%;line-height:100px;">
                                    <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:skyblue;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">拼搏<Br />进取</div>
                                </div>
                           </div>
                        </div>

                      <div style="float:left;width:50%">
                          <span style="color:rgba(34,205,193,1);font-size:40px;text-align:center">出世心态</span>
                          <hr />
                          <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                              <div style="float:left;margin-bottom:30px; color:lightgreen;width:50%;line-height:100px;">
                                    <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orange;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">平常<Br />心</div>
                                </div>
                              <div style="float:left;margin-bottom:30px; color:skyblue;width:50%;line-height:100px;">
                                    <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:#6d3353;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">知足<Br />常乐</div>
                                </div>
                           </div>
                        </div>

                  </div>
                     <%}else if("10".Equals(topicIdString)){ %>
                 <div style="text-align:center;overflow:hidden">
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
                    <%}else if("2".Equals(topicIdString)){ %>
                  <div style="text-align:center">
                      <div style="color:rgba(34,205,193,1);font-size:40px;text-align:center;margin:0px 80px">幸福感由以下因素组成</div>
                      <hr />
                      <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                          <div style="float:left;margin-bottom:30px; color:lightgreen;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:lightgreen;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">积极<Br />情绪</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:skyblue;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:skyblue;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">身心<Br />投入</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orange;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orange;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">人际<Br />关系</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orangered;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:orangered;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">人生<Br />意义</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:#6d3353;width:20%;line-height:100px;">
                                <div style="margin-left:calc((100% - 100px)/2);float:left;text-align:center;background-color:#6d3353;color:white;width:100px;border-radius:50px;line-height:30px;height:100px;font-size:32px;font-weight:bold;padding-top:20px;">生活<Br />成就</div>
                            </div>

                          </div>
                  </div>
                   <%}else if("5".Equals(topicIdString)){ %>
                    <div style="text-align:center">
                      <div style="color:rgba(34,205,193,1);font-size:40px;text-align:center;margin:0px 80px">工作满意度由五个因素组成</div>
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
                   <%}else if("3".Equals(topicIdString)){ %>
                   <div style="text-align:center">
                      <div style="color:rgba(34,205,193,1);font-size:40px;text-align:center;margin:0px 80px">生活状态的三个区域</div>
                      <hr />
                      <div style="overflow:hidden;padding-left:20px;padding-right:20px;">
                          <div style="float:left;margin-bottom:30px; color:lightgreen;width:33.3%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:lightgreen;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:34px;font-weight:bold;padding-top:30px;">舒适<Br />区</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:skyblue;width:33.3%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:skyblue;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:34px;font-weight:bold;padding-top:30px;">学习<Br />区</div>
                            </div>
                          <div style="float:left;margin-bottom:30px; color:orange;width:33.3%;line-height:120px;">
                                <div style="margin-left:calc((100% - 120px)/2);float:left;text-align:center;background-color:orange;color:white;width:120px;border-radius:60px;line-height:30px;height:120px;font-size:34px;font-weight:bold;padding-top:30px;">恐慌<Br />区</div>
                            </div>
                    </div>
                  </div>

                   <%}else if("11".Equals(topicIdString)){ %>
                 <div style="text-align:center">
                      <div style="color:rgba(34,205,193,1);font-size:40px;text-align:center;margin:0px 80px">完整的健康由四个因素组成</div>
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
                      <%} %>
               </div>

           </div>





           <hr style="margin-top:50px;margin-bottom:50px;border:2px solid rgba(34,205,193,1)"/>

            
           <div>
               <div style="overflow:hidden;margin-bottom:30px;">
                   <span style="float:left">测试说明</span>
                   
               </div>
               <div style="color:#888;font-size:36px;padding-left:50px;padding-right:50px;"><span>
                   <%if("1".Equals(topicIdString)){ %>
                   最权威的人格特质测试方法。心理学家用大量研究方法，对不同种族和人群进行长期研究，提炼出5个最关键最普遍的人格特质，简称“大五” ：外向性、宜人性（友善性）、尽责性（谨慎性）、神经质（情绪稳定性）、开放性。
                   <%}else if("9".Equals(topicIdString)){ %>
                   出世、入世心态的本质是我们对于目标追求的态度和方式，并作为内在动机影响着我们的心理活动和行为方式。本测试通过答题计分法，测量你对于目标的追求心理，也就是出世、入世的倾向。
                   <%}else if("10".Equals(topicIdString)){ %>
                   完美主义者的最大特点是追求完美。它虽然有积极的一面，但是过度的完美主义与强迫症近似。如果在生活中对处处不满意、过度追求完美，会导致更多压力、焦虑、不开心，并在很多地方都会带来混乱。
通过本测试将会得出你的完美主义程度，以及和其他网友的比较。
                   <%}else if("2".Equals(topicIdString)){ %>
                   幸福可以量化吗？积极心理学和幸福相关的研究学者，近几年提出了一种受到广泛认同的理论，幸福由以下五个要素组成：积极情绪、身心投入、人际关系、人生意义、生活成就。<br />
快来测一下你的幸福程度，以及和小伙伴们的比较吧！
                   <%}else if("5".Equals(topicIdString)){ %>
                   你对工作满意吗？本测试是在访谈大量各行业职场人士的基础上制订而成。<br />
快来测一下你的得分，以及和小伙伴们的比较吧！
                   <%}else if("3".Equals(topicIdString)){ %>
                   心理学研究中关于生活状态也就是人对于外部世界的认识，分为三个区域：舒适区（comfort zone），学习区（stretch zone）和恐慌区（stress zone）。
通过下面的题目问答，你可以了解到自己的生活状态属于哪个区域。
                   <%}else if("11".Equals(topicIdString)){ %>
                   健康不仅仅是没有疾病， 而是身体、心理和社会适应的完好状态。根据世界卫生组织的标准，完整的健康由以下四个因素组成：身体健康、心理健康、居住环境健康、社会适应健康。


                   <%} %></span>
               </div>

           </div>
       </div>

       <div id="buttonArea" runat="server" class="content" style="text-align:center;padding-top:80px;margin-bottom:200px;">
          
       </div>
    
   
    <asp:Label ID="topicId" runat="server" Visible="false" />
    <asp:Label ID="topicType" runat="server" Visible="false" />
    <asp:Label ID="totalOptions" runat="server" Visible="false" />
    <asp:Label ID="totalChooseItems" runat="server" Visible="false" />
    <asp:Label ID="userId" runat="server" Visible="false"  />

    </form>

    <!--
    <script>
        function onBridgeReady() {
            WeixinJSBridge.call('hideOptionMenu');
        }

        if (typeof WeixinJSBridge == "undefined") {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        } else {
            onBridgeReady();
        }
</script>-->
    
</body>
</html>

