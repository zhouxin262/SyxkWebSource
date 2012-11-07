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
        <asp:Label ID="label1" runat="server" Text="筛选条件："></asp:Label>
        <asp:TextBox ID="sxtjTextBox" runat ="server" Text= ""></asp:TextBox>
        <asp:Button ID="sxButton" runat = "server" Text = "开始筛选" OnClick="sxButton_Click" />
        <asp:Button ID="czButton" runat="server" Text="显示全部" OnClick="czButton_Click" />
        </td></tr>
        <tr><td> &nbsp</td></tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Width="100%" PageSize="20">
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NumericFirstLast"
                NextPageText="下页" PreviousPageText="上页" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SYMC" HeaderText="实验名称" ReadOnly="True" SortExpression="SYMC" />
                <asp:BoundField DataField="SYBH" HeaderText="实验编号" ReadOnly="True" SortExpression="SYBH" />
                <asp:TemplateField HeaderText="实验地点" SortExpression="SYSMC">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SYSDD") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="实验教师" SortExpression="JSXM">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("JSXM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="人数" SortExpression="SYRS">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("SYRS") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              
                <asp:TemplateField HeaderText="周次" SortExpression="SYZ">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZMC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="星期" SortExpression="SYXINGQ">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("XINGQMC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="课时" SortExpression="SYKS">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="sqrs" HeaderText="已申请" SortExpression="sqrs" />
                <asp:TemplateField HeaderText="已批准" SortExpression="sprs">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Convert.ToString(Eval("sprs"))==""?0:Eval("sprs") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible ='<%# Convert.ToInt32(Eval("syrs"))-Convert.ToInt32(Eval("sqrs")) > 0?true:false %>' PostBackUrl='<%#"stu_sykc_sq2.aspx?id=" +  Eval("ID") %>'>申请</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EmptyDataTemplate>
                暂无数据
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
