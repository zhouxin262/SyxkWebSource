<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_gly_sys.aspx.cs" Inherits="admin_gly" %>

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
				SelectCommand="SELECT [ID], [GLYXM], [DLM],[LXMC] FROM [V_SYSZRGLY]"
				DeleteCommand="update t_glyxxb set sfsyszr=null where DLM=@DLM"
				>
				<DeleteParameters>
					<asp:Parameter Name="DLM" Type="string" />
				</DeleteParameters>
				</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [GLYXM], [DLM] FROM [T_GLYXXB] WHERE ([GLYLX] = @GLYLX)  ORDER BY [GLYXM]">
				<SelectParameters>
					<asp:Parameter DefaultValue="2" Name="GLYLX" Type="Int32" />
				</SelectParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LXMC] FROM [D_SYSLXB] ORDER BY [LXMC]"></asp:SqlDataSource>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DLM"
			DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="GLYXM" HeaderText="管理员姓名" SortExpression="GLYXM">
				</asp:BoundField>
				<asp:BoundField DataField="LXMC" HeaderText="实验室名称" SortExpression="LXMC">
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
							选择管理员：</td>
						<td style="width: 147px">
							<asp:DropDownList ID="GLYDDL" runat="server" Width="130px">
							</asp:DropDownList></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							选择实验室：</td>
						<td style="width: 147px">
							<asp:DropDownList ID="SYSDDL" runat="server"  Width="130px">
							</asp:DropDownList></td>
					</tr>
					<tr valign="bottom">
						<td style="width: 100px; height: 26px">
							
						</td>
						<td align="left" style="width: 147px; height: 26px">
							<asp:Button ID="addBtn" runat="server" OnClick="addBtn_Click"
								Text="安排管理员" /><asp:Button ID="cancelBtn" runat="server" Text="取消" /></td>
					</tr>
				</table>
				<br />

	</form>
</body>
</html>
