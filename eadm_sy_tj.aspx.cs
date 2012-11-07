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

public partial class eadm_sy_tj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
		if ( !IsPostBack )
		{
            KCSDS.SelectCommand = "SELECT [ID], [KCMC]  FROM [V_KCXXB] where id in (select kcid from T_syskcglb where sysid in (select sysid from t_sysglb where glyid='" + s.getUserCode() + "')) ";
			KCSDS.DataBind();
		}
    }
	protected void addButton_Click ( object sender , EventArgs e )
	{
		string symc = MCTextBox.Text.Trim();
		string sykcid = SYKCDDL.SelectedValue;
		int sylxid = Convert.ToInt32( SYLXDDL.SelectedValue );
		int sylbid = Convert.ToInt32( SYLBDDL.SelectedValue );
		int syyqid = Convert.ToInt32( SYYQDDL.SelectedValue );
		int syzlbid = Convert.ToInt32(SYZLBDDL.SelectedValue);
		int syxs = Convert.ToInt32( SYXSTextBox.Text.Trim() );
        string nrdxz = "";
        string yrdxz = "";
		string syjj = SYJJTextBox.Text.Trim();
		dbModule dm = new dbModule();
		int i = dm.addSyxx( symc , sykcid , sylxid , sylbid , syyqid , syzlbid , syxs , nrdxz , yrdxz , syjj );
		switch ( i )
		{
			case 1://正常添加成功
				messageLabel.Text = Resources.Resource.strAddNewSuccess;
				MCTextBox.Text = "";
				SYXSTextBox.Text = "";
                //NRDXZTextBox.Text = "";
                //YRDXZTextBox.Text = "";
				SYKCDDL.DataBind();
				SYLXDDL.DataBind();
				SYLBDDL.DataBind();
				SYYQDDL.DataBind();
				SYZLBDDL.DataBind();
				SYJJTextBox.Text = "";
				break;
			default://添加失败
				messageLabel.Text = Resources.Resource.strAddNewFailed;
				break;
		}
	}
	protected void cacelButton_Click ( object sender , EventArgs e )
	{
		Response.Redirect( "eadm_sy_tj.aspx" );
	}
}
