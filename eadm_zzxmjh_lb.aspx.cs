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

public partial class eadm_zzxmjh_lb : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
		Security s = Session["sec"] as Security;
		if ( s == null )
		{
			Response.Redirect( "error.aspx" );
		}
		string sxtj = Session["sxtj"] as string;
		dbModule dm = new dbModule();
		if ( sxtj == "" || sxtj == null )
		{
			SqlDataSource1.SelectCommand = "SELECT [ID],[SYBH], [SYID], [SYJSID], [JSXM], [SYSID], [SYXN], [SYRS], [SYKS], [SYSDD], [SYZ], [SYXQ], [XSXM], [SQRID], [SYJJ], [SYXS], [SYMC], [SYXINGQ], [XYMC], [SJH], [YJDZ], [LBMC], [XYID], [ZYID], [ZYMC], [XSLBID],[XINGQMC],[ZMC],[MC],[KSSJ],[JSSJ] FROM [V_ZZSJXMJHB] ORDER BY [SYBH]";
		}
		else
		{
			SqlDataSource1.SelectCommand = "SELECT [ID],[SYBH], [SYID], [SYJSID], [JSXM], [SYSID], [SYXN], [SYRS], [SYKS], [SYSDD], [SYZ], [SYXQ], [XSXM], [SQRID], [SYJJ], [SYXS], [SYMC], [SYXINGQ], [XYMC], [SJH], [YJDZ], [LBMC], [XYID], [ZYID], [ZYMC], [XSLBID],[XINGQMC],[ZMC],[MC],[KSSJ],[JSSJ] FROM [V_ZZSJXMJHB] where (sybh like '%" + sxtj + "%' or symc like '%" + sxtj + "%' or sysmc like '%" + sxtj + "%' or jsxm like '%" + sxtj + "%' or syxn like '%" + sxtj + "%') ORDER BY [SYBH]";
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
			Response.Redirect( "eadm_zzxmjh_lb.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "eadm_zzxmjh_lb.aspx" );
	}

	protected void GridView1_RowEditing ( object sender , GridViewEditEventArgs e )
	{

		//Security s = Session["sec"] as Security;
		//int kcid = Convert.ToInt32( ( GridView1.Rows[e.NewEditIndex].FindControl( "KCIDLabel" ) as Label ).Text );
		//SYSSDS.SelectCommand = "SELECT [ID], [SYSDD], [SYSMC] FROM [T_SYSXXB] where id = 0 or [ID] IN (select sysid from v_gly_sys_kc where glyid='" + s.getUserCode() + "' and kcid=" + kcid + ")";

	}
	protected void GridView1_RowUpdating ( object sender , GridViewUpdateEventArgs e )
	{

		int sysid = Convert.ToInt32( e.NewValues["SYSID"].ToString() );
		string syxn = e.OldValues["SYXN"].ToString();
		int syxq = Convert.ToInt32( e.OldValues["SYXQ"].ToString() );
		int syz = Convert.ToInt32( e.NewValues["SYZ"].ToString() );
		int syxingq = Convert.ToInt32( e.NewValues["SYXINGQ"].ToString() );
		int syks = Convert.ToInt32( e.NewValues["SYKS"].ToString() );
		dbModule dm = new dbModule();
		if ( dm.cfjh( sysid , syxn , syxq , syz , syxingq , syks ) != 0 )
		{
			messageLabel.Text = Resources.Resource.strDuplicateSJString;
			e.Cancel = true;
			return;
		}
		messageLabel.Text = "";
	}
}
