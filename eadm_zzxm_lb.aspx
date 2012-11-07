<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_zzxm_lb.aspx.cs" Inherits="eadm_zzxm_lb" %>

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
				SelectCommand="SELECT [SJXMMC], [XMJJ], [SQRID], [SQZT], [XSXM], [XYID], [ZYID], [XSLBID], [SJH], [YJDZ], [ZYMC], [LBMC], [XYMC], [ID] FROM [V_ZZSJXMSQB] ORDER BY [SJXMMC]"
				UpdateCommand="Update t_zzsjxmb set sqzt=1 where id=@id" OnUpdated="SqlDataSource1_Updated">
				<UpdateParameters>
				<asp:Parameter Name="id" Type="int32" />
				</UpdateParameters>
			</asp:SqlDataSource>
			&nbsp; &nbsp; &nbsp;&nbsp;<br />
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
					<td style="height: 17px">
						&nbsp;</td>
				</tr>
			</table>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
			AllowPaging="True" Width="100%" DataKeyNames="ID" >
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="SJXMMC" HeaderText="实验名称" SortExpression="SJXMMC" />
				<asp:BoundField DataField="XMJJ" HeaderText="实验简介" SortExpression="XMJJ" />
				<asp:BoundField DataField="SQRID" HeaderText="申请人" SortExpression="SQRID" />
				<asp:BoundField DataField="XSXM" HeaderText="姓名" SortExpression="XSXM" />
				<asp:BoundField DataField="SYKSSJ" HeaderText="开始时间" />
				<asp:BoundField DataField="syjssj" HeaderText="结束时间" />
				<asp:BoundField DataField="sysdd" HeaderText="实验地点" />
				<asp:BoundField DataField="SJH" HeaderText="手机号" SortExpression="SJH" />
				<asp:BoundField DataField="YJDZ" HeaderText="邮件地址" SortExpression="YJDZ" />
				<asp:TemplateField ShowHeader="False">
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton3"  CommandName= "Update" CausesValidation ="true" runat="server">通过审批</asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="False">
					<ItemTemplate>
						&nbsp;<asp:LinkButton ID="LinkButton4" PostBackUrl='<%#"eadm_zzxm_sp.aspx?pz=0&id=" +  Eval("ID") %>' runat="server">拒绝审批</asp:LinkButton>
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
