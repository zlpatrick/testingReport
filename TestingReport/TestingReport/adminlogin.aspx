<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="TestingReport.adminlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <p>管理员ID：<asp:TextBox ID="adminName" runat="server"></asp:TextBox></p> 
   <p>管理员密码：<asp:TextBox ID="adminPass" runat="server"></asp:TextBox></p>
   <p><asp:Button ID="loginButton" Text="登录" runat="server" /></p>
    </div>
    </form>
</body>
</html>
