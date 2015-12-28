<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person-self.aspx.cs" Inherits="TestingReport.person_self" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>幸福ABC - 认识自我</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
</head>
<body style="background-color:#eee">
    <form id="form1" runat="server">
    <div>

    <a href="person.aspx?userid=<%=Request["userid"] %>">
    <div style="background-color:rgba(117,197,240,1);height:300px;position:relative;">
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
    </div>
    </a>
    
    <div style="text-align:center;color:#555;padding-top:120px;padding-bottom:30px;background-color:white">
        <div><%=userNickName %></div>
        <div class="user-tag">
            <span><%=age %></span><span><%=industry %></span><span><%=region %></span>
        </div>
        <div style="font-size:40px;margin-top:30px;color:grey">
            <ul style="padding:0">
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:rgba(117,197,240,1)"><%=testTimes %>次</span><br />测试次数</li>
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:rgba(117,197,240,1)"><%=toolTimes %>天</span><br />使用工具</li>
                <li style="display:inline-block;width:32%"><span style="color:rgba(117,197,240,1)"><%=selfPercent %>%</span><br />认识自我</li>
            </ul>
        </div>
    </div>


    
    <hr style="margin:0;border-color:#AAA;"/>
  
    
    <div style="padding-top:25px;padding-bottom:25px;text-align:center;color:orangered">
        完成度：<span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
    </div>
   
    <div style="border-top:1px solid #AAA;border-bottom:1px solid #AAA;background-color:white;padding:50px;">
        <div ><span class="glyphicon glyphicon-user"></span> 性格分析</div>
        <div style="text-align:right"><a href="profile.aspx?id=1&userid=<%=Request["userid"] %>"><img src="img/big5.png" style="width:70%;"/></a></div>
       <!-- <div style="margin-top:40px"><a href="result.aspx">查看我的测试结果</a> <a href="test.aspx">再测一次</a></div>
        <div><a href="test.aspx">进入测试</a></div>-->
    </div>

    <div style="border-top:1px solid #AAA;border-bottom:1px solid #AAA;background-color:white;padding:50px;margin-top:50px;margin-bottom:50px;">
        <div ><span class="glyphicon glyphicon-user"></span> 职业取向</div>
        <div style="text-align:right"><a href="profile.aspx?id=8&userid=<%=Request["userid"] %>"><img src="img/mbti.gif" style="width:70%;"/></a></div>
        <!--<div style="margin-top:40px"><a href="result.aspx">查看我的测试结果</a> <a href="test.aspx">再测一次</a></div>
        <div><a href="test.aspx">进入测试</a></div>-->
    </div>

    </div>
    </form>
</body>
</html>
