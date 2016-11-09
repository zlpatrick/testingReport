<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-index.aspx.cs" Inherits="TestingReport.admin_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
        <tr><td>题目</td><td><asp:TextBox runat="server" ID="title"></asp:TextBox></td></tr>
        <tr><td>题目描述</td><td><asp:TextBox runat="server" ID="introduction"></asp:TextBox></td></tr>
        <tr><td>题目图片</td><td><asp:FileUpload runat="server" ID="img" /></td></tr>
        <tr><td>题目总数</td><td><asp:TextBox runat="server" ID="totalOptions"></asp:TextBox></td></tr>
        <tr><td>题目选择项个数</td><td><asp:TextBox runat="server" ID="totalChooseItems"></asp:TextBox></td></tr>
        <tr><td colspan="2"><asp:Button runat="server" ID="addTopic" Text="添加题目" 
                onclick="addTopic_Click" /></td></tr>
        </table>
    </div>
    </form>
</body>
</html>
