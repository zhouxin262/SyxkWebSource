<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aadm_jsxx_bj.aspx.cs" Inherits="aadm_jsxx_bj" %>

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
				SelectCommand="SELECT [GZH], [JSXM], [ZC], [XYMC], [LBMC], [SJH], [YJDZ], [JSJJ], [XYID], [JSLB] FROM [V_JSJBXXB] ORDER BY [GZH]"
				UpdateCommand="UPDATE T_JSXXB SET JSXM=@JSXM,ZC=@ZC,SJH=@SJH,YJDZ=@YJDZ,JSJJ=@JSJJ,XYID=@XYID WHERE GZH=@GZH"
				DeleteCommand="UPDATE T_JSXXB SET SFYX=0 WHERE GZH=@GZH" >
				<DeleteParameters>
					<asp:Parameter Name="GZH" Type="STRING" />
				</DeleteParameters>
				<UpdateParameters>
					<asp:Parameter Name="GZH" Type="STRING" />
					<asp:Parameter Name="JSXM" Type="STRING" />
					<asp:Parameter Name="ZC" Type="STRING" />
					<asp:Parameter Name="SJH" Type="STRING" />
					<asp:Parameter Name="YJDZ" Type="STRING" />
					<asp:Parameter Name="JSJJ" Type="STRING" />
					<asp:Parameter Name="XYID" Type="INT32" />
					
				</UpdateParameters>
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [LBMC] FROM [D_JSLBB]"></asp:SqlDataSource>
			<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [XYMC] FROM [D_XYXXB]"></asp:SqlDataSource>
			<br />
			&nbsp;<table width="100%">
				<tr>
					<td align="center">
						<asp:Label ID="messageLabel" runat="server" ForeColor="red" Text=""></asp:Label></td>
				</tr>
				<tr>
					<td align="center">
						<asp:Label ID="label1" runat="server" Text="ɸѡ������"></asp:Label>
						<asp:TextBox ID="sxtjTextBox" runat="server" Text=""></asp:TextBox>
						<asp:Button ID="sxButton" runat="server" OnClick="sxButton_Click" Text="��ʼɸѡ" />
						<asp:Button ID="czButton" runat="server" OnClick="czButton_Click" Text="��ʾȫ��" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
				</tr>
			</table>
		</div>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
			DataKeyNames="GZH" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="100%">
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<RowStyle BackColor="#EFF3FB" />
			<Columns>
				<asp:BoundField DataField="GZH" HeaderText="���ʺ�" SortExpression="GZH" ReadOnly="True">
					<ControlStyle Width="40px" />
					<ItemStyle Width="40px" />
				</asp:BoundField>
				<asp:BoundField DataField="JSXM" HeaderText="����" SortExpression="JSXM">
					<ControlStyle Width="70px" />
					<ItemStyle Width="70px" />
				</asp:BoundField>
				<asp:BoundField DataField="ZC" HeaderText="ְ��" SortExpression="ZC">
					<ControlStyle Width="60px" />
					<ItemStyle Height="60px" />
				</asp:BoundField>
				<asp:TemplateField HeaderText="ѧԺ" SortExpression="XYMC">
					<EditItemTemplate>
						<asp:DropDownList ID="xyDDL" runat="server" DataSourceID="SqlDataSource3" DataTextField="XYMC"
							DataValueField="ID" SelectedValue='<%# Bind("XYID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="xyLabel" runat="server" Text='<%# Eval("XYMC") %>'></asp:Label>
					</ItemTemplate>
					<ControlStyle Width="140px" />
					<ItemStyle Width="140px" />
				</asp:TemplateField>
				<asp:BoundField DataField="SJH" HeaderText="�ֻ���" SortExpression="SJH">
					<ControlStyle Width="100px" />
					<ItemStyle Width="100px" />
				</asp:BoundField>
				<asp:BoundField DataField="YJDZ" HeaderText="����" SortExpression="YJDZ">
					<ControlStyle Width="150px" />
					<ItemStyle Width="150px" />
				</asp:BoundField>
				<asp:TemplateField ShowHeader="False">
					<EditItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
							Text="����"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
							Text="ȡ��"></asp:LinkButton>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
							Text="�༭"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('ȷ��Ҫɾ����');"
							CausesValidation="False" CommandName="Delete" Text="ɾ��"></asp:LinkButton>
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
			<PagerSettings FirstPageText="��һҳ" LastPageText="���ҳ" Mode="NextPreviousFirstLast"
				NextPageText="��ҳ" PreviousPageText="��ҳ" />
		</asp:GridView>
		&nbsp;&nbsp;<br />
		&nbsp;
	</form>
</body>
</html>
