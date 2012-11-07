<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aadm_kcxx_bj.aspx.cs" Inherits="aadm_kcxx_bj" %>

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
				SelectCommand="SELECT [ID], [KCBH], [KCMC], [JSID], [JSXM], [KCXX],[KCXS], [SFAPSY], [SKRS] FROM [V_KCXXB] ORDER BY [KCBH],KCMC,JSXM"
				UpdateCommand="UPDATE T_KCXXB SET KCBH=@KCBH,KCMC=@KCMC,JSID=@JSID,KCXS=@KCXS,KCXX=@KCXX,SKRS=@SKRS WHERE ID=@ID"
				DeleteCommand="DELETE FROM T_KCXXB WHERE ID=@ID" >
				<DeleteParameters>
					<asp:Parameter Name="ID" Type="INT32" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="KCBH" Type="STRING" />
					<asp:Parameter Name="KCMC" Type="STRING" />
					<asp:Parameter Name="JSID" Type="STRING" />
					<asp:Parameter Name="KCXS" Type="INT32" />
					<asp:Parameter Name="KCXX" Type="STRING" />
					<asp:Parameter Name="SKRS" Type="INT32" />
					<asp:Parameter Name="ID" Type="INT32" />
				</UpdateParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [GZH], [JSXM] FROM [T_JSXXB] where sfyx=1 and jslb=1"></asp:SqlDataSource>
			<br />
			&nbsp;<table width="100%">
				<tr>
					<td align="center">
						<asp:Label ID="messageLabel" runat="server" ForeColor="red" Text=""></asp:Label></td>
				</tr>
				<tr>
					<td align="center">
						<asp:Label ID="label1" runat="server" Text="筛选条件："></asp:Label>
						<asp:TextBox ID="sxtjTextBox" runat="server" Text=""></asp:TextBox>
						<asp:Button ID="sxButton" runat="server" OnClick="sxButton_Click" Text="开始筛选" />
						<asp:Button ID="czButton" runat="server" OnClick="czButton_Click" Text="显示全部" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
				</tr>
			</table>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
			DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="KCBH" HeaderText="课程编号" SortExpression="KCBH">
				</asp:BoundField>
				<asp:BoundField DataField="KCMC" HeaderText="课程名称" SortExpression="KCMC">
				</asp:BoundField>
                <asp:TemplateField HeaderText="任课教师" SortExpression="JSXM">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="JSXM" DataValueField="GZH" SelectedValue='<%# Bind("JSID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("JSXM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:BoundField DataField="KCXS" HeaderText="课程学时" SortExpression="KCXS">
				</asp:BoundField>
				<asp:BoundField DataField="KCXX" HeaderText="课程信息" SortExpression="KCXX">
				</asp:BoundField>
				<asp:BoundField DataField="SKRS" HeaderText="上课人数" SortExpression="SKRS">
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
