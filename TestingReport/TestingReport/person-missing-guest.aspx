<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person-missing-guest.aspx.cs" Inherits="TestingReport.person_missing_guest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生活再发现</title>

     <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />

    <style>
         .dropdown button
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

         .modal-content .closeButton ul li{
            text-align:center;
             width:40%;
             margin:40px 30% 40px 30%;
             background-color:rgba(34,205,193,1);
         }

         .modal-content ul a{
             color:white;
             text-decoration:none;
         }
         
 
         a:hover
    {
        text-decoration:none;
    }

         .user-tag span a{
             color:white;
         }

         .user-tag .user-tag-active a{
             color:rgba(34,205,193,1) !important;
         }
        
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return onSubmit()">
    <div style="padding-left:80px;padding-right:80px;">
        <div style="font-size:40px;color:rgba(34,205,193,1);text-align:center;margin-top:30px;">请选择您的个人信息</div>
        <hr style="border-color:rgba(34,205,193,1)" />
         <div style="font-size:36px;">
   <p style="margin-bottom:30px;">1 - 为了获取更准确的测试结果和分析报告，请如实选择您的个人信息。</p>
<p style="margin-bottom:30px;">2 - 您的个人信息仅用于后台数据分析，其他人都不可见，我们将为您严格保密。</p>
        </div>

        <div ID="errorMsg" style="display:none">
            <p style="color:red;font-size:40px;">
                请选择完整您的个人信息!
            </p>
        </div>
        <%
            if ("1".Equals(Request["miss"])) { 
             %>
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
            <button class="btn btn-default dropdown-toggle" type="button" id="workDropDown" data-toggle="modal"  data-target="#workModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择工作职能:
            </button>
        </div>
        <%}
            else if ("2".Equals(Request["miss"]))
            { %>
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

        <%} %>

         <asp:Button ID="start" Text="查看测试结果" runat="server"  onclick="start_Click" cssClass="buttonBack" style="margin-bottom:100px;margin-top:50px;background-color:rgba(34,205,193,1);color:white;"/>

    </div>
       
        <asp:HiddenField runat="server" ID="age" />
        <asp:HiddenField runat="server" ID="gender" />
        <asp:HiddenField runat="server" ID="industry" />
        <asp:HiddenField runat="server" ID="marriage" />
        <asp:HiddenField runat="server" ID="degree" />
        <asp:HiddenField runat="server" ID="income" />
        <asp:HiddenField runat="server" ID="work" />
        <asp:HiddenField runat="server" ID="miss" />
    </form>

      <div id="ageModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content" style="padding:50px;">
               <div style="text-align:center">请选择出生年代</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');"><li>1950年之前</li></a>
                <a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');"><li>50-59年</li></a>
                <a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');"><li>60-69年</li></a>
                <a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');"><li>70-79年</li></a>
                <a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');"><li>80-89年</li></a>
                <a href="#" onclick="setAge(this);$('#ageModelDialog').modal('hide');"><li>90-00年</li></a>
                <a href="#" onclick="setAge(this;$('#ageModelDialog').modal('hide');)"><li style="border-bottom:none">2000年以后</li></a>
            </ul>
                 <div class="closeButton">
                    <ul><a href="#" onclick="$('#ageModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
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
               <div style="text-align:center">请选择婚姻状况</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
                    <a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');"><li>已婚</li></a>
                   <a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');"><li>离异</li></a>
                <a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');"><li>未婚有固定伴侣</li></a>
                <a href="#" onclick="setMarriage(this);$('#marriageModelDialog').modal('hide');"><li style="border-bottom:none">单身</li></a>
            </ul>
                 <div class="closeButton">
                    <ul><a href="#" onclick="$('#marriageModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
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
               <div style="text-align:center">请选择所在行业</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
                   <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>学生</li></a>
               <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>IT.通讯.电子.互联网</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>房地产.建筑.物业</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>金融.贸易</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>消费品</li></a>
               <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"> <li>汽车.机械.制造业</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>医疗.制药</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>能源.化工.环保</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>服务.外包.中介</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>广告.传媒.娱乐</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>教育.文化.体育</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>交通.物流.运输</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>政府.事业单位</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>农林牧渔</li></a>
                <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li style="border-bottom:none">其他</li></a>
            </ul>
                 <div class="closeButton">
                    <ul><a href="#" onclick="$('#industryModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>

         <div id="workModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content singleline" style="padding:50px;">
               <div style="text-align:center">请选择所属工作职能</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
                   <a href="#" onclick="setIndustry(this);$('#industryModelDialog').modal('hide');"><li>学生</li></a>
               <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>市场.销售类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>服务.支持类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>财务.行政.人力资源类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>项目.产品类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>技术.研发类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>生产.制造类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>设计.艺术类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>法律.咨询.教育类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li>中高层管理类</li></a>
                <a href="#" onclick="setWork(this);$('#workModelDialog').modal('hide');"><li style="border-bottom:none">其他专业人士类</li></a>
            </ul>
                 <div class="closeButton">
                    <ul><a href="#" onclick="$('#workModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
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
               <div style="text-align:center">请选择收入状况</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
               <a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');"><li>5万以下</li></a>
                <a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');"><li>5到10万</li></a>
                <a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');"><li>10到20万</li></a>
                <a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');"><li>20到40万</li></a>
                <a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');"><li>40到100万</li></a>
                <a href="#" onclick="setIncome(this);$('#incomeModelDialog').modal('hide');"><li style="border-bottom:none">100万以上</li></a>
                 </ul>
                <div class="closeButton">
                    <ul><a href="#" onclick="$('#incomeModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
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
               <div style="text-align:center">请选择学历状况</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
                <a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');"><li>中学</li></a>
                <a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');"><li>大专</li></a>
                <a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');"><li>本科</li></a>
                <a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');"><li>硕士研究生</li></a>
                <a href="#" onclick="setDegree(this);$('#degreeModelDialog').modal('hide');"><li style="border-bottom:none">博士/博士后</li></a>
            </ul>
                 <div class="closeButton">
                    <ul><a href="#" onclick="$('#degreeModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
            </div>
		</div>
		</td></tr>
		</tbody></table>
	</div>

    <script>
        $(document).ready(function () {
            if ($("#gender").val() != '') {
                $("#genderDropDown").text(" 所在地区：" + $("#gender").val());
            }
            if ($("#age").val() != '') {
                $("#ageDropDown").text(" 出生年代：" + $("#age").val());
            }
            if ($("#industry").val() != '') {
                $("#industryDropDown").text(" 所在行业：" + $("#industry").val());
            }
            if ($("#income").val() != '') {
                $("#incomeDropDown").text(" 年收入：" + $("#income").val());
            }
            if ($("#degree").val() != '') {
                $("#degreeDropDown").text(" 最高学历：" + $("#degree").val());
            }
            if ($("#marriage").val() != '') {
                $("#marriageDropDown").text(" 个人状况：" + $("#marriage").val());
            }
            if ($("#work").val() != '') {
                $("#workDropDown").text(" 工作职能：" + $("#work").val());
            }
        }
        );

        function onSubmit() {
            if ($("#miss").val() == "1") {

                if ($("#ageDropDown").text().indexOf("请选择") >= 0) {
                    $("#errorMsg").css("display", "block");
                    return false;
                }
                if ($("#workDropDown").text().indexOf("请选择") >= 0) {
                    $("#errorMsg").css("display", "block");
                    return false;
                }
                if ($("#industryDropDown").text().indexOf("请选择") >= 0) {
                    $("#errorMsg").css("display", "block");
                    return false;
                }
            }
            else if ($("#miss").val() == "2") {
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
        }

        function setAge(hyper) {
            $("#ageDropDown").text(" 出生年代：" + hyper.innerText);
            $("#age").val(hyper.innerText);

        }

        function setGender(hyper) {
            $("#genderDropDown").text(" 所在地区：" + hyper.innerText);
            $("#gender").val(hyper.innerText);

        }

        function setIndustry(hyper) {
            $("#industryDropDown").text(" 所在行业：" + hyper.innerText);
            $("#industry").val(hyper.innerText);

        }

        function setMarriage(hyper) {
            $("#marriageDropDown").text(" 个人状况：" + hyper.innerText);
            $("#marriage").val(hyper.innerText);

        }

        function setDegree(hyper) {
            $("#degreeDropDown").text(" 最高学历：" + hyper.innerText);
            $("#degree").val(hyper.innerText);

        }

        function setIncome(hyper) {
            $("#incomeDropDown").text(" 年收入：" + hyper.innerText);
            $("#income").val(hyper.innerText);

        }

        function setWork(hyper) {
            $("#workDropDown").text(" 工作职能：" + hyper.innerText);
            $("#work").val(hyper.innerText);
            $("#start").click();
        }
    </script>
</body>
</html>


