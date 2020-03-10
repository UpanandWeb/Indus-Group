using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// This code defines the Insertion of form data into Data base
/// </summary>
public partial class verifyinfo_outside : System.Web.UI.Page
{  
    protected void Page_Load(object sender, EventArgs e)
        {
       //form values are not post back to the form
        if (!Page.IsPostBack)
        {
            txtzipUS.Visible = false;
            txtpinIndia.Visible = false;
            lblzip.Visible = false;
            DataTable myDt = new DataTable();
            myDt = CreateDataTable();
            Session["myDatatable"] = myDt;

            gvWorkExp.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
            gvWorkExp.DataBind();

            DataTable myDt1 = new DataTable();
            myDt1 = CreateDataTable1();
            Session["myDatatable1"] = myDt1;

            gvEdu.DataSource = ((DataTable)Session["myDatatable1"]).DefaultView;
            gvEdu.DataBind();
            
        }

    }
    /// <summary>
    /// Button click event for submitting the entaire form data into the Database
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        string str = "";
        //if country india then corresponding pin code will go to String str
        if (ddlCountry.SelectedItem.Value == "India")
        {
            str = txtpinIndia.Text;
        }
        else if (ddlCountry.SelectedItem.Value == "U.S")
        {
            str = txtzipUS.Text;
        }
        //connection to the database
        String connectionString = WebConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection con = new SqlConnection(connectionString);     
        SqlCommand cmd = new SqlCommand("JDSt_PersonalInfo1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fname",SqlDbType.NVarChar,50).Value= txtfname.Text;
            cmd.Parameters.Add("@lname",SqlDbType.NVarChar,50).Value= txtlname.Text;
            cmd.Parameters.Add("@addline1",SqlDbType.NVarChar,50).Value= txtadressline1.Text;
            cmd.Parameters.Add("@addline2",SqlDbType.NVarChar,50).Value= txtadresline2.Text;
            cmd.Parameters.Add("@city",SqlDbType.NVarChar,50).Value= txtcity.Text;
            cmd.Parameters.Add("@state",SqlDbType.NVarChar,50).Value= ddlstate.SelectedItem.Value;
            cmd.Parameters.Add("@country",SqlDbType.NVarChar,50).Value= ddlCountry.SelectedItem.Value;
            cmd.Parameters.Add("@zip", SqlDbType.NVarChar, 50).Value = str;
            cmd.Parameters.Add("@hmphcc",SqlDbType.NVarChar,50).Value= txthomephCC.Text;
            cmd.Parameters.Add("@hmphac",SqlDbType.NVarChar,50).Value= txthomephAC.Text;
            cmd.Parameters.Add("@hmphno",SqlDbType.NVarChar,50).Value= txthomephNo.Text;
            cmd.Parameters.Add("@cellphcc",SqlDbType.NVarChar,50).Value= txtcellCC.Text;
            cmd.Parameters.Add("@cellphac",SqlDbType.NVarChar,50).Value= txtcellAC.Text;
            cmd.Parameters.Add("@cellphno",SqlDbType.NVarChar,50).Value= txtcellNo.Text;
            cmd.Parameters.Add("@workphcc",SqlDbType.NVarChar,50).Value= txtworkphCC.Text;
            cmd.Parameters.Add("@workphac",SqlDbType.NVarChar,50).Value= txtworkphAC.Text;
            cmd.Parameters.Add("@workphno",SqlDbType.NVarChar,50).Value= txtworkphNo.Text;
            cmd.Parameters.Add("@workphext",SqlDbType.NVarChar,50).Value= txtworkphExt.Text;
            cmd.Parameters.Add("@cursal",SqlDbType.NVarChar,50).Value= txtcursal.Text;
            cmd.Parameters.Add("@cursalyr",SqlDbType.NVarChar,50).Value= ddlCurSalary.SelectedItem.Text;
            cmd.Parameters.Add("@prefsal",SqlDbType.NVarChar,50).Value= txtprefsal.Text;
            cmd.Parameters.Add("@prefsalyr",SqlDbType.NVarChar,50).Value= ddlprefsal.SelectedItem.Text;
            cmd.Parameters.Add("@email",SqlDbType.NVarChar,50).Value= txtemailaddress.Text;
            cmd.Parameters.Add("@pwd",SqlDbType.NVarChar,50).Value= txtpwd.Text;
            cmd.Parameters.Add("@conpwd",SqlDbType.NVarChar,50).Value= txtconpwd.Text;
            cmd.Parameters.Add("@id",SqlDbType.Int);
            cmd.Parameters["@id"].Direction=ParameterDirection.Output;
            cmd.Parameters.Add("@msg",SqlDbType.NVarChar,50);
            cmd.Parameters["@msg"].Direction=ParameterDirection.Output;
            cmd.Connection=con;
            string msg=null;
            int results=0;
            try
            {
                //To open connection
                con.Open();
                cmd.ExecuteNonQuery();
                    //keeping id of the Personal Information database table into results
                    results=(int)cmd.Parameters["@id"].Value;
                    //creation of datatable and assigning it with session containing work experience data
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["myDatatable"];
                    //Insertion of Multiple row values of Work Experience Datatable into Database Table
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            DataRow row = dt.Rows[i];
                            SqlCommand cmdexp = new SqlCommand("JDSt_WorkExp1", con);
                            cmdexp.CommandType = CommandType.StoredProcedure;
                            cmdexp.Parameters.Add("@id", SqlDbType.Int).Value = results.ToString();
                            cmdexp.Parameters.Add("@frommonth", SqlDbType.NVarChar).Value = row["frommonth"].ToString();
                            cmdexp.Parameters.Add("@fromyear", SqlDbType.NVarChar).Value = row["fromyear"].ToString();
                            cmdexp.Parameters.Add("tomonth", SqlDbType.NVarChar).Value = row["tomonth"].ToString();
                            cmdexp.Parameters.Add("toyear", SqlDbType.NVarChar).Value = row["toyear"].ToString();
                            cmdexp.Parameters.Add("title", SqlDbType.NVarChar).Value = row["title"].ToString();
                            cmdexp.Parameters.Add("workexp", SqlDbType.NVarChar).Value = row["workexperience"].ToString();
                        
                            cmdexp.ExecuteNonQuery();
                        
                            }
                        }
                        else
                        {
                            Response.Write("not inserted");
                        }
                        //creation of datatable and assigning it with session containing Education details
                        DataTable dt1 = new DataTable();
                        dt1 = (DataTable)Session["myDatatable1"];
                        //Insertion of Multiple row values of Education details Datatable into corresponding Database Table
                        if (dt1.Rows.Count > 0)
                        {
                            for (int j = 0; j < dt1.Rows.Count; j++)
                            {
                                DataRow row1 = dt1.Rows[j];
                                SqlCommand cmdedu = new SqlCommand("JDSt_Education1", con);
                                cmdedu.CommandType = CommandType.StoredProcedure;
                                cmdedu.Parameters.Add("@id", SqlDbType.Int).Value = results.ToString();
                                cmdedu.Parameters.Add("@yearofpass", SqlDbType.NVarChar, 50).Value = row1["year"].ToString();
                                cmdedu.Parameters.Add("@degree", SqlDbType.NVarChar, 50).Value = row1["degree"].ToString();
                                cmdedu.Parameters.Add("@school", SqlDbType.NVarChar, 50).Value = row1["school"].ToString();
                                cmdedu.Parameters.Add("@major", SqlDbType.NVarChar, 50).Value = row1["major"].ToString();
                                cmdedu.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            Response.Write("No records found ");
                        }

            }
            catch(SqlException ex)
            {
              //lblexception.Text= ex.Message();
              Response.Write(ex);
            }
            finally
            {
                cmd.Dispose();
                if(con!=null)
                {
                    // To close connection
                    con.Close();
                }
            }
            string strScript = "";
            strScript = "alert('Thanking you!For Registration.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    /// <summary>
    /// Go to the login page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void lnkbtnhere_Click(object sender, EventArgs e)
    {
        string jobid = Request.QueryString["id"].ToString();       
        Response.Redirect("newaccount_login.aspx?id="+ jobid + "");
    }

    /// <summary>
    /// To set Page Index for Grid View
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void gvWorkExp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       gvWorkExp.PageIndex = e.NewPageIndex;
        //Bind data to the GridView control.
        BindData();
    }
    /// <summary>
    /// To edit Grid View row of Work Experience
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvWorkExp_RowEditing(object sender, GridViewEditEventArgs e)
    {

        gvWorkExp.EditIndex = e.NewEditIndex;
        //Bind data to the GridView control.
        BindData();

    }
    /// <summary>
    /// To Cancel the row editing of Work Experience Grid View
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvWorkExp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
         
        // Reset the edit index.
        gvWorkExp.EditIndex = -1;
        //Bind data to the GridView control.
        BindData();
    }
    /// <summary>
    /// Bind the Work Experience data with WorkExpGrid View
    /// </summary>
    private void BindData()
    {
        //create data table
        DataTable dt = new DataTable();
        //Add columns to the data table 
        dt.Columns.Add("id", typeof(int));
        dt.Columns.Add("fromfmonth", typeof(string));
        dt.Columns.Add("fromyear", typeof(string));
        dt.Columns.Add("tomonth", typeof(string));
        dt.Columns.Add("toyear", typeof(string));
        dt.Columns.Add("title", typeof(string));
        dt.Columns.Add("workexperience", typeof(string));
        // keeping session data into data table
        dt = (DataTable)Session["myDatatable"];
        //Binding data table to grid view
        gvWorkExp.DataSource = dt;
        gvWorkExp.DataBind();
    }
    /// <summary>
    /// To Update the WorkExperience Grid View Row
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvWorkExp_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            //Update the values.
            GridViewRow row = (GridViewRow)gvWorkExp.Rows[e.RowIndex];
            String id = ((TextBox)(row.Cells[0].Controls[0])).Text.ToString();            
            String frommonth = ((TextBox)row.Cells[1].Controls[0]).Text.ToString();
            String fromyear = ((TextBox)row.Cells[2].Controls[0]).Text.ToString();
            String tomonth = ((TextBox)row.Cells[3].Controls[0]).Text.ToString();
            String toyear = ((TextBox)row.Cells[4].Controls[0]).Text.ToString();
            String title = ((TextBox)row.Cells[5].Controls[0]).Text.ToString();
            String workexperience = ((TextBox)row.Cells[6].Controls[0]).Text.ToString();
            DataTable dt = (DataTable)Session["myDatatable"];
            
            //Adding updated values to the data table
            dt.Rows[row.DataItemIndex]["frommonth"] = frommonth;
            dt.Rows[row.DataItemIndex]["fromyear"] = fromyear;
            dt.Rows[row.DataItemIndex]["tomonth"] = tomonth;
            dt.Rows[row.DataItemIndex]["toyear"] = toyear;
            dt.Rows[row.DataItemIndex]["title"] = title;
            dt.Rows[row.DataItemIndex]["workexperience"] = workexperience;
            // Reset the edit index.            
            gvWorkExp.EditIndex = -1;
            // Rebinding the new data table values to the Grid
            ExpGridRebibind(dt);
        }
        catch (Exception ex)
        {
            //To catch the Exception while Grid View Row is not Updated
            lblMsg.Text = ex.Message;
        }



    }
    /// <summary>
    /// Rebinding the work experience data table values to the WorkExp Gid View and keeping that data table into a session
    /// </summary>
    /// <param name="dt"></param>
    private void ExpGridRebibind( DataTable dt)
    {
      
          gvWorkExp.DataSource = dt;
          gvWorkExp.DataBind();
          Session["myDatatable"] = dt;
    }   
    /// <summary>
    /// To delete the data table row through Grid View and rebinding the data table having new values to the Grid View 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvWorkExp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        //assigning session to the datatable which we have to do delete operation        
        DataTable dt =(DataTable)Session["myDatatable"];
        //to delete the row of datatable by passing the index of data table
        int i = 0;
        int index = 0;
        foreach (DataRow row in dt.Rows)
        {
            index = i;
            // do stuff
            i++;
        }
        dt.Rows[index].Delete();
        //Rebind the data table to the grid
        ExpGridRebibind(dt);
    }
    /// <summary>
    /// Creation of the DataTable for Work Experience 
    /// </summary>
    /// <returns></returns>
    private DataTable CreateDataTable()
    {
        DataTable myDataTable = new DataTable();

        DataColumn myDataColumn;

        myDataColumn = new DataColumn();

        myDataColumn.DataType = Type.GetType("System.Int32");
        myDataColumn.ColumnName = "id";
        myDataTable.Columns.Add(myDataColumn);
        //specify it as auto increment field
        myDataColumn.AutoIncrement = true;
        myDataColumn.AutoIncrementSeed = 1;
        myDataColumn.ReadOnly = true;


        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "frommonth";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "fromyear";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "tomonth";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "toyear";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "title";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "workexperience";
        myDataTable.Columns.Add(myDataColumn);

        return myDataTable;
    }
    /// <summary>
    /// Adding Work Experience form data to the DataTable by passing form values
    /// </summary>
    /// <param name="frommonth">From Month</param>
    /// <param name="fromyear">From Year</param>
    /// <param name="tomonth">To month</param>
    /// <param name="toyear">To year</param>
    /// <param name="title">title</param>
    /// <param name="workexp">Work Experience</param>
    /// <param name="myTable"></param>
    private void AddDataToTable(string frommonth, string fromyear, string tomonth, string toyear, string title, string workexp, DataTable myTable)
    {
        DataRow row;
        row = myTable.NewRow();

        row["frommonth"] = frommonth;
        row["fromyear"] = fromyear;
        row["tomonth"] = tomonth;
        row["toyear"] = toyear;
        row["title"] = title;
        row["workexperience"] = workexp;

        myTable.Rows.Add(row);
    }
    /// <summary>
    /// Button click event for adding work experience data to the DataTable,
    /// keeping that DataTable in session
    /// and Bind that DataTable to Grid View
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnexpsubmit_Click(object sender, EventArgs e)
    {
        if (txttitle.Text.Trim() == "")
        {
            //this.lblTips.Text = "You must fill a title.";
            return;
        }
        else
        {
            AddDataToTable(this.ddlfrom.SelectedItem.Text.Trim(), this.txtfromyr.Text.Trim(), this.ddlto.SelectedItem.Text.Trim(), this.txttoyr.Text.Trim(), this.txttitle.Text.Trim(), this.txtexp.Text.Trim(), (DataTable)Session["myDatatable"]);
            this.gvWorkExp.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
            this.gvWorkExp.DataBind();

            this.txtfromyr.Text = "";
            this.txttoyr.Text = "";
            this.txttitle.Text = "";
            this.txtexp.Text = "";
            //this.lblTips.Text = "";
            
        }
    }
    /// <summary>
    /// Creation of the DataTable for adding Education Details
    /// </summary>
    /// <returns></returns>
    private DataTable CreateDataTable1()
    {
        DataTable myDataTable = new DataTable();

        DataColumn myDataColumn;

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.Int32");
        myDataColumn.ColumnName = "id";
        myDataTable.Columns.Add(myDataColumn);
        //specify it as auto increment field
        myDataColumn.AutoIncrement = true;
        myDataColumn.AutoIncrementSeed = 1;
        myDataColumn.ReadOnly = true;

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "year";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "degree";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "school";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "major";
        myDataTable.Columns.Add(myDataColumn);

        return myDataTable;
    }
    /// <summary>
    /// Adding Education details to the DataTable by passing form values
    /// </summary>
    /// <param name="year">Year</param>
    /// <param name="degree">Degree</param>
    /// <param name="school">School</param>
    /// <param name="major">Major</param>
    /// <param name="myTable1">My table</param>
    private void AddDataToTable1(string year, string degree, string school, string major, DataTable myTable1)
    {
        DataRow row;

        row = myTable1.NewRow();

        //row["id"] = Guid.NewGuid().ToString();
        row["year"] = year;
        row["degree"] = degree;
        row["school"] = school;
        row["major"] = major;

        myTable1.Rows.Add(row);
    }
    /// <summary>
    /// Button click event for adding Education Details data to the DataTable,
    /// keeping that DataTable into session
    /// and Bind that DataTable to Grid View
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btneducationsubmit_Click(object sender, EventArgs e)
    {
        if (txtmajor.Text.Trim() == "")
        {
            //lblTips.Visible = true;
            //this.lblTips.Text = "You must fill a title.";
            return;
        }
        else
        {
            AddDataToTable1(this.txtyear.Text.Trim(), this.txtdegree.Text.Trim(), this.txtschool.Text.Trim(), this.txtmajor.Text.Trim(), (DataTable)Session["myDatatable1"]);
            this.gvEdu.DataSource = ((DataTable)Session["myDatatable1"]).DefaultView;
            this.gvEdu.DataBind();
            this.txtyear.Text = "";
            this.txtdegree.Text = "";
            this.txtschool.Text = "";
            this.txtmajor.Text = "";

            

        }
    }
    /// <summary>
    /// To set Page Index for Grid View
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvEdu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEdu.PageIndex = e.NewPageIndex;
        //Bind data to the GridView control.
        BindData1();

    }
    /// <summary>
    /// To edit row of Education Grid View 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvEdu_RowEditing(object sender, GridViewEditEventArgs e)
    {

        gvEdu.EditIndex = e.NewEditIndex;

        BindData1();

    }
    /// <summary>
    /// To Cancel the row editing of Education Grid View
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvEdu_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //Reset the edit index.
        gvEdu.EditIndex = -1;
        //Bind data to the GridView control.
        BindData1();
    }
    /// <summary>
    /// Bind the Education data with EducationGrid View
    /// </summary>
    private void BindData1()
    {
        DataTable dt1 = new DataTable();

        dt1.Columns.Add("year", typeof(string));
        dt1.Columns.Add("degree", typeof(string));
        dt1.Columns.Add("school", typeof(string));
        dt1.Columns.Add("major", typeof(string));
        dt1 = (DataTable)Session["myDatatable1"];
        gvEdu.DataSource = dt1;
        gvEdu.DataBind();
    }
    /// <summary>
    /// To Update the Education Grid View Row
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvEdu_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        try
        {
            //Update the values.
            GridViewRow row1 = (GridViewRow)gvEdu.Rows[e.RowIndex];  
          
            
            String id = ((TextBox)(row1.Cells[0].Controls[0])).Text.ToString();
            String year = ((TextBox)row1.Cells[1].Controls[0]).Text.ToString();
            String degree = ((TextBox)row1.Cells[2].Controls[0]).Text.ToString();
            String school = ((TextBox)row1.Cells[3].Controls[0]).Text.ToString();
            String major = ((TextBox)row1.Cells[4].Controls[0]).Text.ToString();
                       
            DataTable dt1 = (DataTable)Session["myDatatable1"];

            dt1.Rows[row1.DataItemIndex]["year"] = year;
            dt1.Rows[row1.DataItemIndex]["degree"] =degree;
            dt1.Rows[row1.DataItemIndex]["school"] = school;
            dt1.Rows[row1.DataItemIndex]["major"] = major;

            gvEdu.EditIndex = -1;

            EduRebind(dt1);
        }
        catch (Exception ex)
        {
            //To catch exception handled
            lblMsg.Text = ex.Message;
        }

    }
    /// <summary>
    /// Rebinding the Education data table values to the Education Gid View and keeping that data table into a session
    /// </summary>
    /// <param name="dt1"></param>
    protected void EduRebind(DataTable dt1)
    {
        gvEdu.DataSource = dt1;
        gvEdu.DataBind();
        Session["myDataTable1"] = dt1;
    }
    /// <summary>
    /// To delete the data table row through Grid View and rebinding the data table having new values to the EducationGrid View 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void gvEdu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        //assigning session to the datatable which we have to do delete operation
        DataTable dt1 = (DataTable)Session["myDatatable1"];
        //to delete the row of datatable by passing the index of data table
        int i = 0;
        int index = 0;
        foreach (DataRow row in dt1.Rows)
        {
            index = i;
            // do stuff
            i++;
        }
        dt1.Rows[index].Delete();
        //Rebind the data table to the grid
        EduRebind(dt1);
    }
    /// <summary>
    /// event for dropdown list of country selected
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCountry.SelectedItem.Value == "India")
        {
            lblzip.Visible = true;
            txtzipUS.Visible = false;
            txtpinIndia.Visible = true;
        }
        else if (ddlCountry.SelectedItem.Value == "U.S")
        {
            lblzip.Visible = true;
            txtpinIndia.Visible = false;
            txtzipUS.Visible = true;
        }
    }

}



    

