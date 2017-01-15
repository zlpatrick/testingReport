<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test-big-five.aspx.cs" Inherits="TestingReport.test_big_five" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
    <title>生活再发现</title>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    
    <script src="Scripts/jquery-1.4.1.min.js" ></script>
    <script>
        function ontest(id) {
            $('#' + id + '\'').addClass("test-option-button-click");
        }
    </script>
    <style>

        .bottom-choose-item-panel{
            clear:both;
            font-size:36px;
            padding-left:50px;
            padding-right:60px;
            color:grey;
        }
    </style>
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

