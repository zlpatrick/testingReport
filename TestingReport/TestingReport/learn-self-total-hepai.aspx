<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="learn-self-total-hepai.aspx.cs" Inherits="TestingReport.learn_self_total_hepai" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta content="user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>幸福ABC - 认识自我</title>
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
    </style>
    
</head>
<body style="background-color:white">
    <form id="form1" runat="server">

         
      <div style="background-color:rgba(34,205,193,1);height:150px;position:relative;">
        <a href="person.aspx?userid=<%=Request["userid"] %>">
        <img src="<%=userImageUrl %>" style="width:200px;border-radius:100px;border-radius:100px;position:absolute;bottom:-100px;left:calc((100% - 200px)/2)"/>
    </a>
    </div>
    
    
    <div style="text-align:center;color:white;padding-top:120px;padding-bottom:30px;background-color:rgba(34,205,193,1)">
        <div><%=userNickName %></div>
        <div class="user-tag">
            <span><%=age %></span><span><%=industry %></span><span><%=region %></span>
        </div>
        <div style="font-size:40px;margin-top:30px;color:white">
            <ul style="padding:0">
               <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:yellow"><%=testTimes %>%</span><br />认识自我</li>
                <li style="display:inline-block;width:32%;border-right: 1px solid lightgrey"><span style="color:yellow"><%=toolTimes %>%</span><br />发现生活</li>
                <li style="display:inline-block;width:32%"><span style="color:yellow"><%=selfPercent %>%</span><br />信息完整度</li>
            </ul>
        </div>
    </div>



         <div style="padding:80px;font-size:40px;margin-bottom:200px;">
        <div style="overflow:hidden;margin-bottom:40px;">
            <div style="padding-left:30px;border-left:8px solid rgba(34,205,193,1);float:left;color:rgba(34,205,193,1)">合拍榜</div>
        </div>
        <div style="font-size:32px;">
            <table style="width:100%;text-align:center">
                <tr style="height:80px">
                    <td></td>
                    <td><span style="border-radius:10px;background-color:rgba(34,205,193,1);color:white;padding:20px;">大五人格</span></td>
                    <td><span style="border-radius:10px;background-color:skyblue;color:white;padding:20px;">完美主义</span></td>
                    <td><span style="border-radius:10px;background-color:orangered;color:white;padding:20px;">出世入世</span></td>
                </tr>
                <tr style="height:80px">
                    <td style="padding-top:20px;padding-bottom:20px;">
                        <img src="img/4-right.png" style="width:160px;border-radius:80px;border-radius:80px;" /><br />
                        Jeffrey</td>
                    <td>80%</td>
                    <td>50%</td>
                    <td>40%</td>
                </tr>
                <tr style="height:80px">
                    <td style="padding-top:20px;padding-bottom:20px;">
                        <img src="http://wx.qlogo.cn/mmopen/ajNVdqHZLLAYLS099gHf5fuf8HySVmwVa50ZBKqZ9zBV1cFB9H7kNn2ZNRxWew4OfVblt7icCSIAenYoQ1TJiaBw/0" style="width:160px;border-radius:80px;border-radius:80px;"/><br />
                        三石叔叔</td>
                    <td>80%</td>
                    <td>70%</td>
                    <td></td>
                </tr>
                
                <tr style="height:80px">
                  <td style="padding-top:20px;padding-bottom:20px;">
                        <img src="img/1-right.png" style="width:160px;border-radius:80px;border-radius:80px;" /><br />
                        浪子回头</td>
                    <td></td>
                    <td>60%</td>
                    <td>40%</td>
                </tr>
            </table>
        </div>
    </div>
   


    


   
    <div style="position:fixed;bottom:0;height:120px;border-top-color:grey;font-size:40px;background-color:rgba(34,205,193,1);width:100%;z-index:1000;color:white;text-align:center;line-height:120px;">
       
         <div style="width:25%;border-top:4px solid #3d585f;height:120px;line-height:120px;float:left"><a href="learn-self.aspx?userid=<%=Request["userid"] %>" style="color:white">认识自我</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="find-life.aspx?userid=<%=Request["userid"] %>" style="color:white">发现生活</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="happiness.aspx?userid=<%=Request["userid"] %>" style="color:white">幸福宝典</a></div>
        <div style="width:25%;border-top:4px solid rgba(34,205,193,1);height:120px;line-height:120px;float:left"><a href="person.aspx?userid=<%=Request["userid"] %>" style="color:white">个人中心</a></div>
       
    </div>



    </form>
    <div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
                    <img src="assets/guide.png"/>
    </div>


</body>
   
</html>

