<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="learn-self-links.aspx.cs" Inherits="TestingReport.learn_self_links" %>

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

         
   
    
    
    <div style="text-align:center;color:white;padding-top:30px;padding-bottom:30px;background-color:rgba(34,205,193,1)">
        <div>幸福宝典</div>
        <div class="user-tag">
            <span><a href="happiness.aspx?userid=<%=Request["userid"] %>" style="color:white">所有文章</a></span><span class="user-tag-active">认识自我</span><span>发现生活</span>
        </div>
        
    </div>

 

    <div style="padding:30px 80px;margin-bottom:100px;">
            <div style="overflow:hidden">
                 <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">好文推荐</div>
                
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

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="happiness.aspx?userid=<%=Request["userid"] %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=Request["userid"] %>" style="color:white">个人中心</a></div>
       
    </div>
    </form>
    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>
</body>
   
</html>