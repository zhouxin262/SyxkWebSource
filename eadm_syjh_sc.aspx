﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_syjh_sc.aspx.cs" Inherits="eadm_syjh_sc" %>

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
				SelectCommand="SELECT [ID], [SYMC], [KCID], [KCMC], [SYLBID], [SYLXID], [SYYQID], [LBMC], [LXMC], [SYZLBID],[XSLB],[SYXS],[NRDXZ],[YRDXZ],[SYJJ],[YQMC] FROM [V_SYJBXXB] ORDER BY [SYMC],[KCMC]"
				UpdateCommand="UPDATE T_SYXXB SET SYMC=@SYMC,KCID=@KCID,SYLBID=@SYLBID,SYLXID=@SYLXID,SYYQID=@SYYQID,SYZLBID=@SYZLBID,SYXS=@SYXS,NRDXZ=@NRDXZ,YRDXZ=@YRDXZ,SYJJ=@SYJJ WHERE ID=@ID"
				DeleteCommand="DELETE FROM T_SYXXB WHERE ID=@ID">
				<DeleteParameters>
					<asp:Parameter Name="ID" Type="STRING" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="ID" Type="INT32" />
					<asp:Parameter Name="SYMC" Type="STRING" />
					<asp:Parameter Name="KCID" Type="INT32" />
					<asp:Parameter Name="SYLBID" Type="INT32" />
					<asp:Parameter Name="SYLXID" Type="INT32" />
					<asp:Parameter Name="SYYQID" Type="INT32" />
					<asp:Parameter Name="SYZLBID" Type="INT32" />
					<asp:Parameter Name="SYXS" Type="INT32" />
					<asp:Parameter Name="NRDXZ" Type="STRING" />
					<asp:Parameter Name="YRDXZ" Type="STRING" />
					<asp:Parameter Name="SYJJ" Type="STRING" />
				</UpdateParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SYLBSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LBMC] FROM [D_SYLBB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="SYLXSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LXMC] FROM [D_SYLXB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="SYYQSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [YQMC] FROM [D_SYYQB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="XSLBSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LBMC] FROM [D_XSLBB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="KCSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [KCMC] FROM [V_KCXXB]"></asp:SqlDataSource>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
			DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
			AllowPaging="True" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="SYMC" HeaderText="实验名称" SortExpression="实验名称" />
				<asp:TemplateField HeaderText="课程名称" SortExpression="KCMC">
					<EditItemTemplate>
						<asp:DropDownList ID="KCDDL" runat="server" DataSourceID="KCSDS" DataTextField="KCMC"
							DataValueField="ID" SelectedValue='<%# Bind("KCID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("KCMC") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="实验类别" SortExpression="LBMC">
					<EditItemTemplate>
						<asp:DropDownList ID="SYLBDDL" runat="server" DataSourceID="SYLBSDS" DataTextField="LBMC"
							DataValueField="ID" SelectedValue='<%# Bind("SYLBID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("LBMC") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="实验类型" SortExpression="LXMC">
					<EditItemTemplate>
						<asp:DropDownList ID="SYLXDDL" runat="server" DataSourceID="SYLXSDS" DataTextField="LXMC"
							DataValueField="ID" SelectedValue='<%# Bind("SYLXID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("LXMC") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="学生类别" SortExpression="XSLB">
					<EditItemTemplate>
						<asp:DropDownList ID="XSLBDDL" runat="server" DataSourceID="XSLBSDS" DataTextField="LBMC"
							DataValueField="ID" SelectedValue='<%# Bind("SYZLBID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label4" runat="server" Text='<%# Bind("XSLB") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="实验要求" SortExpression="YQMC">
					<EditItemTemplate>
						<asp:DropDownList ID="SYYQDDL" runat="server" DataSourceID="SYYQSDS" DataTextField="YQMC"
							DataValueField="ID" SelectedValue='<%# Bind("SYYQID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label5" runat="server" Text='<%# Bind("LXMC") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:BoundField DataField="SYXS" HeaderText="学时" SortExpression="SYXS" />
				<asp:TemplateField>
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" 
							PostBackUrl='<%#"eadm_syjh_sc2.aspx?id=" +  Eval("ID") %>'>生成计划</asp:LinkButton>
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
