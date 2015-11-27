<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="way-tool.aspx.cs" Inherits="TestingReport.way_tool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC - 方法 & 工具</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
    .mylist
    {
        overflow:hidden;
        border-top:2px dashed lightgrey;
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
<body style="background-color:#eee">
    <form id="form1" runat="server">
    <div>
        <a href="person.aspx">
            <div style="overflow:hidden;padding:50px;background-color:white">
                <div style="float:left;width:20%"><img src="<%=userImageUrl %>" style="width:100%;border-radius:10px;"/></div>
                <div style="float:left;padding:50px;color:#555">昵称: <%=userNickName %></div>
                <div style="float:right;padding:50px 20px;color:#555"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></div>
            </div>
        </a>
        <hr style="margin:0;border-bottom:1px solid #AAA"/>
    
        <div style="padding-top:25px;padding-bottom:25px;text-align:center;color:orangered">
            努力程度：<span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
        </div>

        <div style="border-top:1px solid #AAA;border-bottom:1px solid #AAA;background-color:white;padding:50px;">
            <div ><span class="glyphicon glyphicon-user"></span> 我的工具</div>
            <div style="overflow:hidden;padding-top:50px;padding-bottom:50px">
                <div style="width:5%;float:left">&nbsp;</div>
                <div style="width:40%;float:left;border:2px dashed lightblue;padding:40px 20px;text-align:center;font-size:40px">本周完成度<br />20分</div>
                <div style="width:10%;float:left">&nbsp;</div>
                <div style="width:40%;float:left;border:2px dashed lightblue;padding:40px 20px;text-align:center;font-size:40px">本周完成度<br />30分</div>
                <div style="width:5%;float:left">&nbsp;</div>
            </div>

        </div>

        <div style="border-top:1px solid #AAA;border-bottom:1px solid #AAA;background-color:white;padding:50px;margin-top:50px;margin-bottom:50px">
            <div ><span class="glyphicon glyphicon-user"></span> 方法 List</div>
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
        
    </div>
 
    </form>
</body>
</html>
