<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TestingReport.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
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
    <p>幸福ABC - 热门测试</p>
    <form id="form1" runat="server">
    <div>
    <p><a href="background.aspx?id=3&userid=<%=Request["userid"] %>">生活状态测试（Panic, Strech, Comfort）</a></p>
    <p><a href="background.aspx?id=2&userid=<%=Request["userid"] %>">幸福维度量表</a></p>
    <p>&nbsp;</p>
    <p><a href="background.aspx?id=1&userid=<%=Request["userid"] %>">大5人格量表</a></p>
    <p><a href="background.aspx?id=5&userid=<%=Request["userid"] %>">工作满意度量表</a></p>
    <p><a href="background.aspx?id=4&userid=<%=Request["userid"] %>">情绪测试量表</a></p>
    <p><a href="background.aspx?id=6&userid=<%=Request["userid"] %>">生活满意度量表</a></p>
    <p><a href="background.aspx?id=7&userid=<%=Request["userid"] %>">总体幸福感量表</a></p>
    </div>
    </form>
</body>
</html>
