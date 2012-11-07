using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin_xggrxx : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Security sec = new Security();
        //string usercode = sec.getUserCode();
       // string usercode = "chinallk1";
        //Session["usercode"] = usercode;
        

    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Command(object sender, CommandEventArgs e)
    {

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
    protected void Button2_Click(object sender, EventArgs e)
    {
        //FormView1.ChangeMode(FormViewMode.ReadOnly);
       // MessageLabel.Text = "";
    }




    protected void XYTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void SJHTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void FormView1_PageIndexChanging1(object sender, FormViewPageEventArgs e)
    {

    }
}
