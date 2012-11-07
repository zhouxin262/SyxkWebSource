<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_js_lb.aspx.cs" Inherits="admin_js_lb" %>

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
            DeleteCommand="DELETE FROM [D_JSLBB] WHERE [ID] = @ID" InsertCommand="INSERT INTO [D_JSLBB] ([LBMC]) VALUES (@LBMC)"
            SelectCommand="SELECT * FROM [D_JSLBB]" UpdateCommand="UPDATE [D_JSLBB] SET [LBMC] = @LBMC WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="LBMC" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="LBMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" >
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"/>
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="���" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" />
                <asp:BoundField DataField="LBMC" HeaderText="�������" SortExpression="LBMC">
                </asp:BoundField>
				<asp:TemplateField ShowHeader="False">
					<EditItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
							Text="����"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
							Text="ȡ��"></asp:LinkButton>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
							Text="�༭"></asp:LinkButton>
						<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('ȷ��Ҫɾ����');" CausesValidation="False" CommandName="Delete"
							Text="ɾ��"></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                ��������
            </EmptyDataTemplate>
            <PagerStyle BackColor="#6699CC" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#6699CC" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#6699CC" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="Azure"/>
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <div style=" padding:5px 15px;">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <InsertItemTemplate>
                �������:
                <asp:TextBox CssClass="text_input" ID="LBMCTextBox" runat="server" Text='<%# Bind("LBMC") %>'></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="��������" />
                <asp:Button ID="Button2" runat="server" CommandName="cancle" Text="ȡ��" />
            </InsertItemTemplate>
        </asp:FormView>
        </div>
    </form>
</body>
</html>
