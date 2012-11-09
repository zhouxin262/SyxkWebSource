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

public partial class aadm_kcxx_tj : System.Web.UI.Page
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
		int skrs=0;
        int kcxs=0;
		string kcbh = KCBHTextBox.Text.Trim();
		string kcmc = KCMCTextBox.Text.Trim();
        string jsid = JSDDL.SelectedValue;
		string kcxx = KCXXTextBox.Text.Trim();
        try
        {
            kcxs = Convert.ToInt32(KCXSTextBox.Text.Trim());
        }
        catch
        {
            messageLabel.Text = Resources.Resource.strNotValidInt;
        }
        try
        {
            skrs = Convert.ToInt32(SKRSTextBox.Text.Trim());
        }
        catch
        {
            messageLabel.Text = Resources.Resource.strNotValidInt;
        }
        dbModule dm = new dbModule();
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        int xyid = Int32.Parse(s.getUserXy());
        int i = dm.addKcxx(kcbh, kcmc, jsid, kcxx, kcxs, skrs, xyid);
		switch ( i )
		{
			case 1://正常添加成功
				messageLabel.Text = Resources.Resource.strAddNewSuccess;
                KCBHTextBox.Text = "";
                KCMCTextBox.Text = "";
                KCXXTextBox.Text = "";
                KCXSTextBox.Text = "";
                SKRSTextBox.Text = "";
				JSDDL.DataBind();
				break;
			default://添加失败
				messageLabel.Text = Resources.Resource.strAddNewFailed;
				break;
		}
	}
	protected void cacelButton_Click ( object sender , EventArgs e )
	{
		Response.Redirect( "aadm_kcxx_tj.aspx" );
	}
}
