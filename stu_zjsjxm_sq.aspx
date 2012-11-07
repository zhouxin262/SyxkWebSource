<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_zjsjxm_sq.aspx.cs" Inherits="stu_zjsjxm_sq" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/coolWindowsCalendar.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;<asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
            <table width="400px">
                <tr>
                    <td align="right" style="width: 100px">
                        实践项目名称：</td>
                    <td style="width: 300px">
                        <asp:TextBox CssClass="text_input" ID="MCTextBox" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px">
                        实验日期：</td>
                    <td style="width: 300px">
                        <asp:TextBox CssClass="text_input" ID="SYRQTextBox" runat="server" Text="" onclick='javascript:setday(this);'></asp:TextBox></td>
                        
                </tr>     
                  <br />           
                <tr>
                    <td align="right" style="width: 100px">
                        开始时间：</td>
                    <td style="width: 300px">
						&nbsp;<asp:DropDownList ID="s1" runat="server">
							<asp:ListItem Value="08">08</asp:ListItem>
							<asp:ListItem Value="08">09</asp:ListItem>
							<asp:ListItem Value="08">10</asp:ListItem>
							<asp:ListItem Value="08">11</asp:ListItem>
							<asp:ListItem Value="08">12</asp:ListItem>
							<asp:ListItem Value="08">13</asp:ListItem>
							<asp:ListItem Value="08">14</asp:ListItem>
							<asp:ListItem Value="08">15</asp:ListItem>
							<asp:ListItem Value="08">16</asp:ListItem>
							<asp:ListItem Value="08">17</asp:ListItem>					
							
						</asp:DropDownList>时<asp:DropDownList ID="s2" runat="server">
							<asp:ListItem>00</asp:ListItem>
							<asp:ListItem>10</asp:ListItem>
							<asp:ListItem>20</asp:ListItem>
							<asp:ListItem>30</asp:ListItem>
							<asp:ListItem>40</asp:ListItem>
							<asp:ListItem>50</asp:ListItem>
						</asp:DropDownList>分</td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px">
                        结束时间：</td>
                    <td style="width: 300px">
                        <asp:DropDownList ID="s3" runat="server">
							<asp:ListItem Value="08">08</asp:ListItem>
							<asp:ListItem Value="08">09</asp:ListItem>
							<asp:ListItem Value="08">10</asp:ListItem>
							<asp:ListItem Value="08">11</asp:ListItem>
							<asp:ListItem Value="08">12</asp:ListItem>
							<asp:ListItem Value="08">13</asp:ListItem>
							<asp:ListItem Value="08">14</asp:ListItem>
							<asp:ListItem Value="08">15</asp:ListItem>
							<asp:ListItem Value="08">16</asp:ListItem>
							<asp:ListItem Value="08">17</asp:ListItem>					
							
						</asp:DropDownList>时<asp:DropDownList ID="s4" runat="server">
							<asp:ListItem>00</asp:ListItem>
							<asp:ListItem>10</asp:ListItem>
							<asp:ListItem>20</asp:ListItem>
							<asp:ListItem>30</asp:ListItem>
							<asp:ListItem>40</asp:ListItem>
							<asp:ListItem>50</asp:ListItem>
						</asp:DropDownList>分</td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px">
                        实验室：</td>
                    <td style="width: 300px">
						<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="LXMC" DataValueField="ID">
						</asp:DropDownList></td>
                </tr>
                                <tr>
                    <td align="right" style="width: 100px">
                        实验房间：</td>
                    <td style="width: 300px">
						<asp:DropDownList ID="syfjDDL" runat="server" DataSourceID="SqlDataSource2" DataTextField="SYSMC" DataValueField="ID">
						</asp:DropDownList></td>
                </tr>         
                <tr>
                    <td align="right" style="width: 100px">
						实验描述：</td>
                    <td style="width: 300px">
                        <asp:TextBox CssClass="text_input" ID="SYJJTextBox" runat="server" Height="180px" Text="" TextMode="MultiLine"
                            Width="300px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px; height: 26px">
                        </td>
                    <td align="left" style="width: 147px; height: 26px"><asp:Button ID="addButton" runat="server" OnClick="addButton_Click" Text="添加" />
                        &nbsp;<asp:Button ID="cacelButton" runat="server" OnClick="cacelButton_Click" Text="取消" /></td>
                </tr>
            </table>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [LXMC], [ID] FROM [D_SYSLXB] ORDER BY [ID]"></asp:SqlDataSource>
            <br />
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
				SelectCommand="SELECT [ID], [SYSMC], [SYSLXID] FROM [T_SYSXXB] WHERE ([SYSLXID] = @SYSLXID) ORDER BY [SYSMC]">
				<SelectParameters>
					<asp:ControlParameter ControlID="DropDownList1" Name="SYSLXID" PropertyName="SelectedValue"
						Type="Int32" />
				</SelectParameters>
			</asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
