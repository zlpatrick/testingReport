<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="TestingReport.result" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
     <script src="Scripts/Chart.js"></script>
     <style>
      a
      {
        color:grey;
        text-decoration:none;
      }
     </style>
</head>
<body>
    <asp:Panel id="titleDiv" runat="server"></asp:Panel>
        <div style="width:80%;margin:auto">
			<canvas id="canvas" height="250"></canvas>
		</div>

    <form id="form1" runat="server">
    <div>
   
    </div>
    </form>
    <input 
    <%=chartJsString %>


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
