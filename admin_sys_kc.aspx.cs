using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class admin_sys_kc : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
        if (s.getUserXy().ToString() != "")
        {
            SqlDataSource4.SelectCommand = "SELECT D_SYSLXB.XYID, T_SYSXXB.ID, T_SYSXXB.SYSMC FROM T_SYSXXB INNER JOIN D_SYSLXB ON T_SYSXXB.SYSLXID = D_SYSLXB.ID WHERE [XYID] = " + s.getUserXy().ToString() + "  ORDER BY [SYSMC]";
            SqlDataSource3.SelectCommand = "SELECT [KCMC], [ID] FROM [V_KCXXB] WHERE [XYID] = " + s.getUserXy().ToString() + " ORDER BY [KCMC]";
        }
		if ( !IsPostBack )
		{
			KCDDL.DataSource = SqlDataSource3;
			KCDDL.DataTextField = "KCMC";
			KCDDL.DataValueField = "ID";
			KCDDL.DataBind();
			SYSDDL.DataSource = SqlDataSource4;
			SYSDDL.DataTextField = "SYSMC";
			SYSDDL.DataValueField = "ID";
			SYSDDL.DataBind();
		}
	}

	protected void addBtn_Click ( object sender , EventArgs e )
	{
		SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings["syxkConn"].ConnectionString );
		SqlCommand comm = new SqlCommand();
		comm.Connection = conn;
		comm.CommandText = "insert into t_syskcglb (kcid,sysid) values(@kcid,@sysid)";
		comm.Parameters.Clear();
		comm.Parameters.AddWithValue( "kcid" , KCDDL.SelectedValue );
		comm.Parameters.AddWithValue( "sysid" , SYSDDL.SelectedValue );
		try
		{
			conn.Open();
			comm.ExecuteNonQuery();
			GridView1.DataBind();
		}
		catch ( Exception ex )
		{
			Response.Redirect( "error.aspx?errcode=" + ex.Message.ToString() );
		}
		finally
		{
			conn.Close();
		}
	}


}
