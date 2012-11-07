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

public partial class tea_syap_lb : System.Web.UI.Page
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
			SqlDataSource1.SelectCommand = "SELECT [ID],[KCID], [SYID], [SYBH], [SYMC], [KCMC], [SYRS], [SYKS], [SYSID], [SYJSID], [SYSMC],[SYSDD], [JSXM], [SYXN], [SYXQ], [SYZ], [SYXINGQ],[MC],[XINGQMC],[ZMC] FROM [V_SYJHXXB] where SYJSID ='" + s.getUserCode() + "' ORDER BY [SYXN], [SYXQ],[SYZ],[SYXINGQ]";
		}
		else
		{
			SqlDataSource1.SelectCommand = "SELECT [ID],[KCID], [SYID], [SYBH], [SYMC], [KCMC], [SYRS], [SYKS], [SYSID], [SYJSID], [SYSMC],[SYSDD], [JSXM], [SYXN], [SYXQ], [SYZ], [SYXINGQ],[MC],[XINGQMC],[ZMC] FROM [V_SYJHXXB] where  (symc like '%" + sxtj + "%' or sysdd like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or syxn like '%" + sxtj + "%' or syxq like '%" + sxtj + "%' or zmc like '%" + sxtj + "%' or xingqmc like '%" + sxtj + "%' or mc like '%" + sxtj + "%') and SYJSID ='" + s.getUserCode() + "' ORDER BY [SYXN], [SYXQ],[SYZ],[SYXINGQ]";
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
			Response.Redirect( "tea_syap_lb.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "tea_syap_lb.aspx" );
	}
}
