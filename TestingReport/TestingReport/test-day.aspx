﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test-day.aspx.cs" Inherits="TestingReport.testday" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC</title>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    
    <script src="Scripts/jquery-1.4.1.min.js" ></script>
    <script>
        function ontest(id) {
            $('#'+id+'\'').addClass("test-option-button-click");
        }
    </script>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>

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
    </script>
</body>
</html>
