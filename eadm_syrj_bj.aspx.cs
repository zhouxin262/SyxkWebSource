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

public partial class eadm_syrj_bj : System.Web.UI.Page
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
			SqlDataSource1.SelectCommand = "SELECT [ID], [SYBH], [SYMC], [KCMC], [JSXM], [SYSMC], [SYRS], [SYXN], [SYXINGQ], [SYXQ], [SYSDD], [XINGQMC], [ZMC], [MC],[SYZLBID],[XSLB], [sqrs], [sprs] FROM [V_XKRSB]";
		}
		else
		{
			SqlDataSource1.SelectCommand = "SELECT [ID], [SYBH], [SYMC], [KCMC], [JSXM], [SYSMC], [SYRS], [SYXN], [SYXINGQ], [SYXQ], [SYSDD], [XINGQMC], [ZMC], [MC],[SYZLBID],[XSLB], [sqrs], [sprs] FROM [V_XKRSB] where ( sybh like '%" + sxtj + "%' or symc like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or jsxm like '%" + sxtj + "%' or syxn like '%" + sxtj + "%' or syxq like '%" + sxtj + "%' or zmc like '%" + sxtj + "%' or xingqmc like '%" + sxtj + "%' or mc like '%" + sxtj + "%')";
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
			Response.Redirect( "eadm_syrj_bj.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "eadm_syrj_bj.aspx" );
	}
}
