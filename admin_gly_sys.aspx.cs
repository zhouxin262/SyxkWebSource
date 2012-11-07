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

public partial class admin_gly : System.Web.UI.Page
{
	protected void Page_Load ( object sender , EventArgs e )
	{
        Security s = Session["sec"] as Security;
        if (s == null)
        {
            Response.Redirect("error.aspx");
        }
		if ( !IsPostBack )
		{
			GLYDDL.DataSource = SqlDataSource3;
			GLYDDL.DataTextField = "GLYXM";
			GLYDDL.DataValueField = "DLM";
			GLYDDL.DataBind();
			SYSDDL.DataSource = SqlDataSource4;
			SYSDDL.DataTextField = "LXMC";
			SYSDDL.DataValueField = "ID";
			SYSDDL.DataBind();
		}
	}
	protected void addBtn_Click ( object sender , EventArgs e )
	{
		SqlConnection conn = new SqlConnection( ConfigurationManager.ConnectionStrings["syxkConn"].ConnectionString );
		SqlCommand comm = new SqlCommand();
		comm.Connection = conn;
		comm.CommandText = "update t_glyxxb set sfsyszr=@sylxid where DLM=@glyid";
		comm.Parameters.Clear();
		comm.Parameters.AddWithValue( "glyid" , GLYDDL.SelectedValue );
		comm.Parameters.AddWithValue( "sylxid" , SYSDDL.SelectedValue );
		try
		{
			conn.Open();
			comm.ExecuteNonQuery();
			GridView1.DataBind();
		}
		catch ( Exception ex )
		{
			Response.Redirect( "error.aspx?errcode=" + ex.Message );
		}
		finally
		{
			conn.Close();
		}
	}

}
