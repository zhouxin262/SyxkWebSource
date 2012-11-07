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

public partial class eadm_syjh_bj : System.Web.UI.Page
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
        int flag = 0;
        int syjhid = 0;
        try
        {
            flag = Convert.ToInt32(Request["flag"]);
            syjhid = Convert.ToInt32(Request["id"]);
        }
        catch
        {
            flag = 0;
        }
        if (flag == 1)
        {
            dm.setSyjhSqzt(syjhid);
            Response.Redirect("eadm_syjh_bj.aspx");
        }
		if ( sxtj == "" || sxtj == null )
		{
			SqlDataSource1.SelectCommand = "SELECT sqzt,[ID],[KCID],[JSXM], [SYID], [SYBH], [SYMC], [KCMC], [SYRS], [SYKS], [SYSID], [SYJSID], [SYSMC],[SYSDD],  [SYXN], [SYXQ], [SYZ], [SYXINGQ],[MC],[XINGQMC],[ZMC] FROM [V_SYJHXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() + "') ORDER BY [SYMC], [SYBH]";
		}
		else
		{
            SqlDataSource1.SelectCommand = "SELECT sqzt,[ID],[KCID], [SYID],[JSXM], [SYBH], [SYMC], [KCMC], [SYRS], [SYKS], [SYSID], [SYJSID], [SYSMC],[SYSDD],[SYXN], [SYXQ], [SYZ], [SYXINGQ],[MC],[XINGQMC],[ZMC] FROM [V_SYJHXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() + "') and (sybh like '%" + sxtj + "%' or JSXM like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or sysmc like '%" + sxtj + "%' or SYSDD like '%" + sxtj + "%' or syxn like '%" + sxtj + "%') ORDER BY [SYMC], [SYBH]";
		}
        if (!IsPostBack)
        {
            //JSSDS.SelectCommand = "SELECT [ID], [SYMC]+'(' + [JSXM] + ')' as SYMC FROM [V_SYJBXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() + "') ORDER BY [SYMC]";
            SYSSDS.SelectCommand = "SELECT [ID], [SYSDD] FROM [T_SYSXXB] WHERE id in (select sysid from v_gly_sys_kc where glyid='" + s.getUserCode() + "') and  ([ID] <> @ID) ORDER BY [SYSDD]";
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
			Response.Redirect( "eadm_syjh_bj.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "eadm_syjh_bj.aspx" );
	}

	protected void GridView1_RowEditing ( object sender , GridViewEditEventArgs e )
	{

		Security s = Session["sec"] as Security;
		string kcid = ( GridView1.Rows[e.NewEditIndex].FindControl( "KCIDLabel" ) as Label ).Text ;
		SYSSDS.SelectCommand = "SELECT [ID], [SYSDD], [SYSMC] FROM [T_SYSXXB] where id = 0 or [ID] IN (select sysid from v_gly_sys_kc where glyid='" + s.getUserCode() + "' and kcid='" + kcid + "')";

	}
	protected void GridView1_RowUpdating ( object sender , GridViewUpdateEventArgs e )
	{

		int sysid = Convert.ToInt32( e.NewValues["SYSID"].ToString() );
        //string syxn = e.OldValues["SYXN"].ToString();
        //int syxq = Convert.ToInt32( e.OldValues["SYXQ"].ToString() );
		int syz = Convert.ToInt32( e.NewValues["SYZ"].ToString() );
		int syxingq = Convert.ToInt32( e.NewValues["SYXINGQ"].ToString() );
		int syks = Convert.ToInt32( e.NewValues["SYKS"].ToString() );
		dbModule dm = new dbModule();
		if ( dm.cfjh( sysid , "noneed" , 0 , syz , syxingq , syks ) != 0 )
		{
            messageLabel.Text = "实验安排冲突，已强制安排实验。"; //Resources.Resource.strDuplicateSJString;
			e.Cancel = false;
			return;
		}
		messageLabel.Text = "";
	}
}
