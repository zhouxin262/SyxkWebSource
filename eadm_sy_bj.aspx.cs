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

public partial class eadm_sy_bj : System.Web.UI.Page
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
			SqlDataSource1.SelectCommand = "SELECT [ID], [SYMC], [KCID], [KCMC], [SYLBID], [SYLXID], [SYYQID], [LBMC], [LXMC], [SYZLBID],[XSLB],[SYXS],[NRDXZ],[YRDXZ],[SYJJ],[YQMC] FROM [V_SYJBXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() + "')  ORDER BY [SYMC],[KCMC]";
		}
		else
		{
            SqlDataSource1.SelectCommand = "SELECT [ID], [SYMC], [KCID],[KCMC], [SYLBID], [SYLXID], [SYYQID], [LBMC], [LXMC], [SYZLBID],[XSLB],[SYXS],[NRDXZ],[YRDXZ],[SYJJ],[YQMC] FROM [V_SYJBXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() + "')  and (symc like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or lbmc like '%" + sxtj + "%' or lxmc like '%" + sxtj + "%') ORDER BY [SYMC],[KCMC]";
		}
		
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
			Response.Redirect( "eadm_sy_bj.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "eadm_sy_bj.aspx" );
	}
}
