using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class india_Emp_EmployeeInfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["aceConnectionString"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null && Session["Designation"] == null)
            {
                Response.Redirect("login.aspx");
            }

            else
            {
                string emailid = Session["userid"].ToString();

                //Navigate and bind employee details
                IGIIT sdata = new IGIIT();
                DataSet ds = sdata.GetEmpDet2(emailid);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtemail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                    conemail.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
                    txtempid.Text = ds.Tables[0].Rows[0]["empid"].ToString();
                    empfathername.Text = ds.Tables[0].Rows[0]["fathername"].ToString();
                    empmothername.Text = ds.Tables[0].Rows[0]["mothername"].ToString();
                    imgdisplay.ImageUrl = "~/admin/emp_photos/" + ds.Tables[0].Rows[0]["photo"].ToString();

                    SqlDataAdapter sdp = new SqlDataAdapter("select count(*) as count from emp_personal where emailid='" + emailid + "'", con);
                    DataSet ds1 = new DataSet();
                    sdp.Fill(ds1);
                    if (ds1.Tables[0].Rows[0]["count"].ToString() == "0")
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into emp_personal(empid,emailid) values('" + txtempid.Text + "','" + txtemail.Text + "')", con);
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i == 1)
                        {

                        }
                    }
                    else
                    {
                        SqlDataAdapter sdp1 = new SqlDataAdapter("select * from emp_personal where emailid='" + emailid + "'", con);
                        DataSet ds2 = new DataSet();
                        sdp1.Fill(ds2);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            emprefname.Text = ds2.Tables[0].Rows[0]["Refname"].ToString();
                            emprefdesig.Text = ds2.Tables[0].Rows[0]["Refdesig"].ToString(); ;
                            emprefemail.Text = ds2.Tables[0].Rows[0]["Refemail"].ToString();
                            emprefmob.Text = ds2.Tables[0].Rows[0]["RefMobile"].ToString();
                            emprefalter.Text = ds2.Tables[0].Rows[0]["Refaltmobile"].ToString();
                            emprefaddress.Text = ds2.Tables[0].Rows[0]["Refaddress"].ToString();

                            empfathername.Text = ds2.Tables[0].Rows[0]["Fathername"].ToString();
                            empfatherdesig.Text = ds2.Tables[0].Rows[0]["Fatherdesig"].ToString();
                            empfatheremail.Text = ds2.Tables[0].Rows[0]["Fatheremail"].ToString();
                            empfathermobile.Text = ds2.Tables[0].Rows[0]["FatherMobile"].ToString();
                            empfatheralter.Text = ds2.Tables[0].Rows[0]["Fatheraltmobile"].ToString();
                            empfatheraddress.Text = ds2.Tables[0].Rows[0]["Fatheraddress"].ToString();

                            empmothername.Text = ds2.Tables[0].Rows[0]["Mothername"].ToString();
                            empmotherdesig.Text = ds2.Tables[0].Rows[0]["Motherdesig"].ToString();
                            empmotheremail.Text = ds2.Tables[0].Rows[0]["Motheremail"].ToString();
                            empmothermobile.Text = ds2.Tables[0].Rows[0]["MotherMobile"].ToString();
                            empmotheralter.Text = ds2.Tables[0].Rows[0]["Motheraltmobile"].ToString();
                            empmotheraddress.Text = ds2.Tables[0].Rows[0]["Motheraddress"].ToString();

                            empbrother1name.Text = ds2.Tables[0].Rows[0]["Brother1name"].ToString();
                            empbrother1desig.Text = ds2.Tables[0].Rows[0]["Brother1desig"].ToString();
                            empbrother1email.Text = ds2.Tables[0].Rows[0]["Brother1email"].ToString();
                            empbrother1mobile.Text = ds2.Tables[0].Rows[0]["Brother1Mobile"].ToString();
                            empbrother1alter.Text = ds2.Tables[0].Rows[0]["Brother1altmobile"].ToString();
                            empbrother1address.Text = ds2.Tables[0].Rows[0]["Brother1address"].ToString();

                            empbrother2name.Text = ds2.Tables[0].Rows[0]["Brother2name"].ToString();
                            empbrother2desig.Text = ds2.Tables[0].Rows[0]["Brother2desig"].ToString();
                            empbrother2email.Text = ds2.Tables[0].Rows[0]["Brother2email"].ToString();
                            empbrother2mobile.Text = ds2.Tables[0].Rows[0]["Brother2Mobile"].ToString();
                            empbrother2alter.Text = ds2.Tables[0].Rows[0]["Brother2altmobile"].ToString();
                            empbrother2address.Text = ds2.Tables[0].Rows[0]["Brother2address"].ToString();

                            empsister1name.Text = ds2.Tables[0].Rows[0]["Sister1name"].ToString();
                            empsister1desig.Text = ds2.Tables[0].Rows[0]["Sister1desig"].ToString();
                            empsister1email.Text = ds2.Tables[0].Rows[0]["Sister1email"].ToString();
                            empsister1mobile.Text = ds2.Tables[0].Rows[0]["Sister1Mobile"].ToString();
                            empsister1alter.Text = ds2.Tables[0].Rows[0]["Sister1altmobile"].ToString();
                            empsister1address.Text = ds2.Tables[0].Rows[0]["Sister1address"].ToString();

                            empsister2name.Text = ds2.Tables[0].Rows[0]["Sister2name"].ToString();
                            empsister2desig.Text = ds2.Tables[0].Rows[0]["Sister2desig"].ToString();
                            empsister2email.Text = ds2.Tables[0].Rows[0]["Sister2email"].ToString();
                            empsister2mobile.Text = ds2.Tables[0].Rows[0]["Sister2Mobile"].ToString();
                            empsister2alter.Text = ds2.Tables[0].Rows[0]["Sister2altmobile"].ToString();
                            empsister2address.Text = ds2.Tables[0].Rows[0]["Sister2address"].ToString();

                            string empdes = empdesc.Text = ds2.Tables[0].Rows[0]["Empdes"].ToString();
                        }
                    }
                }
            }
        }
    }

    protected void btmnsave_Click(object sender, EventArgs e)
    {
        string refname = emprefname.Text;
        string refdes = emprefdesig.Text;
        string refemail = emprefemail.Text;
        string refmobile = emprefmob.Text;
        string refalter = emprefalter.Text;
        string refaddress = emprefaddress.Text;

        string fathername = empfathername.Text;
        string fathgerdesig = empfatherdesig.Text;
        string fatheremail = empfatheremail.Text;
        string fathermobile = empfathermobile.Text;
        string fatheralter = empfatheralter.Text;
        string fatheraddress = empfatheraddress.Text;

        string mothername = empmothername.Text;
        string motherdesig = empmotherdesig.Text;
        string mothermail = empmotheremail.Text;
        string mothermobile = empmothermobile.Text;
        string motheralter = empmotheralter.Text;
        string motheraddress = empmotheraddress.Text;

        string bro1name = empbrother1name.Text;
        string bro1desig = empbrother1desig.Text;
        string bro1email = empbrother1email.Text;
        string bro1mobile = empbrother1mobile.Text;
        string bro1later = empbrother1alter.Text;
        string bro1address = empbrother1address.Text;

        string bro2name = empbrother2name.Text;
        string bro2desig = empbrother2desig.Text;
        string bro2email = empbrother2email.Text;
        string bro2mobile = empbrother2mobile.Text;
        string bro2later = empbrother2alter.Text;
        string bro2address = empbrother2address.Text;

        string sis1name = empsister1name.Text;
        string sis1desig = empsister1desig.Text;
        string sis1mail = empsister1email.Text;
        string sis1mobile = empsister1mobile.Text;
        string sis1later = empsister1alter.Text;
        string sis1address = empsister1address.Text;

        string sis2name = empsister2name.Text;
        string sis2desig = empsister2desig.Text;
        string sis2mail = empsister2email.Text;
        string sis2mobile = empsister2mobile.Text;
        string sis2later = empsister2alter.Text;
        string sis2address = empsister2address.Text;

        string empdes=empdesc.Text;
        string date=System.DateTime.Now.ToString("dd/MM/yyyy hh:mm::ss");

        con.Open();
        SqlCommand cmd = new SqlCommand("update emp_personal set Refname ='"+refname+"',Refdesig ='"+refdes+"',Refemail='"+refemail+"', RefMobile='"+refmobile+"',Refaltmobile='"+refalter+"',Refaddress='"+refaddress+"',        Fathername='"+fathername+"',Fatherdesig ='"+fathgerdesig+"',Fatheremail ='"+fatheremail+"', FatherMobile ='"+fathermobile+"',Fatheraltmobile ='"+fatheralter+"',Fatheraddress='"+fatheraddress+"',Mothername ='"+mothername+"',Motherdesig ='"+motherdesig+"',Motheremail ='"+mothermail+"', MotherMobile ='"+mothermobile+"',Motheraltmobile ='"+motheralter+"',Motheraddress ='"+motheraddress+"',Brother1name ='"+bro1name+"',Brother1desig ='"+bro1desig+"',Brother1email ='"+bro1email+"', Brother1Mobile ='"+bro1mobile+"',Brother1altmobile ='"+bro1later+"',Brother1address ='"+bro1address+"',Brother2name ='"+bro2name+"',Brother2desig ='"+bro2desig+"',Brother2email ='"+bro2email+"', Brother2Mobile ='"+bro2mobile+"',Brother2altmobile ='"+bro2later+"',Brother2address ='"+bro2address+"',Sister1name ='"+sis1name+"',Sister1desig ='"+sis1desig+"',Sister1email ='"+sis1mail+"', Sister1Mobile ='"+sis1mobile+"',Sister1altmobile ='"+sis1later+"',Sister1address='"+sis1address+"',Sister2name ='"+sis2name+"',Sister2desig ='"+sis2desig+"',Sister2email ='"+sis2mail+"', Sister2Mobile ='"+sis2mobile+"',Sister2altmobile ='"+sis2later+"',Sister2address ='"+sis2address+"',Empdes  ='"+empdes+"',pdate='"+date+"' where emailid='"+txtemail.Text+"'", con);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        if (i == 1)
        {
            string str = "alert('Data Updated Successfully');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", str, true);
        }

    }
}