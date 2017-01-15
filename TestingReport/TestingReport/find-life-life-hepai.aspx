<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="find-life-life-hepai.aspx.cs" Inherits="TestingReport.find_life_life_hepai" %>

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
        <div style="width:500px;color:white;background-color:rgba(34,205,193,1);text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">生活状态测试
            <div style="float:left;width:5px;background-color:white;margin-left:15px;">&nbsp;</div>
             <div style="float:right;width:5px;background-color:white;margin-right:15px;">&nbsp;</div>
        </div>
    </div>
 
        <div style="padding:40px 80px 80px 80px;margin-bottom:50px;">
            <div style="overflow:hidden">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">合拍榜</div>
            
                </div>
            <div style="margin-top:40px;margin-bottom:20px;font-size:40px">和你性格最接近的好友</div>
            <div style="margin-top:40px;font-size:40px">
                <div style="overflow:hidden;margin-bottom:40px;margin-top:20px;">
                    <div style="float:left;width:20%;text-align:center"><img src="img/5-left.png" style="width:80%" /></div>
                    <div style="float:left;width:60%;padding-top:40px">三石叔叔</div>
                    <div style="float:left;text-align:center;margin-top:20px;font-size:40px"><span style="color:orangered">合拍指数</span><br />90%</div>
                </div>
                 <div style="overflow:hidden;margin-bottom:40px;margin-top:20px;">
                    <div style="float:left;width:20%;text-align:center"><img src="img/5-right.png" style="width:80%"/></div>
                 <div style="float:left;width:60%;padding-top:40px">Jeffrey</div>
                    <div style="float:left;text-align:center;margin-top:20px;font-size:40px"><span style="color:orangered">合拍指数</span><br />78%</div>
                </div>
                 <div style="overflow:hidden;margin-bottom:40px;margin-top:20px;">
                    <div style="float:left;width:20%;text-align:center"><img src="img/4-left.png" style="width:80%" /></div>
                     <div style="float:left;width:60%;padding-top:40px">浪子回头</div>
                    <div style="float:left;text-align:center;margin-top:20px;font-size:40px"><span style="color:orangered">合拍指数</span><br />65%</div>
                </div>

            </div>
           
        </div>

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="knowledge.aspx?userid=<%=Request["userid"] %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=Request["userid"] %>" style="color:white">个人中心</a></div>
       
    </div>
    </form>
    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>
</body>
   
</html>
