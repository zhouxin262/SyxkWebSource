using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stu_xggrxx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Security s = Session["sec"] as Security;
		if ( s == null )
		{
			Response.Redirect( "error.aspx" );
		}
		
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // Use the UpdateItem method to programmatically update
            // the current record in the FormView control. 
            FormView1.UpdateItem(true);
            Response.Write(" <script language=javascript>alert('修改成功');opener.location.reload();window.close(); </script>");

        }
        catch (HttpException ex)
        {
            //MessageLabel.Text = "The FormView control must be in edit mode to update a record.";
        }

    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
}
