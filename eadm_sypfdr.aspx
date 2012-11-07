<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_sypfdr.aspx.cs" Inherits="eadm_sypfdr" %>

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
			&nbsp;<asp:SqlDataSource ID="KCSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID],  [KCMC] as kcmc  FROM [V_KCXXB]"></asp:SqlDataSource>
			<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			<table>
				<tr>
					<td align="right" style="width: 100px">
						选择文件：</td>
					<td style="width: 147px">
						<asp:FileUpload ID="FileUpload1" runat="server" /></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 24px;">
						实验课程：</td>
					<td style="width: 147px; height: 24px;">
						<asp:DropDownList ID="SYKCDDL" runat="server" DataSourceID="KCSDS" DataTextField="KCMC" DataValueField="ID" Width="185px">
						</asp:DropDownList></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right">
						<asp:Button ID="addButton" runat="server" Text="导入数据" OnClick="addButton_Click" />
						&nbsp;<asp:Button ID="cacelButton" runat="server" Text="导出错误" OnClick="cacelButton_Click" /></td>
				</tr>
			</table>
			<br />
			&nbsp;</div>
		&nbsp;
	</form>
</body>
</html>
