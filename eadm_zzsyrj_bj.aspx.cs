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

public partial class eadm_zzsyrj_bj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
			SqlDataSource1.SelectCommand = "SELECT [sqrs], [sprs], [SYBH], [SYSDD], [SYSID], [JSXM], [SYID], [SYKS], [SYRS], [SYXN], [SYXQ], [SYJJ], [SYXS], [SYMC], [SYXINGQ], [SQRID], [XSXM], [XYMC], [SJH], [ZYID], [XYID], [YJDZ], [LBMC], [XSLBID], [ZYMC], [ID], [XINGQMC], [SYJSID], [SYZ], [MC], [ZMC] FROM [v_ZZSJXMRSB] ORDER BY [SYMC]";
		}
		else
		{
			SqlDataSource1.SelectCommand = "SELECT [sqrs], [sprs], [SYBH], [SYSDD], [SYSID], [JSXM], [SYID], [SYKS], [SYRS], [SYXN], [SYXQ], [SYJJ], [SYXS], [SYMC], [SYXINGQ], [SQRID], [XSXM], [XYMC], [SJH], [ZYID], [XYID], [YJDZ], [LBMC], [XSLBID], [ZYMC], [ID], [XINGQMC], [SYJSID], [SYZ], [MC], [ZMC] FROM [v_ZZSJXMRSB] where (symc like '%" + sxtj + "%' or sybh like '%" + sxtj + "%' or jsxm like '%" + sxtj + "%' or sysdd like '%" + sxtj + "%' or syxn like '%" + sxtj + "%' or syxq like '%" + sxtj + "%' or zmc like '%" + sxtj + "%' or xingqmc like '%" + sxtj + "%' or mc like '%" + sxtj + "%')  ORDER BY [SYMC]";
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
			Response.Redirect( "eadm_zzsyrj_bj.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "eadm_zzsyrj_bj.aspx" );
	}
}
