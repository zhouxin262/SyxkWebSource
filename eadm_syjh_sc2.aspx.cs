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

public partial class eadm_syjh_sc2 : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        dbModule dm = new dbModule();
        int syid =  Convert.ToInt32( Request["id"] );
        symcTextBox.Text = dm.getSymcBySyid(syid);
        kcmcTextBox.Text = dm.getKcmcBySyid(syid);
		string kcbh = dm.getKcidBySyid( syid );
		syddSDS.SelectCommand = "SELECT [ID], [SYSDD], [SYSMC] FROM [T_SYSXXB] where id = 0 or [ID] IN (select sysid from v_gly_sys_kc where glyid='" + s.getUserCode() + "' and kcid='" + kcbh + "')";

	}
	protected void Button2_Click ( object sender , EventArgs e )
	{
		Response.Redirect( "eadm_syjh_sc.aspx" );
	}
	protected void Button1_Click ( object sender , EventArgs e )
	{
		pbModule pm = new pbModule();
		if ( !pm.isValidIntString( syfzTextBox.Text.Trim() ) || !pm.isValidIntString( mzrsTextBox.Text.Trim() ) )
		{
			messageLabel.Text = Resources.Resource.strNotValidInt;
			return;
		}

		dbModule dm = new dbModule();

		int syid = Convert.ToInt32( Request["id"] );
		string bhqz = sybhTextBox.Text.Trim();
		int syfz = Convert.ToInt32( syfzTextBox.Text.Trim() );
		int mzrs = Convert.ToInt32( mzrsTextBox.Text.Trim() );
		string jsid = syjsDDL.SelectedValue;
		int sysid = Convert.ToInt32( syddDDL.SelectedValue );
		dm.syfz( syid , bhqz, syfz , mzrs,sysid,jsid );
		messageLabel.Text = Resources.Resource.strOperateSuccess;
	}
}
