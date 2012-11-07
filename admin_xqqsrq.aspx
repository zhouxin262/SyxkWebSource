<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_xqqsrq.aspx.cs" Inherits="admin_xqqsrq" %>

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
			SelectCommand="SELECT [CSRQ], [ID],[XN1],[XN2],[XQ] FROM [D_XQCSRQ]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [D_XQCSRQ] WHERE [ID] = @original_ID AND [CSRQ] = @original_CSRQ" InsertCommand="INSERT INTO [D_XQCSRQ] ([CSRQ], [ID]) VALUES (@CSRQ, @ID)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [D_XQCSRQ] SET [CSRQ] = @CSRQ ,XN1=@XN1,XN2=@XN2,XQ=@XQ WHERE [ID] = @original_ID">
			<DeleteParameters>
				<asp:Parameter Name="original_ID" Type="Int32" />
				<asp:Parameter Name="original_CSRQ" Type="DateTime" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="CSRQ" Type="DateTime" />
				<asp:Parameter Name="original_ID" Type="Int32" />
				<asp:Parameter Name="XN1" Type="Int32" />
				<asp:Parameter Name="XN2" Type="Int32" />
				<asp:Parameter Name="XQ" Type="Int32" />
				
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="CSRQ" Type="DateTime" />
				<asp:Parameter Name="ID" Type="Int32" />
			</InsertParameters>
		</asp:SqlDataSource>
		<table><tr align="center"><td><asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label></td></tr><tr><td>	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
            
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<Columns>
				<asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
				<asp:TemplateField HeaderText="初始日期" SortExpression="CSRQ">
					<EditItemTemplate>
						<asp:TextBox CssClass="text_input" ID="TextBox1" runat="server" Text='<%# Bind("CSRQ", "{0:d}") %>'></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("CSRQ", "{0:d}") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
                <asp:BoundField DataField="XN1" HeaderText="学年起" SortExpression="XN1" />
                <asp:BoundField DataField="XN2" HeaderText="学年止" SortExpression="XN2" />
                <asp:TemplateField HeaderText="学期" SortExpression="XQ">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("XQ") %>' Width="87px">
                            <asp:ListItem Value="1" Selected="True">第一学期</asp:ListItem>
                            <asp:ListItem Value="2">第二学期</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("XQ") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:CommandField ShowEditButton="True" />
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
		</asp:GridView></td></tr>
		<tr align="center"><td algin="center"> <asp:Button ID="Button1" runat="server" Text="清理旧数据" OnClick="Button1_Click" /></td></tr></table>
	
       </div>
    </form>
</body>
</html>
