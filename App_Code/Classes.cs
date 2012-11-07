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
/// 教师类
/// </summary>
public class js
{
	private string gzh;//工资号
	private string xm;//姓名
	private string zc;//职称
	private string sjh;//手机号
	private string yjdz;//邮件地址
	private string jj;//简介
	private string zpdz;//照片地址，暂无用处
	private string xymc;//学院名称
	private string lbmc;//类别名称
	private int lbid;//学院id
	private int xyid;//类别id

	public void setGzh ( string str )
	{
		gzh = str;
	}
	public string getGzh ()
	{
		return gzh;
	}

	public void setXm ( string str )
	{
		xm = str;
	}
	public string getXm ()
	{
		return xm;
	}

	public string getZc ()
	{
		return zc;
	}
	public void setZc (string str)
	{
		zc = str;
	}

	public void setSjh ( string str )
	{
		sjh = str;
	}
	public string getSjh ()
	{
		return sjh;
	}

	public void setYjdz ( string str )
	{
		yjdz = str;
	}
	public string getYjdz ()
	{
		return yjdz;
	}

	public void setJj ( string str )
	{
		jj = str;
	}
	public string getJj ()
	{
		return jj;
	}

	public void setZpdz ( string str )
	{
		zpdz = str;
	}
	public string getZpdz ()
	{
		return zpdz;
	}

	public void setLbid ( int i )
	{
		lbid = i;
	}
	public int getLbid ()
	{
		return lbid;
	}

	public void setXyid ( int i )
	{
		xyid = i;
	}
	public int getXyid ()
	{
		return xyid;
	}

	public int add ()
	{
		return add( gzh , xm , zc, sjh , yjdz , jj , xyid );
	}

	public int add ( string gzhStr , string xmStr , string zcStr, string sjhStr , string yjdzStr , string jjStr , int iXyid )
	{
		dbModule dm = new dbModule();
		return dm.addJsxx( gzhStr , xmStr , sjhStr , zcStr , yjdzStr , jjStr , iXyid  );
	}

	public int del ()
	{
		return del( gzh );
	}

	public int del ( string gzhStr )
	{
		dbModule dm = new dbModule();
		return dm.deleteJsxx( gzhStr );
	}

	public int update ()
	{
		return update( gzh , xm , zc, sjh , yjdz , jj , xyid , lbid );
	}

	public int update ( string gzhStr , string xmStr , string zcStr, string sjhStr , string yjdzStr , string jjStr , int iXyid , int iLbid )
	{
		dbModule dm = new dbModule();
		return dm.updateJsxx( gzhStr , xmStr , sjhStr , zcStr , yjdzStr , jjStr , iXyid , iLbid );
	}
}