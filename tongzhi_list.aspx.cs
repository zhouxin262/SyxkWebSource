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

public partial class tongzhi_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataSource1.SelectCommand = "SELECT top 10 [ID], case when len(biaoti) > 15 then  left([BIAOTI],12) + '...' when len(biaoti) <=15 then biaoti end as biaoti, [NEIRONG], [SHIJIAN], [FABUREN] FROM [T_GONGGAO] ORDER BY [SHIJIAN] DESC";
        }
    }
}
