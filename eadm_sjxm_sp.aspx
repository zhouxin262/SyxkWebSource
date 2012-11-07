<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_sjxm_sp.aspx.cs" Inherits="eadm_sysp" %>

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
    <div>
    <table width="80%" height="50%">
    <tr><td align="center"> <asp:Label id="messageLabel" runat="server" ForeColor="Red"></asp:Label></td></tr>
    <tr><td align="center" valign="middle"><asp:Label Height="100px" ID="Label" runat="server" Text="拒绝批准原因："></asp:Label>&nbsp;
		<asp:TextBox ID="jjyyTextBox" runat="server" Height="100px" TextMode="MultiLine" Width="210px"></asp:TextBox><br />
		</td></tr>
		<tr><td align="center" valign="middle"><asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" />
		<asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" /></td></tr></table>
    
    </div>
    </form>
</body>
</html>
