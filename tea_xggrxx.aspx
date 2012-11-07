<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tea_xggrxx.aspx.cs" Inherits="tea_xggrxx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 83px;
        }
        .style2
        {
            width: 92px;
        }
        .style3
        {
            width: 107px;
        }
    </style>
    </head>
<body>                                                                                                                        
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            
            SelectCommand="SELECT [GZH], [JSXM], [ZC], [XYID], [SJH], [YJDZ], [JSLB], [JSJJ] FROM [T_JSXXB] WHERE ([GZH] = @GZH)" 
            OldValuesParameterFormatString="original_{0}" 
            DeleteCommand="DELETE FROM [T_JSXXB] WHERE [GZH] = @original_GZH" 
            
            
            InsertCommand="INSERT INTO [T_JSXXB] ([GZH], [JSXM], [ZC], [XYID], [SJH], [YJDZ], [JSLB], [JSJJ]) VALUES (@GZH, @JSXM, @ZC, @XYID, @SJH, @YJDZ, @JSLB, @JSJJ)" UpdateCommand="UPDATE [T_JSXXB] SET [JSXM] = @JSXM, [ZC] = @ZC, [XYID] = @XYID, [SJH] = @SJH, [YJDZ] = @YJDZ,  [JSJJ] = @JSJJ WHERE [GZH] = @original_GZH" ProviderName="<%$ ConnectionStrings:syxkConn.ProviderName %>"
            >
            <SelectParameters>
                <asp:SessionParameter Name="GZH" SessionField="usercode" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_GZH" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="JSXM" Type="String" />
                <asp:Parameter Name="ZC" Type="String" />
                <asp:Parameter Name="XYID" Type="Int32" />
                <asp:Parameter Name="SJH" Type="String" />
                <asp:Parameter Name="YJDZ" Type="String" />
                <asp:Parameter Name="JSJJ" Type="String" />
                <asp:Parameter Name="original_GZH" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="GZH" Type="String" />
                <asp:Parameter Name="JSXM" Type="String" />
                <asp:Parameter Name="ZC" Type="String" />
                <asp:Parameter Name="XYID" Type="Int32" />
                <asp:Parameter Name="SJH" Type="String" />
                <asp:Parameter Name="YJDZ" Type="String" />
                <asp:Parameter Name="JSLB" Type="Int32" />
                <asp:Parameter Name="JSJJ" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            DeleteCommand="DELETE FROM [D_XYXXB] WHERE [ID] = @original_ID AND (([XYMC] = @original_XYMC) OR ([XYMC] IS NULL AND @original_XYMC IS NULL))" 
            InsertCommand="INSERT INTO [D_XYXXB] ([XYMC]) VALUES (@XYMC)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [ID], [XYMC] FROM [D_XYXXB]" 
            UpdateCommand="UPDATE [D_XYXXB] SET [XYMC] = @XYMC WHERE [ID] = @original_ID AND (([XYMC] = @original_XYMC) OR ([XYMC] IS NULL AND @original_XYMC IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_XYMC" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="XYMC" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_XYMC" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="XYMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [ID], [LBMC] FROM [D_JSLBB]">
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="GZH"
            DataSourceID="SqlDataSource1" DefaultMode="Edit" 
            Height="254px"  Width="501px">
            <EditItemTemplate>
                <table style="width: 480px">
                    <tr>
                        <td align="right" class="style12">
                            工号：</td>
                        <td class="style11">
                            <asp:TextBox ID="XHTextBox" runat="server" Text='<%# Bind("GZH") %>' 
                                Enabled="False" ReadOnly="True" Height="20px" Width="160px" ></asp:TextBox>
                        </td>
                        <td class="style13">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="style5">
                            姓名：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="XMTextBox" runat="server" Text='<%# Bind("JSXM") %>' 
                                Width="160px"></asp:TextBox>
                        </td>
                        <td class="style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="XMTextBox" ErrorMessage="姓名不能为空" 
                                ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style5">
                            职称：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="161px" 
                                Text='<%# Bind("ZC") %>'></asp:TextBox>
                        </td>
                        <td class="style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            学院：</td>
                        <td class="style8">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource2" DataTextField="XYMC" DataValueField="ID" 
                                
                                SelectedValue='<%# Bind("XYID") %>' Width="167px" Height="16px">
                            </asp:DropDownList>
                        </td>
                        <td class="style1">
                            &nbsp;</td>
                    </tr>
                   <%-- <tr>
                        <td align="right" class="style9">
                            教师类别：</td>
                        <td class="style8">
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="LBMC" DataValueField="ID" 
                                Width="166px" Height="16px">
                            </asp:DropDownList>
                        </td>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>--%>
                    <tr>
                        <td align="right" class="style9">
                            手机号：</td>
                        <td class="style8">
                            <asp:TextBox ID="SJHTextBox" runat="server" 
                                 Text='<%# Bind("SJH") %>' Height="22px" Width="163px"></asp:TextBox>
                        </td>
                        <td class="style10">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="SJHTextBox" ErrorMessage="手机号格式不正确" 
                                ValidationExpression="^[1]+[3,5]+\d{9}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            邮件地址：</td>
                        <td class="style8">
                            <asp:TextBox ID="YJDZTextBox" runat="server" Text='<%# Bind("YJDZ") %>' 
                                Height="22px" Width="163px"></asp:TextBox>
                        </td>
                        <td class="style10">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="YJDZTextBox" ErrorMessage="邮件格式不正确" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            教师简介：</td>
                        <td class="style8">
                            <asp:TextBox ID="TextBox2" runat="server" Height="97px" Width="164px" 
                                Text='<%# Bind("JSJJ") %>'></asp:TextBox>
                        </td>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                        </td>
                        <td style="width: 147px; height: 26px">
                            <asp:Button ID="Button1" runat="server" CommandName="Update" CausesValidation="True" 
                                 Text="修改" onclick="Button1_Click1"   />
                            <asp:Button ID="Button2" runat="server" CommandName="Cancel"  
                                CausesValidation="False"  Text="取消" 
                                 />
                        </td>
                        <td class="style2">
                            &nbsp;</td>
                    </tr>
                </table>
            </EditItemTemplate>
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
    
    </div>
    </form>
</body>
</html>

