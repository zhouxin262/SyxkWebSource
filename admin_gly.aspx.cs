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

        if (s.getUserXy() != "")
        {
            SqlDataSource1.SelectCommand = "SELECT T_GLYXXB.DLM, T_GLYXXB.GLYXM, T_GLYXXB.SJH, T_GLYXXB.GLYLX, T_GLYXXB.YJDZ, D_XYXXB.XYMC, T_GLYXXB.GLYXY FROM T_GLYXXB LEFT OUTER JOIN D_XYXXB ON T_GLYXXB.GLYXY = D_XYXXB.ID WHERE (T_GLYXXB.GLYXY <> '') AND GLYXY = " + s.getUserXy().ToString();
            SqlDataSource2.SelectCommand = "SELECT [ID], [XYMC] FROM [D_XYXXB] WHERE id = " + s.getUserXy().ToString();
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT T_GLYXXB.DLM, T_GLYXXB.GLYXM, T_GLYXXB.SJH, T_GLYXXB.GLYLX, T_GLYXXB.YJDZ, D_XYXXB.XYMC, T_GLYXXB.GLYXY FROM T_GLYXXB LEFT OUTER JOIN D_XYXXB ON T_GLYXXB.GLYXY = D_XYXXB.ID WHERE (T_GLYXXB.GLYXY <> '')";
            SqlDataSource2.SelectCommand = "SELECT [ID], [XYMC] FROM [D_XYXXB]";
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
				break;
			case 2:
				return "实验管理员";
				break;
			default:
				return "error code";
				break;
		}
	}
}
