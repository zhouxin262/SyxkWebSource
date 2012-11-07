<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_gly_sys.aspx.cs" Inherits="admin_gly" %>

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
				SelectCommand="SELECT [ID], [GLYXM], [SYSID], [GLYID], [SYSMC], [SYSDD] FROM [V_SYSGLY] where sysid in (select sysid from t_sysxxb where syslxid =@syslxid)"
				DeleteCommand="DELETE FROM T_SYSGLB WHERE ID=@ID"
				>
								<SelectParameters>
					<asp:Parameter Name="SYSLXID" Type="int32" DefaultValue="1" />
				</SelectParameters>
				<DeleteParameters>
					<asp:Parameter Name="ID" Type="int32" />
				</DeleteParameters>
				</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [GLYXM], [DLM] FROM [T_GLYXXB] WHERE ([GLYLX] = @GLYLX) ORDER BY [GLYXM]">
				<SelectParameters>
					<asp:Parameter DefaultValue="2" Name="GLYLX" Type="Int32" />
				</SelectParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LXMC] FROM [D_SYSLXB]"></asp:SqlDataSource>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID"
			DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="GLYXM" HeaderText="����Ա����" SortExpression="GLYXM">
				</asp:BoundField>
				<asp:BoundField DataField="SYSMC" HeaderText="ʵ��������" SortExpression="SYSMC">
				</asp:BoundField>
				<asp:BoundField DataField="SYSDD" HeaderText="ʵ���ҵص�" SortExpression="SYSDD">
				</asp:BoundField>
				<asp:TemplateField ShowHeader="False">
					<ItemTemplate>
						&nbsp;
						<asp:LinkButton ID="LinkButton1" CommandName="delete" runat="server" OnClientClick="return confirm('ȷ��Ҫɾ����');">ɾ��</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
			<EmptyDataTemplate>
				��������
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
							ѡ�����Ա��</td>
						<td style="width: 147px">
							<asp:DropDownList ID="GLYDDL" runat="server" Width="130px">
							</asp:DropDownList></td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">
							ѡ��ʵ���ң�</td>
						<td style="width: 147px">
							<asp:DropDownList ID="SYSDDL" runat="server"  Width="130px" DataTextField="ID" DataValueField="LXMC">
							</asp:DropDownList></td>
					</tr>
					<tr valign="bottom">
						<td style="width: 100px; height: 26px">
							
						</td>
						<td align="left" style="width: 147px; height: 26px">
							<asp:Button ID="addBtn" runat="server" OnClick="addBtn_Click"
								Text="��ӹ���Ա" /><asp:Button ID="cancelBtn" runat="server" Text="ȡ��" /></td>
					</tr>
				</table>
				<br />

	</form>
</body>
</html>
