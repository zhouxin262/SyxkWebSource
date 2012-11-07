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

public partial class eadm_zzxm_sp : System.Web.UI.Page
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
		int syid = Convert.ToInt32(Request["id"]);
		string jjyy = jjyyTextBox.Text.Trim();
		dbModule dm = new dbModule();
		dm.spsjxmjj( syid , jjyy );
		messageLabel.Text = Resources.Resource.strOperateSuccess;
		jjyyTextBox.Text = "";
	}
	protected void Button2_Click ( object sender , EventArgs e )
	{
		Session["syid"] = "-1";
		Response.Redirect("eadm_zzxm_lb.aspx");
	}
}
