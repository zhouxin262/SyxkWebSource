<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>北京交通大学实验选课系统</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/style01.css" type="text/css" rel="stylesheet" />
<link href="../css/common.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
		function check(){
			if(document.forms[0].unameTextbox.value==""){
				alert("请输入您的用户名");
				document.forms[0].unameTextbox.focus();
				return false;
			}
			if(document.forms[0].upassTextbox.value==""){
				alert("请输入您的密码");
				document.forms[0].upassTextbox.focus();
				return false;
			}
			
			return true;
		}		
		
function TABLE1_onclick() {

}

		</script>

<meta content="MSHTML 6.00.2900.5897" name="GENERATOR" /></head>

	<body bgcolor="#ffffff">
		<table width="706" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="111">
					<img src="images/top_img.gif" width="700" height="111" />
				</td>
			</tr>
			<tr>
				<td background="images/index_r2_c1.jpg">
					<form action="" method="post" runat="server">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center">
									<asp:Label ID="errors" runat="server" Text="" ForeColor="red" CssClass="logintxt"></asp:Label>
								</td>
							</tr>
							<tr>
								<td align="center">
									<table width="360" border="0" cellspacing="0" cellpadding="0" id="TABLE1" onclick="return TABLE1_onclick()">
										<tr>
											<td width="90" align="right" class="logintxt" style="height: 31px">
												用户名：
											</td>
											<td align="left" style="width: 194px; height: 31px;">
												<asp:TextBox CssClass="text_input" ID="ucodeTextbox" runat="server"></asp:TextBox>
											</td>
											<td rowspan="4" align="center" valign="middle">
												&nbsp;</td>
										</tr>
										<tr>
											<td align="right" class="logintxt" style="height: 31px">
												密码：

											</td>
											<td align="left" style="width: 194px; height: 31px;">
												<asp:TextBox CssClass="text_input" ID="upassTextbox" runat="server" TextMode="Password"></asp:TextBox>
											</td>
										</tr>
										<tr>
											<td align="right" class="logintxt" style="height: 31px">
												类别：

											</td>
											<td align="left" style="width: 194px; height: 31px;">
                                                &nbsp;<asp:DropDownList ID="lb_DropList" runat="server" TabIndex="3">
                                                    <asp:ListItem Selected="True" Value="0">学生</asp:ListItem>
                                                    <asp:ListItem Value="1">任课教师</asp:ListItem>
                                                    <asp:ListItem Value="2">实验教师</asp:ListItem>
                                                    <asp:ListItem Value="4">教务管理员</asp:ListItem>
                                                    <asp:ListItem Value="3">管理员</asp:ListItem>
                                                </asp:DropDownList>
												&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="loginButton" OnClientClick="return check();" runat="server" Text="登  录" OnClick="loginButton_Click" TabIndex="4"></asp:Button></td>
										</tr>
<%--										<tr>
											<td height="31" align="right" class="logintxt">
												身份：

											</td>
											<td align="left">
												<html:select property="usertype">
													<logic:present
														name="<%=Global.APPLICATION_ATTRIB_USER_TYPE_LIST%>">
														<html:options
															collection="<%=Global.APPLICATION_ATTRIB_USER_TYPE_LIST%>"
															property="dictId" labelProperty="dictName" />
													</logic:present>
												</html:select>
											</td>
										</tr>
--%>									</table>
								</td>
							</tr>
							<tr>
								<td valign="bottom">
									<div align="center">
										<hr>
										Copyright &copy; 2009-2010,北京交通大学 All Rights Reserved
									</div>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
		</body>
</html>
