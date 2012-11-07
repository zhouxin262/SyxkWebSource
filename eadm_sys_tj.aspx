<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_sys_tj.aspx.cs" Inherits="eadm_sys_tj" %>


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
		
		<asp:SqlDataSource ID="SYSLXSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT [ID], [LXMC] FROM [D_SYSLXB]"></asp:SqlDataSource>
			<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			<table>
				<tr>
					<td align="right" style="width: 100px">
						名称：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="MCTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px">
						地点：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="DDTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
								<tr>
					<td align="right" style="width: 100px">
						面积：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="RLTextBox" runat="server" Text=''></asp:TextBox></td>
				</tr>
<%--				<tr>
					<td align="right" style="width: 100px">
						台套配备：</td>
					<td style="width: 147px">
					<asp:TextBox CssClass="text_input" ID="TTPBTextBox" runat="server" Text=''></asp:TextBox>
						</td>
				</tr>--%>
				<tr>
					<td align="right" style="width: 100px; height: 24px;">
						类型：</td>
					<td style="width: 147px; height: 24px;">
						<asp:DropDownList ID="SYSLXDDL" runat="server"
							Width="153px" DataSourceID="SYSLXSDS" DataTextField="LXMC" DataValueField="ID">
						</asp:DropDownList></td>
				</tr>
								<tr>
					<td align="right" style=" height:80px;width: 100px" valign=top>
						描述：</td>
					<td style="width: 147px">
						<asp:TextBox CssClass="text_input" ID="MSTextBox" runat="server" Text='' TextMode="MultiLine" Height="80px" Width="200px"></asp:TextBox></td>
				</tr>
				<tr>
					<td colspan=2 align="right">
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
