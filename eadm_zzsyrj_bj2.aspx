<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_zzsyrj_bj2.aspx.cs" Inherits="eadm_zzsyrj_bj2" %>

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
            SelectCommand="SELECT [ID],[SYJJ], [SYBH], [SYMC], [JSXM], [SYSDD], [SYRS], [ZMC], [XINGQMC], [SYXN], [SYXQ], [MC],[SQRID],[XSXM] FROM [V_ZZSJXMJHB] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            SelectCommand="SELECT [ID],[SHR], [XSXH], [XSXM], [XYID], [ZYID], [XSLBID], [SJH], [YJDZ], [ZYMC], [XYMC] FROM [V_ZZXMXKB] WHERE ([SYJHID] = @SYJHID)"
            DeleteCommand="delete from t_syxkb where ID=@ID"
            >
            
            <SelectParameters>
                <asp:QueryStringParameter Name="SYJHID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        实验基本信息：<br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID"
            DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="50px" Width="790px">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <Fields>
                <asp:BoundField DataField="SYMC" HeaderText="实验名称" SortExpression="SYMC" />
				<asp:BoundField DataField="SQRID" HeaderText="申请人学号" SortExpression="SQRID" />
				<asp:BoundField DataField="XSXM" HeaderText="申请人姓名" SortExpression="XSXM" />
                <asp:BoundField DataField="SYBH" HeaderText="实验编号" SortExpression="SYBH" />
                <asp:BoundField DataField="JSXM" HeaderText="教师" SortExpression="JSXM" />
                <asp:BoundField DataField="SYSDD" HeaderText="实验地点" SortExpression="SYSDD" />
                <asp:BoundField DataField="SYRS" HeaderText="实验人数" SortExpression="SYRS" />
                <asp:BoundField DataField="SYXN" HeaderText="学年" SortExpression="SYXN" />
                <asp:BoundField DataField="SYXQ" HeaderText="学期" SortExpression="SYXQ" />
                <asp:BoundField DataField="ZMC" HeaderText="实验周" SortExpression="ZMC" />
                <asp:BoundField DataField="XINGQMC" HeaderText="实验星期" SortExpression="XINGQMC" />
                <asp:BoundField DataField="MC" HeaderText="实验课时" SortExpression="MC" />
				<asp:BoundField DataField="SYJJ" HeaderText="实验简介" SortExpression="SYJJ" />
            </Fields>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:DetailsView>
        实验人员信息：<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="ID">
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
                NextPageText="下页" PreviousPageText="上页" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EmptyDataTemplate>
                暂无数据
            </EmptyDataTemplate>
            <EditRowStyle BackColor="Azure" />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="XSXH" HeaderText="学号" SortExpression="XSXH" />
                <asp:BoundField DataField="XSXM" HeaderText="姓名" SortExpression="XSXM" />
                <asp:BoundField DataField="XYMC" HeaderText="学院" SortExpression="XYMC" />
                <asp:BoundField DataField="ZYMC" HeaderText="专业" SortExpression="ZYMC" />
                <asp:BoundField DataField="SHR" HeaderText="审核人" SortExpression="SHR" />
                <asp:BoundField DataField="SJH" HeaderText="手机号" SortExpression="SJH" />
                <asp:BoundField DataField="YJDZ" HeaderText="邮件地址" SortExpression="YJDZ" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除" OnClientClick="return confirm('确认要删除吗？');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
        实验人员添加<br />
            
                学号:
                <asp:TextBox CssClass="text_input" ID="XSXHTextBox" runat="server" Text='<%# Bind("SQRID") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server"  Text="添加学生" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server"  Text="刷新" OnClick="Button2_Click"  />

    </div>
    </form>
</body>
</html>
