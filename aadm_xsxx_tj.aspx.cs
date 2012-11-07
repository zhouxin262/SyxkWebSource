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

public partial class aadm_xsxx_tj : System.Web.UI.Page
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
		dbModule dm = new dbModule();
		string xh = XHTextBox.Text.Trim();
		string xsxm = XMTextBox.Text.Trim();
		string sjh = SJHTextBox.Text.Trim();
		string yjdz = YJDZTextBox.Text.Trim();
		int nj = Convert.ToInt32( NJTextBox.Text.Trim() );
		int xyid = Convert.ToInt32( XYDDL.SelectedValue );
		int xslbid = Convert.ToInt32(LBDDL.SelectedValue);
		int zyid = Convert.ToInt32(ZYDDL.SelectedValue);
		int i = dm.addXsxx( xh , xsxm , sjh , yjdz , xyid , xslbid , zyid,nj );
		switch ( i )
		{
			case 1://正常添加成功
				messageLabel.Text = Resources.Resource.strAddNewSuccess;
				XHTextBox.Text = "";
				XMTextBox.Text = "";
				SJHTextBox.Text = "";
				YJDZTextBox.Text = "";
				XYDDL.DataBind();
				LBDDL.DataBind();
				ZYDDL.DataBind();
				break;
			default://添加失败
				messageLabel.Text = Resources.Resource.strAddNewFailed;
				break;
		}
	}

	protected void cacelButton_Click ( object sender , EventArgs e )
	{
		Response.Redirect( "aadm_xsxx_tj.aspx" );
	}
}
