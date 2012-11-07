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

public partial class admin_tongzhi_tj : System.Web.UI.Page
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
         Security s = Session["sec"] as Security;
        string strBiaoTi = txtBiaoTi.Text;
        string strNeiRong = txtNeiRong.Text;
        string strFaBuRen = s.getUserName();
        dbModule dm = new dbModule();
        int i = dm.addTongZhi(strBiaoTi, strNeiRong, strFaBuRen);
		switch ( i )
		{
			case 1://正常添加成功
				messageLabel.Text = Resources.Resource.strAddNewSuccess;
                txtBiaoTi.Text = "";
                txtNeiRong.Text = "";
				break;
			default://添加失败
				messageLabel.Text = Resources.Resource.strAddNewFailed;
				break;
		}
	}
	protected void cacelButton_Click ( object sender , EventArgs e )
	{
        Response.Redirect("admin_tongzhi_tj.aspx");
	}
}
