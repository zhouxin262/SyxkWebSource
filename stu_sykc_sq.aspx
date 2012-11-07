<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_sykc_sq.aspx.cs" Inherits="stu_sykc_sq" %>

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
            SelectCommand="SELECT [ID], [SYBH], [SYMC], [KCMC], [JSXM], [SYSMC], [SYRS], [SYXN], [SYXINGQ], [SYXQ], [SYSDD], [XINGQMC], [ZMC], [MC], [sqrs], [sprs] FROM [V_YWCXSRSB]"
            
            >
        </asp:SqlDataSource>
        <br />
        <table width="100%">
        <tr><td align="center"><asp:Label ID="messageLabel" runat="server" Text="" ForeColor="red"></asp:Label></td></tr>
        <tr><td align="center">
        <asp:Label ID="label1" runat="server" Text="ɸѡ������"></asp:Label>
        <asp:TextBox ID="sxtjTextBox" runat ="server" Text= ""></asp:TextBox>
        <asp:Button ID="sxButton" runat = "server" Text = "��ʼɸѡ" OnClick="sxButton_Click" />
        <asp:Button ID="czButton" runat="server" Text="��ʾȫ��" OnClick="czButton_Click" />
        </td></tr>
        <tr><td> &nbsp</td></tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Width="100%" PageSize="20">
            <PagerSettings FirstPageText="��һҳ" LastPageText="���ҳ" Mode="NumericFirstLast"
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
                <asp:BoundField DataField="sqrs" HeaderText="������" SortExpression="sqrs" />
                <asp:TemplateField HeaderText="����׼" SortExpression="sprs">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Convert.ToString(Eval("sprs"))==""?0:Eval("sprs") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible ='<%# Convert.ToInt32(Eval("syrs"))-Convert.ToInt32(Eval("sqrs")) > 0?true:false %>' PostBackUrl='<%#"stu_sykc_sq2.aspx?id=" +  Eval("ID") %>'>����</asp:LinkButton>
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
        &nbsp;&nbsp;</div>
    </form>
</body>
</html>
