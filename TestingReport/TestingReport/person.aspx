<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person.aspx.cs" Inherits="TestingReport.person" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幸福ABC - 个人设置</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
        #tab1 .dropdown button
        {
            height:135px;
            line-height:135px;
            padding-left:40px;
            color:#666;
            font-size:40px !important;
        }

    </style>
</head>
<body style="background-color:#eee">
    <form id="form1" runat="server">
    <div style="overflow:hidden;padding:50px; background-color:white">
        <div style="float:left;width:20%"><img src="<%=userImageUrl %>" style="width:100%;border-radius:10px;"/></div>
        <div style="float:left;padding:50px;color:#555">昵称: <%=userNickName %></div>
    </div>

    <hr style="margin:0;border-bottom:1px solid #AAA"/>

    <!--<div style="overflow:hidden;">
        <div style="width:50%;float:left;padding-top:30px;padding-bottom:30px;">
            <img src="img/corner.png" style="width:100px;margin-left:50px;"/> <a href="person-self.aspx" style="color:#555">认识自我</a>
        </div>
        <div style="width:50%;float:left;padding-top:30px;padding-bottom:30px;background-color:lightgray;color:white">
            <img src="img/corner.png" style="width:100px;margin-left:50px;"/> 个人设置
        </div>
    </div>-->
    <div style="padding-top:30px;padding-bottom:30px;padding-left:50px;font-size:45px;">
        个人设置
    </div>
    
    <hr style="margin:0;border-color:#AAA"/>
    <div id="tab1" style="background-color:white;">
        <div ID="errorMsg" style="display:none">
            <p style="color:red;padding:0px 50px">
                请选择您的个人信息!
            </p>
        </div>
        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="genderDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择地区:
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="font-size:50px;width:100%">
                <li><a href="#" onclick="setGender(this)">北京</a></li>
                <li><a href="#" onclick="setGender(this)">上海</a></li>
                <li><a href="#" onclick="setGender(this)">天津</a></li>
                <li><a href="#" onclick="setGender(this)">重庆</a></li>
                <li><a href="#" onclick="setGender(this)">河北</a></li>
                <li><a href="#" onclick="setGender(this)">山西</a></li>
                <li><a href="#" onclick="setGender(this)">辽宁</a></li>
                <li><a href="#" onclick="setGender(this)">吉林</a></li>
                <li><a href="#" onclick="setGender(this)">黑龙江</a></li>
                <li><a href="#" onclick="setGender(this)">江苏</a></li>
                <li><a href="#" onclick="setGender(this)">浙江</a></li>
                <li><a href="#" onclick="setGender(this)">安徽</a></li>
                <li><a href="#" onclick="setGender(this)">福建</a></li>
                <li><a href="#" onclick="setGender(this)">江西</a></li>
                <li><a href="#" onclick="setGender(this)">山东</a></li>
                <li><a href="#" onclick="setGender(this)">河南</a></li>
                <li><a href="#" onclick="setGender(this)">湖北</a></li>
                <li><a href="#" onclick="setGender(this)">湖南</a></li>
                <li><a href="#" onclick="setGender(this)">广东</a></li>
                <li><a href="#" onclick="setGender(this)">海南</a></li>
                <li><a href="#" onclick="setGender(this)">四川</a></li>
                <li><a href="#" onclick="setGender(this)">贵州</a></li>
                <li><a href="#" onclick="setGender(this)">云南</a></li>
                <li><a href="#" onclick="setGender(this)">陕西</a></li>
                <li><a href="#" onclick="setGender(this)">甘肃</a></li>
                <li><a href="#" onclick="setGender(this)">青海</a></li>
                <li><a href="#" onclick="setGender(this)">台湾</a></li>
                <li><a href="#" onclick="setGender(this)">内蒙古</a></li>
                <li><a href="#" onclick="setGender(this)">广西</a></li>
                <li><a href="#" onclick="setGender(this)">宁夏</a></li>
                <li><a href="#" onclick="setGender(this)">新疆</a></li>
                <li><a href="#" onclick="setGender(this)">西藏</a></li>
                <li><a href="#" onclick="setGender(this)">香港</a></li>
                <li><a href="#" onclick="setGender(this)">澳门</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setGender(this)">海外</a></li>
            </ul>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%;">
            <button class="btn btn-default dropdown-toggle" type="button" id="ageDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择出生年代:
          
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="font-size:50px;width:100%">
                <li><a href="#" onclick="setAge(this)">1950年之前</a></li>
                <li><a href="#" onclick="setAge(this)">50-59年</a></li>
                <li><a href="#" onclick="setAge(this)">60-69年</a></li>
                <li><a href="#" onclick="setAge(this)">70-79年</a></li>
                <li><a href="#" onclick="setAge(this)">80-89年</a></li>
                <li><a href="#" onclick="setAge(this)">90-00年</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setAge(this)">2000年以后</a></li>
            </ul>
        </div>


        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="industryDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择行业:
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="font-size:50px;width:100%">
                <li><a href="#" onclick="setIndustry(this)">互联网-游戏-软件</a></li>
                <li><a href="#" onclick="setIndustry(this)">电子-通信-硬件</a></li>
                <li><a href="#" onclick="setIndustry(this)">房地产-建筑-物业</a></li>
                <li><a href="#" onclick="setIndustry(this)">金融</a></li>
                <li><a href="#" onclick="setIndustry(this)">消费品</a></li>
                <li><a href="#" onclick="setIndustry(this)">汽车-机械-制造</a></li>
                <li><a href="#" onclick="setIndustry(this)">服务-外包-中介</a></li>
                <li><a href="#" onclick="setIndustry(this)">广告-传媒-教育-文化</a></li>
                <li><a href="#" onclick="setIndustry(this)">交通-贸易-物流</a></li>
                <li><a href="#" onclick="setIndustry(this)">医疗-制药</a></li>
                <li><a href="#" onclick="setIndustry(this)">能源-化工-环保</a></li>
                <li><a href="#" onclick="setIndustry(this)">政府</a></li>
                <li><a href="#" onclick="setIndustry(this)">农林牧渔</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setIndustry(this)">其他</a></li>
            </ul>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="marriageDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择婚姻状况:
          
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="font-size:50px;width:100%">
                <li><a href="#" onclick="setMarriage(this)">已婚</a></li>
                <li><a href="#" onclick="setMarriage(this)">未婚有固定伴侣</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setMarriage(this)">单身</a></li>
            </ul>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="incomeDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择年收入:
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="font-size:50px;width:100%">
                <li><a href="#" onclick="setIncome(this)">5万以下</a></li>
                <li><a href="#" onclick="setIncome(this)">5到10万</a></li>
                <li><a href="#" onclick="setIncome(this)">10到20万</a></li>
                <li><a href="#" onclick="setIncome(this)">20到40万</a></li>
                <li><a href="#" onclick="setIncome(this)">40到100万</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setIncome(this)">100万以上</a></li>
            </ul>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="degreeDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
                请选择学历:
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="font-size:50px;width:100%">
                <li><a href="#" onclick="setDegree(this)">中学</a></li>
                <li><a href="#" onclick="setDegree(this)">大专</a></li>
                <li><a href="#" onclick="setDegree(this)">本科</a></li>
                <li><a href="#" onclick="setDegree(this)">硕士研究生</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setDegree(this)">博士/博士后</a></li>
            </ul>
        </div>
    
       
    </div>
    
    <hr style="margin:0;border-color:#AAA"/>
    <div>
        <asp:HiddenField runat="server" ID="age" />
        <asp:HiddenField runat="server" ID="gender" />
        <asp:HiddenField runat="server" ID="industry" />
        <asp:HiddenField runat="server" ID="marriage" />
        <asp:HiddenField runat="server" ID="degree" />
        <asp:HiddenField runat="server" ID="income" />


    <div style="margin-top:60px;margin-bottom:30px;font-size:45px;background-color:white;border-top:2px solid #AAA;border-bottom:2px solid #AAA">
        <asp:Button ID="start" Text="保 存" runat="server"  onclick="start_Click" cssClass="buttonBack" OnClientClick="return onMysubmit();"/>
    </div>
        
            
       
    </div>
    </form>
</body>


    <script>
        function setAge(hyper) {
            $("#ageDropDown").text(" " + hyper.innerText);
            $("#age").val(hyper.innerText);
        }

        function setGender(hyper) {
            $("#genderDropDown").text(" " + hyper.innerText);
            $("#gender").val(hyper.innerText);
        }

        function setIndustry(hyper) {
            $("#industryDropDown").text(" " + hyper.innerText);
            $("#industry").val(hyper.innerText);
        }

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
            if ($("#ageDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
            if ($("#genderDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
            if ($("#industryDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
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

        $(document).ready(function () {
            if($("#gender").val() != '')
            {
                $("#genderDropDown").text(" " + $("#gender").val());
            }
            if ($("#age").val() != '') {
                $("#ageDropDown").text(" " + $("#age").val());
            }
            if ($("#industry").val() != '') {
                $("#industryDropDown").text(" " + $("#industry").val());
            }
            if ($("#income").val() != '') {
                $("#incomeDropDown").text(" " + $("#income").val());
            }
            if ($("#degree").val() != '') {
                $("#degreeDropDown").text(" " + $("#degree").val());
            }
            if ($("#marriage").val() != '') {
                $("#marriageDropDown").text(" " + $("#marriage").val());
            }
        }
        );
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
