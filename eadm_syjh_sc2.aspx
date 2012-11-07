<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_syjh_sc2.aspx.cs" Inherits="eadm_syjh_sc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>无标题页</title>
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<form id="form1" runat="server">
		<div>
            &nbsp;<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			
			<table>
				<tr>
					<td>
						<asp:Label ID="Label1" runat="server" Text="实验名称："></asp:Label></td>
					<td style="width: 167px">
						<asp:TextBox CssClass="text_input" ID="symcTextBox" runat="server" ReadOnly="True"></asp:TextBox></td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="Label2" runat="server" Text="实验课程："></asp:Label></td>
					<td style="width: 167px">
						<asp:TextBox CssClass="text_input" ID="kcmcTextBox" runat="server" ReadOnly="True"></asp:TextBox></td>
				</tr>
				<tr>
					<td style="height: 26px">
						<asp:Label ID="Label5" runat="server" Text="编号前缀："></asp:Label></td>
					<td style="height: 26px; width: 167px;">
						<asp:TextBox CssClass="text_input" ID="sybhTextBox" runat="server"></asp:TextBox></td>
				</tr>
								<tr>
					<td style="height: 26px">
						<asp:Label ID="Label6" runat="server" Text="实验教师："></asp:Label></td>
					<td style="height: 26px; width: 167px;">
						<asp:DropDownList ID="syjsDDL" runat="server" DataSourceID="syjsSDS" DataTextField="JSXM"
							DataValueField="GZH" Width="162px">
						</asp:DropDownList></td>
				</tr>
								<tr>
					<td style="height: 26px">
						<asp:Label ID="Label7" runat="server" Text="实验地点："></asp:Label></td>
					<td style="height: 26px; width: 167px;">
						<asp:DropDownList ID="syddDDL" runat="server" DataSourceID="syddSDS" DataTextField="SYSDD"
							DataValueField="ID" Width="162px">
						</asp:DropDownList></td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="Label3" runat="server" Text="实验分组："></asp:Label></td>
					<td style="width: 167px">
						<asp:TextBox CssClass="text_input" ID="syfzTextBox" runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td>
						<asp:Label ID="Label4" runat="server" Text="每组人数："></asp:Label></td>
					<td style="width: 167px">
						<asp:TextBox CssClass="text_input" ID="mzrsTextBox" runat="server" ></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right">
						<asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" /></td>
					<td align="right" style="width: 167px">
						<asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" /></td>
				</tr>
			</table>
		</div>
		<asp:SqlDataSource ID="syjsSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT [GZH], [JSXM] FROM [V_SYJSJBXXB] ORDER BY [JSXM]"></asp:SqlDataSource>
		<asp:SqlDataSource ID="syddSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT [ID], [SYSDD] FROM [V_SYSXXB]"></asp:SqlDataSource>

	</form>
</body>
</html>
