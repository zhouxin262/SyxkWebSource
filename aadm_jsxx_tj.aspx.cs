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

public partial class aadm_jsxx_tj : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        XYSDS.SelectCommand = "SELECT [XYMC], [ID] FROM [D_XYXXB] WHERE [ID] = " + s.getUserXy().ToString() + " ORDER BY [ID]";
    }
	protected void addButton_Click ( object sender , EventArgs e )
	{
		js jsxx = new js();
		string gzh = GZHTextBox.Text.Trim();
		string jsxm = JSXMTextBox.Text.Trim();
		string zc = zcTextBox.Text.Trim();
		string sjh = SJHTextBox.Text.Trim();
		string yjdz = YJDZTextBox.Text.Trim();
		int xyid = Convert.ToInt32(XYDDL.SelectedValue);
		int i = jsxx.add( gzh , jsxm , zc, sjh , yjdz , "暂无" , xyid );
		switch ( i )
		{
			case 1://正常添加成功
				messageLabel.Text = Resources.Resource.strAddNewSuccess;
				GZHTextBox.Text = "";
				JSXMTextBox.Text = "";
				zcTextBox.Text = "";
				SJHTextBox.Text = "";
				YJDZTextBox.Text = "";
				XYDDL.DataBind();
				break;
			default://添加失败
				messageLabel.Text = Resources.Resource.strAddNewFailed;
				break;
		}
	}
	protected void cacelButton_Click ( object sender , EventArgs e )
	{
		Response.Redirect( "aadm_jsxx_tj.aspx" );
	}
}
