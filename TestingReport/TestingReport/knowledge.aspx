<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="knowledge.aspx.cs" Inherits="TestingReport.happiness" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>生活再发现 - 幸福宝典</title>
      <script src="Scripts/jquery.1.11.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <style>
 
         a:hover
    {
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
       .mylist
    {
        overflow:hidden;
        border-bottom:2px dashed lightgrey;
    }
    .mylist-img
    {
        float:left;
        width:27%;
        padding:20px 20px 20px 0px;
    }
    .mylist-intro
    {
        float:left;
        width:73%;
        padding:0px 0px 0px 20px;
    }
    .mylist-img img
    {
        width:100%;
        height:100%;
    }
    .mylist-title
    {
        text-align:left;
        font-size:36px;
        padding-top:30px;

    }

    .mylist-title a
    {
        color:#333;
        font-weight:bold;
    }

    .mylist-subtitle
    {
        color:grey;
        text-align:left;
        font-size:40px;
    }
    .glyphicon-star
    {
        color:rgba(34,205,193,1);
    }
     .user-tag span a{
             color:white;
         }

         .user-tag .user-tag-active a{
             color:rgba(34,205,193,1) !important;
         }
    </style>
    
        
</head>
<body style="background-color:white">
    <form id="form1" runat="server">

         
   
    
    
    <div style="text-align:center;color:white;padding-top:30px;padding-bottom:30px;background-color:rgba(34,205,193,1)">
        <div>知识点滴</div>
        <div class="user-tag">
            <span class="user-tag-active" id="allSpan"><a href="#" onclick="showTab('all')">所有文章</a></span>
            <span id="characterSpan"><a href="#" onclick="showTab('character')">性格解析</a></span>
            <span id="happySpan"><a href="#" onclick="showTab('happy')">快乐幸福</a></span>
            <span id="careerSpan"><a href="#" onclick="showTab('career')">事业成就</a></span>
        </div>
        
    </div>

 

    <div style="padding:30px 50px;margin-bottom:100px;">
            <div style="overflow:hidden">
                 <div style="padding-left:30px;font-size:40px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">好文推荐</div>
                
            </div>
            
            <div style="margin-top:30px;margin-bottom:100px;">

                <div class="mylist characterList allList">
                    <div class="mylist-img">
                        <a href="http://mp.weixin.qq.com/s/pToGDXy8-vO9fqPKrNXHVw"><img src="assets/articles/1.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s/pToGDXy8-vO9fqPKrNXHVw">TED:内向性格的力量</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 859人
                        </p>
                    </div>
                </div>
            
                <div class="mylist characterList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=5&sn=40217362dd1a8abd81caf66d2ea41d02&chksm=e97848b2de0fc1a4b6e633f8a65f45ed945c8e5fe0952d15276de181625adfb1994fee2ea03b&scene=4#wechat_redirect"><img src="assets/articles/2.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=5&sn=40217362dd1a8abd81caf66d2ea41d02&chksm=e97848b2de0fc1a4b6e633f8a65f45ed945c8e5fe0952d15276de181625adfb1994fee2ea03b&scene=4#wechat_redirect">TED:性格的迷思，你究竟是谁?</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 726人
                        </p>
                    </div>
                </div>

                <div class="mylist characterList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=1&sn=08321a17f5bc3ac3287a292e52cf8254&chksm=e97848bcde0fc1aa75a5941daf19f7fa038d6c0ea5ab7840b693f15533d762bdeb416485a108&scene=4#wechat_redirect"><img src="assets/articles/3.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=1&sn=08321a17f5bc3ac3287a292e52cf8254&chksm=e97848bcde0fc1aa75a5941daf19f7fa038d6c0ea5ab7840b693f15533d762bdeb416485a108&scene=4#wechat_redirect">可怕的完美主义</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 687人
                        </p>
                    </div>
                </div>

                <div class="mylist characterList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=3&sn=97e062a7ca81725d21677a5c2384672c&chksm=e97848b2de0fc1a4d1cf919eb0075cd748e66ad1aa3590dc27fa5132b20f5394294b1dbc8ff4&scene=4#wechat_redirect"><img src="assets/articles/4.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=3&sn=97e062a7ca81725d21677a5c2384672c&chksm=e97848b2de0fc1a4d1cf919eb0075cd748e66ad1aa3590dc27fa5132b20f5394294b1dbc8ff4&scene=4#wechat_redirect">做真实快乐的自己</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 730人
                        </p>
                    </div>
                </div>

                <div class="mylist characterList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=2&sn=3997727d2f86e8b60ca58712810d4888&chksm=e97848b2de0fc1a4aa7ba98af5ed1d049645bac2b5bc4eab524ac155f9b599c05ab2ec6af217&scene=4#wechat_redirect"><img src="assets/articles/5.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=2&sn=3997727d2f86e8b60ca58712810d4888&chksm=e97848b2de0fc1a4aa7ba98af5ed1d049645bac2b5bc4eab524ac155f9b599c05ab2ec6af217&scene=4#wechat_redirect">如何科学鉴别一个人的性格特征?</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 689人
                        </p>
                    </div>
                </div>

                <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=7&sn=088b94eb20a08ff59b97e2bf064aac9e&chksm=e97848bcde0fc1aa707623308e93004c0721ad764a7500ca2a26b38c113a3393b9d212fb1385&scene=4#wechat_redirect"><img src="assets/articles/6.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=7&sn=088b94eb20a08ff59b97e2bf064aac9e&chksm=e97848bcde0fc1aa707623308e93004c0721ad764a7500ca2a26b38c113a3393b9d212fb1385&scene=4#wechat_redirect">TED:幸福是什么?</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 763人
                        </p>
                    </div>
                </div>

                <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=8&sn=582f4b34c01af6b4c3cc81823104359b&chksm=e97848bcde0fc1aa40d8c26882e44bb91d1c738c1c82b896cf8d7039f3b761bfd9171efda7f4&scene=4#wechat_redirect"><img src="assets/articles/7.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=8&sn=582f4b34c01af6b4c3cc81823104359b&chksm=e97848bcde0fc1aa40d8c26882e44bb91d1c738c1c82b896cf8d7039f3b761bfd9171efda7f4&scene=4#wechat_redirect">TED:快乐的源泉</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 745人
                        </p>
                    </div>
                </div>

                <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=6&sn=aa85e0e5674c2d31122cfcb56f357231&chksm=e97848b2de0fc1a457b77ac375b85e4b488acd2343c2207dc375ac64c1a3ef555e5d1d91bee6&scene=4#wechat_redirect"><img src="assets/articles/8.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=6&sn=aa85e0e5674c2d31122cfcb56f357231&chksm=e97848b2de0fc1a457b77ac375b85e4b488acd2343c2207dc375ac64c1a3ef555e5d1d91bee6&scene=4#wechat_redirect">TED:我们为什么快乐?</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 823人
                        </p>
                    </div>
                </div>

                <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=3&sn=17d6884169db20259f002c5353b1d9cb&chksm=e978488cde0fc19a50a002a52b44ec416197545922c0e089ff371f6cd455bfcc723207e4c7a5&scene=4#wechat_redirect"><img src="assets/articles/9.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=3&sn=17d6884169db20259f002c5353b1d9cb&chksm=e978488cde0fc19a50a002a52b44ec416197545922c0e089ff371f6cd455bfcc723207e4c7a5&scene=4#wechat_redirect">TED:选择的困惑</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 784人
                        </p>
                    </div>
                </div>

                 <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=6&sn=43d8501de484f36f87005a064ac8602a&chksm=e97848bcde0fc1aad067e160e9b6799ad00a3b6bc029d393f965d5d2cf6861ab5010170c5ca1&scene=4#wechat_redirect"><img src="assets/articles/10.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=6&sn=43d8501de484f36f87005a064ac8602a&chksm=e97848bcde0fc1aad067e160e9b6799ad00a3b6bc029d393f965d5d2cf6861ab5010170c5ca1&scene=4#wechat_redirect">TED:华理克谈为人生目的而活</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 668人
                        </p>
                    </div>
                </div>

                <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=2&sn=4f35eff21b3f531666f2bf6c167d7709&chksm=e97848bcde0fc1aa9368bbf07d096031ffc8e770d3c63019c3ef3ce9fc3a9948aff8ae275775&scene=4#wechat_redirect"><img src="assets/articles/11.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=2&sn=4f35eff21b3f531666f2bf6c167d7709&chksm=e97848bcde0fc1aa9368bbf07d096031ffc8e770d3c63019c3ef3ce9fc3a9948aff8ae275775&scene=4#wechat_redirect">提升你的幸福竞争力</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 597人
                        </p>
                    </div>
                </div>

                <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=4&sn=fd47acff921f2d594166ad6600f53e85&chksm=e97848b2de0fc1a4b40c6e0ab344caf2d21a6f1e5509083e9239c8bc803dfff31be9317384de&scene=4#wechat_redirect"><img src="assets/articles/12.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=4&sn=fd47acff921f2d594166ad6600f53e85&chksm=e97848b2de0fc1a4b40c6e0ab344caf2d21a6f1e5509083e9239c8bc803dfff31be9317384de&scene=4#wechat_redirect">提升幸福感的秘籍</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 923人
                        </p>
                    </div>
                </div>

                 <div class="mylist happyList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=2&sn=def92c0159ddf105ef36d3f9020b9b72&chksm=e978488cde0fc19aec788b5cc1618fc3197554ea5121d0e5c2f7c2eb45cd07d2bc386f4627a6&scene=4#wechat_redirect"><img src="assets/articles/13.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=2&sn=def92c0159ddf105ef36d3f9020b9b72&chksm=e978488cde0fc19aec788b5cc1618fc3197554ea5121d0e5c2f7c2eb45cd07d2bc386f4627a6&scene=4#wechat_redirect">俞敏洪谈幸福</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 699人
                        </p>
                    </div>
                </div>

                <div class="mylist careerList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=4&sn=a72734c8e52f8346661a5482dd4bec4e&chksm=e978488cde0fc19a74181df3f14c1ca22bb6b0c00d5d5d70d4fc9f0781ab341a68bd2e89b931&scene=4#wechat_redirect"><img src="assets/articles/14.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=4&sn=a72734c8e52f8346661a5482dd4bec4e&chksm=e978488cde0fc19a74181df3f14c1ca22bb6b0c00d5d5d70d4fc9f0781ab341a68bd2e89b931&scene=4#wechat_redirect">TED:心理学观点的"幸运关键"</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 792人
                        </p>
                    </div>
                </div>

                <div class="mylist careerList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=3&sn=eaa0fba3120fd4649a06bc9ac09829b5&chksm=e97848bcde0fc1aa06ad2a4631f370a204f9f2212ee5c0343ba46540e3dd9ce171a4ab16cbc5&scene=4#wechat_redirect"><img src="assets/articles/15.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=3&sn=eaa0fba3120fd4649a06bc9ac09829b5&chksm=e97848bcde0fc1aa06ad2a4631f370a204f9f2212ee5c0343ba46540e3dd9ce171a4ab16cbc5&scene=4#wechat_redirect">你并不需要通过辞职来实现梦想</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 814人
                        </p>
                    </div>
                </div>

                <div class="mylist careerList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=1&sn=cac30a608b2be0862b6a62d012b7d624&chksm=e97848b2de0fc1a4e0e8da16b1c030ec0d34303e8f96740738097675c8f3b77d7fa92e31f65a&scene=4#wechat_redirect"><img src="assets/articles/16.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483676&idx=1&sn=cac30a608b2be0862b6a62d012b7d624&chksm=e97848b2de0fc1a4e0e8da16b1c030ec0d34303e8f96740738097675c8f3b77d7fa92e31f65a&scene=4#wechat_redirect">如何让上司"按着你的想法"做事</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 716人
                        </p>
                    </div>
                </div>

                <div class="mylist careerList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=4&sn=35aa71d5a2eaa16fbb5c22ccfa9477b7&chksm=e97848bcde0fc1aaf07cc7806f3c23e2050972aea52952197fca802ee97e77cdf5e3e76bc4d0&scene=4#wechat_redirect"><img src="assets/articles/17.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483666&idx=4&sn=35aa71d5a2eaa16fbb5c22ccfa9477b7&chksm=e97848bcde0fc1aaf07cc7806f3c23e2050972aea52952197fca802ee97e77cdf5e3e76bc4d0&scene=4#wechat_redirect">如何提升工作效率</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 527人
                        </p>
                    </div>
                </div>

                <div class="mylist careerList allList">
                    <div class="mylist-img"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=1&sn=628afb16aea9488503cec2d00abc4c6e&chksm=e978488cde0fc19a084c1bef612631aa69be1f7a9badd25ab7645432d5e836ed2bc14ce763c0&scene=4#wechat_redirect"><img src="assets/articles/18.png" /></a></div>
                    <div class="mylist-intro">
                        <p class="mylist-title"><a href="http://mp.weixin.qq.com/s?__biz=MzI0MjY1NTQyNQ==&mid=2247483682&idx=1&sn=628afb16aea9488503cec2d00abc4c6e&chksm=e978488cde0fc19a084c1bef612631aa69be1f7a9badd25ab7645432d5e836ed2bc14ce763c0&scene=4#wechat_redirect">职场上,比"做对事"更重要的是"看对人"</a></p>
                        <p class="mylist-subtitle"><span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-user"></span> 673人
                        </p>
                    </div>
                </div>
            </div>
     </div>

    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=openid %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=openid %>" style="color:white">发现生活</a></div>
         <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="knowledge.aspx?userid=<%=openid %>" style="color:white">知识点滴</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left">
              <% if(!profileComplete){ %>
            <div style="position:absolute;right:10px;top:10px;width:20px;height:20px;border-radius:10px;background-color:red"></div>
            <%} %>
            <a href="person.aspx?userid=<%=openid %>" style="color:white">用户中心</a></div>
       
    </div>
    </form>
    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>
</body>
   <script>

       function showTab(tabname) {
           $(".user-tag span").removeClass("user-tag-active");
           $("#" + tabname + "Span").addClass("user-tag-active");

           $(".mylist").css("display", "none");
           $("." + tabname + "List").css("display", "block");
       }
   </script>
</html>
