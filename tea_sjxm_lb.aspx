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
            <PagerSettings FirstPageText="��һҳ" LastPageText="���ҳ" Mode="NextPreviousFirstLast"
                NextPageText="��ҳ" PreviousPageText="��ҳ" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SYMC" HeaderText="ʵ������" SortExpression="SYMC" />
                <asp:BoundField DataField="KCMC" HeaderText="�γ�����" SortExpression="KCMC" />
                <asp:BoundField DataField="LBMC" HeaderText="ʵ�����" SortExpression="LBMC" />
                <asp:BoundField DataField="LXMC" HeaderText="ʵ������" SortExpression="LXMC" />
                <asp:BoundField DataField="XSLB" HeaderText="ѧ�����" SortExpression="XSLB" />
                <asp:BoundField DataField="SYXS" HeaderText="ѧʱ" SortExpression="SYXS" />
                <asp:BoundField DataField="NRDXZ" HeaderText="���϶�����" SortExpression="NRDXZ" />
                <asp:BoundField DataField="YRDXZ" HeaderText="���϶�����" SortExpression="YRDXZ" />
                <asp:BoundField DataField="SYJJ" HeaderText="ʵ����" SortExpression="SYJJ" />
                <asp:BoundField DataField="ZTMS" HeaderText="ʵ����" SortExpression="ZTMS" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton Visible=<%# Convert.ToInt32(Eval("SQZT"))<=0?true:false %> ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="��������" OnClientClick="return confirm('ȷ��Ҫ����������');"></asp:LinkButton>
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
