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

public partial class stu_syfs_lb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        string sxtj = Session["sxtj"] as string;
        dbModule dm = new dbModule();
        if (sxtj == "" || sxtj == null)
        {
            SqlDataSource1.SelectCommand = "SELECT [KCBH], [KCMC], [JSID], [JSXM], [SYFS] FROM [V_XSSYFS] where XSXH='" + s.getUserCode() + "' ORDER BY [KCMC], [JSXM]";
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT [KCBH], [KCMC], [JSID], [JSXM], [SYFS] FROM [V_XSSYFS] WHERE XSXH='" + s.getUserCode() + "'  and (kcbh like '%" + sxtj + "%' or kcmc like '%" + sxtj + "%' or jsxm like '%" + sxtj + "%' or jsid like '%" + sxtj + "%' ) ORDER BY [KCMC], [JSXM]";
        }
        //SqlDataSource1.SelectCommand = "SELECT ID,SYMC,SYBH,KCMC,JSXM,SYSDD,ZMC,XINGQMC,MC,XKZT,SQSJ,SYZT,JRSJ,LKSJ FROM V_SYXKB WHERE XSXH='" + s.getUserCode() + "'";
    }

    protected void sxButton_Click(object sender, EventArgs e)
    {
        pbModule pm = new pbModule();
        string sxtj = sxtjTextBox.Text.Trim();
        if (pm.hasForbiddenChar(sxtj))
        {
            messageLabel.Text = Resources.Resource.strNotValidShaiXuan;
            return;
        }
        else
        {
            Session["sxtj"] = sxtj;
            Response.Redirect("stu_syfs_lb.aspx");
        }

    }
    protected void czButton_Click(object sender, EventArgs e)
    {
        Session["sxtj"] = "";
        Response.Redirect("stu_syfs_lb.aspx");
    }
}
