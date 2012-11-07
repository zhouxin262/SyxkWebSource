<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_gly.aspx.cs" Inherits="admin_gly" %>

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
        <asp:SqlDataSource  ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            DeleteCommand="DELETE FROM [T_GLYXXB] WHERE [DLM] = @DLM" InsertCommand="INSERT INTO [T_GLYXXB] ([DLM], [DLMM], [GLYXM],  [SJH], [GLYLX], [YJDZ]) VALUES (@DLM,@DLMM, @GLYXM, @SJH, @GLYLX, @YJDZ)"
            SelectCommand="SELECT [DLM], [GLYXM], [SJH], [GLYLX], [YJDZ] FROM [T_GLYXXB]" UpdateCommand="UPDATE [T_GLYXXB] SET [GLYXM] = @GLYXM, [SJH] = @SJH, [GLYLX] = @GLYLX, [YJDZ] = @YJDZ WHERE [DLM] = @DLM ">
            <DeleteParameters>
                <asp:Parameter Name="DLM" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="DLM" Type="String" />
                <asp:Parameter Name="GLYXM" Type="String" />
                <asp:Parameter Name="DLMM" Type="String" />
                <asp:Parameter Name="SJH" Type="String" />
                <asp:Parameter Name="GLYLX" Type="Int32" />
                <asp:Parameter Name="YJDZ" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
				<asp:Parameter Name="DLM" Type="String" />
				<asp:Parameter Name="DLMM" Type="String" DefaultValue="888888" />
				<asp:Parameter Name="GLYXM" Type="String" />
				<asp:Parameter Name="SJH" Type="String" />
				<asp:Parameter Name="GLYLX" Type="Int32" />
				<asp:Parameter Name="YJDZ" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="DLM" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
				<asp:BoundField DataField="DLM" HeaderText="登录名" ReadOnly="True" SortExpression="DLM" />
                <asp:BoundField DataField="GLYXM" HeaderText="姓名" SortExpression="GLYXM">
                </asp:BoundField>
                <asp:BoundField DataField="SJH" HeaderText="手机号" SortExpression="SJH">
                </asp:BoundField>
				<asp:TemplateField HeaderText="管理员类型" SortExpression="GLYLX">
					<EditItemTemplate>
						<asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("GLYLX") %>'>
							<asp:ListItem Value="0">系统管理员</asp:ListItem>
							<asp:ListItem Selected="True" Value="1">教务管理员</asp:ListItem>
							<asp:ListItem Value="2">实验管理员</asp:ListItem>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# getGLYLX(Convert.ToInt32(Eval("GLYLX"))) %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
                <asp:BoundField DataField="YJDZ" HeaderText="邮箱" SortExpression="YJDZ">
                </asp:BoundField>
				<asp:TemplateField ShowHeader="False">
					<EditItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
							Text="更新"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
							Text="取消"></asp:LinkButton>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
							Text="编辑"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确认要删除吗？');" CausesValidation="False" CommandName="Delete"
							Text="删除"></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                暂无数据
            </EmptyDataTemplate>
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="Azure"/>
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        &nbsp;<asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td align="right" style="width: 100px">
                            登录名：</td>
                        <td style="width: 147px">
                      <asp:TextBox CssClass="text_input" ID="DLMTextBox" runat="server" Text='<%# Bind("DLM") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 100px">
                            姓名：</td>
                        <td style="width: 147px">
                      <asp:TextBox CssClass="text_input" ID="GLYXMTextBox" runat="server" Text='<%# Bind("GLYXM") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 100px">
                            手机号：</td>
                        <td style="width: 147px">
                      <asp:TextBox CssClass="text_input" ID="SJHTextBox" runat="server" Text='<%# Bind("SJH") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                     <td align="right" style="width: 100px">
                            邮箱：</td>
                        <td style="width: 147px">
                      <asp:TextBox CssClass="text_input" ID="YJDZTextBox" runat="server" Text='<%# Bind("YJDZ") %>'></asp:TextBox></td>
                     
                    </tr>
                    <tr>
                          <td align="right" style="width: 100px">
                            管理员类型：</td>
                        <td style="width: 147px">
							<asp:DropDownList ID="GLYLXDDL" runat="server" SelectedValue='<%# Bind("GLYLX") %>' Width="153px">
								<asp:ListItem Value="0">系统管理员</asp:ListItem>
								<asp:ListItem Value="1">教务管理员</asp:ListItem>
								<asp:ListItem Value="2">实验管理员</asp:ListItem>
							</asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 26px">
                        </td>
                        <td style="width: 147px; height: 26px">
                            <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="添加管理员" />
                            <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="取消" /></td>
                    </tr>
                </table>
                <br />
            </InsertItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
