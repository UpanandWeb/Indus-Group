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

public partial class Admin_Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (Request.QueryString["ret"] != null)
        {
            body1.Attributes.Add("onload", "return alertsubmit()");

        }

    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion
    
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string ucourse = "";
        // string ucurriculum = "";
        string curname = "sdsd";
        string fName = "";
        string fext = string.Empty;

        ucourse = Convert.ToString(course.Text);
        if (curr.PostedFile != null)
        {
            fext = System.IO.Path.GetExtension(curr.FileName);
            if (fext != ".pdf")
            {
                lblerror.Text = "You can Upload only PDF Files!";
            }
            else
            {
               // fName =System.IO.Path.GetFileName(curr.FileName);
                //curr.PostedFile.SaveAs(Server.MapPath("Curriculam/" + fName));
                fName = course.SelectedItem.Text.ToString();
                curr.PostedFile.SaveAs(Server.MapPath(fName));
            }
             Response.Redirect("Admin_Upload.aspx?ret=ok");
        }
        else
        {

            lblerror.Text = "You can Upload only PDF Files!";
                
        }
          
  }
      
}
