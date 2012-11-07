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

public partial class stu_sykc_sq : System.Web.UI.Page
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
			SqlDataSource1.SelectCommand = "SELECT [ID], [SYBH], [SYMC], [KCMC], [JSXM], [SYSMC], [SYRS], [SYXN], [SYXINGQ], [SYXQ], [SYSDD], [XINGQMC], [ZMC], [MC], [sqrs], [sprs] FROM [V_YWCXSRSB] where sqzt=1 and syid in (select syid from t_syxxb where kcid in (select id from v_kcxxb where id in( select kcbh from t_kcxxb where id in (select kcid from t_xsxkb where xsxh='" + s.getUserCode() +  "')))) and (xslb='不限' or xslb='" + dm.getXslbByXh( s.getUserCode() ) + "') order by kcmc,symc,sybh";
		}
		else
		{
            SqlDataSource1.SelectCommand = "SELECT [ID], [SYBH], [SYMC], [KCMC], [JSXM], [SYSMC], [SYRS], [SYXN], [SYXINGQ], [SYXQ], [SYSDD], [XINGQMC], [ZMC], [MC], [sqrs], [sprs] FROM [V_YWCXSRSB] where sqzt=1 and syid in (select syid from t_syxxb where kcid in (select id from v_kcxxb where id in( select kcbh from t_kcxxb where id in (select kcid from t_xsxkb where xsxh='" + s.getUserCode() + "')) and (xslb='不限' or xslb='" + dm.getXslbByXh(s.getUserCode()) + "')" + " and (sybh like '%" + sxtj + "%' or symc like '%" + sxtj + "%' or  jsxm like '%" + sxtj + "%' or sysdd like '%" + sxtj + "%' or zmc like '%" + sxtj + "%' or mc like '%" + sxtj + "%' or syxn like '%" + sxtj + "%' or syxq like '%" + sxtj + "%') order by sybh";
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
			Response.Redirect( "stu_sykc_sq.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "stu_sykc_sq.aspx" );
	}
}
