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

    <a href="person.aspx">
        <div style="overflow:hidden;padding:50px;background-color:white">
            <div style="float:left;width:20%"><img src="<%=userImageUrl %>" style="width:100%;border-radius:10px;"/></div>
            <div style="float:left;padding:50px;color:#555">昵称: <%=userNickName %></div>
            <div style="float:right;padding:50px 20px;color:#555"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></div>
        </div>
    </a>

    <hr style="margin:0;border-bottom:1px solid #AAA"/>
    
    <div style="padding-top:25px;padding-bottom:25px;text-align:center;color:orangered">
        完成度：<span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
    </div>
   
    <div style="border-top:1px solid #AAA;border-bottom:1px solid #AAA;background-color:white;padding:50px;">
        <div ><span class="glyphicon glyphicon-user"></span> 性格分析</div>
        <div style="text-align:right"><img src="img/big5.png" style="width:70%;"/></div>
        <div style="margin-top:40px"><a href="result.aspx">查看我的测试结果</a> <a href="test.aspx">再测一次</a></div>
        <div><a href="test.aspx">进入测试</a></div>
    </div>

    <div style="border-top:1px solid #AAA;border-bottom:1px solid #AAA;background-color:white;padding:50px;margin-top:50px;margin-bottom:50px;">
        <div ><span class="glyphicon glyphicon-user"></span> 职业取向</div>
        <div style="text-align:right"><img src="img/mbti.gif" style="width:70%;"/></div>
        <div style="margin-top:40px"><a href="result.aspx">查看我的测试结果</a> <a href="test.aspx">再测一次</a></div>
        <div><a href="test.aspx">进入测试</a></div>
    </div>

    </div>
    </form>
</body>
</html>
