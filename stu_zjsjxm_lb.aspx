<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_zjsjxm_lb.aspx.cs" Inherits="stu_zjsjxm_lb" %>

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
            SelectCommand="SELECT ztms,[ID], [SJXMMC],[XMJJ], [SQRID], [SQZT],[XSXM] FROM [V_ZZSJXMSQB]"
            DeleteCommand="delete from t_zzsjxmb where id=@id">
			<DeleteParameters>
				<asp:Parameter Name="id" Type="int32" />
			</DeleteParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Width="100%">
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
                NextPageText="下页" PreviousPageText="上页" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SJXMMC" HeaderText="实验名称" SortExpression="SJXMMC" />
                
                <asp:BoundField DataField="XMJJ" HeaderText="实验简介" SortExpression="XMJJ" />
                <asp:BoundField DataField="ZTMS" HeaderText="申请状态" SortExpression="ZTMS" />
				<asp:TemplateField ShowHeader="False">
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" Visible='<%# Convert.ToInt32(Eval("SQZT"))<=0?true:false %>' CausesValidation="False" CommandName="Delete"
							Text="撤销申请"></asp:LinkButton>
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
