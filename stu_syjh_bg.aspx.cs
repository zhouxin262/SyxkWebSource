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

public partial class stu_syjh_bg : System.Web.UI.Page
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
			
        }
		for ( int i = 1 ; i <= 7 ; i++ )
		{
			for ( int j = 1 ; j <= 7 ; j++ )
			{
				Table1.Rows[i].Cells[j].Text = "&nbsp";
			}
		}
		
	}
	protected void Button1_Click ( object sender , EventArgs e )
	{
		Security s = Session["sec"] as Security;
		string xn = xnDDL.SelectedValue;
		string xq = xqDDL.SelectedValue;
		string z = zDDL.SelectedValue;
		string xh = s.getUserCode();
		SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings["syxkConn"].ConnectionString );
		string sql = "select symc,sysdd,syxingq,syks from v_syxkb where syxn='" + xn + "' and syxq=" + xq + " and syz=" + z + " and xsxh='" + xh + "' order by syxn,syxq,syz,syxingq,syks";
		SqlDataAdapter ada = new SqlDataAdapter(sql,conn);
		DataTable dt = new DataTable();
		ada.Fill( dt );
		Table1.Caption = xn + "学年——" + xqDDL.SelectedItem.Text + "——" + zDDL.SelectedItem.Text + "实验安排表";
		
		for ( int i = 0 ; i < dt.Rows.Count ; i++ )
		{
			string symc = dt.Rows[i]["symc"].ToString();
			string sysdd = dt.Rows[i]["sysdd"].ToString();
			int syxingq = Convert.ToInt32(dt.Rows[i]["syxingq"]);
			int syks = Convert.ToInt32(dt.Rows[i]["syks"]);
			TableCell tc = Table1.FindControl( "TableCell" + syks.ToString() + syxingq.ToString() ) as TableCell;
			if ( tc == null )
			{
			}
			else
			{
				tc.Text = symc + "(" + sysdd + ")";
			}
			
		}
	}
}
