using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Security 的摘要说明

/// </summary>
/// 
public enum priCode { xtgly , jwgly , sygly , js , xs , none }
public class Security
{



	private priCode s;
	private string userCode;
	private string userName;

	public Security ( priCode c,string uC,string uN )
	{
		s = c;
		userCode = uC;
		userName = uN;
		
	}

	public Security ()
	{
		s = priCode.none;
		userCode = "";
		userName = "";
	}
	public priCode getSecurity ()
	{
		return s;
	}

	public void setSecurity ( priCode c )
	{
		s = c;
	}

	public void setUserCode ( string c )
	{
		userCode = c;
	}

	public string getUserCode ()
	{
		return userCode;
	}

	public void setUserName ( string n )
	{
		userName = n;
	}

	public string getUserName ()
	{
		return userName;
	}

}
