﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_xgmm.aspx.cs" Inherits="admin_xgmm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:20px">
        <br />
        <asp:Label ID="errors" runat="server" Width="793px"></asp:Label><br />

        请输入原密码 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        <asp:TextBox CssClass="text_input" ID="oldpassTextbox" runat="server" TextMode="Password"></asp:TextBox><br />
        <br />
        请输入新密码 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br /><asp:TextBox CssClass="text_input" ID="newpassTextbox1" runat="server" TextMode="Password"></asp:TextBox><br />
        <br />
        请再次输入新密码 &nbsp;&nbsp;<br />
        <asp:TextBox CssClass="text_input" ID="newpassTextbox2" runat="server" OnTextChanged="TextBox3_TextChanged" TextMode="Password"></asp:TextBox><br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认" /><br />
    
    </div>
    </form>
</body>
</html>
