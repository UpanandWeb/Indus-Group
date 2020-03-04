using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ApplyJob : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    string Base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString != null)
        {

        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        string job = Request.QueryString["jobcode"];
        string name = txt1.Text;
        string ph = txt2.Text;

        string email = txt3.Text;
        if (fp.HasFile)
        {
            string resumeName = fp.FileName.ToString();
            string exte = Path.GetExtension(resumeName);
            if (exte == ".doc" || exte == ".docx")
            {
                string resumepath = Base_dir + "industravels/Resumes/" + resumeName;
                fp.SaveAs(resumepath);
                int flag = 0;
                string date = DateTime.Now.ToString();
                tr.inserjobapplication(job, name, email, ph, resumeName, date, flag);
                string alert = "alert('Thank you, Application sent successfully. Recruiters will contact you soon.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert, true);

            }
            else
            {
                string alert1 = "alert('Please upload file in .doc or .docx formats.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert box", alert1, true);
            }
            
           // ClientScript.RegisterStartupScript(typeof(Page), "Message", "<script>alert('Thank you, Application sent successfully. Recruiters will contact you soon.'); </script>");
            txt1.Text = "";
            txt2.Text = "";
            txt3.Text = "";
        }
    }
}