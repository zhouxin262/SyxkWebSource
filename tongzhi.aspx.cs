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

public partial class tongzhi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dbModule dm = new dbModule();
            int id = Convert.ToInt32(Request["id"]);
            if (id != null)
            {

                lbldate.Text = dm.getTongZhiDateById(id);
                lblmsg.Text = dm.getTongZhiNeiRongById(id);
                lbltitle.Text = dm.getTongZhiBiaoTiById(id);
                lblusername.Text = dm.getTongZhiFaBuById(id);
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("tongzhi_list.aspx");
    }
}
