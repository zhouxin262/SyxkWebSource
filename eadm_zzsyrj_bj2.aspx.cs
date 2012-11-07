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

public partial class eadm_zzsyrj_bj2 : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
		Security s = Session["sec"] as Security;
		if ( s == null )
		{
			Response.Redirect( "error.aspx" );
		}
	}
	protected void Button1_Click ( object sender , EventArgs e )
	{
		pbModule pm = new pbModule();
		string xsxh = XSXHTextBox.Text.Trim();
		if ( !pm.isValidString( xsxh ) )
		{
			messageLabel.Text = Resources.Resource.strNotValidString;
			return;
		}
		dbModule dm = new dbModule();
		string xsxm = dm.getXsxmByXh( xsxh );
		if ( xsxm.Equals( "error!" ) )
		{
			messageLabel.Text = Resources.Resource.strNotFoundString;
			return;
		}
		int syjhid = Convert.ToInt32( Request["ID"] );
		Security sec = Session["sec"] as Security;
		string shrid = sec.getUserCode();
		if ( dm.cfxk( syjhid , xsxh ) != 0 )//重复选课
		{
			messageLabel.Text = Resources.Resource.strDuplicateXKString;
			return;
		}
		dm.sqxk( syjhid , xsxh , shrid );
		Response.Redirect( Request.Url.AbsoluteUri );

	}
	protected void Button2_Click ( object sender , EventArgs e )
	{
		Response.Redirect( Request.Url.AbsoluteUri );
	}
}
