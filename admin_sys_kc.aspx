<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sys_kc.aspx.cs" Inherits="admin_sys_kc" %>

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
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [KCBH], [KCMC], [SYSMC], [SYSDD], [LXMC], [SYSID], [KCID] FROM [V_SYSKC]"
				DeleteCommand="DELETE FROM T_SYSKCGLB WHERE ID=@ID"
				>
				<DeleteParameters>
					<asp:Parameter Name="ID" Type="int32" />
				</DeleteParameters>
				</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [KCMC], [ID] FROM [V_KCXXB] ORDER BY [KCMC]">
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [SYSMC], [ID] FROM [T_SYSXXB] ORDER BY [SYSMC]"></asp:SqlDataSource>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"
			DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="GLYXM">
				</asp:BoundField>
				<asp:BoundField DataField="KCMC" HeaderText="课程名称" SortExpression="KCMC" />
				
				<asp:BoundField DataField="SYSMC" HeaderText="实验室名称" SortExpression="SYSMC">
				</asp:BoundField>
				<asp:BoundField DataField="SYSDD" HeaderText="实验室地点" SortExpression="SYSDD">
				</asp:BoundField>
				<asp:TemplateField ShowHeader="False">
					<ItemTemplate>
						&nbsp;
						<asp:LinkButton ID="LinkButton1" CommandName="delete" runat="server" OnClientClick="return confirm('确认要删除吗？');">删除</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
			<EmptyDataTemplate>
				暂无数据
			</EmptyDataTemplate>
			<PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
			<SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
			<HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
			<EditRowStyle BackColor="Azure" />
			<AlternatingRowStyle BackColor="White" />
		</asp:GridView>
		<br />
				&nbsp;<table>
					<tr>
						<td align="right" style="width: 100px">
							选择课程：</td>
						<td style="width: 147px">
							<asp:DropDownList ID="KCDDL" runat="server" AutoPostBack="True" DataTextField="KCMC" DataValueField="ID">
							</asp:DropDownList></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							选择实验室：</td>
						<td style="width: 147px">
							<asp:DropDownList ID="SYSDDL" runat="server" AutoPostBack="True">
							</asp:DropDownList></td>
					</tr>
					<tr valign="bottom">
						<td style="width: 100px; height: 26px">
							
						</td>
						<td align="left" style="width: 147px; height: 26px"><asp:Button ID="addBtn" runat="server" OnClick="addBtn_Click"
								Text="添加课程" />
							<asp:Button ID="cancelBtn" runat="server" Text="取消" /></td>
					</tr>
				</table>
				<br />

	</form>
</body>
</html>
