<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tool-record.aspx.cs" Inherits="TestingReport.tool_record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>幸福ABC - 方法 & 工具</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
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
                    <div style="position:absolute;left:60px;bottom:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">项目打卡</div>
                </div>

                <div>
                    <table style="color:white;text-align:center;width:800px;margin:40px auto">
                        <tr style="height:100px">
                            <td><span style="padding:10px;border:1px solid white;border-radius:10px">工具名称</span></td>
                            <td><span style="margin-left:50px"><%=toolName %></span></td>
                        </tr>
                        <tr style="height:100px">
                            <td><span style="padding:10px;border:1px solid white;border-radius:10px">打卡频率</span></td>
                            <td><span style="margin-left:50px"><%=frequency %></span></td>
                        </tr>
                        <tr style="height:100px">
                            <td><span style="padding:10px;border:1px solid white;border-radius:10px">创建日期</span></td>
                            <td><span style="margin-left:50px"><%=createDateTime %></span></td>
                        </tr>
                    </table>
                </div>
            
                <div style="position:relative;border:none">
                    <div style="width: 0;height: 0;border-bottom: 200px solid white;border-right: 0 solid transparent;z-index:-1" id="triangle2" class="triangle2"></div>
                     <div style="position:absolute;right:50px;top:-5px;width:300px;border-radius:150px;background-color:white;z-index:20;height:300px">&nbsp;</div>
                    <div style="position:absolute;right:60px;top:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">打卡记录</div>

                </div>
           
                <div style="background:white;color:rgba(117,197,240,1);text-align:center;padding-top:100px;">
                    <table style="width:600px;margin:30px auto">
                        <%
                            for( int i = 0 ;i<listDays.Count;i++)
                            { 
                             %>
                        <tr>
                            <Td><%=listDays[i] %></Td>
                            <td><%=listStatus[i] %></td>

                        </tr>
                        <%
                        } %>
                        </table>
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
