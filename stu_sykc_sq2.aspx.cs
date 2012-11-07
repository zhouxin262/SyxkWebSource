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

public partial class stu_sykc_sq2 : System.Web.UI.Page
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
            dbModule dm = new dbModule();
            int syjhid = Convert.ToInt32(Request["ID"]);
            Security sec = Session["sec"] as Security;
            string sqrid = sec.getUserCode();
            string shrid = "admin";
            if (dm.cfxk(syjhid,sqrid)!=0)//重复选课
            {
                messageLabel.Text = Resources.Resource.strDuplicateXKString;
                return;
            }
			if ( dm.xkym( syjhid ) != 0 )//选课已满
			{
				messageLabel.Text = Resources.Resource.strFullString;
				return;
			}
            if (ConfigurationManager.AppSettings["wxsh"] == "1")
            {
				int i = dm.sqxk( syjhid , sqrid , shrid );
				if ( i == 1 )
				{
					messageLabel.Text = Resources.Resource.strOperateSuccess;
				}
				else
				{
					messageLabel.Text = Resources.Resource.strOperateFailed;
				}
            }
        }
    }
}
