<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="background.aspx.cs" Inherits="TestingReport.background" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="Styles/Site.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p style="background-color:#0097d4;margin:0;padding:30px 5px;text-align:center;color:White">请选择您的个人信息<br /></p>
    </div>
    <div style="padding:0px 50px">
    <p>年龄</p>
    <p>
        <asp:DropDownList ID="age" runat="server">
            <asp:ListItem>20岁以下</asp:ListItem>
            <asp:ListItem>21-25岁</asp:ListItem>
            <asp:ListItem>26-30岁</asp:ListItem>
            <asp:ListItem>31-35岁</asp:ListItem>
            <asp:ListItem>36-40岁</asp:ListItem>
            <asp:ListItem>41-50岁</asp:ListItem>
            <asp:ListItem>50岁以上</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>性别</p>
    <p>
        <asp:DropDownList ID="gender" runat="server">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>行业</p>
    <p>
        <asp:DropDownList ID="industry" runat="server">
            <asp:ListItem>互联网-游戏-软件</asp:ListItem> 
            <asp:ListItem>电子-通信-硬件</asp:ListItem> 
            <asp:ListItem>房地产-建筑-物业</asp:ListItem> 
            <asp:ListItem>金融</asp:ListItem> 
            <asp:ListItem>消费品</asp:ListItem> 
            <asp:ListItem>汽车-机械-制造</asp:ListItem> 
            <asp:ListItem>服务-外包-中介</asp:ListItem> 
            <asp:ListItem>广告-传媒-教育-文化</asp:ListItem> 
            <asp:ListItem>交通-贸易-物流</asp:ListItem> 
            <asp:ListItem>医疗-制药</asp:ListItem> 
            <asp:ListItem>能源-化工-环保</asp:ListItem> 
            <asp:ListItem>政府</asp:ListItem> 
            <asp:ListItem>农林牧渔</asp:ListItem> 
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="start" runat="server" Text="进入测试" onclick="start_Click" CssClass="test-button"/>
    </p>
    </div>
    </form>
</body>
</html>
