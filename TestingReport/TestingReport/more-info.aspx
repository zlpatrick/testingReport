<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="more-info.aspx.cs" Inherits="TestingReport.more_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC</title>
    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
 
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p style="text-align:center;color:White">
            <img src="assets/<%=infoTitleImage %>" style="width:100%;margin-top:40px;"/>
        </p>
    </div>
    <p style="text-align:center">
        <img src="assets/moreinfo.jpg" style="width:100%;margin:30px 0px;"/>
    </p>
    <div ID="errorMsg" style="display:none">
        <p style="color:red;padding:0px 50px">
            请选择完整信息!
        </p>
    </div>

    <div class="dropdown" style="padding:20px 50px 0px 50px;width:100%">
        <button class="btn btn-info dropdown-toggle" type="button" id="marriageDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
            请选择婚姻状况:
          
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="left:50px;font-size:50px;width:80%">
            <li><a href="#" onclick="setMarriage(this)">已婚</a></li>
            <li><a href="#" onclick="setMarriage(this)">未婚有固定伴侣</a></li>
            <li style="border-bottom:none"><a href="#" onclick="setMarriage(this)">单身</a></li>
        </ul>
    </div>

    <div class="dropdown" style="padding:60px 50px 0px 50px;width:100%">
        <button class="btn btn-info dropdown-toggle" type="button" id="incomeDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
            请选择年收入:
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="left:50px;font-size:50px;width:80%">
            <li><a href="#" onclick="setIncome(this)">5万以下</a></li>
            <li><a href="#" onclick="setIncome(this)">5到10万</a></li>
            <li><a href="#" onclick="setIncome(this)">10到20万</a></li>
            <li><a href="#" onclick="setIncome(this)">20到40万</a></li>
            <li><a href="#" onclick="setIncome(this)">40到100万</a></li>
            <li style="border-bottom:none"><a href="#" onclick="setIncome(this)">100万以上</a></li>
        </ul>
    </div>

    <div class="dropdown" style="padding:60px 50px 0px 50px;width:100%">
        <button class="btn btn-info dropdown-toggle" type="button" id="degreeDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
            请选择学历:
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="left:50px;font-size:50px;width:80%">
            <li><a href="#" onclick="setDegree(this)">中学</a></li>
            <li><a href="#" onclick="setDegree(this)">大专</a></li>
            <li><a href="#" onclick="setDegree(this)">本科</a></li>
            <li><a href="#" onclick="setDegree(this)">硕士研究生</a></li>
            <li style="border-bottom:none"><a href="#" onclick="setDegree(this)">博士/博士后</a></li>
        </ul>
    </div>


        <asp:HiddenField runat="server" ID="marriage" />
        <asp:HiddenField runat="server" ID="degree" />
        <asp:HiddenField runat="server" ID="income" />
    <p style="text-align:center;margin-top:50px">
        <asp:Button ID="start" runat="server"  onclick="start_Click" CssClass="moreinfo-button" OnClientClick="return onMysubmit();"/>
    </p>

    </form>
</body>
    
    <script>
        function setMarriage(hyper) {
            $("#marriageDropDown").text(" " + hyper.innerText);
            $("#marriage").val(hyper.innerText);
        }

        function setDegree(hyper) {
            $("#degreeDropDown").text(" " + hyper.innerText);
            $("#degree").val(hyper.innerText);
        }

        function setIncome(hyper) {
            $("#incomeDropDown").text(" " + hyper.innerText);
            $("#income").val(hyper.innerText);
        }

        function onMysubmit() {
            if ($("#incomeDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
            if ($("#degreeDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
            if ($("#marriageDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
        }
    </script>

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
</html>