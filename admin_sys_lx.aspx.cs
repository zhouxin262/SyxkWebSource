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

public partial class admin_sys_lx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }

        if (s.getUserXy() != "")
        {
            SqlDataSource1.SelectCommand = "SELECT ID,LXMC,LXYWMC FROM [D_SYSLXB] WHERE [XYID] = " + s.getUserXy().ToString();
            SqlDataSource1.InsertParameters["XYID"].DefaultValue = s.getUserXy();
        }
    }
}
