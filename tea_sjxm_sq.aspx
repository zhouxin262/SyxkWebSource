<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tea_sjxm_sq.aspx.cs" Inherits="tea_sjxm_sq" %>

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
        <div>
            <asp:SqlDataSource ID="SYLBSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
                SelectCommand="SELECT [ID], [LBMC] FROM [D_SYLBB]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SYLXSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
                SelectCommand="SELECT [ID], [LXMC] FROM [D_SYLXB]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SYYQSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
                SelectCommand="SELECT [ID], [YQMC] FROM [D_SYYQB]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="XSLBSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
                SelectCommand="SELECT [ID], [LBMC] FROM [D_XSLBB]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="KCSDS" runat="server" ConnectionString="<%$ ConnectionStrings:syxkConn %>"
                SelectCommand="SELECT [ID], [KCMC] FROM [T_KCXXB]"></asp:SqlDataSource>
            <asp:Label ID="messageLabel" runat="server" ForeColor="Red"></asp:Label><br />
            <table width="340px">
                <tr>
                    <td align="right" style="width: 110px">
                        实验名称：</td>
                    <td style="width: 300px">
                        <asp:TextBox CssClass="text_input" ID="MCTextBox" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px; height: 24px">
                        实验课程：</td>
                    <td style="width: 162px; height: 24px">
                        <asp:DropDownList ID="SYKCDDL" runat="server" DataSourceID="KCSDS" DataTextField="KCMC"
                            DataValueField="ID">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px">
                        实验类型：</td>
                    <td style="width: 162px">
                        <asp:DropDownList ID="SYLXDDL" runat="server" DataSourceID="SYLXSDS" DataTextField="LXMC"
                            DataValueField="ID">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px">
                        实验类别：</td>
                    <td style="width: 162px">
                        <asp:DropDownList ID="SYLBDDL" runat="server" DataSourceID="SYLBSDS" DataTextField="LBMC"
                            DataValueField="ID">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px; height: 24px">
                        实验要求：</td>
                    <td style="width: 162px; height: 24px">
                        <asp:DropDownList ID="SYYQDDL" runat="server" DataSourceID="SYYQSDS" DataTextField="YQMC"
                            DataValueField="ID">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right">
                        实验者类别：</td>
                    <td style="width: 162px">
                        <asp:DropDownList ID="SYZLBDDL" runat="server" DataSourceID="XSLBSDS" DataTextField="LBMC"
                            DataValueField="ID">
                        </asp:DropDownList></td>
                </tr>
               
                <tr>
                    <td align="right" style="width: 100px">
                        拟认定性质：</td>
                    <td style="width: 162px">
                        <asp:TextBox CssClass="text_input" ID="NRDXZTextBox" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100px">
                        已认定性质：</td>
                    <td style="width: 162px">
                        <asp:TextBox CssClass="text_input" ID="YRDXZTextBox" runat="server" Text=""></asp:TextBox></td>
                </tr>
                 <tr>
                    <td align="right" style="width: 110px">
                        实验学时：</td>
                    <td style="width: 230px">
                        <asp:TextBox CssClass="text_input" ID="SYXSTextBox" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" style="width: 110px">
                        实验简介：</td>
                    <td style="width: 230px">
                        <asp:TextBox CssClass="text_input" ID="SYJJTextBox" runat="server" Height="150px" Text="" TextMode="MultiLine"
                            Width="230px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right" style="width: 300px; height: 26px">
                        </td>
                    <td align="left" style="width: 300px; height: 26px"><asp:Button ID="addButton" runat="server" OnClick="addButton_Click" Text="添加" />
                        &nbsp;<asp:Button ID="cacelButton" runat="server" OnClick="cacelButton_Click" Text="取消" /></td>
                </tr>
            </table>
            <br />
            &nbsp;</div>
        &nbsp;
    
    </div>
    </form>
</body>
</html>
