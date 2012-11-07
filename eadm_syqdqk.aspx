<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_syqdqk.aspx.cs" Inherits="eadm_syqdqk" %>

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
			&nbsp;<asp:SqlDataSource ID="KCSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [kcbh],  [KCMC]  FROM [V_KCXXB]"></asp:SqlDataSource><asp:SqlDataSource ID="SYSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [SYMC], [ID] FROM [V_SYJBXXB] WHERE ([KCBH] = @KCBH) ORDER BY [SYMC]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="KCDDL" Name="KCBH" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            &nbsp;
			<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
			<table>
				<tr>
					<td align="right" style="width: 100px">
                        课程：</td>
					<td style="width: 147px"><asp:DropDownList ID="KCDDL" runat="server" DataSourceID="KCSDS" DataTextField="KCMC" DataValueField="kcbh" Width="185px" AutoPostBack="True" >
                    </asp:DropDownList></td>
				</tr>
				<tr>
					<td align="right" style="width: 100px; height: 24px;">
                        实验：</td>
					<td style="width: 147px; height: 24px;">
						<asp:DropDownList ID="SYDDL" runat="server" DataSourceID="SYSDS" DataTextField="SYMC" DataValueField="ID" Width="185px">
						</asp:DropDownList></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right">
                        <asp:Button runat="server"  ID="btnExport"  Text="导出查看" OnClick="btnExport_Click" /></td>
				</tr>
			</table>
			<br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
			</div>

	</form>
</body>
</html>
