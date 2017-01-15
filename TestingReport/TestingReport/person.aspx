<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person.aspx.cs" Inherits="TestingReport.person" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
    <title>生活再发现 - 个人设置</title>

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
<body  style="background-color:white">
    <form id="form1" runat="server">
   <div style="background-color:rgba(34,205,193,1);height:150px;position:relative;">
       
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
   
    </div>
    
    
        <div style="text-align:center;color:white;padding-top:120px;padding-bottom:10px;background-color:rgba(34,205,193,1)"><%=userNickName %></div>
    <div style="text-align:center;color:white;padding-top:10px;padding-bottom:30px;background-color:rgba(34,205,193,1)">
        
        <div class="user-tag">
            <span class="user-tag-active" id="infoSpan"><a href="#" onclick="showTab('info')">个人信息</a></span>
            <span id="instructionSpan"><a href="#" onclick="showTab('instruction')" >使用说明</a></span>
            <span id="aboutusSpan"><a href="#" onclick="showTab('aboutus')">关于我们</a></span>
        </div>
        
    </div>


   
    <hr style="margin:0;border-color:#AAA"/>
<div id="infoTab" class="pageTab">
        <%if(!profileComplete){ %>
    <div class="alert alert-warning alert-dismissible" role="alert" style="font-size:40px">
          <button type="button" class="close" data-dismiss="alert" style="height:initial"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          为了获得更准确的分析报告，请完善你的个人信息.
    </div>
        <%} %>

    <div style="padding:80px;">
          <div style="overflow:hidden;margin-bottom:40px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">我的个人信息</div>
        </div>
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
            <button class="btn btn-default dropdown-toggle" type="button" id="workDropDown" data-toggle="modal"  data-target="#workModelDialog" aria-haspopup="true" aria-expanded="true" style="width:100%;border-bottom:none">
                请选择工作职能:
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
    </div>
        <div style="padding-left:80px;padding-right:80px;font-size:36px;">
   <p style="margin-bottom:30px;">1 - 为了获取更准确的测试结果和分析报告，请如实选择您的个人信息。</p>
<p>2 - 您的个人信息仅用于后台数据分析，其他人都不可见，我们将为您严格保密。</p>
        </div>

</div>
<div id="instructionTab" style="display:none" class="pageTab">
    <div style="padding:80px 80px 20px 80px;">
          <div style="overflow:hidden;margin-bottom:10px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">使用说明</div>
        </div>
        </div>

    <div style="font-size:36px;padding-left:80px;padding-right:80px;color:#666">
        <div>- 人的性格和心理千变万化，很难直接测量。在心理学中，一般通过测量人的各种态度和行为表现来间接地评估他们的心理活动和性格特征。</div>
        <br /><div>- 虽然这些测量手段无法达到完全准确的程度，但是编制完善的测试量表仍然具有积极意义，能帮助我们更好的认识自我并发挥指导作用。</div>
        <br /><div>- “生活再发现”团队在参考国内外相关领域研究成果的基础上，结合中国社会的实际情况，编制了一系列关于性格分析、生活状态的测试量表。经过实践的检验，大部分评测的信度和效度都达到75%以上，并且我们仍然在持续地改进我们的量表。</div>
    <br />
        <p style="font-weight:bold">术语介绍</p>
        <p>
- 信度（Reliability）即可靠性，是指根据测量工具所得到的测量结果的一致性或稳定性。<br />
- 效度（Validity）即有效性，它是指测量工具是否能够准确测量出所欲测量特性的程度。
        </p>

        <br />
        <p style="font-weight:bold">参考资料（包括但不限于）</p>
        <p>
《积极心理学》  斯奈德 、洛佩斯 著<br />
《现代心理学》  张春兴 著<br />
《认识自己，接纳自己》  塞利格曼 著<br />
《 常用心理评估量表手册》 戴晓阳 著<br />
《量表编制：理论与应用》 德维利斯 著<br />
        </p>
    <br />
        <p>如有涉及侵犯版权事宜，请与我们联系，我们将在3个工作日内做出答复。</p>
    </div>

</div>

