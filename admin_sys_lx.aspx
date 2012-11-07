<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sys_lx.aspx.cs" Inherits="admin_sys_lx" %>

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
            DeleteCommand="DELETE FROM [D_SYSLXB] WHERE [ID] = @ID" InsertCommand="INSERT INTO [D_SYSLXB] ([LXMC],[LXYWMC]) VALUES (@LXMC,@LXYWMC)"
            SelectCommand="SELECT ID,LXMC,LXYWMC FROM [D_SYSLXB]" UpdateCommand="UPDATE [D_SYSLXB] SET [LXMC] = @LXMC,LXYWMC=LXYWMC WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="LXMC" Type="String" />
                <asp:Parameter Name="LXYWMC" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="LXMC" Type="String" />
                <asp:Parameter Name="LXYWMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="编号" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="LXMC" HeaderText="实验室名称" SortExpression="LXMC">
                </asp:BoundField>
                                <asp:BoundField DataField="LXYWMC" HeaderText="英文名称" SortExpression="LXMC">
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
            <EditRowStyle BackColor="Azure"/>
            <AlternatingRowStyle BackColor="White" />
            <EmptyDataTemplate>
                暂无数据
            </EmptyDataTemplate>
        </asp:GridView>
        <div style="padding:5px 15px"><asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                类型名称
                <asp:TextBox CssClass="text_input" ID="LXMCTextBox" runat="server" Text='<%# Bind("LXMC") %>'></asp:TextBox>&nbsp;<asp:Button
                    ID="Button1" runat="server" CommandName="Insert" Text="添加新类别" />
                <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="取消" />
            </InsertItemTemplate>
        </asp:FormView>
			<br />
			&nbsp;</div>
    </form>
</body>
</html>
