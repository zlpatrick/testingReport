<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="find-life-badge.aspx.cs" Inherits="TestingReport.find_life_badge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生活再发现 - 发现生活</title>
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

        <div style="padding:80px ;font-size:40px;margin-bottom:400px;">
        <div style="overflow:hidden;margin-bottom:40px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">我的性格标签</div>
            
        </div>
        <div style="font-size:32px;font-weight:bold">
            <% if (badgeNames.Count > 0) { 
                for(int i=0;i<badgeNames.Count;i++){ %>
            <a href="#" style="color:white" data-toggle="modal" data-target="#badge-dialog-<%=badgeCategory[i] %>">
                <div style="float:left;margin-bottom:30px; color:<%=badgeColor[i]%>;width:33.3%;line-height:80px;">
                    <div style="float:left;text-align:center;background-color:<%=badgeColor[i]%>;color:white;width:80px;border-radius:40px;line-height:80px;height:80px;font-size:28px;font-weight:bold;"><%=badgeClass[i] %></div>&nbsp;<%=badgeNames[i] %>
                </div></a>
            <% }}
               else{%>
               <span style="color:rgba(34,205,193,1)">你还没有标签，赶快参加测试获取吧！</span>
            <%} %>

        </div>
        <div style="clear:both">说明: 点击标签，可以看到分类情况和各类别用户比例。</div>
    </div>
   

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=openid %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=openid %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="knowledge.aspx?userid=<%=openid %>" style="color:white">知识点滴</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=openid %>" style="color:white">用户中心</a></div>
       
    </div>
    </form>

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
                        非常幸福
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=happy_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        比较幸福
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=happy_2 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        不太幸福
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=happy_3 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        很不幸福
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=happy_4 %>%
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
                        非常满意
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=work_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        比较满意
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=work_2 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        不太满意
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=work_3 %>%
                    </div>
                    
                 </div> 

                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        很不满意
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=work_4 %>%
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
                        舒适区
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=life_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        学习区
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=life_2 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        恐慌区
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=life_3 %>%
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

    <div id="badge-dialog-4" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
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
                        非常健康
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=health_1 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        比较健康
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=health_2 %>%
                    </div>
                    
                 </div> 
                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        比较健康
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=health_3 %>%
                    </div>
                    
                 </div> 

                <div style="overflow:hidden">
                    <div style="float:left;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);border:2px solid rgba(34,205,193,1);padding:10px;border-radius:5px;">
                        很不健康
                    </div>
                    <div style="float:right;margin-right:30px; margin-bottom:30px; color:rgba(34,205,193,1);padding:10px;">
                        <%=health_4 %>%
                    </div>
                    
                 </div> 
               
                 <a href="#" style="color:white" onclick="$('#badge-dialog-4').modal('hide');">
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
