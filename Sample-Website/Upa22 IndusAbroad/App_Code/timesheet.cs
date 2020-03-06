using System;
using System.Data;
using System.Configuration;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data.SqlClient;

/// <summary>
/// Summary description for timesheet
/// </summary>
public class timesheet
{
    public DataAccess obj = new DataAccess();

	public timesheet()
	{
	}

    public string Insert_CompanyInfo(string CompanyName, string CompanyOwner, string Address1, string Address2, int City, int State, int Country, string Zip, string Website, string EmailID, string PhoneNo, string MobileNo, string Fax, string CompanyType, string Description)
    {
        string strres=string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[15];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyOwner", CompanyOwner);
            Params[2] = new SqlParameter("@Address1", Address1);
            Params[3] = new SqlParameter("@Address2", Address2);
            Params[4] = new SqlParameter("@City", City);
            Params[5] = new SqlParameter("@State", State);
            Params[6] = new SqlParameter("@Country", Country);
            Params[7] = new SqlParameter("@Zip", Zip);
            Params[8] = new SqlParameter("@Website", Website);
            Params[9] = new SqlParameter("@EmailID", EmailID);
            Params[10] = new SqlParameter("@PhoneNo", PhoneNo);
            Params[11] = new SqlParameter("@MobileNo", MobileNo);
            Params[12] = new SqlParameter("@Fax", Fax);
            Params[13] = new SqlParameter("@CompanyType", CompanyType);
            Params[14]=new SqlParameter("@Description",Description);
            strres = obj.ExecuteNonQuery("Insert_CompanyInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_CountryMaster()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_CountryMaster");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_StateMaster(int intCountryId)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@intCountryId", intCountryId);
            ds = obj.ExcuteQryProc("Read_StateMaster", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_CityMaster(int sid)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@sid", sid);
            ds = obj.ExcuteQryProc("Read_CityMaster", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_EmployeeInfo(string FirstName, string LastName, string Address1, string Address2, string City, string State, string Country, string Zip, int Accept_Flag)
    {
        string strres=string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[9];
            Params[0] = new SqlParameter("@FirstName", FirstName);
            Params[1] = new SqlParameter("@LastName", LastName);
            Params[2] = new SqlParameter("@Address1", Address1);
            Params[3] = new SqlParameter("@Address2", Address2);
            Params[4] = new SqlParameter("@City", City);
            Params[5] = new SqlParameter("@State", State);
            Params[6] = new SqlParameter("@Country", Country);
            Params[7] = new SqlParameter("@Zip", Zip);
            Params[8] = new SqlParameter("@Accept_Flag", Accept_Flag);
            strres = obj.ExecuteNonQuery("Insert_EmployeeInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_ProjectInfo(string ProjectName, string ProjectOwner, string CompanyType, string CompanyName, string InternalDivision, string ProjectType, string Priority, string Status, string ShortName, DateTime StartDate, DateTime TargetFinishDate, string ActualBudget, string TargetBudget, string ActualURL, string StagingURL, string ProjectDesc)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[16];
            Params[0] = new SqlParameter("@ProjectName", ProjectName);
            Params[1] = new SqlParameter("@ProjectOwner", ProjectOwner);
            Params[2] = new SqlParameter("@CompanyType", CompanyType);
            Params[3] = new SqlParameter("@CompanyName", CompanyName);
            Params[4] = new SqlParameter("@InternalDivision", InternalDivision);
            Params[5] = new SqlParameter("@ProjectType", ProjectType);
            Params[6] = new SqlParameter("@Priority", Priority);
            Params[7] = new SqlParameter("@Status", Status);
            Params[8] = new SqlParameter("@ShortName", ShortName);
            Params[9] = new SqlParameter("@StartDate", SqlDbType.DateTime, 30, "StartDate");
            if (StartDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[9].Value = DBNull.Value;
            }
            else
            {
                Params[9].Value = StartDate;
            }
            Params[10] = new SqlParameter("@TargetFinishDate", SqlDbType.DateTime, 30, "TargetFinishDate");
            if (TargetFinishDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[10].Value = DBNull.Value;
            }
            else
            {
                Params[10].Value = TargetFinishDate;
            }
            Params[11] = new SqlParameter("@ActualBudget", ActualBudget);
            Params[12] = new SqlParameter("@TargetBudget", TargetBudget);
            Params[13] = new SqlParameter("@ActualURL", ActualURL);
            Params[14] = new SqlParameter("@StagingURL", StagingURL);
            Params[15] = new SqlParameter("@ProjectDesc", ProjectDesc);
            strres = obj.ExecuteNonQuery("Insert_ProjectInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet1(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours1, int BillableHours1, int NonBillableHours1, DateTime Day1, DateTime Day2, DateTime Day3, DateTime Day4, DateTime Day5, DateTime Day6, DateTime Day7, int Day1Work, int Day2Work, int Day3Work, int Day4Work, int Day5Work, int Day6Work, int Day7Work)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[20];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            //Params[2] = new SqlParameter("@ProjStartDate", SqlDbType.DateTime, 30, "ProjStartDate");
            //if (ProjStartDate.ToString() == "1/1/0001 12:00:00 AM")
            //{
            //    Params[2].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[2].Value = ProjStartDate;
            //}
            //Params[3] = new SqlParameter("@ProjEndDate", SqlDbType.DateTime, 30, "ProjEndDate");
            //if (ProjEndDate.ToString() == "1/1/0001 12:00:00AM")
            //{
            //    Params[3].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[3].Value = ProjEndDate;
            //}
            Params[2] = new SqlParameter("@EmployeeType", EmployeeType);
            Params[3] = new SqlParameter("@TotalHours1", TotalHours1);
            Params[4] = new SqlParameter("@BillableHours1", BillableHours1);
            Params[5] = new SqlParameter("@NonBillableHours1", NonBillableHours1);
            Params[6] = new SqlParameter("@Day1", SqlDbType.DateTime, 30, "Day1");
            if (Day1.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[6].Value = DBNull.Value;
            }
            else
            {
                Params[6].Value = Day1;
            }
            Params[7] = new SqlParameter("@Day2", SqlDbType.DateTime, 30, "Day2");
            if (Day2.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[7].Value = DBNull.Value;
            }
            else
            {
                Params[7].Value = Day2;
            }
            Params[8] = new SqlParameter("@Day3", SqlDbType.DateTime, 30, "Day3");
            if (Day3.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[8].Value = DBNull.Value;
            }
            else
            {
                Params[8].Value = Day3;
            }
            Params[9] = new SqlParameter("@Day4", SqlDbType.DateTime, 30, "Day4");
            if (Day4.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[9].Value = DBNull.Value;
            }
            else
            {
                Params[9].Value = Day4;
            }
            Params[10] = new SqlParameter("@Day5", SqlDbType.DateTime, 30, "Day5");
            if (Day5.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[10].Value = DBNull.Value;
            }
            else
            {
                Params[10].Value = Day5;
            }
            Params[11] = new SqlParameter("@Day6", SqlDbType.DateTime, 30, "Day6");
            if (Day6.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[11].Value = DBNull.Value;
            }
            else
            {
                Params[11].Value = Day6;
            }
            Params[12] = new SqlParameter("@Day7", SqlDbType.DateTime, 30, "Day7");
            if (Day7.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[12].Value = DBNull.Value;
            }
            else
            {
                Params[12].Value = Day7;
            }
            Params[13] = new SqlParameter("@Day1Work", Day1Work);
            Params[14] = new SqlParameter("@Day2Work", Day2Work);
            Params[15] = new SqlParameter("@Day3Work", Day3Work);
            Params[16] = new SqlParameter("@Day4Work", Day4Work);
            Params[17] = new SqlParameter("@Day5Work", Day5Work);
            Params[18] = new SqlParameter("@Day6Work", Day6Work);
            Params[19] = new SqlParameter("@Day7Work", Day7Work);
            
            strres = obj.ExecuteNonQuery("Insert_TimeSheet1", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet2(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours2, int BillableHours2, int NonBillableHours2, DateTime Day8, DateTime Day9, DateTime Day10, DateTime Day11, DateTime Day12, DateTime Day13, DateTime Day14, int Day8Work, int Day9Work, int Day10Work, int Day11Work, int Day12Work, int Day13Work, int Day14Work)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[20];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            //Params[2] = new SqlParameter("@ProjStartDate", SqlDbType.DateTime, 30, "ProjStartDate");
            //if (ProjStartDate.ToString() == "1/1/0001 12:00:00 AM")
            //{
            //    Params[2].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[2].Value = ProjStartDate;
            //}
            //Params[3] = new SqlParameter("@ProjEndDate", SqlDbType.DateTime, 30, "ProjEndDate");
            //if (ProjEndDate.ToString() == "1/1/0001 12:00:00AM")
            //{
            //    Params[3].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[3].Value = ProjEndDate;
            //}
            Params[2] = new SqlParameter("@EmployeeType", EmployeeType);
            Params[3] = new SqlParameter("@TotalHours2", TotalHours2);
            Params[4] = new SqlParameter("@BillableHours2",BillableHours2);
            Params[5] = new SqlParameter("@NonBillableHours2", NonBillableHours2);
            Params[6] = new SqlParameter("@Day8", SqlDbType.DateTime, 30, "Day8");
            if (Day8.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[6].Value = DBNull.Value;
            }
            else
            {
                Params[6].Value = Day8;
            }
            Params[7] = new SqlParameter("@Day9", SqlDbType.DateTime, 30, "Day9");
            if (Day9.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[7].Value = DBNull.Value;
            }
            else
            {
                Params[7].Value = Day9;
            }
            Params[8] = new SqlParameter("@Day10", SqlDbType.DateTime, 30, "Day10");
            if (Day10.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[8].Value = DBNull.Value;
            }
            else
            {
                Params[8].Value = Day10;
            }
            Params[9] = new SqlParameter("@Day11", SqlDbType.DateTime, 30, "Day11");
            if (Day11.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[9].Value = DBNull.Value;
            }
            else
            {
                Params[9].Value = Day11;
            }
            Params[10] = new SqlParameter("@Day12", SqlDbType.DateTime, 30, "Day12");
            if (Day12.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[10].Value = DBNull.Value;
            }
            else
            {
                Params[10].Value = Day12;
            }
            Params[11] = new SqlParameter("@Day13", SqlDbType.DateTime, 30, "Day13");
            if (Day13.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[11].Value = DBNull.Value;
            }
            else
            {
                Params[11].Value = Day13;
            }
            Params[12] = new SqlParameter("@Day14", SqlDbType.DateTime, 30, "Day14");
            if (Day14.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[12].Value = DBNull.Value;
            }
            else
            {
                Params[12].Value = Day14;
            }
            Params[13] = new SqlParameter("@Day8Work", Day8Work);
            Params[14] = new SqlParameter("@Day9Work", Day9Work);
            Params[15] = new SqlParameter("@Day10Work", Day10Work);
            Params[16] = new SqlParameter("@Day11Work", Day11Work);
            Params[17] = new SqlParameter("@Day12Work", Day12Work);
            Params[18] = new SqlParameter("@Day13Work", Day13Work);
            Params[19] = new SqlParameter("@Day14Work", Day14Work);
            strres = obj.ExecuteNonQuery("Insert_TimeSheet2", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet3(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours3, int BillableHours3, int NonBillableHours3, DateTime Day15, DateTime Day16, DateTime Day17, DateTime Day18, DateTime Day19, DateTime Day20, DateTime Day21, int Day15Work, int Day16Work, int Day17Work, int Day18Work, int Day19Work, int Day20Work, int Day21Work)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[20];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            //Params[2] = new SqlParameter("@ProjStartDate", SqlDbType.DateTime, 30, "ProjStartDate");
            //if (ProjStartDate.ToString() == "1/1/0001 12:00:00 AM")
            //{
            //    Params[2].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[2].Value = ProjStartDate;
            //}
            //Params[3] = new SqlParameter("@ProjEndDate", SqlDbType.DateTime, 30, "ProjEndDate");
            //if (ProjEndDate.ToString() == "1/1/0001 12:00:00AM")
            //{
            //    Params[3].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[3].Value = ProjEndDate;
            //}
            Params[2] = new SqlParameter("@EmployeeType", EmployeeType);
            Params[3] = new SqlParameter("@TotalHours3", TotalHours3);
            Params[4] = new SqlParameter("@BillableHours3", BillableHours3);
            Params[5] = new SqlParameter("@NonBillableHours3", NonBillableHours3);
            Params[6] = new SqlParameter("@Day15", SqlDbType.DateTime, 30, "Day15");
            if (Day15.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[6].Value = DBNull.Value;
            }
            else
            {
                Params[6].Value = Day15;
            }
            Params[7] = new SqlParameter("@Day16", SqlDbType.DateTime, 30, "Day16");
            if (Day16.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[7].Value = DBNull.Value;
            }
            else
            {
                Params[7].Value = Day16;
            }
            Params[8] = new SqlParameter("@Day17", SqlDbType.DateTime, 30, "Day17");
            if (Day17.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[8].Value = DBNull.Value;
            }
            else
            {
                Params[8].Value = Day17;
            }
            Params[9] = new SqlParameter("@Day18", SqlDbType.DateTime, 30, "Day18");
            if (Day18.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[9].Value = DBNull.Value;
            }
            else
            {
                Params[9].Value = Day18;
            }
            Params[10] = new SqlParameter("@Day19", SqlDbType.DateTime, 30, "Day19");
            if (Day19.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[10].Value = DBNull.Value;
            }
            else
            {
                Params[10].Value = Day19;
            }
            Params[11] = new SqlParameter("@Day20", SqlDbType.DateTime, 30, "Day20");
            if (Day20.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[11].Value = DBNull.Value;
            }
            else
            {
                Params[11].Value = Day20;
            }
            Params[12] = new SqlParameter("@Day21", SqlDbType.DateTime, 30, "Day21");
            if (Day21.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[12].Value = DBNull.Value;
            }
            else
            {
                Params[12].Value = Day21;
            }
            Params[13] = new SqlParameter("@Day15Work", Day15Work);
            Params[14] = new SqlParameter("@Day16Work", Day16Work);
            Params[15] = new SqlParameter("@Day17Work", Day17Work);
            Params[16] = new SqlParameter("@Day18Work", Day18Work);
            Params[17] = new SqlParameter("@Day19Work", Day19Work);
            Params[18] = new SqlParameter("@Day20Work", Day20Work);
            Params[19] = new SqlParameter("@Day21Work", Day21Work);
            strres = obj.ExecuteNonQuery("Insert_TimeSheet3", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet4(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours4, int BillableHours4, int NonBillableHours4, DateTime Day22, DateTime Day23, DateTime Day24, DateTime Day25, DateTime Day26, DateTime Day27, DateTime Day28, int Day22Work, int Day23Work, int Day24Work, int Day25Work, int Day26Work, int Day27Work, int Day28Work)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[20];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            //Params[2] = new SqlParameter("@ProjStartDate", SqlDbType.DateTime, 30, "ProjStartDate");
            //if (ProjStartDate.ToString() == "1/1/0001 12:00:00 AM")
            //{
            //    Params[2].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[2].Value = ProjStartDate;
            //}
            //Params[3] = new SqlParameter("@ProjEndDate", SqlDbType.DateTime, 30, "ProjEndDate");
            //if (ProjEndDate.ToString() == "1/1/0001 12:00:00AM")
            //{
            //    Params[3].Value = DBNull.Value;
            //}
            //else
            //{
            //    Params[3].Value = ProjEndDate;
            //}
            Params[2] = new SqlParameter("@EmployeeType", EmployeeType);
            Params[3] = new SqlParameter("@TotalHours4", TotalHours4);
            Params[4] = new SqlParameter("@BillableHours4", BillableHours4);
            Params[5] = new SqlParameter("@NonBillableHours4", NonBillableHours4);
            Params[6] = new SqlParameter("@Day22", SqlDbType.DateTime, 30, "Day22");
            if (Day22.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[6].Value = DBNull.Value;
            }
            else
            {
                Params[6].Value = Day22;
            }
            Params[7] = new SqlParameter("@Day23", SqlDbType.DateTime, 30, "Day23");
            if (Day23.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[7].Value = DBNull.Value;
            }
            else
            {
                Params[7].Value = Day23;
            }
            Params[8] = new SqlParameter("@Day24", SqlDbType.DateTime, 30, "Day24");
            if (Day24.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[8].Value = DBNull.Value;
            }
            else
            {
                Params[8].Value = Day24;
            }
            Params[9] = new SqlParameter("@Day25", SqlDbType.DateTime, 30, "Day25");
            if (Day25.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[9].Value = DBNull.Value;
            }
            else
            {
                Params[9].Value = Day25;
            }
            Params[10] = new SqlParameter("@Day26", SqlDbType.DateTime, 30, "Day26");
            if (Day26.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[10].Value = DBNull.Value;
            }
            else
            {
                Params[10].Value = Day26;
            }
            Params[11] = new SqlParameter("@Day27", SqlDbType.DateTime, 30, "Day27");
            if (Day27.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[11].Value = DBNull.Value;
            }
            else
            {
                Params[11].Value = Day27;
            }
            Params[12] = new SqlParameter("@Day28", SqlDbType.DateTime, 30, "Day28");
            if (Day28.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[12].Value = DBNull.Value;
            }
            else
            {
                Params[12].Value = Day28;
            }
            Params[13] = new SqlParameter("@Day22Work", Day22Work);
            Params[14] = new SqlParameter("@Day23Work", Day23Work);
            Params[15] = new SqlParameter("@Day24Work", Day24Work);
            Params[16] = new SqlParameter("@Day25Work", Day25Work);
            Params[17] = new SqlParameter("@Day26Work", Day26Work);
            Params[18] = new SqlParameter("@Day27Work", Day27Work);
            Params[19] = new SqlParameter("@Day28Work", Day28Work);
            strres = obj.ExecuteNonQuery("Insert_TimeSheet4", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_TimeSheet1(int @EmployeeID, int @ProjectID, int @CYear, int @CMonth)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            ds = obj.ExcuteQryProc("Read_TimeSheet1", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_TimeSheet2(int @EmployeeID, int @ProjectID, int @CYear, int @CMonth)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            ds = obj.ExcuteQryProc("Read_TimeSheet2", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_TimeSheet3(int @EmployeeID, int @ProjectID, int @CYear, int @CMonth)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            ds = obj.ExcuteQryProc("Read_TimeSheet3", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_TimeSheet4(int @EmployeeID, int @ProjectID, int @CYear, int @CMonth)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            ds = obj.ExcuteQryProc("Read_TimeSheet4", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_AllDays(int @EmployeeID, int @ProjectID, int @CYear, int @CMonth)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@EmployeeID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            ds = obj.ExcuteQryProc("Read_AllDays", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_CompanyID(string CompanyType)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyType", CompanyType);
            ds = obj.ExcuteQryProc("Read_CompanyID", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    //CompanyName, CompanyOwner, Address1, City, State, Country, c_person, Website, EmailID, PhoneNo, Cdesig, Fax, CompanyType, Description,Paswd,CPaswd, CID);
    public string Edit_CompanyInfo(string CompanyName, string CompanyOwner, string Address1, string City, string State, string Country, string c_person, string Website, string EmailID, string PhoneNo, string C_desig,string Fax, string CompanyType, string Description,string Pwd,string Cpwd, int CID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[17];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyOwner", CompanyOwner);
            Params[2] = new SqlParameter("@Address1", Address1);         
            Params[3] = new SqlParameter("@City", City);
            Params[4] = new SqlParameter("@State", State);
            Params[5] = new SqlParameter("@Country", Country);
            Params[6] = new SqlParameter("@cont_person",c_person );
            Params[7] = new SqlParameter("@Website", Website);
            Params[8] = new SqlParameter("@EmailID", EmailID);
            Params[9] = new SqlParameter("@PhoneNo", PhoneNo);
            Params[10] = new SqlParameter("@cont_desig", C_desig);
            Params[11] = new SqlParameter("@Fax", Fax);
            Params[12] = new SqlParameter("@CompanyType", CompanyType);
            Params[13] = new SqlParameter("@Description", Description);
            Params[14] = new SqlParameter("@password", Pwd);
            Params[15] = new SqlParameter("@cpassword", Cpwd);
            Params[16] = new SqlParameter("@CID", CID);
            strres = obj.ExecuteNonQuery("Edit_CompanyInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Client()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Client");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Vendor()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Vendor");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Company()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Company");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Supplier()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Supplier");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Government()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Govt");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Internal()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Internal");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_NotApplicable()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_NotApplicable");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_CompanyInfo(int CID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CID", CID);
            ds = obj.ExcuteQryProc("Read_CompanyInfo", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_EmployeeInfo(string FirstName, string LastName, string Address1, string Address2, int City, int State, int Country, string Zip, int Accept_Flag,int eID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[10];
            Params[0] = new SqlParameter("@FirstName", FirstName);
            Params[1] = new SqlParameter("@LastName", LastName);
            Params[2] = new SqlParameter("@Address1", Address1);
            Params[3] = new SqlParameter("@Address2", Address2);
            Params[4] = new SqlParameter("@City", City);
            Params[5] = new SqlParameter("@State", State);
            Params[6] = new SqlParameter("@Country", Country);
            Params[7] = new SqlParameter("@Zip", Zip);
            Params[8] = new SqlParameter("@Accept_Flag", Accept_Flag);
            Params[9] = new SqlParameter("@eID", eID);
            strres = obj.ExecuteNonQuery("Edit_EmployeeInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_EmployeeInfo()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_EmployeeInfo");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_EmployeeInfo(int eID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@eID", eID);
            ds = obj.ExcuteQryProc("Read_EmployeeInfo", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_ProjectInfo(string ProjectName, string ProjectOwner, string CompanyType, string CompanyName, string InternalDivision, string ProjectType, string Priority, string Status, string ShortName, DateTime StartDate, DateTime TargetFinishDate, string ActualBudget, string TargetBudget, string ActualURL, string StagingURL, string ProjectDesc,int PID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[17];
            Params[0] = new SqlParameter("@ProjectName", ProjectName);
            Params[1] = new SqlParameter("@ProjectOwner", ProjectOwner);
            Params[2] = new SqlParameter("@CompanyType", CompanyType);
            Params[3] = new SqlParameter("@CompanyName", CompanyName);
            Params[4] = new SqlParameter("@InternalDivision", InternalDivision);
            Params[5] = new SqlParameter("@ProjectType", ProjectType);
            Params[6] = new SqlParameter("@Priority", Priority);
            Params[7] = new SqlParameter("@Status", Status);
            Params[8] = new SqlParameter("@ShortName", ShortName);
            Params[9] = new SqlParameter("@StartDate", SqlDbType.DateTime, 30, "StartDate");
            if (StartDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[9].Value = DBNull.Value;
            }
            else
            {
                Params[9].Value = StartDate;
            }
            Params[10] = new SqlParameter("@TargetFinishDate", SqlDbType.DateTime, 30, "TargetFinishDate");
            if (TargetFinishDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[10].Value = DBNull.Value;
            }
            else
            {
                Params[10].Value = TargetFinishDate;
            }
            Params[11] = new SqlParameter("@ActualBudget", ActualBudget);
            Params[12] = new SqlParameter("@TargetBudget", TargetBudget);
            Params[13] = new SqlParameter("@ActualURL", ActualURL);
            Params[14] = new SqlParameter("@StagingURL", StagingURL);
            Params[15] = new SqlParameter("@ProjectDesc", ProjectDesc);
            Params[16] = new SqlParameter("@PID", PID);
            strres = obj.ExecuteNonQuery("Edit_ProjectInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_NotDefined()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_NotDefined");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Proposed()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Proposed");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_InPlanning()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_InPlanning");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_InProgress()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_InProgress");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_OnHold()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_OnHold");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Complete()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Complete");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Template()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Template");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Archived()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Archived");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Gantt()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Gantt");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_ProjectInfo(int PID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@PID", PID);
            ds = obj.ExcuteQryProc("Read_ProjectInfo", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Delete_CompanyInfo(int CID)
    {
        string strres = string.Empty;

        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CID", CID);
            strres = obj.ExecuteNonQuery("Delete_CompanyInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_EmployeeInfo(int eID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@eID", eID);
            strres = obj.ExecuteNonQuery("Delete_EmployeeInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_ProjectInfo(int PID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@PID", PID);
            strres = obj.ExecuteNonQuery("Delete_ProjectInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_EmployeeName()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_EmployeeName");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_ProjectsName()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_ProjectsName");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_ProjectTime(int ProjID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@ProjID", ProjID);
            ds = obj.ExcuteQryProc("Read_ProjectTime", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_DepartmentInfo(string DeptCode, int CompanyID, string DeptName, string CompanyType)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@DeptCode", DeptCode);
            Params[1] = new SqlParameter("@CompanyID", CompanyID);
            Params[2] = new SqlParameter("@DeptName", DeptName);
            Params[3] = new SqlParameter("@CompanyType", CompanyType);
            strres = obj.ExecuteNonQuery("Insert_DepartmentInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_DepartmentInfo(string DeptCode, int CompanyID, string DeptName, int ID,string CompanyType)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@DeptCode", DeptCode);
            Params[1] = new SqlParameter("@CompanyID", CompanyID);
            Params[2] = new SqlParameter("@DeptName", DeptName);
            Params[3] = new SqlParameter("@ID", ID);
            Params[4] = new SqlParameter("@CompanyType", CompanyType);
            strres = obj.ExecuteNonQuery("Edit_DepartmentInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_DepartmentInfo(int ID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@ID", ID);
            strres = obj.ExecuteNonQuery("Delete_DepartmentInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_DepartmentInfo()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_DepartmentInfo");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_DepartmentInfo(int ID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@ID", ID);
            ds = obj.ExcuteQryProc("Read_DepartmentInfo", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet View_DeptInfo(int ID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@ID", ID);
            ds = obj.ExcuteQryProc("View_DeptInfo", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Roles(string Role_Name)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@Role_Name", Role_Name);
            strres = obj.ExecuteNonQuery("Insert_Roles", Params).ToString(); ;
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Roles(int ID,string Role_Name)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@ID", ID);
            Params[1] = new SqlParameter("@Role_Name", Role_Name);
            strres = obj.ExecuteNonQuery("Edit_Roles", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_roles(int ID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@ID", ID);
            strres = obj.ExecuteNonQuery("Delete_Roles", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Roles()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Roles");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

}
