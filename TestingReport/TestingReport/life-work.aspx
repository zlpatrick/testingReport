<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="life-work.aspx.cs" Inherits="TestingReport.life_work" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC - 工作 & 生活</title>

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
    </div>
    <div style="padding-top:40px;padding-bottom:40px;">
        <div style="text-align:center"><a href="work-life.aspx">工作状态</a> &nbsp;&nbsp;|&nbsp;&nbsp; 生活状态</div>
    </div>
    <div style="background-color:White;border-top:1px solid #AAA;border-bottom:1px solid #AAA">
        <div style="padding-top:30px;padding-bottom:30px;text-align:center;color:orangered">关爱指数：<span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
            <span class="glyphicon glyphicon-star-empty"></span>
        </div>
        <div>
            <div style="padding-left:50px">
                <span class="glyphicon glyphicon-user"></span> 生活状态大数据
            </div>

            <a href="profile.aspx?id=3&userid=<%=Request["userid"] %>">
            <div style="overflow:hidden;padding:50px;color:#bbb">
                <div style="width:50%;float:left">
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:80px 50px 50px 50px;padding:30px;">
                        幸福指数<br />30分<br />击败30%网友
                        
                    </div>
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:50px;padding:30px;">
                        焦虑指数<br />50分<br />击败60%网友
                        
                    </div>
                </div>
                <div style="width:50%;float:left">
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:30px 50px 50px 50px;padding:30px;">
                        情绪指数<br />30分<br />击败30%网友
                        
                    </div>
                    <div style="background-color:#efefef;font-size:40px;border:3px dashed lightblue;border-radius:20px;text-align:center;margin:50px;padding:30px;">
                        成就与意义<br />50分<br />击败60%网友
                        
                    </div>
                </div>
            </div>
            </a>
        </div>
        <div>
            <div style="padding-left:50px">
                <span class="glyphicon glyphicon-user"></span> 历史记录
            </div>
        </div>
    </div>
    </form>
</body>
</html>
