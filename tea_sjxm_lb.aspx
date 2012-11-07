<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tea_sjxm_lb.aspx.cs" Inherits="tea_sjxm_lb" %>

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
            SelectCommand="SELECT [ID], [SYMC], [KCID], [KCMC], [SYLBID], [SYLXID], [SYYQID], [LBMC], [LXMC], [SYZLBID], [XSLB], [SYXS], [NRDXZ], [YRDXZ], [SYJJ], [YQMC], [SQRID], [SQZT],[ZTMS] FROM [V_SYSJXMXXB]"
            DeleteCommand="delete from t_syxxb where id=@id"
            
            >
            <DeleteParameters>
                <asp:Parameter Name="id" Type ="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
       
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Width="100%">
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
                NextPageText="下页" PreviousPageText="上页" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SYMC" HeaderText="实验名称" SortExpression="SYMC" />
                <asp:BoundField DataField="KCMC" HeaderText="课程名称" SortExpression="KCMC" />
                <asp:BoundField DataField="LBMC" HeaderText="实验类别" SortExpression="LBMC" />
                <asp:BoundField DataField="LXMC" HeaderText="实验类型" SortExpression="LXMC" />
                <asp:BoundField DataField="XSLB" HeaderText="学生类别" SortExpression="XSLB" />
                <asp:BoundField DataField="SYXS" HeaderText="学时" SortExpression="SYXS" />
                <asp:BoundField DataField="NRDXZ" HeaderText="拟认定性质" SortExpression="NRDXZ" />
                <asp:BoundField DataField="YRDXZ" HeaderText="已认定性质" SortExpression="YRDXZ" />
                <asp:BoundField DataField="SYJJ" HeaderText="实验简介" SortExpression="SYJJ" />
                <asp:BoundField DataField="ZTMS" HeaderText="实验简介" SortExpression="ZTMS" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton Visible=<%# Convert.ToInt32(Eval("SQZT"))<=0?true:false %> ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="撤销申请" OnClientClick="return confirm('确认要撤销申请吗？');"></asp:LinkButton>
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
        &nbsp;</div>
    </form>
</body>
</html>
