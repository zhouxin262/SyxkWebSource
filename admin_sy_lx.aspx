<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sy_lx.aspx.cs" Inherits="admin_sy_lx" %>
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
            DeleteCommand="DELETE FROM [D_SYLXB] WHERE [ID] = @ID" InsertCommand="INSERT INTO [D_SYLXB] ([LXMC]) VALUES (@LXMC)"
            SelectCommand="SELECT * FROM [D_SYLXB]" UpdateCommand="UPDATE [D_SYLXB] SET [LXMC] = @LXMC WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="LXMC" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="LXMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="LXMC" HeaderText="类型名称" SortExpression="LXMC">
                    <ItemStyle Width="300px" />
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
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="Azure" />
            <AlternatingRowStyle BackColor="White" />
            <EmptyDataTemplate>
                暂无数据
            </EmptyDataTemplate>
        </asp:GridView> 
        <div style="padding:5px 15px">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                类型名称:
                <asp:TextBox CssClass="text_input" ID="LXMCTextBox" runat="server" Text='<%# Bind("LXMC") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="添加新类型" />
                <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="取消" />
            </InsertItemTemplate>
        </asp:FormView></div>
    </form>
</body>
</html>
