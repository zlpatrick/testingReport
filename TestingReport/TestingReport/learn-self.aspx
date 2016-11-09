<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="learn-self.aspx.cs" Inherits="TestingReport.learn_self" %>

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
        <a href="person.aspx?userid=<%=openid %>">
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

    <div style="padding:80px;font-size:40px;">
        <div style="overflow:hidden;margin-bottom:40px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">我的性格标签</div>
            <div style="float:right;font-size:40px;color:grey;"><a href="learn-self-badge.aspx?userid=<%=openid %>" style="color:grey">查看更多..</a></div>
        </div>
        <div style="font-size:32px;">
            <% if (badgeNames.Count > 0) { 
                for(int i=0;i<badgeNames.Count;i++){ %>
            <a href="#" style="color:white" data-toggle="modal" data-target="#badge-dialog-<%=badgeCategory[i] %>">
                <div style="float:left;margin-right:30px;margin-bottom:30px; color:<%=badgeColor[i]%>;border:2px solid <%=badgeColor[i]%>;padding:10px;border-radius:5px;">
                    <span class="glyphicon <%=badgeClass[i] %>"></span> <%=badgeNames[i] %>
                </div></a>
            <% }}
               else{%>
               <span style="color:rgba(34,205,193,1)">你还没有标签，赶快参加测试获取吧！</span>
            <%} %>
        </div>
    </div>

        <div style="padding:80px;font-size:40px;">
        <div style="overflow:hidden;margin-bottom:40px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">合拍榜</div>
            <div style="float:right;font-size:40px;color:grey;"><a href="learn-self-total-hepai.aspx?userid=<%=openid %>" style="color:grey">查看更多..</a></div>
        </div>
        <div style="font-size:32px;">
            <div style="margin-top:40px;overflow:hidden;font-size:40px">
                <div style="width:33%;float:left;text-align:center">
                    <img src="img/3-left.png"  style="width:70%;"/><br />90%
                </div>
                <div style="width:33%;float:left;text-align:center">
                    <img src="img/1-right.png"  style="width:70%;"/><br />78%
                </div>
                <div style="width:33%;float:left;text-align:center">
                    <img src="img/2-left.png"  style="width:70%;"/><br />65%
                </div>
            </div>
        </div>
    </div>
        
        
    <div style="padding:0px 80px 80px 80px;font-size:40px;margin-bottom:80px;">
         <div style="overflow:hidden;margin-bottom:40px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">测试列表</div>
           
        </div>
        <div style="overflow:hidden;text-align:center;margin-bottom:30px;border:2px solid lightgrey;border-radius:8px;padding:30px">
            <div style="float:left;width:22%">大五<br />人格测试</div>
            <div style="float:left;width:55%;color:grey;font-size:36px">全球最权威的性格测试<br />共45题 约8分钟</div>
            <% if(bigfive){ %>
            <div style="float:left;width:23%;font-size:36px">已测试<br /><a href="big-five-result.aspx?userid=<%=openid %>"><span style="font-size:36px;padding:5px 10px;color:white;background-color:rgba(34,205,193,1)">查看结果</span></a></div>
       <%}else{ %>
             <div style="float:left;width:23%;font-size:36px">未测试<br /><a href="vote.aspx?id=1&userid=<%=openid %>"><span style="font-size:36px;padding:5px 10px;color:white;background-color:rgba(34,205,193,1)">点击测试</span></a></div>
        <%} %>
        </div>
        <div style="overflow:hidden;text-align:center;margin-bottom:30px;border:2px solid lightgrey;border-radius:8px;padding:30px">
            <div style="float:left;width:22%">出世入世<br />测试</div>
            <div style="float:left;width:55%;color:grey;font-size:36px">测试你的人生态度<br />共16题 约3分钟</div>
            <%if(world){ %>
            <div style="float:left;width:23%;font-size:36px">已测试<br /><a href="world-result.aspx?userid=<%=openid %>"><span style="font-size:36px;padding:5px 10px;color:white;background-color:rgba(34,205,193,1)">查看结果</span></a></div>
            <%}else{ %>
            <div style="float:left;width:23%;font-size:36px">未测试<br /><a href="vote.aspx?id=9&userid=<%=openid %>"><span style="font-size:36px;padding:5px 10px;color:white;background-color:rgba(34,205,193,1)">点击测试</span></a></div>
        <%} %>
        </div>

        <div style="overflow:hidden;text-align:center;border:2px solid lightgrey;border-radius:8px;padding:30px">
            <div style="float:left;width:22%">完美主义<br />测试</div>
            <div style="float:left;width:55%;color:grey;font-size:36px">测试你的完美主义倾向<br />共20题 约4分钟</div>
            <%if(perfect){ %>
            <div style="float:left;width:23%;font-size:36px">已测试<br /><a href="perfect-result.aspx?userid=<%=openid %>"><span style="font-size:36px;padding:5px 10px;color:white;background-color:rgba(34,205,193,1)">查看结果</span></a></div>
            <%}else{ %>
            <div style="float:left;width:23%;font-size:36px">未测试<br /><a href="vote.aspx?id=10&userid=<%=openid %>"><span style="font-size:36px;padding:5px 10px;color:white;background-color:rgba(34,205,193,1)">点击测试</span></a></div>
         <%} %>
        </div>
    </div>

      
       <div style="margin-top:30px">
            <div id="main" style="height:680px;background-color:white;border:none;padding:80px;font-size:36px !important;line-height:initial !important"></div>
        </div>

   

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=openid %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=openid %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="happiness.aspx?userid=<%=openid %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=openid %>" style="color:white">个人中心</a></div>
       
    </div>
    </form>
    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>


    <div id="badge-dialog-1" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:50%">
			<div class="modal-content" style="padding:50px;font-size:32px">
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px;  color:rgba(34,205,193,1);padding:10px;">
                        分类
                    </div>
                    <div style="float:right;margin-right:30px; color:rgba(34,205,193,1);padding:10px;">
                        用户比例
                    </div>
                    
                 </div> 
                <hr style="border:2px solid rgba(34,205,193,1)"/>
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        重度入世
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=world_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        轻度入世
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=world_2 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        轻度出世
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=world_3 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        重度出世
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=world_4 %>%
                    </div>
                    
                 </div> 
                 <a href="#" style="color:white" onclick="$('#badge-dialog-1').modal('hide');">
                    <div style="width:100%;text-align:center;border:none;text-align:center !important;font-size:32px !important;height:80px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:80px;color:white">
                       关闭

                    </div></a>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>

    <div id="badge-dialog-2" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:60%">
			<div class="modal-content" style="padding:50px;font-size:32px">
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px;  color:rgba(34,205,193,1);padding:10px;">
                        分类
                    </div>
                    <div style="float:right;margin-right:30px; color:rgba(34,205,193,1);padding:10px;">
                        用户比例
                    </div>
                    
                 </div> 
                <hr style="border:2px solid rgba(34,205,193,1)"/>
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        顺其自然主义
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=perfect_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        积极完美主义
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=perfect_3 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        神经质完美主义
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=perfect_2 %>%
                    </div>
                    
                 </div> 
               
                 <a href="#" style="color:white" onclick="$('#badge-dialog-2').modal('hide');">
                    <div style="width:100%;text-align:center;border:none;text-align:center !important;font-size:32px !important;height:80px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:80px;color:white">
                       关闭

                    </div></a>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>

    <div id="badge-dialog-3" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:50%">
			<div class="modal-content" style="padding:50px;font-size:32px;">
              <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px;  color:rgba(34,205,193,1);padding:10px;">
                        分类
                    </div>
                    <div style="float:right;margin-right:30px; color:rgba(34,205,193,1);padding:10px;">
                        用户比例
                    </div>
                    
                 </div> 
                <hr style="border:2px solid rgba(34,205,193,1)"/>
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        神经质低
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=bigfive_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        神经质高
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=bigfive_2 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:skyblue;border:2px solid skyblue;padding:10px;border-radius:5px;">
                        内向
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:skyblue;padding:10px;">
                        <%=bigfive_3 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:skyblue;border:2px solid skyblue;padding:10px;border-radius:5px;">
                        外向
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:skyblue;padding:10px;">
                        <%=bigfive_4 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:#398439;border:2px solid #398439;padding:10px;border-radius:5px;">
                        保守
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:#398439;padding:10px;">
                        <%=bigfive_5 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:#398439;border:2px solid #398439;padding:10px;border-radius:5px;">
                        开放
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:#398439;padding:10px;">
                        <%=bigfive_6 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:orangered;border:2px solid orangered;padding:10px;border-radius:5px;">
                        宜人性低
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:orangered;padding:10px;">
                        <%=bigfive_7 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:orangered;border:2px solid orangered;padding:10px;border-radius:5px;">
                        宜人性高
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:orangered;padding:10px;">
                        <%=bigfive_8 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:lightgreen;border:2px solid lightgreen;padding:10px;border-radius:5px;">
                        严谨性低
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:lightgreen;padding:10px;">
                        <%=bigfive_9 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:lightgreen;border:2px solid lightgreen;padding:10px;border-radius:5px;">
                        严谨性高
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:lightgreen;padding:10px;">
                        <%=bigfive_10 %>%
                    </div>
                    
                 </div> 
               
                 <a href="#" style="color:white" onclick="$('#badge-dialog-3').modal('hide');">
                    <div style="width:100%;text-align:center;border:none;text-align:center !important;font-size:32px !important;height:80px;background-color:rgba(34,205,193,1);cursor:pointer;line-height:80px;color:white">
                       关闭

                    </div></a>
                    
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>
</body>
    
</html>

   
