<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stu_xggrxx.aspx.cs" Inherits="stu_xggrxx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    </head>
<body>                                                                                                                        
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            
            SelectCommand="SELECT [XSXH], [XSXM], [BJID], [XYID], [ZYID], [XSLBID], [SJH], [YJDZ] FROM [T_XSXXB] WHERE ([XSXH] = @XSXH)" 
            OldValuesParameterFormatString="original_{0}" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [T_XSXXB] WHERE [XSXH] = @original_XSXH AND (([XSXM] = @original_XSXM) OR ([XSXM] IS NULL AND @original_XSXM IS NULL)) AND (([BJID] = @original_BJID) OR ([BJID] IS NULL AND @original_BJID IS NULL)) AND (([XYID] = @original_XYID) OR ([XYID] IS NULL AND @original_XYID IS NULL)) AND (([ZYID] = @original_ZYID) OR ([ZYID] IS NULL AND @original_ZYID IS NULL)) AND (([XSLBID] = @original_XSLBID) OR ([XSLBID] IS NULL AND @original_XSLBID IS NULL)) AND (([SJH] = @original_SJH) OR ([SJH] IS NULL AND @original_SJH IS NULL)) AND (([YJDZ] = @original_YJDZ) OR ([YJDZ] IS NULL AND @original_YJDZ IS NULL))" 
            
            
            InsertCommand="INSERT INTO [T_XSXXB] ([XSXH], [XSXM], [BJID], [XYID], [ZYID], [XSLBID], [SJH], [YJDZ]) VALUES (@XSXH, @XSXM, @BJID, @XYID, @ZYID, @XSLBID, @SJH, @YJDZ)" UpdateCommand="UPDATE [T_XSXXB] SET [XSXM] = @XSXM, [BJID] = @BJID, [XYID] = @XYID, [ZYID] = @ZYID, [XSLBID] = @XSLBID, [SJH] = @SJH, [YJDZ] = @YJDZ WHERE [XSXH] = @original_XSXH AND (([XSXM] = @original_XSXM) OR ([XSXM] IS NULL AND @original_XSXM IS NULL)) AND (([BJID] = @original_BJID) OR ([BJID] IS NULL AND @original_BJID IS NULL)) AND (([XYID] = @original_XYID) OR ([XYID] IS NULL AND @original_XYID IS NULL)) AND (([ZYID] = @original_ZYID) OR ([ZYID] IS NULL AND @original_ZYID IS NULL)) AND (([XSLBID] = @original_XSLBID) OR ([XSLBID] IS NULL AND @original_XSLBID IS NULL)) AND (([SJH] = @original_SJH) OR ([SJH] IS NULL AND @original_SJH IS NULL)) AND (([YJDZ] = @original_YJDZ) OR ([YJDZ] IS NULL AND @original_YJDZ IS NULL))" ProviderName="<%$ ConnectionStrings:syxkConn.ProviderName %>"
            >
            <SelectParameters>
                <asp:SessionParameter Name="XSXH" SessionField="usercode" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_XSXH" Type="String" />
                <asp:Parameter Name="original_XSXM" Type="String" />
                <asp:Parameter Name="original_BJID" Type="Int32" />
                <asp:Parameter Name="original_XYID" Type="Int32" />
                <asp:Parameter Name="original_ZYID" Type="Int32" />
                <asp:Parameter Name="original_XSLBID" Type="Int32" />
                <asp:Parameter Name="original_SJH" Type="String" />
                <asp:Parameter Name="original_YJDZ" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="XSXM" Type="String" />
                <asp:Parameter Name="BJID" Type="Int32" />
                <asp:Parameter Name="XYID" Type="Int32" />
                <asp:Parameter Name="ZYID" Type="Int32" />
                <asp:Parameter Name="XSLBID" Type="Int32" />
                <asp:Parameter Name="SJH" Type="String" />
                <asp:Parameter Name="YJDZ" Type="String" />
                <asp:Parameter Name="original_XSXH" Type="String" />
                <asp:Parameter Name="original_XSXM" Type="String" />
                <asp:Parameter Name="original_BJID" Type="Int32" />
                <asp:Parameter Name="original_XYID" Type="Int32" />
                <asp:Parameter Name="original_ZYID" Type="Int32" />
                <asp:Parameter Name="original_XSLBID" Type="Int32" />
                <asp:Parameter Name="original_SJH" Type="String" />
                <asp:Parameter Name="original_YJDZ" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="XSXH" Type="String" />
                <asp:Parameter Name="XSXM" Type="String" />
                <asp:Parameter Name="BJID" Type="Int32" />
                <asp:Parameter Name="XYID" Type="Int32" />
                <asp:Parameter Name="ZYID" Type="Int32" />
                <asp:Parameter Name="XSLBID" Type="Int32" />
                <asp:Parameter Name="SJH" Type="String" />
                <asp:Parameter Name="YJDZ" Type="String" />
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
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            DeleteCommand="DELETE FROM [D_BJXXB] WHERE [ID] = @original_ID AND (([BJMC] = @original_BJMC) OR ([BJMC] IS NULL AND @original_BJMC IS NULL))" 
            InsertCommand="INSERT INTO [D_BJXXB] ([BJMC]) VALUES (@BJMC)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [ID], [BJMC] FROM [D_BJXXB]" 
            UpdateCommand="UPDATE [D_BJXXB] SET [BJMC] = @BJMC WHERE [ID] = @original_ID AND (([BJMC] = @original_BJMC) OR ([BJMC] IS NULL AND @original_BJMC IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_BJMC" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="BJMC" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_BJMC" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="BJMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            DeleteCommand="DELETE FROM [D_ZYXXB] WHERE [ID] = @original_ID AND (([ZYMC] = @original_ZYMC) OR ([ZYMC] IS NULL AND @original_ZYMC IS NULL))" 
            InsertCommand="INSERT INTO [D_ZYXXB] ([ZYMC]) VALUES (@ZYMC)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [ID], [ZYMC] FROM [D_ZYXXB]" 
            UpdateCommand="UPDATE [D_ZYXXB] SET [ZYMC] = @ZYMC WHERE [ID] = @original_ID AND (([ZYMC] = @original_ZYMC) OR ([ZYMC] IS NULL AND @original_ZYMC IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_ZYMC" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ZYMC" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_ZYMC" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ZYMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:syxkConn %>" 
            DeleteCommand="DELETE FROM [D_XSLBB] WHERE [ID] = @original_ID AND (([LBMC] = @original_LBMC) OR ([LBMC] IS NULL AND @original_LBMC IS NULL))" 
            InsertCommand="INSERT INTO [D_XSLBB] ([LBMC]) VALUES (@LBMC)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [ID], [LBMC] FROM [D_XSLBB]" 
            UpdateCommand="UPDATE [D_XSLBB] SET [LBMC] = @LBMC WHERE [ID] = @original_ID AND (([LBMC] = @original_LBMC) OR ([LBMC] IS NULL AND @original_LBMC IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_LBMC" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="LBMC" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_LBMC" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="LBMC" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="XSXH"
            DataSourceID="SqlDataSource1" DefaultMode="Edit" 
            Height="254px"  Width="501px" 
            onpageindexchanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                <table style="width: 390px">
                    <tr>
                        <td align="right" class="style12">
                            学号：</td>
                        <td class="style11">
                            <asp:TextBox ID="XHTextBox" runat="server" Text='<%# Bind("XSXH") %>' 
                                Enabled="False" ReadOnly="True" Height="20px" Width="160px" ></asp:TextBox>
                        </td>
                        <td class="style13">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="style5">
                            姓名：</td>
                        <td style="width: 147px">
                            <asp:TextBox ID="XMTextBox" runat="server" Text='<%# Bind("XSXM") %>' 
                                Width="160px"></asp:TextBox>
                        </td>
                        <td class="style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="XMTextBox" ErrorMessage="姓名不能为空" 
                                ></asp:RequiredFieldValidator>
                        </td>
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
                    <%--<tr>
                        <td align="right" class="style5">
                            班级：</td>
                        <td style="width: 147px">
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="BJMC" DataValueField="ID" 
                                Height="16px" Width="167px" SelectedValue='<%# Bind("BJID") %>'>
                            </asp:DropDownList>
                        </td>
                        <td class="style1">
                            &nbsp;</td>
                    </tr>--%>
                    <tr>
                        <td align="right" class="style9">
                            专业：</td>
                        <td class="style8">
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="SqlDataSource4" DataTextField="ZYMC" DataValueField="ID" 
                                SelectedValue='<%# Bind("ZYID") %>' Width="167px" Height="16px">
                            </asp:DropDownList>
                        </td>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            类别：</td>
                        <td class="style8">
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                DataSourceID="SqlDataSource5" DataTextField="LBMC" DataValueField="ID" 
                                SelectedValue='<%# Bind("XSLBID") %>' Width="166px" Height="16px">
                            </asp:DropDownList>
                        </td>
                        <td class="style10">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            手机号：</td>
                        <td class="style8">
                            <asp:TextBox ID="SJHTextBox" runat="server" 
                                 Text='<%# Bind("SJH") %>' Height="22px" Width="157px"></asp:TextBox>
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
                                Height="22px" Width="157px"></asp:TextBox>
                        </td>
                        <td class="style10">
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
                                 Text="修改" onclick="Button1_Click"  />
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


