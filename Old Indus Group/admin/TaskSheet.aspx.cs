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
 

public partial class TaskSheet : System.Web.UI.Page
{
    timesheet obj = new timesheet();
    DataSet ds;
    string sdt = string.Empty;
    string sdtt = string.Empty;
    string res = string.Empty;
    public static int billhours;

    protected void Page_Load(object sender, EventArgs e)
    {

        trtext.Visible = false;
        trtot.Visible = false;
        trot.Visible = false;
        trnonb.Visible = false;
        //trbill.Visible = false;
        //trnonbill.Visible = false;

        if (!IsPostBack)
        {
            Calendar1.Visible = false;
            try
            {
                ds = new DataSet();
                ds = obj.Read_EmployeeName();
                ddlename.DataSource = ds;
                ddlename.DataTextField = "FirstName";
                ddlename.DataValueField = "eID";
                ddlename.DataBind();
                ddlename.Items.Insert(0, "----Select----");

                DataSet ds1 = new DataSet();
                ds1 = obj.Read_ProjectsName();
                ddlprojname.DataSource = ds1;
                ddlprojname.DataTextField = "ProjectName";
                ddlprojname.DataValueField = "PID";
                ddlprojname.DataBind();
                ddlprojname.Items.Insert(0, "----Select----");


            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }


        txt1.Attributes.Add("onblur", "calculateSum();");
        txt2.Attributes.Add("onblur", "calculateSum();");
        txt3.Attributes.Add("onblur", "calculateSum();");
        txt4.Attributes.Add("onblur", "calculateSum();");
        txt5.Attributes.Add("onblur", "calculateSum();");
        txt6.Attributes.Add("onblur", "calculateSum();");
        txt7.Attributes.Add("onblur", "calculateSum();");
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        trtext.Visible = true;
        trot.Visible = true;
        trnonb.Visible = true;

        //trtot.Visible = true;
        //trbill.Visible = true;
        //trnonb.Visible = true;
        //trnonbill.Visible = true;

        billhours = 8;
        int TotBillHours = 40;

        if (Convert.ToInt32(txttot.Text.ToString()) > TotBillHours)
        {
            txtot.Text = Convert.ToString(TotBillHours);
            txtnbtot.Text = (Convert.ToInt32(txttot.Text) - TotBillHours).ToString();
        }
        else
        {
            txtot.Text = txttot.Text;
            txtnbtot.Text = "0";
        }

        try
        {
            int EmployeeID = Convert.ToInt32(ddlename.SelectedItem.Value.ToString());
            int ProjectID = Convert.ToInt32(ddlprojname.SelectedItem.Value.ToString());
            string EmployeeType = ddltype.SelectedItem.Text.ToString();
            int TotalHours = Convert.ToInt32(txttot.Text.ToString());
            int BillableHours = Convert.ToInt32(txtot.Text.ToString());
            int NonBillableHours = Convert.ToInt32(txtnbtot.Text.ToString());
            int Day = Convert.ToInt32(Calendar1.SelectedDate.Day.ToString());
            //int BillableHours=Convert.ToInt32(txtbillhours.Text.ToString());


            if (Day >= 1 && Day <= 7)
            {

                DateTime Day1 = Convert.ToDateTime(td1.InnerHtml.ToString());
                DateTime Day2 = Convert.ToDateTime(td2.InnerHtml.ToString());
                DateTime Day3 = Convert.ToDateTime(td3.InnerHtml.ToString());
                DateTime Day4 = Convert.ToDateTime(td4.InnerHtml.ToString());
                DateTime Day5 = Convert.ToDateTime(td5.InnerHtml.ToString());
                DateTime Day6 = Convert.ToDateTime(td6.InnerHtml.ToString());
                DateTime Day7 = Convert.ToDateTime(td7.InnerHtml.ToString());

                int Day1Work;
                if (txt1.Text != "")
                {
                    Day1Work = Convert.ToInt32(txt1.Text.ToString());
                }
                else
                {
                    Day1Work = 0;
                }
                int Day2Work;
                if (txt2.Text != "")
                {
                    Day2Work = Convert.ToInt32(txt2.Text.ToString());
                }
                else
                {
                    Day2Work = 0;
                }
                int Day3Work;
                if (txt3.Text != "")
                {
                    Day3Work = Convert.ToInt32(txt3.Text.ToString());
                }
                else
                {
                    Day3Work = 0;
                }
                int Day4Work;
                if (txt4.Text != "")
                {
                    Day4Work = Convert.ToInt32(txt4.Text.ToString());
                }
                else
                {
                    Day4Work = 0;
                }
                int Day5Work;
                if (txt5.Text != "")
                {
                    Day5Work = Convert.ToInt32(txt5.Text.ToString());
                }
                else
                {
                    Day5Work = 0;
                }
                int Day6Work;
                if (txt6.Text != "")
                {
                    Day6Work = Convert.ToInt32(txt6.Text.ToString());
                }
                else
                {
                    Day6Work = 0;
                }
                int Day7Work;
                if (txt7.Text != "")
                {
                    Day7Work = Convert.ToInt32(txt7.Text.ToString());
                }
                else
                {
                    Day7Work = 0;
                }
                res = obj.Insert_TimeSheet1(EmployeeID, ProjectID, EmployeeType, TotalHours, BillableHours, NonBillableHours, Day1, Day2, Day3, Day4, Day5, Day6, Day7, Day1Work, Day2Work, Day3Work, Day4Work, Day5Work, Day6Work, Day7Work);
            }

            else if (Day >= 8 && Day <= 14)
            {
                DateTime Day8 = Convert.ToDateTime(td1.InnerHtml.ToString());
                DateTime Day9 = Convert.ToDateTime(td2.InnerHtml.ToString());
                DateTime Day10 = Convert.ToDateTime(td3.InnerHtml.ToString());
                DateTime Day11 = Convert.ToDateTime(td4.InnerHtml.ToString());
                DateTime Day12 = Convert.ToDateTime(td5.InnerHtml.ToString());
                DateTime Day13 = Convert.ToDateTime(td6.InnerHtml.ToString());
                DateTime Day14 = Convert.ToDateTime(td7.InnerHtml.ToString());
                int Day8Work;
                if (txt1.Text != "")
                {
                    Day8Work = Convert.ToInt32(txt1.Text.ToString());
                }
                else
                {
                    Day8Work = 0;
                }
                int Day9Work;
                if (txt2.Text != "")
                {
                    Day9Work = Convert.ToInt32(txt2.Text.ToString());
                }
                else
                {
                    Day9Work = 0;
                }
                int Day10Work;
                if (txt3.Text != "")
                {
                    Day10Work = Convert.ToInt32(txt3.Text.ToString());
                }
                else
                {
                    Day10Work = 0;
                }
                int Day11Work;
                if (txt4.Text != "")
                {
                    Day11Work = Convert.ToInt32(txt4.Text.ToString());
                }
                else
                {
                    Day11Work = 0;
                }
                int Day12Work;
                if (txt5.Text != "")
                {
                    Day12Work = Convert.ToInt32(txt5.Text.ToString());
                }
                else
                {
                    Day12Work = 0;
                }
                int Day13Work;
                if (txt6.Text != "")
                {
                    Day13Work = Convert.ToInt32(txt6.Text.ToString());
                }
                else
                {
                    Day13Work = 0;
                }
                int Day14Work;
                if (txt7.Text != "")
                {
                    Day14Work = Convert.ToInt32(txt7.Text.ToString());
                }
                else
                {
                    Day14Work = 0;
                }
                res = obj.Insert_TimeSheet2(EmployeeID, ProjectID, EmployeeType, TotalHours, BillableHours, NonBillableHours, Day8, Day9, Day10, Day11, Day12, Day13, Day14, Day8Work, Day9Work, Day10Work, Day11Work, Day12Work, Day13Work, Day14Work);
            }

            else if (Day >= 15 && Day <= 21)
            {
                DateTime Day15 = Convert.ToDateTime(td1.InnerHtml.ToString());
                DateTime Day16 = Convert.ToDateTime(td2.InnerHtml.ToString());
                DateTime Day17 = Convert.ToDateTime(td3.InnerHtml.ToString());
                DateTime Day18 = Convert.ToDateTime(td4.InnerHtml.ToString());
                DateTime Day19 = Convert.ToDateTime(td5.InnerHtml.ToString());
                DateTime Day20 = Convert.ToDateTime(td6.InnerHtml.ToString());
                DateTime Day21 = Convert.ToDateTime(td7.InnerHtml.ToString());
                int Day15Work;
                if (txt1.Text != "")
                {
                    Day15Work = Convert.ToInt32(txt1.Text.ToString());
                }
                else
                {
                    Day15Work = 0;
                }
                int Day16Work;
                if (txt2.Text != "")
                {
                    Day16Work = Convert.ToInt32(txt2.Text.ToString());
                }
                else
                {
                    Day16Work = 0;
                }
                int Day17Work;
                if (txt3.Text != "")
                {
                    Day17Work = Convert.ToInt32(txt3.Text.ToString());
                }
                else
                {
                    Day17Work = 0;
                }
                int Day18Work;
                if (txt4.Text != "")
                {
                    Day18Work = Convert.ToInt32(txt4.Text.ToString());
                }
                else
                {
                    Day18Work = 0;
                }
                int Day19Work;
                if (txt5.Text != "")
                {
                    Day19Work = Convert.ToInt32(txt5.Text.ToString());
                }
                else
                {
                    Day19Work = 0;
                }
                int Day20Work;
                if (txt6.Text != "")
                {
                    Day20Work = Convert.ToInt32(txt6.Text.ToString());
                }
                else
                {
                    Day20Work = 0;
                }
                int Day21Work;
                if (txt7.Text != "")
                {
                    Day21Work = Convert.ToInt32(txt7.Text.ToString());
                }
                else
                {
                    Day21Work = 0;
                }
                res = obj.Insert_TimeSheet3(EmployeeID, ProjectID, EmployeeType, TotalHours, BillableHours, NonBillableHours, Day15, Day16, Day17, Day18, Day19, Day20, Day21, Day15Work, Day16Work, Day17Work, Day18Work, Day19Work, Day20Work, Day21Work);
            }

            else
            {
                DateTime Day22 = Convert.ToDateTime(td1.InnerHtml.ToString());
                DateTime Day23 = Convert.ToDateTime(td2.InnerHtml.ToString());
                DateTime Day24 = Convert.ToDateTime(td3.InnerHtml.ToString());
                DateTime Day25 = Convert.ToDateTime(td4.InnerHtml.ToString());
                DateTime Day26 = Convert.ToDateTime(td5.InnerHtml.ToString());
                DateTime Day27 = Convert.ToDateTime(td6.InnerHtml.ToString());
                DateTime Day28 = Convert.ToDateTime(td7.InnerHtml.ToString());
                int Day22Work;
                if (txt1.Text != "")
                {
                    Day22Work = Convert.ToInt32(txt1.Text.ToString());
                }
                else
                {
                    Day22Work = 0;
                }
                int Day23Work;
                if (txt2.Text != "")
                {
                    Day23Work = Convert.ToInt32(txt2.Text.ToString());
                }
                else
                {
                    Day23Work = 0;
                }
                int Day24Work;
                if (txt3.Text != "")
                {
                    Day24Work = Convert.ToInt32(txt3.Text.ToString());
                }
                else
                {
                    Day24Work = 0;
                }
                int Day25Work;
                if (txt4.Text != "")
                {
                    Day25Work = Convert.ToInt32(txt4.Text.ToString());
                }
                else
                {
                    Day25Work = 0;
                }
                int Day26Work;
                if (txt5.Text != "")
                {
                    Day26Work = Convert.ToInt32(txt5.Text.ToString());
                }
                else
                {
                    Day26Work = 0;
                }
                int Day27Work;
                if (txt6.Text != "")
                {
                    Day27Work = Convert.ToInt32(txt6.Text.ToString());
                }
                else
                {
                    Day27Work = 0;
                }
                int Day28Work;
                if (txt7.Text != "")
                {
                    Day28Work = Convert.ToInt32(txt7.Text.ToString());
                }
                else
                {
                    Day28Work = 0;
                }
                res = obj.Insert_TimeSheet4(EmployeeID, ProjectID, EmployeeType, TotalHours, BillableHours, NonBillableHours, Day22, Day23, Day24, Day25, Day26, Day27, Day28, Day22Work, Day23Work, Day24Work, Day25Work, Day26Work, Day27Work, Day28Work);
                //bill();
            }


        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }

    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddltype.SelectedItem.Text == "Full Time")
        {
            Calendar1.Visible = true;
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        trtext.Visible = true;
        trtot.Visible = true;


        sdtt = Calendar1.SelectedDate.ToShortDateString();
        DateTime dt = Convert.ToDateTime(sdtt);

        int dd = Convert.ToInt16(dt.DayOfWeek);

        string[] arr = new string[7];
        if (dd == 1)
        {
            sdt = Calendar1.SelectedDate.ToShortDateString();
            for (int i = 0; i <= 6; i++)
            {
                dt = Convert.ToDateTime(sdt);
                arr[i] = sdt;
                sdt = dt.AddDays(1).ToShortDateString();
            }
        }
        if (dd > 1)
        {
            sdt = Calendar1.SelectedDate.ToShortDateString();
            for (int i = dd; i >= 0; i--)
            {
                dt = Convert.ToDateTime(sdt);
                arr[i] = sdt;
                sdt = dt.AddDays(-1).ToShortDateString();
            }
            sdt = sdtt;
            for (int j = dd; j < 7; j++)
            {
                dt = Convert.ToDateTime(sdt);
                arr[j] = sdt;
                sdt = dt.AddDays(1).ToShortDateString();
            }

        }

        td1.InnerHtml = arr[0];
        td2.InnerHtml = arr[1];
        td3.InnerHtml = arr[2];
        td4.InnerHtml = arr[3];
        td5.InnerHtml = arr[4];
        td6.InnerHtml = arr[5];
        td7.InnerHtml = arr[6];
    }

    //public void bill()
    //{
    //    if (Convert.ToInt32(txt1.Text) > billhours)
    //    {
    //        txtnb1.Text = (Convert.ToInt32(txt1.Text) - billhours).ToString();
    //        txtb1.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb1.Text = txt1.Text;
    //        txtnb1.Text = "0";
    //    }

    //    if (Convert.ToInt32(txt2.Text) > billhours)
    //    {
    //        txtnb2.Text = (Convert.ToInt32(txt2.Text) - billhours).ToString();
    //        txtb2.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb2.Text = txt2.Text;
    //        txtnb2.Text = "0";
    //    }

    //    if (Convert.ToInt32(txt3.Text) > billhours)
    //    {
    //        txtnb3.Text = (Convert.ToInt32(txt3.Text) - billhours).ToString();
    //        txtb3.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb3.Text = txt3.Text;
    //        txtnb3.Text = "0";
    //    }

    //    if (Convert.ToInt32(txt4.Text) > billhours)
    //    {
    //        txtnb4.Text = (Convert.ToInt32(txt4.Text) - billhours).ToString();
    //        txtb4.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb4.Text = txt4.Text;
    //        txtnb4.Text = "0";
    //    }

    //    if (Convert.ToInt32(txt5.Text) > billhours)
    //    {
    //        txtnb5.Text = (Convert.ToInt32(txt5.Text) - billhours).ToString();
    //        txtb5.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb5.Text = txt5.Text;
    //        txtnb5.Text = "0";
    //    }

    //    if (Convert.ToInt32(txt6.Text) > billhours)
    //    {
    //        txtnb6.Text = (Convert.ToInt32(txt6.Text) - billhours).ToString();
    //        txtb6.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb6.Text = txt6.Text;
    //        txtnb6.Text = "0";
    //    }

    //    if (Convert.ToInt32(txt7.Text) > billhours)
    //    {
    //        txtnb7.Text = (Convert.ToInt32(txt7.Text) - billhours).ToString();
    //        txtb7.Text = Convert.ToString(billhours);
    //    }
    //    else
    //    {
    //        txtb7.Text = txt7.Text;
    //        txtnb7.Text = "0";
    //    }
    //}
}
