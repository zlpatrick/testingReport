<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vote.aspx.cs" Inherits="TestingReport.vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    幸福ABC

    </title>
   <script src="Scripts/jquery.1.11.js"></script>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
        .vote-area{
            margin:50px;
            background-color:#cf6649;
            color:white;
            text-align:center;
            border-radius:10px;
        }
    </style>
</head>
<body style="background-color:#3facad">
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Label ID="topicId" runat="server" Visible="false" />
    <asp:Label ID="topicType" runat="server" Visible="false" />
    <asp:Label ID="totalOptions" runat="server" Visible="false" />
    <asp:Label ID="totalChooseItems" runat="server" Visible="false" />
    <asp:Label ID="userId" runat="server" Visible="false"  />
    </form>

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
            $("#custom-panel").html("<div class='vote-area'><div style='padding-top:40px;padding-bottom:40px'>Big Five 大五</div><div style='padding-bottom:40px'>最权威最准确的性格测试</div></div>");
        });

    </script>
</body>
</html>
