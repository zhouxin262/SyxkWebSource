﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tea_xggrxx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Security sec = new Security();
        //string usercode = "1234";
        //Session["usercode"] = usercode;
    }

    

    protected void Button1_Click1(object sender, EventArgs e)
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
}
