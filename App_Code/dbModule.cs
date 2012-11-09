using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// data 的摘要说明

/// </summary>
public class dbModule
{
    private SqlConnection conn = new SqlConnection();

    public dbModule()
    {
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["syxkConn"].ConnectionString;
    }
    public dbModule(string connString)
    {
        conn.ConnectionString = connString;
    }


    public void ClearData()
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "delete from aaaaa";
        try
        {
            conn.Open();
            comm.CommandText = "delete from t_syxkb";
            comm.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            comm.CommandText = "delete from t_xsxkb";
            comm.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            comm.CommandText = "delete from t_syjhb";
            comm.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            comm.CommandText = "delete from t_syxxb";
            comm.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            comm.CommandText = "delete from t_kcxxb";
            comm.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            comm.CommandText = "delete from t_xsxxb";
            comm.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            comm.CommandText = "delete from t_gonghao";
            comm.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {

        }
    }


	public DataTable getWxsyxsmd(string kcbh, int syid)
	{
		DataTable dt = new DataTable("tableXs");
		SqlDataAdapter da = new SqlDataAdapter("select xsxh as 学号,xsxm as 姓名,xymc as 学院,nj as 年级,sjh as 手机号,yjdz as 邮件地址 from v_xsjbxx where xsxh in (select xsxh from t_xsxkb join t_kcxxb on t_xsxkb.kcid=t_kcxxb.id where kcbh=@kcbh ) and  xsxh not in (select xsxh from v_syxkb where syid=@syid) ", conn);
		da.SelectCommand.Parameters.Clear();
		da.SelectCommand.Parameters.AddWithValue("kcbh", kcbh);
		da.SelectCommand.Parameters.AddWithValue("syid", syid);
		try
		{
			da.Fill(dt);
		}
		catch
		{
			dt.TableName = "err";
		}
		return dt;
	}

