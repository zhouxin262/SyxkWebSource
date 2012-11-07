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

public partial class eadm_zzxm_lb : System.Web.UI.Page
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
			SqlDataSource1.SelectCommand = "SELECT [SYKSSJ],[SYJSSJ],[SYSDD] ,[SJXMMC], [XMJJ], [SQRID], [SQZT], [XSXM], [XYID], [ZYID], [XSLBID], [SJH], [YJDZ], [ZYMC], [LBMC], [XYMC], [ID] FROM [V_ZZSJXMSQB] where sqzt=-1 order by SJXMMC";
		}
		else
		{
			SqlDataSource1.SelectCommand = "SELECT [SYKSSJ],[SYJSSJ],[SYSDD] ,[SJXMMC], [XMJJ], [SQRID], [SQZT], [XSXM], [XYID], [ZYID], [XSLBID], [SJH], [YJDZ], [ZYMC], [LBMC], [XYMC], [ID] FROM [V_ZZSJXMSQB] where sqzt=-1 and ( SJXMMC like '%" + sxtj + "%' or syjj like '%" + sxtj + "%' or xsxm like '%" + sxtj + "%' or xymc like '%" + sxtj + "%' or zymc like '%" + sxtj + "%' or sjh like '%" + sxtj + "%' or yjdz like '%" + sxtj + "%' ) ORDER BY [SJXMMC]";
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
	protected void SqlDataSource1_Updated ( object sender , SqlDataSourceStatusEventArgs e )
	{

	}
}
