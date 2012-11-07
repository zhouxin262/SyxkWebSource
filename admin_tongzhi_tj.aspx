<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_tongzhi_tj.aspx.cs" Inherits="admin_tongzhi_tj" %>

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

			<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			<table>
				<tr>
					<td align="right" style="width: 100px">
                        标题：</td>
					<td style="width: 347px">
						<asp:TextBox  Width="100%" CssClass="text_input" ID="txtBiaoTi" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
                        </td>
					<td style="width: 347px">
						</td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
                        内容：</td>
					<td style="width: 347px;height:500px">
						<asp:TextBox Width="100%" Height="500px" CssClass="text_input" ID="txtNeiRong" runat="server" Text='' TextMode="MultiLine"></asp:TextBox></td>
				</tr>
							
				<tr>
					<td colspan=2 align="center">
						<asp:Button ID="addButton" runat="server" Text="添加" OnClick="addButton_Click" />
						&nbsp;<asp:Button ID="cacelButton" runat="server" Text="取消" OnClick="cacelButton_Click" /></td>
				</tr>
			</table>
			<br />
			&nbsp;</div>
		&nbsp;
	</form>
</body>
</html>
