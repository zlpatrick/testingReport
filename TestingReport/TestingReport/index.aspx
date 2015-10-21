<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TestingReport.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <script src="Scripts/jquery.1.11.js"></script>
    <style>
    p
    {
        text-align:center;
    }
    a
    {
        color:orange;
        text-decoration:none;
        
    }

    .topBanner
    {
        cursor:pointer;
    }

    .topBanner-active
    {
        border-bottom:5px solid #0097d4;
        color:#0097d4;
    }

    .bottom-pane
    {
        display:none;
    }

    .bottom-pane-active
    {
        display:block !important;
    }
    .mylist
    {
        overflow:hidden;
        border-bottom:2px dashed lightgrey;
    }
    .mylist-img
    {
        float:left;
        width:240px;
        padding:20px;
    }
    .mylist-intro
    {
        float:left;
    }
    .mylist-img img
    {
        width:200px;
    }
    </style>
    <script>
        function onBridgeReady() {
            WeixinJSBridge.call('hideOptionMenu');
        }

        if (typeof WeixinJSBridge == "undefined") {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        } else {
            onBridgeReady();
        }

        function changeActive(element) {
            $("#topbannerDiv div").removeClass("topBanner-active");
            $("#" + element).addClass("topBanner-active");

            $(".bottom-pane").removeClass("bottom-pane-active");
            $("#" + element + "Pane").addClass("bottom-pane-active");
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row" style="background-color:#EEE;color:#444;height:135px;text-align:center;line-height:135px;overflow:hidden;font-family:'Microsoft Yahei' " id="topbannerDiv">
        <div class="<%=knowledgeClass %>" style="float:left;width:25%" onclick="changeActive('knowledge')" id="knowledge">知识</div>
        <div class="<%=wayClass %>" style="float:left;width:25%" onclick="changeActive('way')" id="way">方法</div>
        <div class="<%=toolClass %>" style="float:left;width:25%" onclick="changeActive('tool')" id="tool">工具</div>
        <div class="<%=personalClass %>" style="float:left;width:25%" onclick="changeActive('person')" id="person">个人中心</div>
    </div>
    
        
    <div id="knowledgePane" class="<%=knowledgePaneClass %>">
        <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-1.jpg" /></div>
            <div class="mylist-intro"></div>
        </div>
        <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-2.jpg" /></div>
            <div class="mylist-intro"></div>
        </div>
         <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-3.jpg" /></div>
            <div class="mylist-intro"></div>
        </div>
         <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-4.jpg" /></div>
            <div class="mylist-intro"></div>
        </div>
    </div>    
    
    <div id="wayPane" class="<%=wayPaneClass %>">
        2
    </div>  

    <div id="toolPane" class="<%=toolPaneClass %>">
        <p style="margin-top:50px;"><span style="color:orangered">Hot!&nbsp;</span><a href="background.aspx?id=3&userid=<%=Request["userid"] %>">生活状态测试(Panic,Strech,Comfort)</a></p>
        <!--<p><a href="background.aspx?id=2&userid=<%=Request["userid"] %>">幸福维度量表</a></p>
        <p>&nbsp;</p>
        <p><a href="background.aspx?id=1&userid=<%=Request["userid"] %>">大5人格量表</a></p>
        <p><a href="background.aspx?id=5&userid=<%=Request["userid"] %>">工作满意度量表</a></p>
        <p><a href="background.aspx?id=4&userid=<%=Request["userid"] %>">情绪测试量表</a></p>
        <p><a href="background.aspx?id=6&userid=<%=Request["userid"] %>">生活满意度量表</a></p>
        <p><a href="background.aspx?id=7&userid=<%=Request["userid"] %>">总体幸福感量表</a></p>-->
    </div>
        
    <div id="personPane" class="<%=personalPaneClass %>">
        3
    </div>

        
    </form>
</body>
</html>
