using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 using System.Data.SqlClient;
using igiit.BussinessLogic;
using System.Web.Configuration;

public partial class admin_Admin_EmpNewFrmCreate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }

        lblmessage.Visible = false;

        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            StateCountry coun = new StateCountry();
            DataSet ds = new DataSet();
            ds = coun.GetCounty();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
                {
                    ccitizen.Items.Add("");
                    ccitizen.Items[i].Text = ds.Tables[0].Rows[i - 1]["txtCountry_name"].ToString();
                    ccitizen.Items[i].Value = ds.Tables[0].Rows[i - 1]["intCountry_id"].ToString();
                }
            }
        }
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
       // try
       // {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("empform1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fmname", SqlDbType.NVarChar, 50).Value = faname.Text;
            cmd.Parameters.Add("@fname", SqlDbType.NVarChar, 50).Value = fname.Text;
            cmd.Parameters.Add("@mname", SqlDbType.NVarChar, 50).Value = mname.Text;
            cmd.Parameters.Add("@aname", SqlDbType.NVarChar, 50).Value = othernames.Text;
            cmd.Parameters.Add("@presaddr", SqlDbType.NVarChar, 50).Value = presaddr.Text;
            cmd.Parameters.Add("@permaddr", SqlDbType.NVarChar, 50).Value = permaddr.Text;
            cmd.Parameters.Add("@permaddr_F", SqlDbType.NVarChar, 50).Value = permaddr_f.Text;
            cmd.Parameters.Add("@dob", SqlDbType.NVarChar, 50).Value = dob.Text.ToString();
            cmd.Parameters.Add("@bplace", SqlDbType.NVarChar, 50).Value = bplace.Text;
            cmd.Parameters.Add("@c_citizen", SqlDbType.NVarChar, 50).Value = ccitizen.SelectedItem.Text;
            cmd.Parameters.Add("@ssno", SqlDbType.NVarChar, 50).Value = ssno.Text;
            cmd.Parameters.Add("@aregno", SqlDbType.NVarChar, 50).Value = arno.Text;
            cmd.Parameters.Add("@Dtaxid", SqlDbType.NVarChar, 50).Value = taxno.Text;
            cmd.Parameters.Add("@nimgr", SqlDbType.NVarChar, 50).Value = nonimm.Text;
            cmd.Parameters.Add("@rdt", SqlDbType.NVarChar, 50).Value = usaddmission.Text.ToString();
            cmd.Parameters.Add("@i94no", SqlDbType.NVarChar, 50).Value = i94no.Text;
           int i= cmd.ExecuteNonQuery();
            con.Close();

            if (i == 1)
            {
                string str = "select top 1 * from empform  order by id desc ";
                SqlCommand com = new SqlCommand(str, con);
                SqlDataReader dr;
                con.Open();
                dr = com.ExecuteReader();
                int uid = 0;
                while (dr.Read())
                {
                    uid = Convert.ToInt32(dr["ID"]);
                    //  Session["ID"] = uid;
                }
                Response.Redirect("Admin_EmpNewFrmCreate1.aspx?crid=" + uid);
            }
    }
}