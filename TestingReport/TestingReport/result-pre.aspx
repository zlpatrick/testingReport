<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result-pre.aspx.cs" Inherits="TestingReport.result_pre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC</title>
 
</head>
<body>
    <form id="form1" runat="server">

     <div>
        <p style="text-align:center;color:White">
            <img src="assets/<%=infoTitleImage %>" style="width:100%;margin-top:30px;"/>
        </p>
    </div>

    <div>
        <p style="text-align:center;color:White">
            <img src="assets/result-pre-tip.png" style="width:100%"/>
        </p>
    </div>

    <div>
        <p style="text-align:center;color:White">
            <a href="more-info.aspx?id=<%=Request["id"] %>&userid=<%=Request["userid"] %>&type=<%=Request["type"] %>"><img src="assets/result-pre-ido.jpg" runat="server" style="width:50%"/></
        </p>
    </div>

    <div>
        <p style="text-align:center;color:White">
            <a href="result.aspx?id=<%=Request["id"] %>&userid=<%=Request["userid"] %>&type=<%=Request["type"] %>"><img src="assets/result-pre-direct.jpg" style="width:70%"/></a>
        </p>
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
