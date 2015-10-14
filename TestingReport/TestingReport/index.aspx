<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TestingReport.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
    <link type="text/css" rel="stylesheet" href="Styles/bootstrap.css" />
    <style>
    p
    {
        text-align:center;
    }
    a
    {
        color:grey;
        text-decoration:none;
    }
    </style>
</head>
<body>
    <div class="row" style="background-color:#0097d4;color:white;height:135px;text-align:center;line-height:135px;font-family:'Microsoft Yahei' ">
        <div style="float:left;width:33.333%">知识</div>
        <div style="float:left;width:33.333%">方法</div>
        <div style="float:left;width:33.333%">工具</div>
    </div>
    <p><img src="assets/index.jpg" style="width:100%" /></p>
    <p style="line-height:100px;margin:60px">专注于研究如何更积极地投入生活、更幸福地享受生活，并提供相关的知识、方法和工具。</p>

    <form id="form1" runat="server">
    <div>
    <p><a href="background.aspx?id=3&userid=<%=Request["userid"] %>">生活状态测试（Panic, Strech, Comfort）</a></p>
    <!--<p><a href="background.aspx?id=2&userid=<%=Request["userid"] %>">幸福维度量表</a></p>
    <p>&nbsp;</p>
    <p><a href="background.aspx?id=1&userid=<%=Request["userid"] %>">大5人格量表</a></p>
    <p><a href="background.aspx?id=5&userid=<%=Request["userid"] %>">工作满意度量表</a></p>
    <p><a href="background.aspx?id=4&userid=<%=Request["userid"] %>">情绪测试量表</a></p>
    <p><a href="background.aspx?id=6&userid=<%=Request["userid"] %>">生活满意度量表</a></p>
    <p><a href="background.aspx?id=7&userid=<%=Request["userid"] %>">总体幸福感量表</a></p>-->
    </div>
    </form>
</body>
</html>
