<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aadm_kcxx_tj.aspx.cs" Inherits="aadm_kcxx_tj" %>

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
		<asp:SqlDataSource ID="JSXXSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>" SelectCommand="SELECT [GZH], [JSXM] FROM [T_JSXXB] where sfyx=1 and jslb=1 order by jsxm"></asp:SqlDataSource>
			<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			<table>
				<tr>
					<td align="right" style="width: 100px">
						�γ̱�ţ�</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="KCBHTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
						�γ����ƣ�</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="KCMCTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
								<tr>
					<td align="right" style="width: 100px; height: 24px;">
						�ον�ʦ��</td>
					<td style="width: 147px; height: 24px;">
						<asp:DropDownList ID="JSDDL" runat="server" Width="153px" DataSourceID="JSXXSDS" DataTextField="JSXM" DataValueField="GZH"></asp:DropDownList></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 26px;">
						�γ���Ϣ��</td>
					<td style="width: 147px; height: 26px;">
					<asp:TextBox CssClass="text_input" ID="KCXXTextBox" runat="server" Text=''></asp:TextBox>
						</td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 26px;">
						�γ�ѧʱ��</td>
					<td style="width: 147px; height: 26px;">
						<asp:TextBox CssClass="text_input" ID="KCXSTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
						�Ͽ�������</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="SKRSTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				
				<tr>
					<td align="right" colspan="2">
						<asp:Button ID="addButton" runat="server" Text="���" OnClick="addButton_Click" />
						&nbsp;<asp:Button ID="cacelButton" runat="server" Text="ȡ��" OnClick="cacelButton_Click" /></td>
				</tr>
			</table>
			</div>
	</form>
</body>
</html>
