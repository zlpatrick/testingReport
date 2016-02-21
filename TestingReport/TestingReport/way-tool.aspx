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
        a:hover
    {
        text-decoration:none;
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
<body>
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
        <hr style="margin:0;border-bottom:1px solid #AAA"/>

        <div style="background-color:rgba(117,197,240,1)">
            
            <div style="margin-top:150px">

                <div style="position:relative;border:none">
                    <div style="width: 0;height: 0;border-top: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle"  class="triangle"></div>
                    <div style="position:absolute;left:50px;bottom:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
                    <div style="position:absolute;left:60px;bottom:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">我的工具</div>
                </div>


                <div style="margin-top:80px;margin-bottom:80px"> 
                    <table style="width:95%;text-align:center;margin:auto">
                        <tr class="my-tool-title">
                            <td><span>方法名称</span></td>
                            <td><span>近5次打卡</span></td>
                            <td><span>操作</span></td>
                        </tr>
                        <tr>
                            <td colspan="4"><hr style="border-color:White;margin-top:40px;" /></td>
                        </tr>

                        <%
                            for (int i = 0; i < toolNames.Count;i++ )
                            { 
                             %>
                        <tr class="my-tool-content">
                            <td><a href="tool-edit.aspx?id=<%= toolIds[i]%>&userid=<%=Request["userid"] %>" style="color:white"><%= toolNames[i]%></a></td>
                            <td></td>
                            <td><a href="tool-record.aspx?id=<%= toolIds[i]%>&userid=<%=Request["userid"] %>" style="color:white"><span style="padding:10px;border:1px solid white;border-radius:10px">打卡</span></a></td>
                        </tr>

                        <%} %>
                       
                    </table>
                    <div style="text-align:center;margin-top:50px;">
                        <a href="tool-add.aspx?userid=<%=Request["userid"]%>">
                        <span style="padding:20px;font-size:40px;background-color:White;color:rgba(117,197,240,1);border-radius:10px">创建新项目</span>
                        </a>
                    </div>
                </div>

                <div style="position:relative;border:none">
                    <div style="width: 0;height: 0;border-bottom: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle2" class="triangle2"></div>
                     <div style="position:absolute;right:50px;top:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
                    <div style="position:absolute;right:60px;top:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">方法推荐</div>

                </div>
            </div>
        </div>

        <div style="background-color:white;padding:50px;margin-top:50px;margin-bottom:50px">
            
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

<script>
    $(document).ready(function () {
        $(".triangle").css("border-right", window.innerWidth + "px solid transparent");
        $(".triangle2").css("border-left", window.innerWidth + "px solid transparent");
    });

	</script>