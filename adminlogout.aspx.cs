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

public partial class adminlogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Security s = new Security();
		s.setSecurity( priCode.none );
		s.setUserName("");
		s.setUserCode("");
		Session["sec"] = s;
		Response.Redirect( "login.aspx" );
    }
}
