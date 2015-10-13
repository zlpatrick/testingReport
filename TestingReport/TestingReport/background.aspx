<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="background.aspx.cs" Inherits="TestingReport.background" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p style="text-align:center;color:White">
            <img src="assets/<%=infoTitleImage %>" style="width:80%"/>
        </p>
    </div>
    <p style="text-align:center">
        <img src="assets/info-tip.jpg" style="width:100%;"/>
    </p>
    <div ID="errorMsg" style="display:none">
        <p style="color:red;padding:0px 50px">
            请选择您的个人信息!
        </p>
    </div>

    <div class="dropdown" style="padding:20px 50px 0px 50px;width:100%">
        <button class="btn btn-info dropdown-toggle" type="button" id="ageDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
            请选择年龄:
          
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="left:50px;font-size:50px;width:80%">
            <li><a href="#" onclick="setAge(this)">20岁以下</a></li>
            <li><a href="#" onclick="setAge(this)">26-30岁</a></li>
            <li><a href="#" onclick="setAge(this)">31-35岁</a></li>
            <li><a href="#" onclick="setAge(this)">36-40岁</a></li>
            <li><a href="# onclick="setAge(this)">41-50岁</a></li>
            <li style="border-bottom:none"><a href="#" onclick="setAge(this)">50岁以上</a></li>
        </ul>
    </div>

    <div class="dropdown" style="padding:60px 50px 0px 50px;width:100%">
        <button class="btn btn-info dropdown-toggle" type="button" id="genderDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
            请选择性别:
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="left:50px;font-size:50px;width:80%">
            <li><a href="#" onclick="setGender(this)">男</a></li>
            <li style="border-bottom:none"><a href="#" onclick="setGender(this)">女</a></li>
        </ul>
    </div>

    <div class="dropdown" style="padding:60px 50px 0px 50px;width:100%">
        <button class="btn btn-info dropdown-toggle" type="button" id="industryDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:100%">
            请选择行业:
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="left:50px;font-size:50px;width:80%">
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
            <li style="border-bottom:none"><a href="#" onclick="setIndustry(this)">农林牧渔</a></li>
        </ul>
    </div>


        <asp:HiddenField runat="server" ID="age" />
        <asp:HiddenField runat="server" ID="gender" />
        <asp:HiddenField runat="server" ID="industry" />
    <p style="text-align:center;margin-top:50px">
        <asp:Button ID="start" runat="server"  onclick="start_Click" CssClass="test-button" OnClientClick="return onMysubmit();"/>
    </p>

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

        function onMysubmit()
        {
            if($("#ageDropDown").text().indexOf("请选择")>=0)
            {
                $("#errorMsg").css("display", "block");
                return false;
            }
            if ($("#genderDropDown").text().indexOf("请选择") >= 0)
            {
                $("#errorMsg").css("display", "block");
                return false;
            }
            if ($("#industryDropDown").text().indexOf("请选择") >= 0) {
                $("#errorMsg").css("display", "block");
                return false;
            }
        }
    </script>
</html>

