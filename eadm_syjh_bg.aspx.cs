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
using System.Data.SqlClient;

public partial class eadm_syjh_bg : System.Web.UI.Page
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
            SYSDS.SelectCommand = "SELECT [ID], [SYMC] FROM [V_SYJBXXB] where kcid in (select kcid from v_gly_sys_kc where glyid='" + s.getUserCode() + "') ORDER BY [SYMC]";
            sysSDS.SelectCommand = "SELECT [ID], [SYSDD] FROM [T_SYSXXB] WHERE id in (select sysid from v_gly_sys_kc where glyid='" + s.getUserCode() + "') and  ([ID] <> @ID) ORDER BY [SYSDD]";
            for (int i = 1; i <= 7; i++)
            {
                for (int j = 1; j <= 7; j++)
                {
                    Table1.Rows[i].Cells[j].Text = "&nbsp";
                }
            }
            string ap = Request["ap"];
            if (ap == null || ap == "") ap = "0";
            if (ap.Equals("1"))
            {//安排实验
                dbModule dm = new dbModule();
                int sysid = Convert.ToInt32(Session["sysid"]);
                int syid = Convert.ToInt32(Session["syid"]);
                string syjsid = Session["syjsid"] as string;
                int syrs = Convert.ToInt32(Session["syrs"]);
                string sybh = Session["sybh"] as string;
                string syxn = Session["syxn"] as string;
                int syxq = Convert.ToInt32(Session["syxq"]);
                int syz = Convert.ToInt32(Session["syz"]);
                int syxingq = Convert.ToInt32(Request["syxingq"]);
                int syks = Convert.ToInt32(Request["syks"]);
                int i = dm.addSyjh(syid, sybh, syjsid, sysid, syrs, syxn, syxq, syz, syxingq, syks);
                syrsTxt.Text = syrs.ToString();
                sybhTXT.Text = sybh;
                xnDDL.DataBind();
                ListItem li1 = xnDDL.Items.FindByValue(syxn);
                if (li1 != null)
                {
                    li1.Selected = true;
                }
                xqDDL.DataBind();
                ListItem li2 = xqDDL.Items.FindByValue(syxq.ToString());
                if (li2 != null)
                {
                    li2.Selected = true;
                }
                zDDL.DataBind();
                ListItem li3 = zDDL.Items.FindByValue(syz.ToString());
                if (li3 != null)
                {
                    li3.Selected = true;
                }
                sysDDL.DataBind();
                ListItem li4 = sysDDL.Items.FindByValue(sysid.ToString());
                if (li4 != null)
                {
                    li4.Selected = true;
                }

                syjsDDL.DataBind();
                ListItem li5 = syjsDDL.Items.FindByValue(syjsid);
                if (li5 != null)
                {
                    li5.Selected = true;
                }
                syDDL.DataBind();
                ListItem li6 = syDDL.Items.FindByValue(syid.ToString());
                if (li6 != null)
                {
                    li6.Selected = true;
                }
                Button1_Click(this, new EventArgs());
            }
            else if (ap.Equals("2"))
            {
                string syjhid = Request["syjhid"];
                int sysid = Convert.ToInt32(Session["sysid"]);
                string syxn = Session["syxn"] as string;
                int syxq = Convert.ToInt32(Session["syxq"]);
                int syz = Convert.ToInt32(Session["syz"]);
                dbModule dm = new dbModule();
                int i = dm.delSyjh(Convert.ToInt32(syjhid));
                if (i == 0)
                {
                    Response.Write("");
                    Button1_Click(this, new EventArgs());
                }
                else
                {
                    xnDDL.DataBind();
                    ListItem li1 = xnDDL.Items.FindByValue(syxn);
                    if (li1 != null)
                    {
                        li1.Selected = true;
                    }
                    xqDDL.DataBind();
                    ListItem li2 = xqDDL.Items.FindByValue(syxq.ToString());
                    if (li2 != null)
                    {
                        li2.Selected = true;
                    }
                    zDDL.DataBind();
                    ListItem li3 = zDDL.Items.FindByValue(syz.ToString());
                    if (li3 != null)
                    {
                        li3.Selected = true;
                    }
                    sysDDL.DataBind();
                    ListItem li4 = sysDDL.Items.FindByValue(sysid.ToString());
                    if (li4 != null)
                    {
                        li4.Selected = true;
                    }
                    Button1_Click(this, new EventArgs());
                }
            }
        }
       
		
		
	}
	protected void Button1_Click ( object sender , EventArgs e )
	{

		string xn = xnDDL.SelectedValue;
		string xq = xqDDL.SelectedValue;
		string z = zDDL.SelectedValue;
		string sysid = sysDDL.SelectedValue;
		SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings["syxkConn"].ConnectionString );
		string sql = "select symc,jsxm,syxingq,syks,id from v_ywcsyjhb where syxn='" + xn + "' and syxq=" + xq + " and syz=" + z + " and sysid= " + sysid + " order by syxn,syxq,syz,syxingq,syks";
		SqlDataAdapter ada = new SqlDataAdapter(sql,conn);
		DataTable dt = new DataTable();
        
		ada.Fill( dt );
		Table1.Caption = xn + "学年——" + xqDDL.SelectedItem.Text + "——" + zDDL.SelectedItem.Text + "——" + sysDDL.SelectedItem.Text + "实验安排表";

        for (int i = 1; i <= 7; i++)
        {
            for (int j = 1; j <= 7; j++)
            {

                TableCell tc = Table1.FindControl("TableCell" + i.ToString() + j.ToString()) as TableCell;
                if (tc == null)
                {
                }
                else
                {
                   
                    tc.Text = @"<a href=eadm_syjh_bg.aspx?&ap=1&syxingq=" + j.ToString() + @"&syks=" + i.ToString() + @">安排实验</a>";
                }
            }
        }

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string symc = dt.Rows[i]["symc"].ToString();
                string jsxm = dt.Rows[i]["jsxm"].ToString();
                string syjhid = dt.Rows[i]["id"].ToString();
                int syxingq = Convert.ToInt32(dt.Rows[i]["syxingq"]);
                int syks = Convert.ToInt32(dt.Rows[i]["syks"]);
                TableCell tc = Table1.FindControl("TableCell" + syks.ToString() + syxingq.ToString()) as TableCell;
                if (tc == null)
                {
                }
                else
                {
                    tc.Text = symc + "(" + jsxm + @")<br><a href=eadm_syjh_bg.aspx?ap=2&syjhid=" + syjhid+@">取消实验</a>";
                }

            }
            Session["syxn"] = xnDDL.SelectedValue;
            Session["syxq"] = xqDDL.SelectedValue;
            Session["syz"] = zDDL.SelectedValue;
            Session["sysid"] = sysDDL.SelectedValue;
	}

    protected void syDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Session["kbap_syid"] = syDDL.SelectedValue;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["syid"] = syDDL.SelectedValue;
        try
        {
            Session["syrs"] = Convert.ToInt32(syrsTxt.Text);
        }
        catch
        {
            syrsTxt.Text = "0";
            Session["syrs"] = 0;
        }
        Session["sybh"] = sybhTXT.Text;

        Session["syjsid"] = syjsDDL.SelectedValue;
        Label1.Text = "当前选定实验为：" + syDDL.SelectedItem.Text; ;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string xn = xnDDL.SelectedValue;
        string xq = xqDDL.SelectedValue;
        string z = zDDL.SelectedValue;
        string sysid = sysDDL.SelectedValue;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["syxkConn"].ConnectionString);
        string sql = "select symc,jsxm,syxingq,syks,id from v_ywcsyjhb where syxn='" + xn + "' and syxq=" + xq + " and syz=" + z + " and sysid= " + sysid + "order by syxn,syxq,syz,syxingq,syks";
        SqlDataAdapter ada = new SqlDataAdapter(sql, conn);
        DataTable dt = new DataTable();
        ada.Fill(dt);
        Table1.Caption = xn + "年——" + xqDDL.SelectedItem.Text + "——" + zDDL.SelectedItem.Text + "——" + sysDDL.SelectedItem.Text + "实验安排表";


        for (int i = 1; i <= 7; i++)
        {
            for (int j = 1; j <= 7; j++)
            {

                TableCell tc = Table1.FindControl("TableCell" + i.ToString() + j.ToString()) as TableCell;
                if (tc == null)
                {
                }
                else
                {

                    //tc.Text = @"<a href=eadm_syjh_bg.aspx?&ap=1&syxingq=" + j.ToString() + @"&syks=" + i.ToString() + @">安排实验</a>";
                    tc.Text = " ";
                }
            }
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string symc = dt.Rows[i]["symc"].ToString();
            string jsxm = dt.Rows[i]["jsxm"].ToString();
            string syjhid = dt.Rows[i]["id"].ToString();
            int syxingq = Convert.ToInt32(dt.Rows[i]["syxingq"]);
            int syks = Convert.ToInt32(dt.Rows[i]["syks"]);
            TableCell tc = Table1.FindControl("TableCell" + syks.ToString() + syxingq.ToString()) as TableCell;
            if (tc == null)
            {
            }
            else
            {
                //tc.Text = symc + "(" + jsxm + @")<br><a href=eadm_syjh_bg.aspx?ap=2&syjhid=" + syjhid + @">取消实验</a>";
                tc.Text = symc + "(" + jsxm + ")";
            }

        }

        string fileName =  "export.xls";

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
       
        form.Controls.Add(Table1);
        
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
