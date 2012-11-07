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

public partial class stu_zjsjxm_sq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        if (!IsPostBack)
        {
            
            
        }
    }
    protected void addButton_Click(object sender, EventArgs e)
    {
        string symc = MCTextBox.Text.Trim();
        
        //int syxs = Convert.ToInt32(SYXSTextBox.Text.Trim());
        string syjj = SYJJTextBox.Text.Trim();
		string sydt = SYRQTextBox.Text.Trim();
		string kssj = sydt + " " + s1.SelectedValue + ":" + s2.SelectedValue;
		string jssj = sydt + " " + s3.SelectedValue + ":" + s4.SelectedValue;
		int sysid = Convert.ToInt32(syfjDDL.SelectedValue);
        Security sec = Session["sec"] as Security;
        string sqrid = sec.getUserCode();
        dbModule dm = new dbModule();
		int i = dm.addZzsjxm( symc , syjj , sqrid ,sysid,kssj ,jssj );
        switch (i)
        {
            case 1://正常添加成功
                messageLabel.Text = Resources.Resource.strAddNewSuccess;
				
                MCTextBox.Text = "";
                //SYXSTextBox.Text = "";
                SYJJTextBox.Text = "";
                break;
            default://添加失败
                messageLabel.Text = Resources.Resource.strAddNewFailed;
                break;
        }
    }
    protected void cacelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("tea_sjxm_sq.aspx");
    }
}
