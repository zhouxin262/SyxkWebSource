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
/// pbModule 的摘要说明

/// </summary>
public class pbModule
{

	public pbModule()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

	public string getGLYLX ( int code )
	{
		switch ( code )
		{
			case 1:
				return "教务管理员";
			case 0:
				return "系统管理员";
			case 2:
				return "实验管理员";
			default:
				return "error code";
		}
	}

	public bool hasForbiddenChar ( string str )
	{
		string validString = "\",.'()*&^%$#@![]{}|\\=-/`~:;<>?";
		CharEnumerator e = str.GetEnumerator();
		while ( e.MoveNext() )
		{
			if ( validString.IndexOf( e.Current ) >= 0 ) return true;
		}
		return false;
	}

	public bool isValidString (string str)
	{
		string validString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_";
		CharEnumerator e = str.GetEnumerator();
		while (e.MoveNext())
		{
			if ( validString.IndexOf( e.Current ) == -1 ) return false;
		}
		return true;
	}

	public bool isValidIntString ( string str )
	{
		string validString = "1234567890";
		CharEnumerator e = str.GetEnumerator();
		while ( e.MoveNext() )
		{
			if ( validString.IndexOf( e.Current ) == -1 ) return false;
		}
		return true;
	}

	public bool isNullString ( string str )
	{
		if ( str == null || str == "" )
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
