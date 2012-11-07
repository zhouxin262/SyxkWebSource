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

public partial class eadm_syrj_bj2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        pbModule pm = new pbModule();
        string xsxh = XSXHTextBox.Text.Trim();
        if (!pm.isValidString(xsxh))
        {
            messageLabel.Text = Resources.Resource.strNotValidString;
            return;
        }
        dbModule dm = new dbModule();
        string xsxm = dm.getXsxmByXh(xsxh);
        if (xsxm.Equals("error!"))
        {
            messageLabel.Text = Resources.Resource.strNotFoundString;
            return;
        }
        string xslb = dm.getXslbByXh(xsxh);

        string yqlb = DetailsView1.Rows[5].Cells[1].Text;
        int syjhid = Convert.ToInt32(Request["ID"]);
        Security sec = Session["sec"] as Security;
		string shrid = sec.getUserCode(); if ( dm.cfxk( syjhid , xsxh ) != 0 )//重复选课
		{
			messageLabel.Text = Resources.Resource.strDuplicateXKString;
			return;
		}
         if (xslb.Trim().Equals(yqlb) || yqlb.Equals("不限"))
         {
             dm.sqxk(syjhid ,xsxh ,shrid);
             
             messageLabel.Text = "学生：" + xsxm + "已经添加！";
         }
         else
         {
             messageLabel.Text = "学生类别：" + xslb + "与实验要求类别：" + yqlb + "不一致，无法添加该学生：" + xsxm;
             return;
         }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string fileName = "export.xls";

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        System.IO.StringWriter sw = new System.IO.StringWriter(sb);
        HtmlTextWriter htw = new HtmlTextWriter(sw);

        Page page = new Page();
        HtmlForm form = new HtmlForm();


        // Deshabilitar la validación de eventos, sólo asp.net 2
        page.EnableEventValidation = false;

        // Realiza las inicializaciones de la instancia de la clase Page que requieran los diseñadores RAD.
        page.DesignerInitialize();

        page.Controls.Add(form);

        form.Controls.Add(GridView1);

        page.RenderControl(htw);

        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.Default;
        Response.Write(sb.ToString());
        Response.End();
    }
}
