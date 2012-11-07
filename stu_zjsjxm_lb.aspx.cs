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

public partial class stu_zjsjxm_lb : System.Web.UI.Page
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
            SqlDataSource1.SelectCommand = "SELECT ztms,[ID], [SJXMMC], [XMJJ], [SQRID], [SQZT],[XSXM] FROM [V_ZZSJXMSQB] where sqrid='" + s.getUserCode() + "'";
        }
    }
}