    public int updateXssyfs(string outid, int kcid, int intPoints)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_xsxkb set syfs=@syfs where xsxh=@xsxh and kcid=@kcid";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("kcid", kcid);
        comm.Parameters.AddWithValue("xsxh", outid);
        comm.Parameters.AddWithValue("syfs", intPoints);
        int result = 0;
        try
        {
            conn.Open();
            result = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            result = Convert.ToInt32(ex.Class);
        }
        finally
        {
            conn.Close();
        }
        return result;

    }

    public int addXsXk(string outid, int kcid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_xsxkb (kcid,xsxh) values(@kcid,@xsxh)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("kcid", kcid);
        comm.Parameters.AddWithValue("xsxh", outid);
        int result = 0;
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            result = Convert.ToInt32(ex.Class);
        }
        finally
        {
            conn.Close();
        }
        return result;

    }

    public string getUnameByUcode(string ucode, priCode uType)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataTable dt = new DataTable();
        int rows = 0;
        switch (uType)
        {
            case priCode.xtgly:

                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select GLYXM from T_GLYXXB where DLM=@username and  GLYLX=0";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["GLYXM"].ToString();
                }
            case priCode.xs:
                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select xsxm from t_xsxxb where xsxh=@username";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["xsxm"].ToString();
                }
                break;
            case priCode.js:
                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select jsxm from t_jsxxb where gzh=@username ";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["jsxm"].ToString();
                }
                break;
            case priCode.jwgly:

                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select GLYXM from T_GLYXXB where DLM=@username and  GLYLX=1";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["GLYXM"].ToString();
                }
                break;
            case priCode.sygly:

                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select GLYXM from T_GLYXXB where DLM=@username and  GLYLX=2";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["GLYXM"].ToString();
                }
                break;
            default:
                return "error!";
        }
    }
    public string getUxyByUcode(string ucode, priCode uType)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataTable dt = new DataTable();
        int rows = 0;
        switch (uType)
        {
            case priCode.xtgly:

                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select GLYXY from T_GLYXXB where DLM=@username and  GLYLX=0";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["GLYXY"].ToString();
                }
            case priCode.xs:
                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select XYID from t_xsxxb where xsxh=@username";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["XYID"].ToString();
                }
                break;
            case priCode.js:
                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select XYID from t_jsxxb where gzh=@username ";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["XYID"].ToString();
                }
                break;
            case priCode.jwgly:

                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select GLYXY from T_GLYXXB where DLM=@username and  GLYLX=1";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["GLYXY"].ToString();
                }
                break;
            case priCode.sygly:

                comm.Connection = conn;
                //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

                comm.CommandText = "select GLYXY from T_GLYXXB where DLM=@username and  GLYLX=2";
                comm.Parameters.Clear();
                comm.Parameters.AddWithValue("username", ucode);
                sda.SelectCommand = comm;

                rows = sda.Fill(dt);
                if (rows == 0)
                {
                    return "error!";
                }
                else if (rows > 1)
                {
                    return "error!";
                }
                else //rows == 1
                {
                    return dt.Rows[0]["GLYXY"].ToString();
                }
                break;
            default:
                return "error!";
        }
    }
    public int adminLogin(string userName, string password)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

        comm.CommandText = "select DLM,DLMM,GLYXM from T_GLYXXB where DLM=@username and  GLYLX=0";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("username", userName);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return 0;
        }
        else if (rows > 1)
        {
            return rows;
        }
        else //rows == 1
        {
            if (password.Equals(dt.Rows[0]["DLMM"].ToString()))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

    }

    public int eadmLogin(string userName, string password)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

        comm.CommandText = "select DLM,DLMM,GLYXM from T_GLYXXB where DLM=@username and  GLYLX=2";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("username", userName);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return 0;
        }
        else if (rows > 1)
        {
            return rows;
        }
        else //rows == 1
        {
            if (password.Equals(dt.Rows[0]["DLMM"].ToString()))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

    }

    public int aadmLogin(string userName, string password)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        //管理员类型0是系统管理员,1是教务管理员,2是实验室管理员

        comm.CommandText = "select DLM,DLMM,GLYXM from T_GLYXXB where DLM=@username and  GLYLX=1";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("username", userName);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return 0;
        }
        else if (rows > 1)
        {
            return rows;
        }
        else //rows == 1
        {
            if (password.Equals(dt.Rows[0]["DLMM"].ToString()))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

    }

    public int xsLogin(string userName, string password)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;

        comm.CommandText = "select xsxh,dlmm from t_xsxxb where xsxh=@username";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("username", userName);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return 0;
        }
        else if (rows > 1)
        {
            return rows;
        }
        else //rows == 1
        {
            if (password.Equals(dt.Rows[0]["DLMM"].ToString()))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

    }

    public int jsLogin(string userName, string password)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;

        comm.CommandText = "select gzh,DLMM ,jslb from t_jsxxb where gzh=@username";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("username", userName);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return 0;
        }
        else if (rows > 1)
        {
            return rows;
        }
        else //rows == 1
        {
            if (password.Equals(dt.Rows[0]["DLMM"].ToString()))
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

    }

    /// <summary>
    /// 实验分组
    /// </summary>
    /// <param name="syid">实验id</param>
    /// <param name="bhqz">编号前缀</param>
    /// <param name="syfz">实验分组</param>
    /// <param name="mzrs">每组人数</param>
    /// <returns></returns>
    public int syfz(int syid, string bhqz, int syfz, int mzrs, int sysid, string jsid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "SELECT MAX(RIGHT(SYBH, 3)) FROM T_SYJHB WHERE (LEFT(SYBH, LEN(SYBH) - 3) = @bhqz)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("bhqz", bhqz);
        int qsbh = 0;
        try
        {
            conn.Open();
            qsbh = Convert.ToInt32(comm.ExecuteScalar());
        }
        catch
        {
            qsbh = 0;
        }
        finally
        {
            conn.Close();
        }
        comm.CommandText = "select xn1,xn2,xq from d_xqcsrq";
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        string syxn = dt.Rows[0]["xn1"].ToString() + "-" + dt.Rows[0]["xn2"].ToString();
        int syxq = Convert.ToInt32(dt.Rows[0]["xq"]);
        for (int i = qsbh + 1; i < qsbh + syfz + 1; i++)
        {
            comm.CommandText = "insert into t_syjhb (syid,sybh,syrs,syxn,syxq,sysid,syjsid) values(@syid,@sybh,@syrs,@syxn,@syxq,@sysid,@syjsid)";
            comm.Parameters.Clear();
            comm.Parameters.AddWithValue("syid", syid);
            comm.Parameters.AddWithValue("sybh", bhqz + i.ToString().PadLeft(3, '0'));
            comm.Parameters.AddWithValue("syrs", mzrs);
            comm.Parameters.AddWithValue("syxn", syxn);
            comm.Parameters.AddWithValue("syxq", syxq);
            comm.Parameters.AddWithValue("sysid", sysid);
            comm.Parameters.AddWithValue("syjsid", jsid);

            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
            }
            catch
            {
                return -1;
            }

            finally
            {
                conn.Close();
            }
        }
        return 1;

    }

    public string getSymcBySyid(int syid)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select SYMC from V_SYJBXXB where ID=@ID";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("ID", syid);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["SYMC"].ToString();
        }
    }

    public string getKcidBySyid(int syid)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select kcid from V_SYJBXXB where ID=@ID";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("ID", syid);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["kcid"].ToString();
        }
    }



    public string getKcmcBySyid(int syid)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select KCMC from V_SYJBXXB where ID=@ID";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("ID", syid);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["KCMC"].ToString();
        }
    }


    public int updatePasswd(string sqlstr)
    {
        conn.Open();
        SqlCommand comm = new SqlCommand(sqlstr, conn);
        if (comm.ExecuteNonQuery() > 0)
        {
            conn.Close();
            return 1;
        }
        else
        {
            conn.Close();
            return -1;
        }

    }

    public int addKcxx(string kcbh, string kcmc, string jsid, string kcxx, int kcxs, int skrs, int xyid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_kcxxb (kcbh,kcmc,jsid,kcxx,kcxs,skrs, xyid) VALUES(@kcbh,@kcmc,@jsid,@kcxx,@kcxs,@skrs, @xyid)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("kcbh", kcbh);
        comm.Parameters.AddWithValue("kcmc", kcmc);
        comm.Parameters.AddWithValue("jsid", jsid);
        comm.Parameters.AddWithValue("kcxx", kcxx);
        comm.Parameters.AddWithValue("kcxs", kcxs);
        comm.Parameters.AddWithValue("skrs", skrs);
        comm.Parameters.AddWithValue("xyid", xyid);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            if (ex.Class == 16)
            {
                rows = -1;
            }
            else
            {
                rows = 0;
            }
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int addJsxx(string gzhStr, string xmStr, string zcStr, string sjhStr, string yjdzStr, string jjStr, int iXyid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_jsxxb (GZH,JSXM,DLMM,ZC,XYID,SJH,YJDZ,SFYX) VALUES(@GZH,@JSXM,@DLMM,@ZC,@XYID,@SJH,@YJDZ,1)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("GZH", gzhStr);
        comm.Parameters.AddWithValue("JSXM", xmStr);
        comm.Parameters.AddWithValue("DLMM", Resources.Resource.strDefaultPasswordString);
        comm.Parameters.AddWithValue("ZC", zcStr);
        comm.Parameters.AddWithValue("XYID", iXyid);
        comm.Parameters.AddWithValue("SJH", sjhStr);
        comm.Parameters.AddWithValue("YJDZ", yjdzStr);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int addXsxx(string xhStr, string xmStr, string sjhStr, string yjdzStr, int iXyid, int iLbid, int iZyid, int nj)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_xsxxb (XSXH,XSXM,DLMM,SJH,YJDZ,XYID,XSLBID,ZYID,NJ) VALUES (@XSXH,@XSXM,@DLMM,@SJH,@YJDZ,@XYID,@XSLBID,@ZYID,@NJ)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("XSXH", xhStr);
        comm.Parameters.AddWithValue("XSXM", xmStr);
        comm.Parameters.AddWithValue("DLMM", Resources.Resource.strDefaultPasswordString);
        comm.Parameters.AddWithValue("SJH", sjhStr);
        comm.Parameters.AddWithValue("YJDZ", yjdzStr);
        comm.Parameters.AddWithValue("XYID", iXyid);
        comm.Parameters.AddWithValue("XSLBID", iLbid);
        comm.Parameters.AddWithValue("ZYID", iZyid);
        comm.Parameters.AddWithValue("NJ", nj);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }


    public int addSysxx(string mcStr, string ddStr, int iRl, int iSysid, string msStr, int iTtpbs)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_sysxxb (SYSMC,SYSDD,SYSRL,SYSLXID,SYSMS,TTPBS) VALUES (@SYSMC,@SYSDD,@SYSRL,@SYSLXID,@SYSMS,@TTPBS)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("SYSMC", mcStr);
        comm.Parameters.AddWithValue("SYSDD", ddStr);
        comm.Parameters.AddWithValue("SYSRL", iRl);
        comm.Parameters.AddWithValue("SYSLXID", iSysid);
        comm.Parameters.AddWithValue("SYSMS", msStr);
        comm.Parameters.AddWithValue("TTPBS", iTtpbs);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int addSyxx(string symc, string sykcid, int sylxid, int sylbid, int syyqid, int syzlbid, int syxs, string nrdxz, string yrdxz, string syjj)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_syxxb (SYMC,KCID,SYLXID,SYLBID,SYYQID,SYZLBID,SYXS,NRDXZ,YRDXZ,SYJJ,SQRID,SQZT,syxz) VALUES (@SYMC,@KCID,@SYLXID,@SYLBID,@SYYQID,@SYZLBID,@SYXS,@NRDXZ,@YRDXZ,@SYJJ,'GLY',1,'必修实验')";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("SYMC", symc);
        comm.Parameters.AddWithValue("KCID", sykcid);
        comm.Parameters.AddWithValue("SYLXID", sylxid);
        comm.Parameters.AddWithValue("SYLBID", sylbid);
        comm.Parameters.AddWithValue("SYYQID", syyqid);
        comm.Parameters.AddWithValue("SYZLBID", syzlbid);
        comm.Parameters.AddWithValue("SYXS", syxs);
        comm.Parameters.AddWithValue("NRDXZ", nrdxz);
        comm.Parameters.AddWithValue("YRDXZ", yrdxz);
        comm.Parameters.AddWithValue("SYJJ", syjj);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }


    public int addSyxx(string symc, int sykcid, int sylxid, int sylbid, int syyqid, int syzlbid, int syxs, string nrdxz, string yrdxz, string syjj, string sqrid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_syxxb (SYMC,KCID,SYLXID,SYLBID,SYYQID,SYZLBID,SYXS,NRDXZ,YRDXZ,SYJJ,SQRID,SQZT,syxz) VALUES (@SYMC,@KCID,@SYLXID,@SYLBID,@SYYQID,@SYZLBID,@SYXS,@NRDXZ,@YRDXZ,@SYJJ,@sqrid,-1,'实践项目')";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("SYMC", symc);
        comm.Parameters.AddWithValue("KCID", sykcid);
        comm.Parameters.AddWithValue("SYLXID", sylxid);
        comm.Parameters.AddWithValue("SYLBID", sylbid);
        comm.Parameters.AddWithValue("SYYQID", syyqid);
        comm.Parameters.AddWithValue("SYZLBID", syzlbid);
        comm.Parameters.AddWithValue("SYXS", syxs);
        comm.Parameters.AddWithValue("NRDXZ", nrdxz);
        comm.Parameters.AddWithValue("YRDXZ", yrdxz);
        comm.Parameters.AddWithValue("SYJJ", syjj);
        comm.Parameters.AddWithValue("sqrid", sqrid);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int delSyjh(int syjhid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "delete from t_syjhb where id = " + syjhid;
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }


    public int addSyjh(int syid, string sybh, string syjsid, int sysid, int syrs, string syxn, int syxq, int syz, int syxingq, int syks)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_syjhb (sybh,syid,syjsid,sysid,syks,syrs,syxn,syxq,syz,syxingq) VALUES (@sybh,@syid,@syjsid,@sysid,@syks,@syrs,@syxn,@syxq,@syz,@syxingq)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("sybh", sybh);
        comm.Parameters.AddWithValue("syid", syid);
        comm.Parameters.AddWithValue("syjsid", syjsid);
        comm.Parameters.AddWithValue("sysid", sysid);
        comm.Parameters.AddWithValue("syrs", syrs);
        comm.Parameters.AddWithValue("syxn", syxn);
        comm.Parameters.AddWithValue("syxq", syxq);
        comm.Parameters.AddWithValue("syz", syz);
        comm.Parameters.AddWithValue("syxingq", syxingq);
        comm.Parameters.AddWithValue("syks", syks);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int addSyxx(string symc, int syxs, string syjj, string sqrid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_syxxb (SYMC,SYXS,SYJJ,SQRID,SQZT,syxz) VALUES (@SYMC,@SYXS,@SYJJ,@sqrid,-1,'自主实践')";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("SYMC", symc);
        comm.Parameters.AddWithValue("SYXS", syxs);
        comm.Parameters.AddWithValue("SYJJ", syjj);
        comm.Parameters.AddWithValue("sqrid", sqrid);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int addZzsjxm(string symc, string syjj, string sqrid, int sysid, string kssj, string jssj)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_zzsjxmb (sjxmmc,xmjj,sysid,sykssj,syjssj,sqrid,SQZT) VALUES (@symc,@syjj,@sysid,@kssj,@jssj,@srqid,-1)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("symc", symc);
        comm.Parameters.AddWithValue("syjj", syjj);
        comm.Parameters.AddWithValue("sysid", sysid);
        comm.Parameters.AddWithValue("kssj", kssj);
        comm.Parameters.AddWithValue("jssj", jssj);
        comm.Parameters.AddWithValue("srqid", sqrid);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int updateJsxx(string gzhStr, string xmStr, string zcStr, string sjhStr, string yjdzStr, string jjStr, int iXyid, int iLbid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_jsxxb set JSXM=@JSXM,ZC=@ZC,XYID=@XYID,SJH=@SJH,YJDZ=@YJDZ,JSLB=@JSLB,SFYX=@SFYX WHERE GZH=@GZH";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("GZH", gzhStr);
        comm.Parameters.AddWithValue("JSXM", xmStr);
        comm.Parameters.AddWithValue("DLMM", Resources.Resource.strDefaultPasswordString);
        comm.Parameters.AddWithValue("ZC", zcStr);
        comm.Parameters.AddWithValue("XYID", iXyid);
        comm.Parameters.AddWithValue("SJH", sjhStr);
        comm.Parameters.AddWithValue("YJDZ", yjdzStr);
        comm.Parameters.AddWithValue("JSLB", iLbid);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int deleteJsxx(string gzhStr)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_jsxxb set sfyx=0 where gzh=@gzh";
        comm.Parameters.AddWithValue("gzh", gzhStr);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public string getXsxmByXh(string xh)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select XSXM from V_XSJBXX where XSXH=@XSXH";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("XSXH", xh);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["XSXM"].ToString();
        }
    }

    public string getXslbByXh(string xh)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select lbmc from V_XSJBXX where XSXH=@XSXH";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("XSXH", xh);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["lbmc"].ToString();
        }
    }


    public string getXyidByXymc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_xyxxb where xymc=@xymc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("xymc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["id"].ToString();
        }
    }


    public string getZyidByZymc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_zyxxb where zymc=@zymc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("zymc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["id"].ToString();
        }
    }

    public string getXslbidByLbmc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_xslbb where lbmc=@lbmc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("lbmc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["id"].ToString();
        }
    }


    public string getKcidByKcbhJsid(string str ,string jsid)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from t_kcxxb where kcbh=@kcbh and jsid=@jsid";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("kcbh", str);
        comm.Parameters.AddWithValue("jsid", jsid);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error!";
        }
        else if (rows > 1)
        {
            return "error!";
        }
        else //rows == 1
        {
            return dt.Rows[0]["id"].ToString();
        }
    }

    public int getSyyqidBySyyqmc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_syyqb where yqmc=@yqmc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("yqmc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["id"].ToString());
        }
    }

    public int getSylxidBySylxmc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_sylxb where lxmc=@lxmc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("lxmc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["id"].ToString());
        }
    }

    public int getSylbidBySylbmc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_sylbb where lbmc=@lbmc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("lbmc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["id"].ToString());
        }
    }

    public int getSyslxidBySyslxmc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from d_syslxb where lxmc=@lxmc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("lxmc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["id"].ToString());
        }
    }

    public int getSysidBySysdd(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from t_sysxxb where sysdd=@sysdd";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("sysdd", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["id"].ToString());
        }
    }

    public int getSyidBySymc(string str)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select id from t_syxxb where symc=@symc";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("symc", str);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["id"].ToString());
        }
    }

    public int cfjh(int sysid, string syxn, int syxq, int syz, int syxingq, int syks)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "select count(*) from t_syjhb where sysid=@sysid  and syz=@syz and syxingq=@syxingq and syks=@syks";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("sysid", sysid);
        //comm.Parameters.AddWithValue("syxn", syxn);
        //comm.Parameters.AddWithValue("syxq", syxq);
        comm.Parameters.AddWithValue("syz", syz);
        comm.Parameters.AddWithValue("syxingq", syxingq);
        comm.Parameters.AddWithValue("syks", syks);
        int i = -1;
        try
        {
            conn.Open();
            i = Convert.ToInt32(comm.ExecuteScalar());
        }
        catch (SqlException ex)
        {
            i = -1;
        }
        finally
        {
            conn.Close();
        }
        return i;
    }

    public int cfxk(int syjhid, string sqrid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "select count(*) from t_syxkb where syjhid in ( select id from t_syjhb where syid in ( select syid from t_syjhb where id=@syjhid)) and sqrid=@sqrid";

        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("syjhid", syjhid);
        comm.Parameters.AddWithValue("sqrid", sqrid);
        int sqcs = -1;
        try
        {
            conn.Open();
            sqcs = Convert.ToInt32(comm.ExecuteScalar());
        }
        catch (SqlException ex)
        {
            sqcs = 0;
        }
        finally
        {
            conn.Close();
        }
        return sqcs;
    }
    public int xkym(int syjhid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "select syrs-sqrs from V_YWCXSRSB where id=@syjhid";

        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("syjhid", syjhid);
        int rsc = 0;
        try
        {
            conn.Open();
            rsc = Convert.ToInt32(comm.ExecuteScalar());
        }
        catch (SqlException ex)
        {
            return 1;
        }
        finally
        {
            conn.Close();
        }
        if (rsc > 0)
        {
            return 0;
        }
        else
        {
            return 0;
        }
    }


    public int sqxk(int syjhid, string sqrid)
    {
        SqlCommand comm = new SqlCommand();

        comm.Connection = conn;
        comm.CommandText = "insert into t_syxkb (syjhid,sqrid) values(@syjhid,@sqrid)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("syjhid", syjhid);
        comm.Parameters.AddWithValue("sqrid", sqrid);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    //门禁授权
    public int mjsq(int syjhid, string outid)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = comm;
        comm.Connection = conn;
        comm.CommandText = "select sysid,syxn,syxq,syz,syxingq,syks from T_syjhb where id=@syjhid";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("syjhid", syjhid);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int sysid = Convert.ToInt32(dt.Rows[0]["sysid"]);
        string syxn = dt.Rows[0]["syxn"].ToString();
        int syxq = Convert.ToInt32(dt.Rows[0]["syxq"]);
        int syz = Convert.ToInt32(dt.Rows[0]["syz"]);
        int syxingq = Convert.ToInt32(dt.Rows[0]["syxingq"]);
        int syks = Convert.ToInt32(dt.Rows[0]["syks"]);

        dt = new DataTable();
        comm.CommandText = "select kssj,jssj from D_sksjb where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", syks);
        sda.Fill(dt);
        int kssj = Convert.ToInt32(dt.Rows[0]["kssj"]);
        int jssj = Convert.ToInt32(dt.Rows[0]["jssj"]);

        dt = new DataTable();
        comm.CommandText = "select csrq from D_xqcsrq where xn1=@xn1 and xn2=@xn2 and xq=@xq";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("xq", syxq);
        comm.Parameters.AddWithValue("xn1", Convert.ToInt32(syxn.Substring(0, 4)));
        comm.Parameters.AddWithValue("xn2", Convert.ToInt32(syxn.Substring(5, 4)));
        sda.Fill(dt);
        DateTime syrq = Convert.ToDateTime(dt.Rows[0]["csrq"]);
        syrq = syrq.AddDays((syz - 1) * 7 + (syxingq - 1) * 1);
        DateTime sykssj = syrq.AddHours(kssj);
        DateTime syjssj = syrq.AddHours(jssj);

        //SqlConnection kqxtConn = new SqlConnection(ConfigurationManager.ConnectionStrings["mjxtConn"].ConnectionString);
        //comm = new SqlCommand("syxk_insert_grant", kqxtConn);
        //comm.CommandType = CommandType.StoredProcedure;
        //comm.Parameters.AddWithValue("outid", outid);
        //comm.Parameters.AddWithValue("sysid", sysid);
        //comm.Parameters.AddWithValue("kssj", sykssj.AddMinutes(-10));
        //comm.Parameters.AddWithValue("jssj", syjssj.AddMinutes(10));
        //kqxtConn.Open();
        //comm.ExecuteNonQuery();
        //kqxtConn.Close();
        conn.Close();
        return 0;
    }


    public int setSyjhSqzt(int syjhid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_syjhb set sqzt=-1*sqzt where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", syjhid);

        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    //直接审核
    public int sqxk(int syjhid, string sqrid, string shrid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;

        comm.CommandText = "insert into t_syxkb (syjhid,sqrid,xkzt,shr,spsj) values(@syjhid,@sqrid,1,@shr,@spsj)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("syjhid", syjhid);
        comm.Parameters.AddWithValue("sqrid", sqrid);
        comm.Parameters.AddWithValue("shr", shrid);
        comm.Parameters.AddWithValue("spsj", DateTime.Now);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
            mjsq(syjhid, sqrid);
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int spxktg(int syxkid, string shrid)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_syxkb set xkzt=1,shr=@shrid,spsj=@spsj where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", syxkid);
        comm.Parameters.AddWithValue("shr", shrid);
        comm.Parameters.AddWithValue("spsj", DateTime.Now);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int getZrSYSID(string dlm)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select sfsyszr from t_glyxxb where dlm=@dlm";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("dlm", dlm);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return -1;
        }
        else if (rows > 1)
        {
            return -1;
        }
        else //rows == 1
        {
            return Convert.ToInt32(dt.Rows[0]["sfsyszr"].ToString());
        }
    }

    public int spsjxmjj(int syid, string jjyy)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_zzsjxmb set sqzt=0,BZ=@jjyy where id=@syid";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("syid", syid);
        comm.Parameters.AddWithValue("jjyy", jjyy);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public string getTongZhiDateById(int id)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select shijian from T_GONGGAO where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", id);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error";
        }
        else if (rows > 1)
        {
            return "error";
        }
        else //rows == 1
        {
            return dt.Rows[0]["shijian"].ToString();
        }
    }

    public string getTongZhiFaBuById(int id)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select faburen from T_GONGGAO where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", id);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error";
        }
        else if (rows > 1)
        {
            return "error";
        }
        else //rows == 1
        {
            return dt.Rows[0]["faburen"].ToString();
        }
    }

    public string getTongZhiNeiRongById(int id)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select neirong from T_GONGGAO where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", id);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error";
        }
        else if (rows > 1)
        {
            return "error";
        }
        else //rows == 1
        {
            return dt.Rows[0]["neirong"].ToString();
        }
    }

    public string getTongZhiBiaoTiById(int id)
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        comm.Connection = conn;
        comm.CommandText = "select biaoti from T_GONGGAO where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", id);
        sda.SelectCommand = comm;
        DataTable dt = new DataTable();
        int rows = sda.Fill(dt);
        if (rows == 0)
        {
            return "error";
        }
        else if (rows > 1)
        {
            return "error";
        }
        else //rows == 1
        {
            return dt.Rows[0]["biaoti"].ToString();
        }
    }

    public int addTongZhi(string biaoti, string neirong, string faburen)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "insert into t_gonggao (biaoti,neirong,faburen) values(@biaoti,@neirong,@faburen)";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("biaoti", biaoti);
        comm.Parameters.AddWithValue("neirong", neirong);
        comm.Parameters.AddWithValue("faburen", faburen);
    
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }

    public int spxkjj(int syxkid, string shrid, string jjyy)
    {
        SqlCommand comm = new SqlCommand();
        comm.Connection = conn;
        comm.CommandText = "update t_syxkb set xkzt=-1,shr=@shrid,spsj=@spsj,ztms=@ztms where id=@id";
        comm.Parameters.Clear();
        comm.Parameters.AddWithValue("id", syxkid);
        comm.Parameters.AddWithValue("shr", shrid);
        comm.Parameters.AddWithValue("spsj", DateTime.Now);
        comm.Parameters.AddWithValue("ztms", jjyy);
        int rows = -1;
        try
        {
            conn.Open();
            rows = comm.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            rows = 0;
        }
        finally
        {
            conn.Close();
        }
        return rows;
    }


	public DataTable getSyqdqk(string kcbh, int syid,string syjsid)
	{
		DataTable dt = new DataTable("tableXs");
		SqlDataAdapter da = new SqlDataAdapter("select kcmc as 课程名称,symc as 实验名称,sqrid as 学号,xsxm as 姓名,jrsj as 进入时间 ,lksj as 离开时间 from v_syxkb where kcid=@kcbh and syid=@syid and syjsid = @syjsid ", conn);
		da.SelectCommand.Parameters.Clear();
		da.SelectCommand.Parameters.AddWithValue("kcbh", kcbh);
		da.SelectCommand.Parameters.AddWithValue("syid", syid);
		da.SelectCommand.Parameters.AddWithValue("syjsid", syjsid);
		try
		{
			da.Fill(dt);
		}
		catch
		{
			dt.TableName = "err";
		}
		return dt;
	}

}
