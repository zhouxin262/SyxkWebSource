<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aadm_xsxx_bj.aspx.cs" Inherits="aadm_xsxx_bj" %>

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
				SelectCommand="SELECT XSXH,XSXM, XYID, ZYID, XSLBID, SJH, YJDZ,ZYMC,LBMC,XYMC,NJ FROM V_XSJBXX"
				UpdateCommand="UPDATE T_XSXXB SET XSXM=@XSXM,XYID=@XYID,ZYID=@ZYID,XSLBID=@XSLBID,SJH=@SJH,YJDZ=@YJDZ,NJ=@NJ WHERE XSXH=@XSXH"
				DeleteCommand="DELETE T_XSXXB where XSXH=@XSXH">
				<DeleteParameters>
					<asp:Parameter Name="XSXH" Type="STRING" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="XSXH" Type="STRING" />
					<asp:Parameter Name="XSXM" Type="STRING" />
					<asp:Parameter Name="XYID" Type="INT32" />
					<asp:Parameter Name="ZYID" Type="INT32" />
					<asp:Parameter Name="XSLBID" Type="INT32" />
					<asp:Parameter Name="SJH" Type="STRING" />
					<asp:Parameter Name="YJDZ" Type="STRING" />
					<asp:Parameter Name="NJ" Type="INT32" />
				</UpdateParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LBMC] FROM [D_XSLBB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [XYMC] FROM [D_XYXXB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [ZYMC] FROM [D_ZYXXB]"></asp:SqlDataSource>
			<br />
			<table width="100%">
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
			DataKeyNames="XSXH" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
			AllowPaging="True" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="XSXH" HeaderText="学号" SortExpression="XSXH" ReadOnly="True">
					<ControlStyle Width="80px" />
					<ItemStyle Width="80px" Wrap="False" />
				</asp:BoundField>
				<asp:BoundField DataField="XSXM" HeaderText="姓名" SortExpression="XSXM">
					<ControlStyle Width="80px" />
					<ItemStyle Width="80px" Wrap="False" />
				</asp:BoundField>
				<asp:TemplateField HeaderText="学院" SortExpression="XYMC">
					<EditItemTemplate>
						&nbsp;<asp:DropDownList ID="xyDDL" runat="server" DataSourceID="SqlDataSource3" DataTextField="XYMC"
							DataValueField="ID" SelectedValue='<%# Bind("XYID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("XYMC") %>'></asp:Label>
					</ItemTemplate>
					<ControlStyle Width="150px" />
					<ItemStyle Width="150px" Wrap="False" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="专业" SortExpression="ZYMC">
					<EditItemTemplate>
						&nbsp;<asp:DropDownList ID="zyDDL" runat="server" DataSourceID="SqlDataSource4" DataTextField="ZYMC"
							DataValueField="ID" SelectedValue='<%# Bind("ZYID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("ZYMC") %>'></asp:Label>
					</ItemTemplate>
					<ControlStyle Width="120px" />
					<ItemStyle Width="120px" Wrap="False" />
				</asp:TemplateField>
				<asp:BoundField DataField="NJ" HeaderText="年级" />
				<asp:TemplateField HeaderText="类别" SortExpression="LBMC">
					<EditItemTemplate>
						<asp:DropDownList ID="lbDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="LBMC"
							DataValueField="ID" SelectedValue='<%# Bind("XSLBID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("LBMC") %>'></asp:Label>
					</ItemTemplate>
					<ControlStyle Width="30px" />
					<ItemStyle Width="30px" Wrap="False" />
				</asp:TemplateField>
				<asp:BoundField DataField="SJH" HeaderText="手机号" SortExpression="SJH" >
					<ControlStyle Width="100px" />
					<ItemStyle Width="100px" Wrap="False" />
				</asp:BoundField>
				<asp:BoundField DataField="YJDZ" HeaderText="邮件地址" SortExpression="YJDZ" >
					<ControlStyle Width="100px" />
					<ItemStyle Width="100px" Wrap="False" />
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
					<ControlStyle Width="50px" />
					<ItemStyle Width="50px" Wrap="False" />
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
