<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_syapdr.aspx.cs" Inherits="eadm_syapdr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		&nbsp;<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
		<table>
			<tr>
				<td align="right" style="width: 100px">
					选择文件：</td>
				<td style="width: 147px">
					<asp:FileUpload ID="FileUpload1" runat="server" /></td>
			</tr>
			
			<tr>
				<td align="right" colspan="2">
					<asp:Button ID="addButton" runat="server" OnClick="addButton_Click" Text="导入数据" />
					&nbsp;<asp:Button ID="cacelButton" runat="server" OnClick="cacelButton_Click" Text="导出错误" /></td>
			</tr>
		</table>
		<br />
		&nbsp;&nbsp;
    </div>
    </form>
</body>
</html>
