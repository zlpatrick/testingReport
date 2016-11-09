<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person.aspx.cs" Inherits="TestingReport.person" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
    <title>幸福ABC - 个人设置</title>

    <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
        #tab1 .dropdown button
        {
            height:120px;
            line-height:120px;
            padding-left:40px;
            color:rgba(34,205,193,1);
            font-size:40px !important;
            background-color: #f2f2f2
        }

        .modal-content{
            background-color:white;
        }

        .modal-content ul
        {
            list-style:none;
            height:100%;
            overflow:hidden;
        }

         .modal-content ul li{
             float:left;
             width:46%;
             margin:20px 2%;
             background-color:rgba(34,205,193,1);

         }

         .modal-content.singleline ul li{
             float:left;
             width:96%;
             margin:15px 2%;
             background-color:rgba(34,205,193,1);

         }

         .modal-content ul li a{
             color:white;
             text-decoration:none;
         }
         
 
         a:hover
    {
        text-decoration:none;
    }
        
    </style>
</head>
<body  style="background-color:white">
    <form id="form1" runat="server">
   <div style="background-color:rgba(34,205,193,1);height:150px;position:relative;">
       
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
   
    </div>
    
    <div style="text-align:center;color:white;padding-top:120px;padding-bottom:30px;background-color:rgba(34,205,193,1)"><%=userNickName %></div>
    
    <hr style="margin:0;border-color:#AAA;"/><!--
 <div>
        <div style="width:500px;color:white;background-color:#1d3d4c;opacity:0.6;text-align:center;margin:40px auto;padding-top:10px;padding-bottom:10px;">个人设置
            <div style="float:left;width:5px;background-color:white;margin-left:15px;">&nbsp;</div>
             <div style="float:right;width:5px;background-color:white;margin-right:15px;">&nbsp;</div>
        </div>
    </div>-->
    
    <hr style="margin:0;border-color:#AAA"/>
    <div id="tab1" style="background-color:#213c4c;margin-top:50px">
        <div ID="errorMsg" style="display:none">
            <p style="color:red;padding:0px 50px">
                请选择您的个人信息!
            </p>
        </div>
        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="genderDropDown" data-toggle="modal" data-target="#regionModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择地区:
            </button>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%;">
            <button class="btn btn-default dropdown-toggle" type="button" id="ageDropDown" data-toggle="modal" data-target="#ageModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择出生年代:  
            </button>       
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="industryDropDown" data-toggle="modal"  data-target="#industryModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择行业:
            </button>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="marriageDropDown" data-toggle="modal"  data-target="#marriageModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择婚姻状况:
            </button>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="incomeDropDown" data-toggle="modal" data-target="#incomeModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择年收入:
            </button>
        </div>

        <div class="dropdown" style="padding:0px 0px 0px 0px;width:100%">
            <button class="btn btn-default dropdown-toggle" type="button" id="degreeDropDown" data-toggle="modal"  data-target="#degreeModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%">
                请选择学历:
            </button>
      
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


    <div style="margin-top:60px;margin-bottom:180px;font-size:45px;background-color:white;border-top:2px solid #AAA;border-bottom:2px solid #AAA">
        <asp:Button ID="start" Text="保 存" runat="server"  onclick="start_Click" cssClass="buttonBack" OnClientClick="return onMysubmit();" style="background-color:rgba(34,205,193,1);color:white"/>
    </div>
    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=openid %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=openid %>" style="color:white">发现生活</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="happiness.aspx?userid=<%=openid %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=openid %>" style="color:white">个人中心</a></div>
       
    </div>
            
       
    </div>



        <div id="regionModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content" style="padding:50px;">
               <div style="color:white">所在地区</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">北京</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">上海</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">天津</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">重庆</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">河北</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">山西</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">辽宁</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">吉林</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">黑龙江</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">江苏</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">浙江</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">安徽</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">福建</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">江西</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">山东</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">河南</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">湖北</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">湖南</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">广东</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">海南</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">四川</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">贵州</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">云南</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">陕西</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">甘肃</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">青海</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">台湾</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">内蒙古</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">广西</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">宁夏</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">新疆</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">西藏</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">香港</a></li>
                <li><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">澳门</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');">海外</a></li>
            </ul>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>



         <div id="ageModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content" style="padding:50px;">
               <div style="color:white">出生年代</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <li><a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');">1950年之前</a></li>
                <li><a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');">50-59年</a></li>
                <li><a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');">60-69年</a></li>
                <li><a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');">70-79年</a></li>
                <li><a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');">80-89年</a></li>
                <li><a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');">90-00年</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setAge(this;$('#ageModelDialog').modal('hide');)">2000年以后</a></li>
            </ul>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>


         <div id="marriageModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content singleline" style="padding:50px;">
               <div style="color:white">婚姻状况</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <li><a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');">已婚</a></li>
                <li><a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');">未婚有固定伴侣</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');">单身</a></li>
            </ul>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>


          <div id="industryModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content singleline" style="padding:50px;">
               <div style="color:white">所在行业</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">互联网-游戏-软件</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">电子-通信-硬件</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">房地产-建筑-物业</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">金融</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">消费品</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">汽车-机械-制造</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">服务-外包-中介</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">广告-传媒-教育-文化</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">交通-贸易-物流</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">医疗-制药</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">能源-化工-环保</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">政府</a></li>
                <li><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">农林牧渔</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');">其他</a></li>
            </ul>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>


        <div id="incomeModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content" style="padding:50px;">
               <div style="color:white">收入状况</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <li><a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');">5万以下</a></li>
                <li><a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');">5到10万</a></li>
                <li><a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');">10到20万</a></li>
                <li><a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');">20到40万</a></li>
                <li><a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');">40到100万</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');">100万以上</a></li>
            </ul>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>

        <div id="degreeModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content" style="padding:50px;">
               <div style="color:white">学历状况</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <li><a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');">中学</a></li>
                <li><a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');">大专</a></li>
                <li><a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');">本科</a></li>
                <li><a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');">硕士研究生</a></li>
                <li style="border-bottom:none"><a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');">博士/博士后</a></li>
            </ul>
            </div>
		</div>
		</td></tr>
		</tbody></table>
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
