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

public partial class eadm_syjh_sc : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        if (!IsPostBack)
        {   
            SqlDataSource1.SelectCommand = "SELECT [ID], [SYMC], [KCID], [KCMC], [SYLBID], [SYLXID], [SYYQID], [LBMC], [LXMC], [SYZLBID],[XSLB],[SYXS],[NRDXZ],[YRDXZ],[SYJJ],[YQMC] FROM [V_SYJBXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() +"') ORDER BY [SYMC],[KCMC]";
            SqlDataSource1.DataBind();
        }
	}
}
