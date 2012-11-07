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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            string str = "alarm.aspx?month=" + DateTime.Now.AddMonths( -1 ).ToString( "yyyy-MM" );
            Response.Write("<script language='javascript'> window.open('tongzhi_list.aspx','adkj','height=350, width=550, top=100, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')</script>");
     
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
        int result = 0;
        Security s = new Security();
        string url = "";
        switch (Convert.ToInt32(lb_DropList.SelectedValue))
        {
            case 0://学生
                result = dm.xsLogin(uCode, uPass);
                url = "stuDefault.aspx";
                s.setSecurity(priCode.xs);
                s.setUserName(dm.getUnameByUcode(uCode, priCode.xs));
                break;
            case 1://任课教师
                result = dm.jsLogin(uCode, uPass);
                url = "teaDefault.aspx";
                s.setUserName(dm.getUnameByUcode(uCode, priCode.js));
                s.setSecurity(priCode.js);
                break;
            case 2://实验教师
                result = dm.eadmLogin(uCode, uPass);
                url = "eadmDefault.aspx";
                s.setSecurity(priCode.sygly);
                s.setUserName(dm.getUnameByUcode(uCode, priCode.sygly));
                break;
            case 3://管理员
                result = dm.adminLogin(uCode, uPass);
                url = "adminDefault.aspx";
                s.setSecurity(priCode.xtgly);
                s.setUserName(dm.getUnameByUcode(uCode, priCode.xtgly));
                break;


        }
		switch ( result )
		{
			case -1 :
				errors.Text = Resources.Resource.strWrongPasswordString;
				break;
			case 0:
				errors.Text = Resources.Resource.strWrongUsernameString;
				break;
			case 1:
				s.setUserCode(ucodeTextbox.Text.Trim());
				
				Session["sec"] = s;
				Session["usercode"] = s.getUserCode();
				Response.Redirect(url);
				break;
			default:
				errors.Text = Resources.Resource.strDuplicateUserNameString;
				break;
		}
	}
}
