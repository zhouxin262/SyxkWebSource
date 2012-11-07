<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_zy_xx.aspx.cs" Inherits="admin_zy_xx" %>
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
            DeleteCommand="DELETE FROM [D_ZYXXB] WHERE [ID] = @ID" InsertCommand="INSERT INTO [D_ZYXXB] ([ZYMC],[XYID]) VALUES (@ZYMC,@XYID)"
            SelectCommand="SELECT [ID],[ZYMC],[XYID],[XYMC] FROM [V_ZYXXB] order by xyid,zymc" UpdateCommand="UPDATE [D_ZYXXB] SET [ZYMC] = @ZYMC,[XYID]=@XYID WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ZYMC" Type="String" />
                <asp:Parameter Name="XYID" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ZYMC" Type="String" />
                <asp:Parameter Name="XYID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
		<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
			SelectCommand="SELECT [ID], [XYMC] FROM [D_XYXXB] ORDER BY [ID]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
				<asp:TemplateField HeaderText="学院" SortExpression="XYMC">
					<EditItemTemplate>
						<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
							DataTextField="XYMC" DataValueField="ID" SelectedValue='<%# Bind("XYID") %>'>
						</asp:DropDownList>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("XYMC") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
                <asp:BoundField DataField="ZYMC" HeaderText="专业名称" SortExpression="ZYMC">
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
				学院：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
					DataTextField="XYMC" DataValueField="ID" SelectedValue='<%# Bind("XYID") %>'>
				</asp:DropDownList><br />
                专业名称:
                <asp:TextBox CssClass="text_input" ID="LBMCTextBox" runat="server" Text='<%# Bind("ZYMC") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="添加专业" />
                <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="取消" />
            </InsertItemTemplate>
        </asp:FormView></div>
    </form>
</body>
</html>
