<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tongzhi.aspx.cs" Inherits="tongzhi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <title>
	选课系统通知
</title><link href="../Styles/old/taobaoStyle.css" type="text/css" rel="stylesheet" /><link href="../Styles/old/YtStyle.css" type="text/css" rel="stylesheet" /><link href="../Styles/old/treeStyle1.css" type="text/css" rel="stylesheet" /><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css"> 
A {
	FONT-SIZE: 9pt;
	COLOR: #0c68b5;
	font-family: 宋体;
}
INPUT {
	BORDER-RIGHT: #0778bc 1px solid; BORDER-TOP: #0778bc 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 9pt; BORDER-LEFT: #0778bc 1px solid; COLOR: #0778bc; BORDER-BOTTOM: #0778bc 1px solid
}
SELECT {
	FONT-SIZE: 9pt; COLOR: #0778bc
}
.myborder1 {
	BORDER-RIGHT: #324457 1px solid; BORDER-TOP: #324457 0px solid; BORDER-LEFT: #324457 1px solid; BORDER-BOTTOM: #324457 0px solid
}
.myborder {
	BORDER-LEFT-COLOR: #80b0ec; BORDER-BOTTOM-COLOR: #80b0ec; BORDER-TOP-STYLE: dotted; BORDER-TOP-COLOR: #80b0ec; BORDER-RIGHT-STYLE: dotted; BORDER-LEFT-STYLE: dotted; BORDER-COLLAPSE: collapse; BORDER-RIGHT-COLOR: #80b0ec; BORDER-BOTTOM-STYLE: dotted
}
TD {
	FONT-SIZE: 9pt; COLOR: gray
}
.colorBorder {
	BORDER-RIGHT: #278bde 1px solid; PADDING-RIGHT: 3px; BORDER-TOP: #278bde 1px solid; PADDING-LEFT: 3px; FONT-SIZE: 8pt; PADDING-BOTTOM: 3px; BORDER-LEFT: #278bde 1px solid; CURSOR: hand; COLOR: #0c68b5; PADDING-TOP: 3px; BORDER-BOTTOM: #278bde 1px solid; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.style4 {
	color: #0869B5;
	font-weight: normal;
	text-decoration: none;
}
 
.style11 {
	color: #000000;
	font-size: 9pt;
	font-family: "华文中宋";
}
.style12 {
	font-family: "宋体";
	line-height: 11pt;
}
.style15 {color: #FFFFFF}
.style16 {font-family: "宋体"; font-size: 9pt; }
.style21 {color: #006699}
.style27 {color: #FF6600}
.style30 {
	color: #3999E7;
	font-weight: normal;
	text-decoration: none;
}
.style31 {
	color: #0079BD;
	font-family: "宋体";
}
</style>


</head>
<body>

 <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
        <tbody>
            <tr>
                <td valign="top" style="width: 764px; text-align: center;">
                    <form runat="server" name="form1" method="post" action="" id="form2">
 
 
                        <center>
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 700px; background-color: #99ffff;">
                                <tr>
                                    <td class="FormTop700" style="width: 700px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="FormBody700" style="width: 700px">
                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 627px">
                                            <tr id="trSpace">
	<td height="15" style="width: 614px; text-align: right;">
                                                    
                                                    
                                                </td>
</tr>
 
                                            <tr>
                                                <td align="center" style="width: 614px">
                                                    <asp:Label runat="server" id="lbltitle" style="color:Black;font-size:Medium;font-weight:bold;" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="5" style="width: 614px">
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <td style="width: 614px; height: 30px;">
                                                    <hr />
                                                    <span id="Label1" style="color:Black;">发布部门：</span><asp:Label runat="server" id="lblusername" style="color:Black;" Text=""></asp:Label>
                                                    <span id="Label2" style="color:Black;">发布日期：</span><asp:Label runat="server" id="lbldate" style="color:Black;" Text=""></asp:Label>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td height="15" style="width: 614px">
                                                </td>
                                            </tr>
                                            <tr align="left" valign="top">
                                                <td style="width: 614px; height: 444px;">
                                                    <asp:Label runat="server" id="lblmsg" style="color:Black;" Text=""></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 614px; height: 16px;">
                                                    <span style="color: #000000">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回" />
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 有 效
                                                        期：</span> <span id="Span1" style="color:Black;width:61px;">长期有效</span></td>
                                            </tr>
                                         
                                    </td>
                                </tr>
                                <tr>
                                    <td class="FormBottom700" style="width: 700px">
                                        </td>
                                </tr>
                            </table>
                        </center>

    </form>
     </td>
            </tr>
        </tbody>
    </table>

</body>
</html>
