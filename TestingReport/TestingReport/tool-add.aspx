<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tool-add.aspx.cs" Inherits="TestingReport.tool_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>幸福ABC - 方法 & 工具</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
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

    .frequency
    {
        cursor:pointer;
    }

    .frequency.selected
    {
        color:rgba(117,197,240,1) !important;
        background-color:white;
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
                    <div style="position:absolute;left:60px;bottom:5px;width:280px;border-radius:140px;background-color:rgba(117,197,240,1);z-index:50;height:280px;color:white;padding:100px 40px;text-align:center">创建项目</div>
                </div>
           
            </div>
            <div style="padding:80px 80px 40px 80px">
                <div>
                    <span style="color:White;border:1px solid white;padding:15px;border-radius:10px">项目名称</span>
                </div> 
                <div style="margin-top:16px"><asp:TextBox ID="itemName" runat="server" style="height:100px;width:100%;border:none;border-bottom:1px solid white;color:White;background-color:rgba(117,197,240,1);outline:none;"></asp:TextBox></div>
            </div>
            <div style="padding:0px 80px">
                <div>
                    <span style="color:White;border:1px solid white;padding:15px;border-radius:10px">打卡频率</span>
                    <span style="margin-left:80px;color:White;border:2px dashed white;padding:15px;border-radius:10px" id="daily" class="frequency">每天</span>
                    <span style="margin-left:40px;color:White;border:2px dashed white;padding:15px;border-radius:10px" id="weekly" class="frequency">每周</span>
                </div> 
                
            </div>
             <div style="padding:0px 80px;margin-top:50px;color:White">
                <div>
                    <span style="color:White;border:1px solid white;padding:15px;border-radius:10px">使用说明</span>
                </div> 
                <div style="font-size:36px">
                <p style="margin-top:30px">* 最多同时用三个工具</p>
                <p>* 每天(周)打卡一次，点击以后打卡成功，未完成改为完成</p>
                <p>* 每天(周)为新开始的一个周期</p>
                <p>* 如果要编辑或删除项目，点击项目名称可以进入</p>
                </div>
            </div>

            <div style="text-align:center;margin-top:50px;padding-bottom:50px;">
                        
                        <asp:Button runat="server" ID="createToolButton" style="width:300px;height:120px;border:none;padding:20px;font-size:50px;background-color:White;color:rgba(117,197,240,1);border-radius:10px" Text="创建项目" OnClick="createToolButton_Click" /> 
                        
                    </div>
        </div>

       
        
    </div>
 <asp:HiddenField runat="server" ID="frequencyField" />
    </form>
</body>
</html>

<script>
    $(document).ready(function () {
        $(".triangle").css("border-right", window.innerWidth + "px solid transparent");
        $(".triangle2").css("border-left", window.innerWidth + "px solid transparent");

        $("#daily").on("click", function () {
            $(".frequency").removeClass("selected");
            $("#daily").addClass("selected");
            $("#frequencyField").val("0");
        });
        $("#weekly").on("click", function () {
            $(".frequency").removeClass("selected");
            $("#weekly").addClass("selected");
            $("#frequencyField").val("1");
        });
    });

	</script>