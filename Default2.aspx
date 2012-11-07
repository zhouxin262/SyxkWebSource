<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<script type="text/javascript" src="js/coolWindowsCalendar.js"></script>
    <title>无标题页</title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
		<asp:TextBox ID="TextBox1" runat="server" onclick='javascript: setday(this);'></asp:TextBox>
    </div>
    </form>
</body>
</html>
