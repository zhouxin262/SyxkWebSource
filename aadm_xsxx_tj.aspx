<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aadm_xsxx_tj.aspx.cs" Inherits="aadm_xsxx_tj" %>

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
			<asp:SqlDataSource ID="LBSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LBMC] FROM [D_XSLBB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="XYSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [XYMC], [ID] FROM [D_XYXXB] ORDER BY [ID]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="ZYSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [ZYMC] FROM [D_ZYXXB]"></asp:SqlDataSource>
			<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			<table>
				<tr>
					<td align="right" style="width: 100px">
						学号：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="XHTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 26px;">
						姓名：</td>
					<td style="width: 147px; height: 26px;">
						<asp:TextBox CssClass="text_input" ID="XMTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
						学院：</td>
					<td style="width: 147px">
						<asp:DropDownList ID="XYDDL" runat="server" Width="153px" DataSourceID="XYSDS" DataTextField="XYMC"
							DataValueField="ID">
						</asp:DropDownList></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
						年级：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="NJTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
						手机号：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="SJHTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 26px;">
						邮箱：</td>
					<td style="width: 147px; height: 26px;">
						<asp:TextBox CssClass="text_input" ID="YJDZTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 24px;">
						学生类别：</td>
					<td style="width: 147px; height: 24px;">
						<asp:DropDownList ID="LBDDL" runat="server" Width="153px" DataSourceID="LBSDS" DataTextField="LBMC"
							DataValueField="ID">
						</asp:DropDownList></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 24px;">
						专业：</td>
					<td style="width: 147px; height: 24px;">
						<asp:DropDownList ID="ZYDDL" runat="server" Width="153px" DataSourceID="ZYSDS" DataTextField="ZYMC"
							DataValueField="ID">
						</asp:DropDownList></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
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
