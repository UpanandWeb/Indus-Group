using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Text.RegularExpressions;

public partial class admin_Admin_Contacts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";
    private static int CID;
    string Str;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblerror.Visible = false;
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        if (!IsPostBack)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
            SessionStateSection section = (SessionStateSection)config.GetSection("system.web/sessionState");
            int timeout = (int)section.Timeout.TotalMinutes * 1000 * 3660; // sessiontime out is 1 min
            ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

            SqlDataAdapter sqlad1 = new SqlDataAdapter("select top 1   * from EmpContacts  where emp_id is not null order by emp_id desc", con);
            DataSet ds1 = new DataSet();
            sqlad1.Fill(ds1);
            string s = ds1.Tables[0].Rows[0]["emp_id"].ToString();
            string clean = Regex.Replace(s, "[^0-9 ]", "");
            int s1 = Convert.ToInt16(clean);
            s1 = s1 + 1;
            s = "IGI" + Convert.ToString(s1);
            txtemployeeid.Text = s;

            lblAcess.Text = Session["UserName"].ToString();
            Bindnew(GridView1, "Ace Indus");
            Bindnew(MyGrid, "Indus Group");
        }

    }
    protected void lnkbtncurrent_Click(object sender, EventArgs e)
    {
        trbuttons.Visible = true;
        trnew1.Visible = false;
        tr1.Visible = false;
        //tr2.Visible = false;
        trnew2.Visible = false;
        //trpre1.Visible = false;
        //trpre2.Visible = false;
        trcurr1.Visible = true;
        trcurr2.Visible = true;
    }
    protected void lnkbtnpre_Click(object sender, EventArgs e)
    {
        trcurr1.Visible = false;
        trbuttons.Visible = false;
        //tr2.Visible = true;
        tr1.Visible = true;
        trcurr2.Visible = false;
        trnew1.Visible = true;
        trnew2.Visible = true;
        //trpre1.Visible = true;
        //trpre2.Visible = true;
    }
    protected void lnkbtnCon_Click(object sender, EventArgs e)
    {
        btnSubm.Visible = true;
        btnUpdate.Visible = false;
        clearcontrols();
        ModalPopupExtender1.Show();
    }

    private void Bindnew(GridView grd,string company)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("Select * from EmpContacts where Company='" + company + "' order by CName Asc", con);
        da.Fill(ds, "empCont");
        if (ds.Tables[0].Rows.Count > 0)
        {
            grd.DataSource = ds;
            grd.DataBind();
        }
    }
    protected void txtCompanyId_Changed(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmdid = new SqlCommand("select CId from EmpContacts where CcId='" + txtCompId.Text+"'", con);
        string result = Convert.ToString(cmdid.ExecuteScalar());
        con.Close();
        if (result != "")
        {
            ModalPopupExtender1.Show();
            ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('Employee Company Id Already Used, Try Another !!!');</script>");
        }
        else
        {
            ModalPopupExtender1.Show();
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {            
            int value = insups("EmpContInsert",0);
            if (value == 1)
            {
                clearcontrols();
                ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('Employee Contact Saved Successfully');</script>");
            }
            Bindnew(GridView1, "Ace Indus");
            Bindnew(MyGrid, "Indus Group");
    }

    public int insups(string proced, int consId)
    {
        try
        {
            SqlCommand cmd = new SqlCommand(proced, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CId", consId);
            cmd.Parameters.AddWithValue("@cname", txtName.Text);
            cmd.Parameters.AddWithValue("@cphone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@cmail", txtmail.Text);
            cmd.Parameters.AddWithValue("@cgtalk", txtGT.Text);
            cmd.Parameters.AddWithValue("@cext", txtExt.Text);
            cmd.Parameters.AddWithValue("@ccomId", txtCompId.Text);
            cmd.Parameters.AddWithValue("@ccomp", ddlCompanys.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@id", txtemployeeid.Text);

            con.Open();
            return cmd.ExecuteNonQuery();
            //con.Close();

        }
        catch
        {
            //clearcontrols();
            ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('sorry, Try Again ');</script>");
            ModalPopupExtender1.Show();
            return 0;
        }
        finally
        {
            con.Close();
        }
        
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int value = insups("EmpUpdate", CID);
        if (value == 1)
        {
            Bindnew(GridView1, "Ace Indus");
            Bindnew(MyGrid, "Indus Group");
            clearcontrols();
            ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('Employee Contact Updated Successfully');</script>");
        }
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearcontrols();
    }
    protected void imgedit_Click(object sender, EventArgs e)
    {
        btnSubm.Visible = false;
        btnUpdate.Visible = true;
        editContact(MyGrid);
       
        //Bindnew(MyGrid, "Indus Group");
    }
    protected void imgdelete_Click(object sender, EventArgs e)
    {
        deleteContact(MyGrid);
        Bindnew(MyGrid, "Indus Group");
    }

    protected void imgedit1_Click(object sender, EventArgs e)
    {
        btnSubm.Visible = false;
        btnUpdate.Visible = true;
        
        editContact(GridView1);
       
    }
    protected void imgdelete1_Click(object sender, EventArgs e)
    {
        deleteContact(GridView1);
        Bindnew(GridView1, "Ace Indus");
    }
    void editContact(GridView grid)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            CID = GridDataId(grid);
            if (CID != 0)
            {
                clearcontrols();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("Select * from EmpContacts where CId=" + CID, con);
                da.Fill(ds, "empCont");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtemployeeid.Text = ds.Tables[0].Rows[0]["emp_id"].ToString();

                    txtName.Text = ds.Tables[0].Rows[0]["CName"].ToString();
                    txtCompId.Text = ds.Tables[0].Rows[0]["CcId"].ToString();
                    txtPhone.Text = ds.Tables[0].Rows[0]["CPhone"].ToString();
                    txtExt.Text = ds.Tables[0].Rows[0]["CExt"].ToString();
                    txtGT.Text = ds.Tables[0].Rows[0]["CGTalk"].ToString();
                    txtmail.Text = ds.Tables[0].Rows[0]["CEmail"].ToString();
                    ddlCompanys.SelectedValue = ds.Tables[0].Rows[0]["Company"].ToString();
                    ModalPopupExtender1.Show();
                }
                //Response.Redirect("Admin_Editvendor.aspx?sid=" + CID);
            }
            else
                ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('Please Selected Checkbox From Proper List');</script>");
        //}
        //else
        //{
        //    ModalPopupExtender1.Hide();
        //    ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('You do not have rights to done this task !!!');</script>");
        //}
    }
    void deleteContact(GridView grid)
    {
       // own = ConfigurationManager.AppSettings["owner"].ToString();
    //    if (lblAcess.Text == own)
   //     {
            int ids = 0;
            CID = GridDataId(grid);
            if (CID != 0)
            {
                try
                {
                    int ID = CID;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete from EmpContacts where CId=" + ID , con);
                    ids = cmd.ExecuteNonQuery();
                    con.Close();
                    if (ids == 1)
                    {
                        Str = "alert('Employee Contact has been Deleted Successfully');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", Str, true);
                    }
                }
                catch (Exception ex)
                {
                    ex.ToString();
                }
            }
            else
                ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('Please Selected Checkbox From Proper List');</script>");
        //}
        //else
        //{

        //    ClientScript.RegisterStartupScript(typeof(Page), "Error", "<script>alert('You do not have rights to done this task !!!');</script>");
        //}

    }
    public int GridDataId(GridView grid)
    {
        for (int i = 0; i < grid.Rows.Count; i++)
        {
            CheckBox cbox = (CheckBox)grid.Rows[i].FindControl("chkselect");
            if (cbox.Checked)
            {
                CID = Convert.ToInt32(grid.DataKeys[i].Values[0].ToString());
            }
        }
        return CID;
    }
    protected void MyGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyGrid.PageIndex = e.NewPageIndex;
        Bindnew(MyGrid, "Indus Group");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bindnew(GridView1, "Ace Indus");
    }

    void clearcontrols()
    {
        txtName.Text = "";
        txtCompId.Text = "";
        txtExt.Text = "";
        txtGT.Text = "";
        txtmail.Text = "";
        txtPhone.Text = "";
        ddlCompanys.SelectedIndex = 0;
    }
}