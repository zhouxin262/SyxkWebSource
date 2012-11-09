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

public partial class aadm_kcxx_bj : System.Web.UI.Page
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
            if (s.getUserXy().ToString() != "")
            {
                SqlDataSource1.SelectCommand = "SELECT [ID], [KCBH], [KCMC], [JSID], [JSXM], [KCXX],[KCXS], [SFAPSY], [SKRS] FROM [V_KCJBXXB] WHERE [XYID] = " + s.getUserXy().ToString() + " ORDER BY [KCBH],KCMC,JSXM";
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [ID], [KCBH], [KCMC], [JSID], [JSXM], [KCXX],[KCXS], [SFAPSY], [SKRS] FROM [V_KCJBXXB] ORDER BY [KCBH],KCMC,JSXM";
            }
            
		}
		else
        {
            if (s.getUserXy().ToString() != "")
            {

                SqlDataSource1.SelectCommand = "SELECT [ID], [KCBH], [KCMC], [JSID], [JSXM], [KCXX],[KCXS], [SFAPSY], [SKRS] FROM [V_KCJBXXB] WHERE [XYID] = " + s.getUserXy().ToString() + "  AND (kcbh like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or jsxm like '%" + sxtj + "%' or kcxx like '%" + sxtj + "%' ) ORDER BY KCBH,KCMC,JSXM";
            }
            else
            {

                SqlDataSource1.SelectCommand = "SELECT [ID], [KCBH], [KCMC], [JSID], [JSXM], [KCXX],[KCXS], [SFAPSY], [SKRS] FROM [V_KCJBXXB] WHERE  (kcbh like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or jsxm like '%" + sxtj + "%' or kcxx like '%" + sxtj + "%' ) ORDER BY KCBH,KCMC,JSXM";
            }
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
			Response.Redirect( "aadm_kcxx_bj.aspx" );
		}

	}
	protected void czButton_Click ( object sender , EventArgs e )
	{
		Session["sxtj"] = "";
		Response.Redirect( "aadm_kcxx_bj.aspx" );
	}
}
