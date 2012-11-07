<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_xy_xx.aspx.cs" Inherits="admin_xy_xx" %>
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
            SelectCommand="SELECT [ID], [XYMC] FROM [D_XYXXB] ORDER BY [ID]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [D_XYXXB] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [D_XYXXB] ([XYMC]) VALUES (@XYMC)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [D_XYXXB] SET [XYMC] = @XYMC WHERE [ID] = @original_ID">
			<DeleteParameters>
				<asp:Parameter Name="original_ID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="XYMC" Type="String" />
				<asp:Parameter Name="original_ID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="XYMC" Type="String" />
			</InsertParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="XYMC" HeaderText="学院名称" SortExpression="XYMC">
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
            <EmptyDataTemplate>
                暂无数据
            </EmptyDataTemplate>
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="Azure"/>
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <div style="padding:5px 15px">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                学院名称:
                <asp:TextBox CssClass="text_input" ID="XYMCTextBox" runat="server" Text='<%# Bind("XYMC") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="添加学院" />
                <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="取消" />
            </InsertItemTemplate>
        </asp:FormView></div>
    </form>
</body>
</html>
