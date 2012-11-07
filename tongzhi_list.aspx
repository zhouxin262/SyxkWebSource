<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tongzhi_list.aspx.cs" Inherits="tongzhi_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html >
<head id="Head1" runat="server">
    <title>通知</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/Peace.jpg">
    <form id="form1" runat="server">
    <table align="center" id="Table5" style="width: 80%;
			height: 218px" cellspacing="1" cellpadding="1" border="1">
			
			<tr height="100px">
				<td align="center">
	<asp:GridView id="GridView1" runat="server" ForeColor="#333333" PageSize="20" Width="100%" GridLines="None" DataSourceID="SqlDataSource1" DataKeyNames="ID" CellPadding="4" AutoGenerateColumns="False" AllowPaging="True">
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NumericFirstLast"
                NextPageText="下页" PreviousPageText="上页"  />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"  />
            <Columns>
                <asp:TemplateField HeaderText="标题" SortExpression="BiaoTi">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("BiaoTi") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" Width="200px" Wrap="False" />
                    <ControlStyle Width="200px" />
                    <FooterStyle Wrap="False" />
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:BoundField DataField="faburen" HeaderText="发布人" SortExpression="faburen">
                    <ItemStyle HorizontalAlign="Left"  />
                </asp:BoundField>
                <asp:TemplateField HeaderText="发布时间" SortExpression="faburen">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("faburen") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left"  />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%#"tongzhi.aspx?id=" +  Eval("ID") %>'>查看详情</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB"  />
            <EmptyDataTemplate>
                暂无数据
            </EmptyDataTemplate>
            <EditRowStyle BackColor="Azure"  />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333"  />
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center"  />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White"  />
            <AlternatingRowStyle BackColor="White"  />
        </asp:GridView>
		</td></tr>
		<tr>
		<td align="center" height="20">
			
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input id="Button2" Width="64px" type="button" value="关闭" language="javascript" onclick="window.close();" /></td></tr></table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            SelectCommand="SELECT [ID], [BIAOTI], [NEIRONG], [SHIJIAN], [FABUREN] FROM [T_GONGGAO] ORDER BY [SHIJIAN] DESC">
        </asp:SqlDataSource>
    </form>
</body>
</html>

