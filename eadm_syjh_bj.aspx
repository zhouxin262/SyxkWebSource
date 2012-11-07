<%@ Page Language="C#" AutoEventWireup="true" CodeFile="eadm_syjh_bj.aspx.cs" Inherits="eadm_syjh_bj" %>

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
            SelectCommand="SELECT [ID],[KCID], [SYID], [SYXN] ,[SYXQ],[SYBH], [SYMC], [KCMC], [SYRS], [SYKS], [SYSID], [SYJSID], [SYSMC],[SYSDD],  [SYXN], [SYXQ], [SYZ], [SYXINGQ],[MC],[XINGQMC],[ZMC] FROM [V_SYJHXXB] ORDER BY [SYMC], [SYBH]"
            UpdateCommand="UPDATE T_SYJHB SET SYSID=@SYSID,SYJSID=@SYJSID,SYKS=@SYKS,SYRS=@SYRS,SYZ=@SYZ,SYXINGQ=@SYXINGQ WHERE ID=@ID"
            DeleteCommand="Delete from T_SYJHB where ID=@ID"
            >
            <UpdateParameters>
            <asp:Parameter Name="SYSID" Type="Int32" />
            <asp:Parameter Name="SYJSID" Type="String" />
            <asp:Parameter Name="SYKS" Type="Int32" />
            <asp:Parameter Name="SYRS" Type="Int32" />
            <asp:Parameter Name="SYZ" Type="Int32" />
            <asp:Parameter Name="SYXINGQ" Type="Int32" />
            <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
            <asp:Parameter Name="ID" Type="int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SYSSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            SelectCommand="SELECT [ID], [SYSDD], [SYSMC] FROM [T_SYSXXB]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="JSSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            SelectCommand="SELECT [JSXM], [GZH] FROM [V_SYJSJBXXB]  ORDER BY [JSXM]">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="JSLB" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="SFYX" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SKSJSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            SelectCommand="SELECT [ID], [MC] FROM [D_SKSJB] ORDER BY [ID]"></asp:SqlDataSource>
		<br />
		&nbsp;<table width="100%">
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
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="ID" OnRowEditing="GridView1_RowEditing" Width="100%" OnRowUpdating="GridView1_RowUpdating" PageSize="20" >
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NumericFirstLast"
                NextPageText="下页" PreviousPageText="上页" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
             
                <asp:BoundField DataField="SYMC" HeaderText="实验名称" ReadOnly="True" SortExpression="SYMC" />
                <asp:BoundField DataField="SYBH" HeaderText="实验组号" ReadOnly="True" SortExpression="SYBH" />
                <asp:BoundField DataField="KCMC" HeaderText="实验课程" SortExpression="KCMC" ReadOnly="True" />
                <asp:TemplateField HeaderText="实验教师">
                   <EditItemTemplate>
                        &nbsp;<asp:DropDownList ID="JSDDL" runat="server" SelectedValue='<%# Bind("SYJSID") %>' DataSourceID="JSSDS" DataTextField="JSXM" DataValueField="GZH">
                            
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("JSXM") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
                        &nbsp;<asp:DropDownList ID="SYXINGQDDL" runat="server" SelectedValue='<%# Bind("SYXINGQ") %>'>
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
                        &nbsp;<asp:DropDownList ID="KSDDL" runat="server" SelectedValue='<%# Bind("SYKS") %>' DataSourceID="SKSJSDS" DataTextField="MC" DataValueField="ID">
                            
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
              
                <asp:TemplateField HeaderText="人数" SortExpression="SYRS">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="text_input" ID="TextBox5" runat="server" Text='<%# Bind("SYRS") %>' Width="70px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("SYRS") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtona" runat="server"  Text='<%# Convert.ToInt32(Eval("sqzt"))==1?"关闭选课":"重新开启" %>' PostBackUrl='<%#"eadm_syjh_bj.aspx?flag=1&id=" +  Eval("ID") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton>
                        <asp:Label ID="KCIDLabel" runat="server" Text='<%# Eval("KCID") %>' Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除"></asp:LinkButton>
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
        </div>
    </form>
</body>
</html>
