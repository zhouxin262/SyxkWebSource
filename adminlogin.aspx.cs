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

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void loginButton_Click ( object sender , EventArgs e )
	{
		dbModule dm = new dbModule();
		pbModule pm = new pbModule();
		string uCode = ucodeTextbox.Text.Trim();
		string uPass = upassTextbox.Text.Trim();
		if ( !pm.isValidString( uCode) || !pm.isValidString( uPass ) )
		{
			errors.Text = Resources.Resource.strNotValidString;
			return;
		}
		int result = dm.adminLogin( uCode , uPass );
		switch ( result )
		{
			case -1 :
				errors.Text = Resources.Resource.strWrongPasswordString;
				break;
			case 0:
				errors.Text = Resources.Resource.strWrongUsernameString;
				break;
			case 1:
				
				Security s = new Security();
				s.setSecurity( priCode.xtgly );
				s.setUserCode(ucodeTextbox.Text.Trim());
				s.setUserName( dm.getUnameByUcode(uCode, priCode.xtgly ) );
				Session["sec"] = s;
				Session["usercode"] = s.getUserCode();
				Response.Redirect( "adminDefault.aspx" );
				break;
			default:
				errors.Text = Resources.Resource.strDuplicateUserNameString;
				break;
		}
	}
}
