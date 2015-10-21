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
    <div style="overflow:hidden">
    <div class="row" style="background-color:#EEE;color:#444;height:135px;text-align:center;line-height:135px;font-family:'Microsoft Yahei' " id="topbannerDiv">
        <div class="<%=knowledgeClass %>" style="float:left;width:25%" onclick="changeActive('knowledge')" id="knowledge">知识</div>
        <div class="<%=wayClass %>" style="float:left;width:25%" onclick="changeActive('way')" id="way">方法</div>
        <div class="<%=toolClass %>" style="float:left;width:25%" onclick="changeActive('tool')" id="tool">工具</div>
        <div class="<%=personalClass %>" style="float:left;width:25%" onclick="changeActive('person')" id="person">个人中心</div>
    </div>
    </div>
    
    <div id="knowledgePane" class="<%=knowledgePaneClass %>">
        <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-1.jpg" /></div>
            <div class="mylist-intro">
                <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzA4MDMwOTY1OQ==&mid=210521445&idx=1&sn=e8b8312cbd73a97df22ca44f32abcfcf#rd">幸福ABC介绍</a></p>
                <p class="mylist-subtitle">关于“幸福ABC”微信公众号的内容介绍。</p>
            </div>
        </div>
        <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-2.jpg" /></div>
            <div class="mylist-intro">
                <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzA4MDMwOTY1OQ==&mid=210538870&idx=1&sn=89537e9cd8c42bf8dce8b1d809d3cb6d#rd">关于幸福的科学</a></p>
                <p class="mylist-subtitle">为什么学习积极心理学可以让我们变得更加乐观，更加幸福。</p>
            </div>
        </div>
         <div class="mylist">
            <div class="mylist-img"><img src="assets/knowledge-3.jpg" /></div>
            <div class="mylist-intro">
                <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzA4MDMwOTY1OQ==&mid=210656210&idx=1&sn=4e9b5f38975b923625771f4da2c62f74#rd">为什么我们离幸福越来越远</a></p>
                <p class="mylist-subtitle">我们的物质生活越来越丰富，为什么反而感觉离幸福越来越远？ </p>
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
    
    <div id="wayPane" class="<%=wayPaneClass %>">
        <div class="mylist">
            <div class="mylist-img"><img src="assets/way-1.jpg" /></div>
            <div class="mylist-intro">
                <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzA4MDMwOTY1OQ==&mid=210725268&idx=1&sn=f888046adfb765806c819289c8d8fe17#rd">如何养成感恩的习惯？</a></p>
                <p class="mylist-subtitle">为什么我们总是抱怨，忘记感恩 ；如何养成感恩的好习惯。</p>
            </div>
        </div>
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
