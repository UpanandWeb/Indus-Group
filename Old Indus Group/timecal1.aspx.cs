using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var zone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            var timeInIndia = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, zone);
            intime.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
            indate.Text = timeInIndia.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
           DataTable dt = new DataTable();   
          
           dt.Columns.AddRange(new DataColumn[8] { new DataColumn("Work Date"), new DataColumn("Work In"),new DataColumn("Lunch Out"),new DataColumn("Lunch In"),new DataColumn("Lunch Hours"),new DataColumn("Work Out"), new DataColumn("Total Hours"), new DataColumn("Leave")});

            DataRow dr1 = dt.NewRow();
            ViewState["Customers"] = dt;
            this.BindGrid();
        }
        }
    protected void BindGrid()
    {
        gdv.DataSource = (DataTable)ViewState["Customers"];
        gdv.DataBind();
    }
   
    protected void btnin_Click(object sender, EventArgs e)
    {
        var zone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        var timeInIndia = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, zone);
        DataTable dt = (DataTable)ViewState["Customers"];
        DataRow dr1 = dt.NewRow();
        indate.Text = timeInIndia.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
        intime.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
        dr1[0] = indate.Text;
        dr1[1] = intime.Text;
        llo.Visible = true;
        outlunch.Visible = true;
        btnlo.Visible = true;
        btnin.Visible = false;
        dt.Rows.Add(dr1);
        ViewState["Customers"] = dt;
        outlunch.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
        this.BindGrid();
      
    }
    protected void btnlo_Click(object sender, EventArgs e)
    {
        var zone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        var timeInIndia = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, zone);
        lli.Visible = true;
        inlunch.Visible = true;
        btnli.Visible = true;
        btnin.Visible = false;
        btnlo.Visible = false;
        DataTable dt = (DataTable)ViewState["Customers"];   
        for (int i = 0; i <= dt.Rows.Count-1 ; i++)
        {
          
                if (dt.Rows[i]["Work In"].ToString() != "00:00")
                {
                    dt.Rows[i]["Lunch Out"] = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
                }
            
        }
        inlunch.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
        outlunch.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
            ViewState["Customers"] = dt;
           
        this.BindGrid();
    }
    protected void btnli_Click(object sender, EventArgs e)
    {
        var zone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        var timeInIndia = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, zone);
        btnlo.Visible = false;
        btnin.Visible = false;
        lwo.Visible = true;
        outdate.Visible = true;
        lot.Visible = true;
        outtime.Visible = true;
        btnsave.Visible = true;
        btnli.Visible = false;
       
        DataTable dt = (DataTable)ViewState["Customers"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            if (dt.Rows[i]["Lunch Out"].ToString() != "00:00")
            {
                dt.Rows[i]["Lunch In"] = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
                string outtime1 = dt.Rows[i]["Lunch Out"].ToString();
                string intime1 = dt.Rows[i]["Lunch In"].ToString();
                DateTime dli1 = DateTime.Parse(intime1);
                TimeSpan LunchIn = TimeSpan.Parse(dli1.ToString("HH:mm"));
                DateTime dli2 = DateTime.Parse(outtime1);
                TimeSpan LunchOut = TimeSpan.Parse(dli2.ToString("HH:mm"));
                TimeSpan tl = LunchIn.Subtract(LunchOut);
                dt.Rows[i]["Lunch Hours"] = tl.ToString();
            }
        }
        inlunch.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
        outtime.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
        outdate.Text = timeInIndia.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
        ViewState["Customers"] = dt;
       
        this.BindGrid();
       
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        var zone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        var timeInIndia = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, zone);
        btnlo.Visible = false;
        btnin.Visible = false;
        btnli.Visible = false;
        btnsave.Visible = false;
        lwo.Visible = true;
        outdate.Visible = true;
        lot.Visible = true;
        outtime.Visible = true;
        btnsave.Visible = true;

        DataTable dt = (DataTable)ViewState["Customers"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            if (dt.Rows[i]["Lunch In"].ToString() != "00:00")
            {
                dt.Rows[i]["Work Out"] = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
                indate.Text = timeInIndia.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
                outdate.Text = timeInIndia.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
                DateTime StartDate = DateTime.ParseExact(indate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
                DateTime EndDate = DateTime.ParseExact(outdate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture);
                TimeSpan tt = Convert.ToDateTime(EndDate).Subtract(Convert.ToDateTime(StartDate));
                double NrOfDays = tt.TotalDays;
                double d1 = NrOfDays * 24;

                string workin = dt.Rows[i]["Work In"].ToString();
                string workout = dt.Rows[i]["Work Out"].ToString();
                DateTime dli1 = DateTime.Parse(workin);
                TimeSpan StartTime = TimeSpan.Parse(dli1.ToString("HH:mm"));
                DateTime dli2 = DateTime.Parse(workout);
                TimeSpan EndTime = TimeSpan.Parse(dli2.ToString("HH:mm"));
                TimeSpan ts = EndTime.Subtract(StartTime);

                string outtime1 = dt.Rows[i]["Lunch Out"].ToString();
                string intime1 = dt.Rows[i]["Lunch In"].ToString();
                DateTime dli3 = DateTime.Parse(intime1);
                TimeSpan LunchIn = TimeSpan.Parse(dli3.ToString("HH:mm"));
                DateTime dli4 = DateTime.Parse(outtime1);
                TimeSpan LunchOut = TimeSpan.Parse(dli4.ToString("HH:mm"));
                TimeSpan tl = LunchIn.Subtract(LunchOut);



                TimeSpan time1 = TimeSpan.FromHours(d1);
                TimeSpan tw = ts.Subtract(tl);
                dt.Rows[i]["Total Hours"] = tw.ToString();
            }

        }
        outtime.Text = timeInIndia.ToString("HH:mm", CultureInfo.InvariantCulture);
        outdate.Text = timeInIndia.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
        ViewState["Customers"] = dt;
        this.BindGrid();

    }
    protected void btnoption_Click(object sender, EventArgs e)
    {
        pnl.Visible = false;
        btnoption.Visible = false;
        ddl.Visible = true;
        lbledate.Visible = true;
        lblsdate.Visible = true;
        txtsdate.Visible = true;
        txtedate.Visible = true;
        btncancel.Visible = true;
        btnoptionsave.Visible = true;
        lblleavetype.Visible = true;
    }
    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((ddl.SelectedValue == "3") || (ddl.SelectedValue == "4"))
        {
            txtsdate.Visible = true;
            lblsdate.Visible = true;
            lbledate.Visible = false;
            txtedate.Visible = false;
            btncancel.Visible = true;
            btnoptionsave.Visible = true;
            lblleavetype.Visible = true;
            txtsdate.Text = "";
            txtedate.Text = "";
        }
        else
        {
            txtsdate.Visible = true;
            lblsdate.Visible = true;
            lbledate.Visible = true;
            txtedate.Visible = true;
            btncancel.Visible = true;
            btnoptionsave.Visible = true;
            lblleavetype.Visible = true;
            txtsdate.Text = "";
            txtedate.Text = "";
        }
    }
    protected void btnoptionsave_Click(object sender, EventArgs e)
    {
         DataTable dt = (DataTable)ViewState["Customers"];
     
            
            if (txtedate.Text == "" || txtedate.Text == null)
            {

                DataRow dr1 = dt.NewRow();
                dr1[0] = txtsdate.Text;
                dr1[1] = "00:00";
                dr1[2] = "00:00";
                dr1[3] = "00:00";
                dr1[4] = "00:00";
                dr1[5] = "00:00";
                dr1[6] = "00:00";
                dr1[7] = ddl.SelectedItem.Text;
                dt.Rows.Add(dr1);
                ViewState["Customers"] = dt;
                this.BindGrid();
                txtedate.Text = "";
                txtsdate.Text = "";
              
            }
            else
            {
             
                var date = new List<DateTime>();
                for (DateTime dt1 = DateTime.ParseExact(txtsdate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture); dt1 <= DateTime.ParseExact(txtedate.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture); dt1 = dt1.AddDays(1))
                {
                    date.Add(dt1);
                   
                }
                foreach (var date1 in date)
                {
                    DataRow dr1 = dt.NewRow();
                    dr1[0] = date1.ToString("dd-MM-yyyy");
                    dr1[1] = "00:00";
                    dr1[2] = "00:00";
                    dr1[3] = "00:00";
                    dr1[4] = "00:00";
                    dr1[5] = "00:00";
                    dr1[6] = "00:00";
                    dr1[7] = ddl.SelectedItem.Text;
                    dt.Rows.Add(dr1);
                 
               }
                ViewState["Customers"] = dt;
                this.BindGrid();
            }
           
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        btnoption.Visible = true;
        ddl.Visible = false;
        lbledate.Visible = false;
        lblsdate.Visible = false;
        txtsdate.Visible = false;
        txtedate.Visible = false;
        btncancel.Visible = false;
        btnoptionsave.Visible = false;
        pnl.Visible = true;
        lblleavetype.Visible = false;
    }
}