<div id="aboutusTab" style="display:none" class="pageTab">
    <div style="padding:80px 80px 20px 80px;">
          <div style="overflow:hidden;margin-bottom:10px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">使用说明</div>
        </div>
        </div>

    <div style="font-size:36px;padding-left:80px;padding-right:80px;color:#666">
    <div>我们是一个复合型的团队，既有从事社会科学和积极心理学的研究者，也有毕业于上海交大的数据挖掘专家。</div>
        <br />
    <div>结合大数据技术和最新心理学理论，我们聚焦于研究现代人的生活状态和精神健康，并提供相应的知识和方法用于改善我们的生活。</div>
        <br />
    <div>让你更好地认识自我、不断地改进工作和生活，是我们整个团队努力的目标。</div>
        <br />
    <div>我们欢迎所有人的参与，如果有任何建议或合作意向，请发送邮件至：<a href="mailto:discover_my_life@163.com" style="color:rgba(34,205,193,1);font-weight:bold">discover_my_life@163.com</a></div>
    </div>

</div>
    <div>
        <asp:HiddenField runat="server" ID="age" />
        <asp:HiddenField runat="server" ID="gender" />
        <asp:HiddenField runat="server" ID="industry" />
        <asp:HiddenField runat="server" ID="marriage" />
        <asp:HiddenField runat="server" ID="degree" />
        <asp:HiddenField runat="server" ID="income" />
        <asp:HiddenField runat="server" ID="work" />

    <div style="margin-top:60px;margin-bottom:180px;font-size:45px;background-color:white;">
        <asp:Button ID="start" Text="保 存" runat="server"  onclick="start_Click" cssClass="buttonBack" style="background-color:rgba(34,205,193,1);color:white;display:none"/>
    </div>




    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=openid %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=openid %>" style="color:white">发现生活</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="knowledge.aspx?userid=<%=openid %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left">
              <% if(!profileComplete){ %>
            <div style="position:absolute;right:10px;top:10px;width:20px;height:20px;border-radius:10px;background-color:red"></div>
            <%} %>
            <a href="person.aspx?userid=<%=openid %>" style="color:white">个人中心</a></div>
       
    </div>
            
       
    </div>



        <div id="regionModelDialog" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" >
		<table height="100%" width="100%">
        <tbody><tr><td valign="middle">
		<div class="modal-dialog" style="width:90%">
			<div class="modal-content" style="padding:50px;">
               <div style="text-align:center">请选择所在地区</div>
               <ul style="font-size:50px;width:100%;text-align:center;padding:0">
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>北京</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>上海</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>天津</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>重庆</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>河北</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>山西</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>辽宁</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>吉林</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>黑龙江</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>江苏</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>浙江</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>安徽</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>福建</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>江西</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>山东</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>河南</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>湖北</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>湖南</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>广东</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>海南</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>四川</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>贵州</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>云南</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>陕西</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>甘肃</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>青海</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>台湾</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>内蒙古</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>广西</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>宁夏</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>新疆</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>西藏</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>香港</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li>澳门</li></a>
                <a href="#" onclick="setGender(this);$('#regionModelDialog').modal('hide');"><li style="border-bottom:none">海外</li></a>
            </ul>
                 <div class="closeButton">
                    <ul><a href="#" onclick="$('#regionModelDialog').modal('hide');">
                        <li>
                            关闭</li></a>
                        </ul>
                </div>
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


    </form>

    
</body>


    <script>
        function setAge(hyper) {
            $("#ageDropDown").text(" 出生年代：" + hyper.innerText);
            $("#age").val(hyper.innerText);
            $("#start").click();
        }

        function setGender(hyper) {
            $("#genderDropDown").text(" 所在地区：" + hyper.innerText);
            $("#gender").val(hyper.innerText);
            $("#start").click();
        }

        function setIndustry(hyper) {
            $("#industryDropDown").text(" 所在行业：" + hyper.innerText);
            $("#industry").val(hyper.innerText);
            $("#start").click();
        }

        function setMarriage(hyper) {
            $("#marriageDropDown").text(" 个人状况：" + hyper.innerText);
            $("#marriage").val(hyper.innerText);
            $("#start").click();
        }

        function setDegree(hyper) {
            $("#degreeDropDown").text(" 最高学历：" + hyper.innerText);
            $("#degree").val(hyper.innerText);
            $("#start").click();
        }

        function setIncome(hyper) {
            $("#incomeDropDown").text(" 年收入：" + hyper.innerText);
            $("#income").val(hyper.innerText);
            $("#start").click();
        }

        function setWork(hyper) {
            $("#workDropDown").text(" 工作职能：" + hyper.innerText);
            $("#work").val(hyper.innerText);
            $("#start").click();
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

        function showTab(tabname) {
            $(".user-tag span").removeClass("user-tag-active");
            $("#" + tabname + "Span").addClass("user-tag-active");
            $(".pageTab").css("display", "none");
            $("#" + tabname + "Tab").css("display", "block");
        }

        $(document).ready(function () {
            if($("#gender").val() != '')
            {
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
