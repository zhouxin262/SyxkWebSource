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
using System.Data.OleDb;
using System.Data.SqlClient;
using SystemConfiguration;


public partial class eadm_syqdqk : System.Web.UI.Page
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
			KCSDS.SelectCommand = "SELECT [kcbh], [KCMC]  FROM [V_KCXXB] where id in (select kcid from T_syskcglb where sysid in (select sysid from t_sysglb where glyid='" + s.getUserCode() + "')) ";
			KCSDS.DataBind();
		}
	}




	protected void btnExport_Click(object sender, EventArgs e)
	{
		Security s=  Session["sec"] as Security;
		if (s==null)
		{
			Response.Redirect("error.aspx");
		}
		string jsid = s.getUserCode();
		dbModule dm = new dbModule();
		string kcbh = KCDDL.SelectedValue;
		int syid= Convert.ToInt32(SYDDL.SelectedValue);
		DataTable dt = dm.getSyqdqk( kcbh ,syid,jsid );
		GridView1.DataSource = dt;
		GridView1.DataBind();
		GridView1.Caption = KCDDL.SelectedItem.Text + "---" + SYDDL.SelectedItem.Text + "签到情况";
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
