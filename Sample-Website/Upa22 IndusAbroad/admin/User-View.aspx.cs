using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Text;

public partial class admin_User_View : System.Web.UI.Page
{
    public static string USERNAME = "ravi_iginc@yahoo.com";
    public static string API_KEY = "dc808cd8-512f-4f02-a6d6-9a2fc68ada01";
    DataSet ds = new DataSet();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";
    string strScript;
    exception err = new exception();
    static string excep_page = "User-View.aspx";
    DataSet dsadmin = new DataSet();

    /// <summary>
    /// Displaying specific user  details by id
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                try
                {
                    string use = Request.QueryString["id"];
                    SqlDataAdapter ad = new SqlDataAdapter("select  * from IA_Users where uid='" + use + "' ", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtFName.Text = ds.Tables[0].Rows[0]["Fname"].ToString();
                        txtLName.Text = ds.Tables[0].Rows[0]["Lname"].ToString();
                        ddlUserType.SelectedItem.Text = ds.Tables[0].Rows[0]["designation"].ToString();
                        ddlCountry.SelectedItem.Text = ds.Tables[0].Rows[0]["country"].ToString();
                        txtUserId.Text = ds.Tables[0].Rows[0]["userid"].ToString();
                        txtPwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
                        txtconPwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
                        txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                        txtMobile.Text = ds.Tables[0].Rows[0]["phno"].ToString();
                        txtConNumber.Text = ds.Tables[0].Rows[0]["contact"].ToString();
                        txtEmailId.Text = ds.Tables[0].Rows[0]["emailid"].ToString();


                        string Enquiryview1 = ds.Tables[0].Rows[0]["Enquiryview"].ToString();
                        if (Enquiryview1 == "1") { CheckBox2.Checked = true; } else { CheckBox2.Checked = false; }
                        string Enquiryreply1 = ds.Tables[0].Rows[0]["Enquiryreply"].ToString();
                        if (Enquiryreply1 == "1") { CheckBox3.Checked = true; } else { CheckBox3.Checked = false; }
                        string Enquirydelete1 = ds.Tables[0].Rows[0]["Enquirydelete"].ToString();
                        if (Enquirydelete1 == "1") { CheckBox5.Checked = true; } else { CheckBox5.Checked = false; }

                        if ((CheckBox2.Checked == true) || (CheckBox3.Checked == true) || (CheckBox5.Checked == true))
                        {
                            rdempyes.Checked = true;
                        }
                        if ((CheckBox2.Checked == true) && (CheckBox3.Checked == true) && (CheckBox5.Checked == true))
                        {
                            CheckBox1.Checked = true;
                        }

                        string Courseview1 = ds.Tables[0].Rows[0]["Courseview"].ToString();
                        if (Courseview1 == "1") { CheckBox8.Checked = true; } else { CheckBox8.Checked = false; }
                        string Courseedit1 = ds.Tables[0].Rows[0]["Courseedit"].ToString();
                        if (Courseedit1 == "1") { CheckBox10.Checked = true; } else { CheckBox10.Checked = false; }
                        string coursedelete1 = ds.Tables[0].Rows[0]["coursedelete"].ToString();
                        if (coursedelete1 == "1") { CheckBox11.Checked = true; } else { CheckBox11.Checked = false; }

                        if ((CheckBox8.Checked == true) || (CheckBox10.Checked == true) || (CheckBox11.Checked == true))
                        {
                            rdh1byes.Checked = true;
                        }
                        if ((CheckBox8.Checked == true) && (CheckBox10.Checked == true) && (CheckBox11.Checked == true))
                        {
                            CheckBox7.Checked = true;
                        }

                        string studentview1 = ds.Tables[0].Rows[0]["studentview"].ToString();
                        if (studentview1 == "1") { CheckBox60.Checked = true; } else { CheckBox60.Checked = false; }
                        string studentedit1 = ds.Tables[0].Rows[0]["studentedit"].ToString();
                        if (studentedit1 == "1") { CheckBox103.Checked = true; } else { CheckBox103.Checked = false; }
                        string studentdelete1 = ds.Tables[0].Rows[0]["studentdelete"].ToString();
                        if (studentdelete1 == "1") { CheckBox104.Checked = true; } else { CheckBox104.Checked = false; }

                        if ((CheckBox60.Checked == true) || (CheckBox103.Checked == true) || (CheckBox104.Checked == true))
                        {
                            Profileyes.Checked = true;
                        }
                        if ((CheckBox60.Checked == true) && (CheckBox103.Checked == true) && (CheckBox104.Checked == true))
                        {
                            CheckBox54.Checked = true;
                        }

                        string supportview1 = ds.Tables[0].Rows[0]["supportview"].ToString();
                        if (supportview1 == "1") { CheckBox14.Checked = true; } else { CheckBox14.Checked = false; }
                        string supportreply1 = ds.Tables[0].Rows[0]["supportreply"].ToString();
                        if (supportreply1 == "1") { CheckBox15.Checked = true; } else { CheckBox15.Checked = false; }
                        string supportdelete1 = ds.Tables[0].Rows[0]["supportdelete"].ToString();
                        if (supportdelete1 == "1") { CheckBox17.Checked = true; } else { CheckBox17.Checked = false; }

                        if ((CheckBox14.Checked == true) || (CheckBox15.Checked == true) || (CheckBox17.Checked == true))
                        {
                            Careersyes.Checked = true;
                        }
                        if ((CheckBox14.Checked == true) && (CheckBox15.Checked == true) && (CheckBox17.Checked == true))
                        {
                            CheckBox13.Checked = true;
                        }

                        string usersview1 = ds.Tables[0].Rows[0]["usersview"].ToString();
                        if (usersview1 == "1") { CheckBox32.Checked = true; } else { CheckBox32.Checked = false; }
                        string userscreate1 = ds.Tables[0].Rows[0]["userscreate"].ToString();
                        if (userscreate1 == "1") { CheckBox33.Checked = true; } else { CheckBox33.Checked = false; }
                        string usersedit1 = ds.Tables[0].Rows[0]["usersedit"].ToString();
                        if (usersedit1 == "1") { CheckBox34.Checked = true; } else { CheckBox34.Checked = false; }
                        string usersdelete1 = ds.Tables[0].Rows[0]["usersdelete"].ToString();
                        if (usersdelete1 == "1") { CheckBox35.Checked = true; } else { CheckBox35.Checked = false; }

                        if ((CheckBox32.Checked == true) || (CheckBox33.Checked == true) || (CheckBox34.Checked == true) || (CheckBox35.Checked == true))
                        {
                            Seminarsyes.Checked = true;
                        }
                        if ((CheckBox32.Checked == true) && (CheckBox33.Checked == true) && (CheckBox34.Checked == true) && (CheckBox35.Checked == true))
                        {
                            CheckBox31.Checked = true;
                        }

                        string feedbackview1 = ds.Tables[0].Rows[0]["feedbackview"].ToString();
                        if (feedbackview1 == "1") { CheckBox38.Checked = true; } else { CheckBox38.Checked = false; }
                        string feedbackreply1 = ds.Tables[0].Rows[0]["feedbackreply"].ToString();
                        if (feedbackreply1 == "1") { CheckBox4.Checked = true; } else { CheckBox4.Checked = false; }
                        string feedbackdelete1 = ds.Tables[0].Rows[0]["feedbackdelete"].ToString();
                        if (feedbackdelete1 == "1") { CheckBox41.Checked = true; } else { CheckBox41.Checked = false; }

                        if ((CheckBox38.Checked == true) || (CheckBox4.Checked == true) || (CheckBox41.Checked == true))
                        {
                            Feedbackyes.Checked = true;
                        }
                        if ((CheckBox38.Checked == true) && (CheckBox4.Checked == true) && (CheckBox41.Checked == true))
                        {
                            CheckBox37.Checked = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    err.insert_exception(ex, excep_page);
                    Response.Redirect("ExceptionPage.aspx");
                }
            }
        }
    }

    /// <summary>
    /// redirect to users page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkview_Click(object sender, EventArgs e)
    {
        Response.Redirect("Users.aspx");
    }


    ///// <summary>
    ///// Enquiry   select all checkbox
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox1.Checked == true)
    //    {
    //        CheckBox2.Checked = true;
    //        CheckBox3.Checked = true;
    //        CheckBox5.Checked = true;
    //    }
    //    else
    //    {
    //        CheckBox2.Checked = false;
    //        CheckBox3.Checked = false;
    //        CheckBox5.Checked = false;
    //    }
    //}

    ///// <summary>
    ///// enquiry view  CHECK/UNCHECK
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox2.Checked == false)
    //    {
    //        CheckBox1.Checked = false;
    //    }
    //    else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
    //    {
    //        CheckBox1.Checked = true;
    //    }
    //}

    ///// <summary>
    ///// enquiry reply  CHECK/UNCHECK
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox3.Checked == false)
    //    {
    //        CheckBox1.Checked = false;
    //    }
    //    else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
    //    {
    //        CheckBox1.Checked = true;
    //    }
    //}

    ///// <summary>
    ///// enquiry delete  CHECK/UNCHECK
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox5.Checked == false)
    //    {
    //        CheckBox1.Checked = false;
    //    }
    //    else if (CheckBox2.Checked == true && CheckBox3.Checked == true && CheckBox4.Checked == true && CheckBox5.Checked == true)
    //    {
    //        CheckBox1.Checked = true;
    //    }
    //}


    ///// <summary>
    ///// courses select all check/uncheck
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox1.Checked == true)
    //    {
    //        CheckBox2.Checked = true;
    //        CheckBox3.Checked = true;
    //        CheckBox5.Checked = true;
    //    }
    //    else
    //    {
    //        CheckBox2.Checked = false;
    //        CheckBox3.Checked = false;
    //        CheckBox5.Checked = false;
    //    }
    //}

    ///// <summary>
    ///// courses preview check/uncheck
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox8.Checked == false)
    //    {
    //        CheckBox7.Checked = false;
    //    }
    //    else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
    //    {
    //        CheckBox7.Checked = true;
    //    }
    //}
    //protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox10.Checked == false)
    //    {
    //        CheckBox7.Checked = false;
    //    }
    //    else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
    //    {
    //        CheckBox7.Checked = true;
    //    }
    //}
    //protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox11.Checked == false)
    //    {
    //        CheckBox7.Checked = false;
    //    }
    //    else if (CheckBox8.Checked == true && CheckBox10.Checked == true && CheckBox11.Checked == true)
    //    {
    //        CheckBox7.Checked = true;
    //    }
    //}

    //protected void CheckBox54_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox54.Checked == true)
    //    {
    //        CheckBox60.Checked = true;
    //        CheckBox103.Checked = true;
    //        CheckBox104.Checked = true;
    //    }
    //    else
    //    {
    //        CheckBox60.Checked = false;
    //        CheckBox103.Checked = false;
    //        CheckBox104.Checked = false;
    //    }
    //}
    //protected void CheckBox60_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox60.Checked == false)
    //    {
    //        CheckBox54.Checked = false;
    //    }
    //    else if (CheckBox60.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
    //    {
    //        CheckBox54.Checked = true;
    //    }
    //}


    //protected void CheckBox103_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox103.Checked == false)
    //    {
    //        CheckBox54.Checked = false;
    //    }
    //    else if (CheckBox60.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
    //    {
    //        CheckBox54.Checked = true;
    //    }
    //}

    //protected void CheckBox104_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox104.Checked == false)
    //    {
    //        CheckBox54.Checked = false;
    //    }
    //    else if (CheckBox60.Checked == true && CheckBox103.Checked == true && CheckBox104.Checked == true)
    //    {
    //        CheckBox54.Checked = true;
    //    }
    //}

    //protected void CheckBox13_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox13.Checked == true)
    //    {
    //        CheckBox14.Checked = true;
    //        CheckBox15.Checked = true;
    //        CheckBox17.Checked = true;
    //    }
    //    else
    //    {
    //        CheckBox14.Checked = false;
    //        CheckBox15.Checked = false;
    //        CheckBox17.Checked = false;
    //    }
    //}

    //protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox14.Checked == false)
    //    {
    //        CheckBox13.Checked = false;
    //    }
    //    else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox17.Checked == true)
    //    {
    //        CheckBox13.Checked = true;
    //    }
    //}

    //protected void CheckBox15_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox15.Checked == false)
    //    {
    //        CheckBox13.Checked = false;
    //    }
    //    else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox17.Checked == true)
    //    {
    //        CheckBox13.Checked = true;
    //    }
    //}


    //protected void CheckBox17_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox17.Checked == false)
    //    {
    //        CheckBox13.Checked = false;
    //    }
    //    else if (CheckBox14.Checked == true && CheckBox15.Checked == true && CheckBox17.Checked == true)
    //    {
    //        CheckBox13.Checked = true;
    //    }
    //}

    //protected void CheckBox31_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox31.Checked == true)
    //    {
    //        CheckBox32.Checked = true;
    //        CheckBox33.Checked = true;
    //        CheckBox34.Checked = true;
    //        CheckBox35.Checked = true;
    //    }
    //    else
    //    {
    //        CheckBox32.Checked = false;
    //        CheckBox33.Checked = false;
    //        CheckBox34.Checked = false;
    //        CheckBox35.Checked = false;
    //    }
    //}

    //protected void CheckBox32_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox32.Checked == false)
    //    {
    //        CheckBox31.Checked = false;
    //    }
    //    else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
    //    {
    //        CheckBox31.Checked = true;
    //    }
    //}

    //protected void CheckBox33_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox33.Checked == false)
    //    {
    //        CheckBox31.Checked = false;
    //    }
    //    else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
    //    {
    //        CheckBox31.Checked = true;
    //    }
    //}

    //protected void CheckBox34_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox34.Checked == false)
    //    {
    //        CheckBox31.Checked = false;
    //    }
    //    else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
    //    {
    //        CheckBox31.Checked = true;
    //    }
    //}

    //protected void CheckBox35_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox35.Checked == false)
    //    {
    //        CheckBox31.Checked = false;
    //    }
    //    else if (CheckBox32.Checked == true && CheckBox33.Checked == true && CheckBox34.Checked == true && CheckBox35.Checked == true)
    //    {
    //        CheckBox31.Checked = true;
    //    }
    //}

    //protected void CheckBox37_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox37.Checked == true)
    //    {
    //        CheckBox38.Checked = true;
    //        CheckBox4.Checked = true;
    //        CheckBox41.Checked = true;
    //    }
    //    else
    //    {
    //        CheckBox38.Checked = false;
    //        CheckBox4.Checked = false;
    //        CheckBox41.Checked = false;
    //    }
    //}

    //protected void CheckBox38_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox38.Checked == false)
    //    {
    //        CheckBox37.Checked = false;
    //    }
    //    else if (CheckBox38.Checked == true && CheckBox41.Checked == true && CheckBox4.Checked == true)
    //    {
    //        CheckBox37.Checked = true;
    //    }
    //}

    //protected void CheckBox41_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (CheckBox41.Checked == false)
    //    {
    //        CheckBox37.Checked = false;
    //    }
    //    else if (CheckBox38.Checked == true && CheckBox41.Checked == true && CheckBox4.Checked == true)
    //    {
    //        CheckBox37.Checked = true;
    //    }
    //}

    //protected void CheckBox4_CheckedChanged1(object sender, EventArgs e)
    //{
    //    if (CheckBox41.Checked == false)
    //    {
    //        CheckBox37.Checked = false;
    //    }
    //    else if (CheckBox38.Checked == true && CheckBox41.Checked == true && CheckBox4.Checked == true)
    //    {
    //        CheckBox37.Checked = true;
    //    }
    //}



    //protected void rdempyes_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (rdempyes.Checked == true)
    //    {
    //        tr1.Visible = true;
    //    }
    //    else if (rdempyes.Checked == false)
    //    {
    //        tr1.Visible = false;
    //    }
    //}

    //protected void rdempno_CheckedChanged(object sender, EventArgs e)
    //{

    //    if (rdempyes.Checked == true)
    //    {
    //        tr1.Visible = true;
    //    }
    //    else if (rdempyes.Checked == false)
    //    {
    //        tr1.Visible = false;
    //    }
    //}
    //protected void rdh1byes_CheckedChanged(object sender, EventArgs e)
    //{

    //    if (rdh1byes.Checked == true)
    //    {
    //        tr14.Visible = true;
    //    }
    //    else if (rdh1byes.Checked == false)
    //    {
    //        tr14.Visible = false;
    //    }
    //}
    //protected void rdh1bno_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (rdh1byes.Checked == true)
    //    {
    //        tr14.Visible = true;
    //    }
    //    else if (rdh1byes.Checked == false)
    //    {
    //        tr14.Visible = false;
    //    }
    //}
    //protected void Profileyes_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Profileyes.Checked == true)
    //    {
    //        tr126.Visible = true;
    //    }
    //    else if (Profileyes.Checked == false)
    //    {
    //        tr126.Visible = false;
    //    }
    //}
    //protected void Profileno_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Profileyes.Checked == true)
    //    {
    //        tr126.Visible = true;
    //    }
    //    else if (Profileyes.Checked == false)
    //    {
    //        tr126.Visible = false;
    //    }
    //}
    //protected void Careersyes_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Careersyes.Checked == true)
    //    {
    //        tr21.Visible = true;
    //    }
    //    else if (Careersyes.Checked == false)
    //    {
    //        tr21.Visible = false;
    //    }
    //}
    //protected void Careersno_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Careersyes.Checked == true)
    //    {
    //        tr21.Visible = true;
    //    }
    //    else if (Careersyes.Checked == false)
    //    {
    //        tr21.Visible = false;
    //    }
    //}
    //protected void Seminarsyes_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Seminarsyes.Checked == true)
    //    {
    //        tr42.Visible = true;
    //    }
    //    else if (Seminarsyes.Checked == false)
    //    {
    //        tr42.Visible = false;
    //    }
    //}
    //protected void Seminarsno_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Seminarsyes.Checked == true)
    //    {
    //        tr42.Visible = true;
    //    }
    //    else if (Seminarsyes.Checked == false)
    //    {
    //        tr42.Visible = false;
    //    }
    //}
    //protected void Feedbackyes_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Feedbackyes.Checked == true)
    //    {
    //        tr49.Visible = true;
    //    }
    //    else if (Feedbackyes.Checked == false)
    //    {
    //        tr49.Visible = false;
    //    }
    //}
    //protected void Feedbackno_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (Feedbackyes.Checked == true)
    //    {
    //        tr49.Visible = true;
    //    }
    //    else if (Feedbackyes.Checked == false)
    //    {
    //        tr49.Visible = false;
    //    }
    //}
}