<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vote.aspx.cs" Inherits="TestingReport.vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
    <title>
    幸福ABC

    </title>
   <script src="Scripts/jquery.1.11.js"></script>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
        .vote-area{
            margin:50px;
            border:1px solid lightgrey;
            background-color:rgba(252,251,252,1);
            text-align:center;
            border-radius:10px;
        }

        a{
            text-decoration:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
    
   
    <asp:Label ID="topicId" runat="server" Visible="false" />
    <asp:Label ID="topicType" runat="server" Visible="false" />
    <asp:Label ID="totalOptions" runat="server" Visible="false" />
    <asp:Label ID="totalChooseItems" runat="server" Visible="false" />
    <asp:Label ID="userId" runat="server" Visible="false"  />

    </form>
    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="happiness.aspx?userid=<%=Request["userid"] %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=Request["userid"] %>" style="color:white">个人中心</a></div>
       
    </div>
    <!--
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
</script>-->

    <script>
        $(document).ready(function () {
            $("#custom-panel").html("<div class='vote-area'><div style='padding-top:40px;padding-bottom:40px'>最权威最准确的性格测试</div></div>");
        });

    </script>
</body>
</html>
