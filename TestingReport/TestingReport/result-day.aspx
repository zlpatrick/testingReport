<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result-day.aspx.cs" Inherits="TestingReport.resultday" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC - <%=topicTitle%></title>
    <link rel="shortcut icon" href="assets/favicon.ico">
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
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
    <div>
        <a href="person.aspx">
            <div style="overflow:hidden;padding:50px;background-color:white">
                <div style="float:left;width:20%"><img src="<%=userImageUrl %>" style="width:100%;border-radius:10px;"/></div>
                <div style="float:left;padding:50px;color:#555">昵称: <%=userNickName %></div>
                <div style="float:right;padding:50px 20px;color:#555"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></div>
            </div>
        </a>
        <hr style="margin:0;border-bottom:1px solid #AAA"/>
    </div>
    <div style="background-color:#eee;height:100px;">&nbsp;</div>

    <asp:Panel id="titleDiv" runat="server" style="border-top:1px solid #AAA;background-color:white"></asp:Panel>
        <div style="width:80%;margin:auto;background-color:white">
			<canvas id="canvas" height="250" style="background-color:white"></canvas>
		</div>

    <form id="form1" runat="server" style="background-color:white">
    <div>
   
    </div>
    </form>
    
    <%
        if ((fromSource != null) && (fromSource.Equals("timeline") || fromSource.Equals("singlemessage") || fromSource.Equals("groupmessage")))
        { 
        %>
    <div style="text-align:center;margin-top:30px;margin-bottom:40px;background-color:white;border-bottom:1px solid #AAA"><img src="assets/trymore.jpg" style="width:100%"/></div>
    <%
    } else {%>

    <div style="margin-bottom:80px;margin-top:40px;background-color:white;">
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
