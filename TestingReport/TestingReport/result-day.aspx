<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result-day.aspx.cs" Inherits="TestingReport.resultday" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC - <%=topicTitle%></title>
    <link rel="shortcut icon" href="assets/favicon.ico">

     <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
     <script src="Scripts/Chart.js"></script>
     <style>
      a
      {
        color:grey;
        text-decoration:none;
      }

      #mcover {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.7);
        display: none;
        z-index: 20000;
     }
     #mcover img {
        position: fixed;
        right: 18px;
        top: 5px;
        width: 530px!important;
        height: auto !important;
        z-index: 20001;
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
    
    <%
        if ((fromSource != null) && (fromSource.Equals("timeline") || fromSource.Equals("singlemessage") || fromSource.Equals("groupmessage")))
        { 
        %>
    <div style="text-align:center;margin-top:30px;margin-bottom:40px"><img src="assets/trymore.jpg" style="width:100%"/></div>
    <%
    } else {%>

    <div style="margin-bottom:80px;margin-top:40px">
        <a href="#" onclick="document.getElementById('mcover').style.display='block';"><img src="assets/share.jpg" style="width:40%;margin-left:5%;margin-right:2.5%"/></a>
        <a href="#" onclick="document.getElementById('mcover').style.display='block';"><img src="assets/invite.jpg" style="width:40%;margin-left:2.5%;margin-right:5%"/></a>
    </div>

    
    <%
    } %>
    <div style="text-align:center;margin-top:30px;margin-bottom:40px"><img src="assets/try.jpg" style="width:100%"/></div>
    <%=chartJsString %>


    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>

    <script>
        function onBridgeReady() {
            WeixinJSBridge.call('showOptionMenu');
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
+