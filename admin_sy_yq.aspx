<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sy_yq.aspx.cs" Inherits="admin_sy_yq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
<%--    <style type="text/css">
    body { font-size: 13px; font-family: Tahoma; color: #3C3C3C;}
    </style>--%><link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
            DeleteCommand="DELETE FROM [D_SYYQB] WHERE [ID] = @ID" InsertCommand="INSERT INTO [D_SYYQB] ([YQMC]) VALUES (@YQMC)"
            SelectCommand="SELECT ID,YQMC FROM [D_SYYQB]" UpdateCommand="UPDATE [D_SYYQB] SET [YQMC] = @LXMC WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="YQMC" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="YQMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="YQMC" HeaderText="实验要求名称" SortExpression="YQMC">
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
        </asp:GridView><br/>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
				实验要求名称:
				<br />
                <asp:TextBox CssClass="text_input" ID="LXMCTextBox" runat="server" Text='<%# Bind("LXMC") %>'></asp:TextBox><br />
                <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="添加" />
                <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="取消" />
            </InsertItemTemplate>
        </asp:FormView>

    </form>
</body>
</html>
