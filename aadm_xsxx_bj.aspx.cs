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

public partial class aadm_xsxx_bj : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
		string sxtj = Session["sxtj"] as string;
		dbModule dm = new dbModule();
		if ( sxtj == "" || sxtj == null )
		{
            SqlDataSource1.SelectCommand = "SELECT XSXH,XSXM, XYID, ZYID, XSLBID, SJH,NJ, YJDZ,ZYMC,LBMC,XYMC FROM V_XSJBXX WHERE [XYID] = " + s.getUserXy().ToString();
		}
		else
		{
            SqlDataSource1.SelectCommand = "SELECT XSXH,XSXM, XYID, ZYID, XSLBID, SJH,NJ, YJDZ,ZYMC,LBMC,XYMC FROM V_XSJBXX where [XYID] = " + s.getUserXy().ToString() + " AND xsxh like '%" + sxtj + "%' or xsxm like '%" + sxtj + "%' or  xymc like '%" + sxtj + "%' or zymc like '%" + sxtj + "%' or lbmc like '%" + sxtj + "%' or sjh like '%" + sxtj + "%' or yjdz like '%" + sxtj + "%'";
		}
        SqlDataSource3.SelectCommand = "SELECT [ID], [XYMC] FROM [D_XYXXB] WHERE [ID] = " + s.getUserXy().ToString();
	}

	protected void sxButton_Click ( object sender , EventArgs e )
	{
		pbModule pm = new pbModule();
		string sxtj = sxtjTextBox.Text.Trim();
		if ( pm.hasForbiddenChar( sxtj ) )
		{
			messageLabel.Text = Resources.Resource.strNotValidShaiXuan;
			return;
		}
		else
		{
			Session["sxtj"] = sxtj;
			Response.Redirect( "aadm_xsxx_bj.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "aadm_xsxx_bj.aspx" );
	}
}
