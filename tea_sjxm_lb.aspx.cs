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

public partial class tea_sjxm_lb : System.Web.UI.Page
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
            
            SqlDataSource1.SelectCommand = "SELECT [ID], [SYMC], [KCID], [KCMC], [SYLBID], [SYLXID], [SYYQID], [LBMC], [LXMC], [SYZLBID], [XSLB], [SYXS], [NRDXZ], [YRDXZ], [SYJJ], [YQMC], [SQRID], [SQZT],[ZTMS] FROM [V_SYSJXMXXB] where sqrid='" + s.getUserCode() + "'";
        }
    }
}
