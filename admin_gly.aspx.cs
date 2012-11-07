using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class admin_gly : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
	}
	protected string getGLYLX ( int code )
	{
		switch ( code )
		{
			case 1:
				return "教务管理员";
				break;
			case 0:
				return "系统管理员";
			case 2:
				return "实验管理员";
			default:
				return "error code";
				break;
		}
	}
}
