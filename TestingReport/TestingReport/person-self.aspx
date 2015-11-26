<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="person-self.aspx.cs" Inherits="TestingReport.person_self" %>

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
    <div style="overflow:hidden;padding:50px;">
        <div style="float:left;width:20%"><img src="<%=userImageUrl %>" style="width:100%"/></div>
        <div style="float:left;padding:50px;">昵称: <%=userNickName %></div>
    </div>

    <hr style="margin:0"/>

    <div style="overflow:hidden;">
        <div style="width:50%;float:left;background-color:lightgray;padding-top:30px;padding-bottom:30px;color:white;">
            <img src="img/corner.png" style="width:100px;margin-left:50px;"/> 认识自我
        </div>
        <div style="width:50%;float:left;padding-top:30px;padding-bottom:30px;">
            <img src="img/corner.png" style="width:100px;margin-left:50px;"/> <a href="person.aspx" style="color:#555">个人设置</a>
        </div>
    </div>
    <hr style="margin:0"/>

    </div>
    </form>
</body>
</html>
