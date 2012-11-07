<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_zzsyrj_bj.aspx.cs" Inherits="eadm_zzsyrj_bj" %>


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
            SelectCommand="SELECT [sqrs], [sprs], [SYBH], [SYSDD], [SYSID], [JSXM], [SYID], [SYKS], [SYRS], [SYXN], [SYXQ], [SYJJ], [SYXS], [SYMC], [SYXINGQ], [SQRID], [XSXM], [XYMC], [SJH], [ZYID], [XYID], [YJDZ], [LBMC], [XSLBID], [ZYMC], [ID], [XINGQMC], [SYJSID], [SYZ], [MC], [ZMC] FROM [v_ZZSJXMRSB] ORDER BY [SYMC]">
        </asp:SqlDataSource>
        <table width="100%">
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
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Width="100%" >
            <PagerSettings FirstPageText="��һҳ" LastPageText="���ҳ" Mode="NextPreviousFirstLast"
                NextPageText="��ҳ" PreviousPageText="��ҳ" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SYMC" HeaderText="ʵ������" ReadOnly="True" SortExpression="SYMC" />
                <asp:BoundField DataField="SYBH" HeaderText="ʵ����" ReadOnly="True" SortExpression="SYBH" />
                <asp:TemplateField HeaderText="ʵ��ص�" SortExpression="SYSMC">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SYSDD") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ʵ���ʦ" SortExpression="JSXM">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("JSXM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="����" SortExpression="SYRS">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("SYRS") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SYXN" HeaderText="ѧ��" ReadOnly="True" SortExpression="SYXN" />
                <asp:BoundField DataField="SYXQ" HeaderText="ѧ��" ReadOnly="True" SortExpression="SYXQ" />
                <asp:TemplateField HeaderText="�ܴ�" SortExpression="SYZ">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZMC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="����" SortExpression="SYXINGQ">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("XINGQMC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="��ʱ" SortExpression="SYKS">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="sqrs" HeaderText="��������" SortExpression="sqrs">
                    <ItemStyle Width="30px" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%#"eadm_zzsyrj_bj2.aspx?id=" +  Eval("ID") %>'>�༭��Ա</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EmptyDataTemplate>
                ��������
            </EmptyDataTemplate>
            <EditRowStyle BackColor="Azure" />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        &nbsp;</div>
    </form>
</body>
</html>
