<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_xggrxx.aspx.cs" Inherits="admin_xggrxx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 229px;
        }
        .style2
        {
            height: 26px;
            width: 229px;
        }
        .style3
        {
            width: 99px;
        }
        .style4
        {
            height: 26px;
            width: 99px;
        }
        .style5
        {
            width: 172px;
        }
        .style6
        {
            height: 26px;
            width: 172px;
        }
    </style>
</head>
<body>                                                                                                                        
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            SelectCommand="SELECT [DLM], [GLYXM], [SJH], [YJDZ] FROM [T_GLYXXB] WHERE ([DLM] = @DLM)"
            UpdateCommand="UPDATE [T_GLYXXB] SET  [GLYXM] = @GLYXM, [SJH] = @SJH, [YJDZ] = @YJDZ WHERE ([DLM] = @DLM)"
            >
            <SelectParameters>
                <asp:SessionParameter Name="DLM" SessionField="usercode" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="GLYXM" />
                <asp:Parameter Name="SJH" />
                <asp:Parameter Name="YJDZ" />
                <asp:Parameter Name="DLM" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DLM"
            DataSourceID="SqlDataSource1" DefaultMode="Edit" 
            Height="254px"  Width="501px">
            <EditItemTemplate>
                <table style="width: 390px">
                    <tr>
                        <td align="right" class="style5">
                            登录名：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="DLMTextBox" runat="server" Text='<%# Bind("DLM") %>' 
                                Enabled="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="style5">
                            管理员姓名：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="GLYXMTextBox" runat="server" Text='<%# Bind("GLYXM") %>'></asp:TextBox>
                        </td>
                        <td class="style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="GLYXMTextBox" ErrorMessage="RequiredFieldValidator">姓名不能为空</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style5">
                            手机号：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="SJHTextBox" runat="server" Text='<%# Bind("SJH") %>'></asp:TextBox>
                        </td>
                        <td class="style1">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="SJHTextBox" ErrorMessage="手机号格式不正确" 
                                ValidationExpression="^[1]+[3,5]+\d{9}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style5">
                            电子邮箱：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="YJDZTextBox" runat="server" Text='<%# Bind("YJDZ") %>'></asp:TextBox>
                        </td>
                        <td class="style1">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="YJDZTextBox" ErrorMessage="邮件格式不正确" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                        </td>
                        <td style="width: 147px; height: 26px">
                            <asp:Button ID="Button1" runat="server" CommandName="Update" CausesValidation="True" 
                                 Text="修改" onclick="Button1_Click1" />
                            <asp:Button ID="Button2" runat="server" CommandName="Cancel"  
                                CausesValidation="False"  Text="取消" 
                                onclick="Button2_Click" />
                        </td>
                        <td class="style2">
                            &nbsp;</td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                DLM:
                <asp:TextBox ID="DLMTextBox" runat="server" Text='<%# Bind("DLM") %>' />
                <br />
                GLYXM:
                <asp:TextBox ID="GLYXMTextBox" runat="server" Text='<%# Bind("GLYXM") %>' />
                <br />
                SJH:
                <asp:TextBox ID="SJHTextBox" runat="server" Text='<%# Bind("SJH") %>' />
                <br />
                YJDZ:
                <asp:TextBox ID="YJDZTextBox" runat="server" Text='<%# Bind("YJDZ") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                DLM:
                <asp:Label ID="DLMLabel" runat="server" Text='<%# Bind("DLM") %>' />
                <br />
                GLYXM:
                <asp:Label ID="GLYXMLabel" runat="server" Text='<%# Bind("GLYXM") %>' />
                <br />
                SJH:
                <asp:Label ID="SJHLabel" runat="server" Text='<%# Bind("SJH") %>' />
                <br />
                YJDZ:
                <asp:Label ID="YJDZLabel" runat="server" Text='<%# Bind("YJDZ") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
