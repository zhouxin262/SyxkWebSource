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

public partial class eadm_sys_tj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
    }
	protected void addButton_Click ( object sender , EventArgs e )
	{
		string sysmc = MCTextBox.Text.Trim();
		string sysdd = DDTextBox.Text.Trim();
		string sysms = MSTextBox.Text.Trim();
		int sysrl = Convert.ToInt32(RLTextBox.Text.Trim());
		int syslxid = Convert.ToInt32( SYSLXDDL.SelectedValue );
		int ttpbs = 0;// = Convert.ToInt32(TTPBTextBox.Text.Trim()); 
		dbModule dm = new dbModule();
		int i = dm.addSysxx( sysmc , sysdd , sysrl , syslxid , sysms , ttpbs );
		switch ( i )
		{
			case 1://正常添加成功
				messageLabel.Text = Resources.Resource.strAddNewSuccess;
				MCTextBox.Text = "";
				DDTextBox.Text = "";
				MSTextBox.Text = "";
				RLTextBox.Text = "";
				SYSLXDDL.DataBind();
				//TTPBTextBox.Text = "";
				break;
			default://添加失败
				messageLabel.Text = Resources.Resource.strAddNewFailed;
				break;
		}
	}
	protected void cacelButton_Click ( object sender , EventArgs e )
	{
		Response.Redirect( "eadm_sys_tj.aspx" );
	}
}
