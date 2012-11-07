<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tea_syap_lb.aspx.cs" Inherits="tea_syap_lb" %>

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
            SelectCommand="SELECT [ID],[KCID], [SYID], [SYBH], [SYMC], [KCMC], [SYRS], [SYKS], [SYSID], [SYJSID], [SYSMC],[SYSDD], [JSXM], [SYXN], [SYXQ], [SYZ], [SYXINGQ],[MC],[XINGQMC],[ZMC] FROM [V_SYJHXXB] ORDER BY [SYMC], [SYBH]">
           
        </asp:SqlDataSource>
    
    </div>
    <table width="100%">
				<tr>
					<td align="center">
						<asp:Label ID="messageLabel" runat="server" ForeColor="red" Text=""></asp:Label></td>
				</tr>
				<tr>
					<td align="center">
						<asp:Label ID="label1" runat="server" Text="筛选条件："></asp:Label>
						<asp:TextBox ID="sxtjTextBox" runat="server" Text=""></asp:TextBox>
						<asp:Button ID="sxButton" runat="server" OnClick="sxButton_Click" Text="开始筛选" />
						<asp:Button ID="czButton" runat="server" OnClick="czButton_Click" Text="显示全部" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;</td>
				</tr>
			</table>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Width="100%">
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
                NextPageText="下页" PreviousPageText="上页" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="SYMC" HeaderText="实验名称" ReadOnly="True" SortExpression="SYMC" />
                <asp:BoundField DataField="SYBH" HeaderText="实验编号" ReadOnly="True" SortExpression="SYBH" />
                <asp:BoundField DataField="KCMC" HeaderText="实验课程" ReadOnly="True" SortExpression="KCMC" />
                <asp:TemplateField HeaderText="实验地点" SortExpression="SYSMC">
                    <EditItemTemplate>
                        &nbsp;<asp:DropDownList ID="SYSDDL" runat="server" DataSourceID="SYSSDS" DataTextField="SYSDD"
                            DataValueField="ID" SelectedValue='<%# Bind("SYSID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SYSDD") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="实验教师" SortExpression="JSXM">
                    <EditItemTemplate>
                        &nbsp;<asp:DropDownList ID="SYJSDDL" runat="server" DataSourceID="JSSDS" DataTextField="JSXM"
                            DataValueField="GZH" SelectedValue='<%# Bind("SYJSID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("JSXM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="人数" SortExpression="SYRS">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="text_input" ID="TextBox5" runat="server" Text='<%# Bind("SYRS") %>' Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("SYRS") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SYXN" HeaderText="学年" ReadOnly="True" SortExpression="SYXN" />
                <asp:BoundField DataField="SYXQ" HeaderText="学期" ReadOnly="True" SortExpression="SYXQ" />
                <asp:TemplateField HeaderText="周次" SortExpression="SYZ">
                    <EditItemTemplate>
                        <asp:DropDownList ID="SYZDDL" runat="server" SelectedValue='<%# Bind("SYZ") %>'>
                            <asp:ListItem Value="0">_暂无_</asp:ListItem>
                            <asp:ListItem Value="1">第一周</asp:ListItem>
                            <asp:ListItem Value="2">第二周</asp:ListItem>
                            <asp:ListItem Value="3">第三周</asp:ListItem>
                            <asp:ListItem Value="4">第四周</asp:ListItem>
                            <asp:ListItem Value="5">第五周</asp:ListItem>
                            <asp:ListItem Value="6">第六周</asp:ListItem>
                            <asp:ListItem Value="7">第七周</asp:ListItem>
                            <asp:ListItem Value="8">第八周</asp:ListItem>
                            <asp:ListItem Value="9">第九周</asp:ListItem>
                            <asp:ListItem Value="10">第十周</asp:ListItem>
                            <asp:ListItem Value="11">第十一周</asp:ListItem>
                            <asp:ListItem Value="12">第十二周</asp:ListItem>
                            <asp:ListItem Value="13">第十三周</asp:ListItem>
                            <asp:ListItem Value="14">第十四周</asp:ListItem>
                            <asp:ListItem Value="15">第十五周</asp:ListItem>
                            <asp:ListItem Value="16">第十六周</asp:ListItem>
                            <asp:ListItem Value="17">第十七周</asp:ListItem>
                            <asp:ListItem Value="18">第十八周</asp:ListItem>
                            <asp:ListItem Value="19">第十九周</asp:ListItem>
                            <asp:ListItem Value="20">第二十周</asp:ListItem>
                            <asp:ListItem Value="21">第二十一周</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZMC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="星期" SortExpression="SYXINGQ">
                    <EditItemTemplate>
                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("SYXINGQ") %>'>
                            <asp:ListItem Value="0">_暂无_</asp:ListItem>
                            <asp:ListItem Value="1">一</asp:ListItem>
                            <asp:ListItem Value="2">二</asp:ListItem>
                            <asp:ListItem Value="3">三</asp:ListItem>
                            <asp:ListItem Value="4">四</asp:ListItem>
                            <asp:ListItem Value="5">五</asp:ListItem>
                            <asp:ListItem Value="6">六</asp:ListItem>
                            <asp:ListItem Value="0">日</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("XINGQMC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="课时" SortExpression="SYKS">
                    <EditItemTemplate>
                        &nbsp;<asp:DropDownList ID="KSDDL" runat="server" DataSourceID="SKSJSDS" DataTextField="MC"
                            DataValueField="ID" SelectedValue='<%# Bind("SYKS") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MC") %>'></asp:Label>
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
    </form>
</body>
</html>
