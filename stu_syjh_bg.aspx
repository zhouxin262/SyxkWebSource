<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_syjh_bg.aspx.cs" Inherits="stu_syjh_bg" %>

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
			&nbsp; &nbsp; &nbsp;
		</div>
		<asp:SqlDataSource ID="sysSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT [ID], [SYSDD] FROM [T_SYSXXB] WHERE ([ID] <> @ID) ORDER BY [SYSDD]">
			<SelectParameters>
				<asp:Parameter DefaultValue="0" Name="ID" Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource><asp:SqlDataSource ID="zSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT [ZID], [ZMC] FROM [D_ZZDB] WHERE ([ZID] <> @ZID) ORDER BY [ZID]">
			<SelectParameters>
				<asp:Parameter DefaultValue="0" Name="ZID" Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>
		<asp:SqlDataSource ID="xnSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT distinct syxn from t_syjhb order by syxn"></asp:SqlDataSource>
		<table>
			<tr>
				<td>
					ѡ��ѧ�꣺</td>
				<td>
					<asp:DropDownList ID="xnDDL" runat="server" DataSourceID="xnSDS" DataTextField="syxn"
						DataValueField="syxn">
					</asp:DropDownList></td>
				<td style="width: 82px">
				</td>
			</tr>
			<tr>
				<td>
					ѡ��ѧ�ڣ�</td>
				<td>
					<asp:DropDownList ID="xqDDL" runat="server">
						<asp:ListItem Value="1">��һѧ��</asp:ListItem>
						<asp:ListItem Value="2">�ڶ�ѧ��</asp:ListItem>
					</asp:DropDownList></td>
				<td style="width: 82px">
				</td>
			</tr>
						<tr>
				<td>
					ѡ���ܣ�</td>
				<td>
					<asp:DropDownList ID="zDDL" runat="server" DataSourceID="zSDS" DataTextField="ZMC" DataValueField="ZID">
						
					</asp:DropDownList></td>
				<td style="width: 82px">
					<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ȷ��" Width="78px" /></td>
			</tr>
		</table>
		<br />
		&nbsp;
		<asp:Table ID="Table1" runat="server" Height="360px" Width="718px" GridLines="Both" BackColor="#FFC0C0" ForeColor="#404040">
			<asp:TableRow runat="server" Height="30px">
				<asp:TableCell Width="80" ID="TableCell00" runat="server">�γ�</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell01" runat="server">��һ</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell02" runat="server">�ܶ�</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell03" runat="server">����</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell04" runat="server">����</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell05" runat="server">����</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell06" runat="server">����</asp:TableCell>
				<asp:TableCell Width="80" ID="TableCell07" runat="server">����</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow runat="server" Height="70px">
				<asp:TableCell ID="TableCell10" runat="server">8:00-10:00</asp:TableCell>
				<asp:TableCell ID="TableCell11" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell12" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell13" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell14" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell15" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell16" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell17" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow runat="server" Height="70px">
				<asp:TableCell ID="TableCell20" runat="server">10:00-12:00</asp:TableCell>
				<asp:TableCell ID="TableCell21" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell22" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell23" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell24" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell25" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell26" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell27" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow runat="server" Height="70px">
				<asp:TableCell ID="TableCell30" runat="server">12:00-14:00</asp:TableCell>
				<asp:TableCell ID="TableCell31" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell32" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell33" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell34" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell35" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell36" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell37" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow runat="server" Height="70px">
				<asp:TableCell ID="TableCell40" runat="server">14:00-16:00</asp:TableCell>
				<asp:TableCell ID="TableCell41" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell42" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell43" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell44" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell45" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell46" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell47" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow runat="server" Height="70px">
				<asp:TableCell ID="TableCell50" runat="server">16:00-18:00</asp:TableCell>
				<asp:TableCell ID="TableCell51" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell52" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell53" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell54" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell55" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell56" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell57" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow runat="server" Height="70px">
				<asp:TableCell ID="TableCell60" runat="server">19:00-21:00</asp:TableCell>
				<asp:TableCell ID="TableCell61" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell62" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell63" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell64" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell65" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell66" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell67" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="TableRow1" runat="server" Height="70px">
				<asp:TableCell ID="TableCell70" runat="server">21:00-23:00</asp:TableCell>
				<asp:TableCell ID="TableCell71" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell72" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell73" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell74" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell75" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell76" runat="server">���ް���</asp:TableCell>
				<asp:TableCell ID="TableCell77" runat="server">���ް���</asp:TableCell>
			</asp:TableRow>
		</asp:Table>
	</form>
</body>
</html>
