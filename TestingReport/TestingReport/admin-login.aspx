<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-login.aspx.cs" Inherits="TestingReport.admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>用户名:<asp:TextBox runat="server" id="username"></asp:TextBox></p>
    <p>密码:<asp:TextBox runat="server" id="userpass"></asp:TextBox></p>
    <p><asp:Button runat="server" ID="submitButton" Text="登录" 
            onclick="submitButton_Click" /></p>
    </div>
    </form>
</body>
</html>
