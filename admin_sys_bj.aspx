<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sys_bj.aspx.cs" Inherits="eadm_sys_bj" %>

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
				SelectCommand="SELECT [ID], [SYSMC], [SYSDD], [SYSLXID], [LXMC], [SYSRL], [SYSMS], [TTPBS] FROM [V_SYSXXB] ORDER BY [SYSMC]"
				UpdateCommand="UPDATE T_SYSXXB SET SYSMC=@SYSMC,SYSDD=@SYSDD,SYSLXID=@SYSLXID,SYSRL=@SYSRL,SYSMS=@SYSMS,TTPBS=@TTPBS WHERE ID=@ID"
				DeleteCommand="DELETE T_SYSXXB WHERE ID=@ID" >
				<DeleteParameters>
					<asp:Parameter Name="ID" Type="INT32" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="SYSMC" Type="STRING" />
					<asp:Parameter Name="SYSDD" Type="STRING" />
					<asp:Parameter Name="SYSLXID" Type="INT32" />
					<asp:Parameter Name="SYSRL" Type="INT32" />
					<asp:Parameter Name="YJDZ" Type="STRING" />
					<asp:Parameter Name="SYSMS" Type="STRING" />
					<asp:Parameter Name="TTPBS" Type="INT32" />
				</UpdateParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LXMC] FROM [D_SYSLXB]"></asp:SqlDataSource>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
			DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="SYSMC" HeaderText="实验室名称" SortExpression="SYSMC" ReadOnly="false">
				</asp:BoundField>
				<asp:BoundField DataField="SYSDD" HeaderText="地点" SortExpression="SYSDD">
				</asp:BoundField>
				<asp:TemplateField HeaderText="类型" SortExpression="LXMC">
					<EditItemTemplate>
						<asp:DropDownList ID="lxDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="LXMC"
							DataValueField="ID" SelectedValue='<%# Bind("SYSLXID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("LXMC") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:BoundField DataField="SYSRL" HeaderText="容量" SortExpression="SYSRL">
				</asp:BoundField>
				<asp:BoundField DataField="TTPBS" HeaderText="台套配备" SortExpression="TTPBS">
				</asp:BoundField>
				<asp:BoundField DataField="SYSMS" HeaderText="实验室描述" SortExpression="SYSMS">
				</asp:BoundField>
				<asp:TemplateField ShowHeader="False">
					<EditItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
							Text="更新"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
							Text="取消"></asp:LinkButton>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
							Text="编辑"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确认要删除吗？');"
							CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
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
			<PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
				NextPageText="下页" PreviousPageText="上页" />
		</asp:GridView>
		&nbsp;&nbsp;<br />
		&nbsp;
	</form>
</body>
</html>
