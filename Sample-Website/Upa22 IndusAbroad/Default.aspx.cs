using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    string contry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string date = System.DateTime.Now.ToString("dd-MM-yyyy");
        int sts = 0;
        SqlCommand cmd = new SqlCommand("insert into [dbo].[IB_Enquiry] (Name,email_id,mobile,Status,comments,posteddate) values ('" + txt1name.Text + "','" + txtemail.Text + "','" + txtphone.Text + "'," + sts + ",'" + txtmsg.Text + "','" + date + "')", con);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            txt1name.Text = "";
            txtemail.Text = "";
            txtphone.Text = "";

            txtmsg.Text = "";
            string strscpt = "alert ('Your Request Recieved..  Will Contact Shortly..');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", strscpt, true);
            // Response.Redirect("Admin-Courses.aspx");
        }
    }

    protected void imgusa_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgusa.ToolTip;
        Response.Redirect("University-Details.aspx?contry="+contry);
    }


    protected void imgcanada_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgcanada.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void imgau_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgau.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void imguk_Click(object sender, ImageClickEventArgs e)
    {
        contry = imguk.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void imgchina_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgchina.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgsing_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgsing.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void imggermany_Click(object sender, ImageClickEventArgs e)
    {
        contry = imggermany.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgitaly_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgitaly.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgfrance_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgfrance.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgjapan_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgjapan.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgvietnam_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgvietnam.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgbrazil_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgbrazil.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgdubai_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgdubai.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgirlend_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgirlend.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgmexico_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgmexico.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgnorway_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgnorway.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgperu_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgperu.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgkuwait_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgkuwait.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imglatvia_Click(object sender, ImageClickEventArgs e)
    {
        contry = imglatvia.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgswitzer_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgswitzer.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgbelgium_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgbelgium.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgturkey_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgturkey.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void imgsweden_Click(object sender, ImageClickEventArgs e)
    {
        contry = imgsweden.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }


    protected void lnkaus_Click(object sender, EventArgs e)
    {
        contry = lnkaus.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void lnkus_Click(object sender, EventArgs e)
    {
        contry = lnkus.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void lnkcan_Click(object sender, EventArgs e)
    {
        contry = lnkcan.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void lnkusa_Click(object sender, EventArgs e)
    {
        contry = lnkusa.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void lnkchina_Click(object sender, EventArgs e)
    {
        contry = lnkchina.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void lnksing_Click(object sender, EventArgs e)
    {
        contry = lnksing.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void lnkgermany_Click(object sender, EventArgs e)
    {
        contry = lnkgermany.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void lnkitaly_Click(object sender, EventArgs e)
    {
        contry = lnkitaly.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }

    protected void lnkjapan_Click(object sender, EventArgs e)
    {
        contry = lnkjapan.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }
    protected void lnkfrance_Click(object sender, EventArgs e)
    {
        contry = lnkfrance.ToolTip;
        Response.Redirect("University-Details.aspx?contry=" + contry);
    }









   
}