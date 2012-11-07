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

public partial class tea_sjxm_sq : System.Web.UI.Page
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
           
            KCSDS.SelectCommand = "SELECT [ID], [KCMC] FROM [T_KCXXB] where jsid='" + s.getUserCode() +"'";
        }
    }
    protected void addButton_Click(object sender, EventArgs e)
    {
        string symc = MCTextBox.Text.Trim();
        int sykcid = Convert.ToInt32(SYKCDDL.SelectedValue);
        int sylxid = Convert.ToInt32(SYLXDDL.SelectedValue);
        int sylbid = Convert.ToInt32(SYLBDDL.SelectedValue);
        int syyqid = Convert.ToInt32(SYYQDDL.SelectedValue);
        int syzlbid = Convert.ToInt32(SYZLBDDL.SelectedValue);
        int syxs = Convert.ToInt32(SYXSTextBox.Text.Trim());
        string nrdxz = NRDXZTextBox.Text.Trim();
        string yrdxz = YRDXZTextBox.Text.Trim();
        string syjj = SYJJTextBox.Text.Trim();
        Security sec = Session["sec"] as Security;
        string sqrid = sec.getUserCode();
        dbModule dm = new dbModule();
        int i = dm.addSyxx(symc, sykcid, sylxid, sylbid, syyqid, syzlbid, syxs, nrdxz, yrdxz, syjj,sqrid);
        switch (i)
        {
            case 1://正常添加成功
                messageLabel.Text = Resources.Resource.strAddNewSuccess;
                MCTextBox.Text = "";
                SYXSTextBox.Text = "";
                NRDXZTextBox.Text = "";
                YRDXZTextBox.Text = "";
                SYKCDDL.DataBind();
                SYLXDDL.DataBind();
                SYLBDDL.DataBind();
                SYYQDDL.DataBind();
                SYZLBDDL.DataBind();
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
