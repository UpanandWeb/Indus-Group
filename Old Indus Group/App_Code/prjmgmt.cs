using System;
using System.Data;
using System.Configuration;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for prjmgmt
/// </summary>
public class prjmgmt
{
    public DataAccess obj = new DataAccess();
    DataSet ds;

	public prjmgmt()
	{
	}

    public string Insert_Company(string CompanyName, string Email, string Phone1, string Phone2, string Fax, string Address1, string Address2, string City, string State, string Zip, string URL, string CompanyOwner, string CompanyType, string Description, string Country,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[16];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@Email", Email);
            Params[2] = new SqlParameter("@Phone1", Phone1);
            Params[3] = new SqlParameter("@Phone2", Phone2);
            Params[4] = new SqlParameter("@Fax", Fax);
            Params[5] = new SqlParameter("@Address1", Address1);
            Params[6] = new SqlParameter("@Address2", Address2);
            Params[7] = new SqlParameter("@City", City);
            Params[8] = new SqlParameter("@State", State);
            Params[9] = new SqlParameter("@Zip", Zip);
            Params[10] = new SqlParameter("@URL", URL);
            Params[11] = new SqlParameter("@CompanyOwner", CompanyOwner);
            Params[12] = new SqlParameter("@CompanyType", CompanyType);
            Params[13] = new SqlParameter("@Description", Description);
            Params[14] = new SqlParameter("@Country", Country);
            Params[15] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Company", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Company(string CompanyName, string Email, string Phone1, string Phone2, string Fax, string Address1, string Address2, string City, string State, string Zip, string URL, string CompanyOwner, string CompanyType, string Description, string Country, int CID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[17];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@Email", Email);
            Params[2] = new SqlParameter("@Phone1", Phone1);
            Params[3] = new SqlParameter("@Phone2", Phone2);
            Params[4] = new SqlParameter("@Fax", Fax);
            Params[5] = new SqlParameter("@Address1", Address1);
            Params[6] = new SqlParameter("@Address2", Address2);
            Params[7] = new SqlParameter("@City", City);
            Params[8] = new SqlParameter("@State", State);
            Params[9] = new SqlParameter("@Zip", Zip);
            Params[10] = new SqlParameter("@URL", URL);
            Params[11] = new SqlParameter("@CompanyOwner", CompanyOwner);
            Params[12] = new SqlParameter("@CompanyType", CompanyType);
            Params[13] = new SqlParameter("@Description", Description);
            Params[14] = new SqlParameter("@Country", Country);
            Params[15] = new SqlParameter("@CID", CID);
            Params[16] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Company", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Company(int CID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Company", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_CompanyType()
    {
        ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_CompanyType");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Projects(string ProjectName, string projectOwner, string ProjectType, int CompanyID, string InternalDivision, DateTime StartDate, DateTime TargetFinishDate, string Priority, string TargetBudget, string ActualBudget, string Status, string ShortName, string URL, string StagingURL, string Description,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[16];
            Params[0] = new SqlParameter("@ProjectName", ProjectName);
            Params[1] = new SqlParameter("@ProjectOwner", projectOwner);
            Params[2] = new SqlParameter("@ProjectType", ProjectType);
            Params[3] = new SqlParameter("@CompanyID", CompanyID);
            Params[4] = new SqlParameter("@InternalDivision", InternalDivision);
            Params[5] = new SqlParameter("@StartDate",SqlDbType.DateTime,30, "StartDate");
            if (StartDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[5].Value = DBNull.Value;
            }
            else
            {
                Params[5].Value = StartDate;
            }
            Params[6] = new SqlParameter("@TargetFinishDate",SqlDbType.DateTime,30,"TargetFinishDate");
            if (TargetFinishDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[6].Value = DBNull.Value;
            }
            else
            {
                Params[6].Value = TargetFinishDate;
            }
            Params[7] = new SqlParameter("@Priority", Priority);
            Params[8] = new SqlParameter("@TargetBudget", TargetBudget);
            Params[9] = new SqlParameter("@ActualBudget", ActualBudget);
            Params[10] = new SqlParameter("@Status", Status);
            Params[11] = new SqlParameter("@ShortName", ShortName);
            Params[12] = new SqlParameter("@URL", URL);
            Params[13] = new SqlParameter("@StagingURL", StagingURL);
            Params[14] = new SqlParameter("@Description", Description);
            Params[15]=new SqlParameter("@CompanyCode",CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Projects", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Projects(string ProjectName, string projectOwner, string ProjectType, int CompanyID, string InternalDivision, DateTime StartDate, DateTime TargetFinishDate, string Priority, string TargetBudget, string ActualBudget, string Status, string ShortName, string URL, string StagingURL, string Description, int PID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[17];
            Params[0] = new SqlParameter("@ProjectName", ProjectName);
            Params[1] = new SqlParameter("@ProjectOwner", projectOwner);
            Params[2] = new SqlParameter("@ProjectType", ProjectType);
            Params[3] = new SqlParameter("@CompanyID", CompanyID);
            Params[4] = new SqlParameter("@InternalDivision", InternalDivision);
            Params[5] = new SqlParameter("@StartDate", SqlDbType.DateTime, 30, "StartDate");
            if (StartDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[5].Value = DBNull.Value;
            }
            else
            {
                Params[5].Value = StartDate;
            }
            Params[6] = new SqlParameter("@TargetFinishDate", SqlDbType.DateTime, 30, "TargetFinishDate");
            if (TargetFinishDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[6].Value = DBNull.Value;
            }
            else
            {
                Params[6].Value = TargetFinishDate;
            }
            Params[7] = new SqlParameter("@Priority", Priority);
            Params[8] = new SqlParameter("@TargetBudget", TargetBudget);
            Params[9] = new SqlParameter("@ActualBudget", ActualBudget);
            Params[10] = new SqlParameter("@Status", Status);
            Params[11] = new SqlParameter("@ShortName", ShortName);
            Params[12] = new SqlParameter("@URL", URL);
            Params[13] = new SqlParameter("@StagingURL", StagingURL);
            Params[14] = new SqlParameter("@Description", Description);
            Params[15] = new SqlParameter("@PID", PID);
            Params[16] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Projects", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Projects(int PID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@PID", PID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Projects",Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Priority()
    {
        ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Priority");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_ProjectStatus()
    {
        ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_ProjectStatus");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_ProjectType()
    {
        ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_ProjectType");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_CompanyName(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_CompanyName",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Company(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Company",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Company(int CID,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Company", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Projects(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Projects",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_ProjectsID(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_ProjectsID", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Client(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Client",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Vendor(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Vendor",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Supplier(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Supplier",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Consultant(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Consultant",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Government(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Government",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Internal(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Internal",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_NotApplicable(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_NotApplicable",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Projects(int PID,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@PID", PID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Projects", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_NotDefined(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_NotDefined",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_NotDefined_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_NotDefined_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Proposed(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Proposed",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Proposed_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Proposed_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_InPlanning(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_InPlanning",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_InPlanning_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_InPlanning_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_InProgress(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_InProgress",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_InProgress_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_InProgress_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_OnHold(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_OnHold",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_OnHold_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_OnHold_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Complete(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Complete",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Complete_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Complete_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Template(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Template",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Template_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Template_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Archieved(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Archieved",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Archieved_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Archieved_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Owner(int cid,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CID", cid);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Owner", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Department(int CompanyID, string DName, string Phone, string Fax, string Address1, string Address2, string City, string State, string Country, string Zip, string URL, string DParent, string Owner, string Description,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[15];
            Params[0] = new SqlParameter("@CompanyID", CompanyID);
            Params[1] = new SqlParameter("@DName", DName);
            Params[2] = new SqlParameter("@Phone", Phone);
            Params[3] = new SqlParameter("@Fax", Fax);
            Params[4] = new SqlParameter("@Address1", Address1);
            Params[5] = new SqlParameter("@Address2", Address2);
            Params[6] = new SqlParameter("@City", City);
            Params[7] = new SqlParameter("@State", State);
            Params[8] = new SqlParameter("@Country", Country);
            Params[9] = new SqlParameter("@Zip", Zip);
            Params[10] = new SqlParameter("@URL", URL);
            Params[11] = new SqlParameter("@DParent", DParent);
            Params[12] = new SqlParameter("@Owner", Owner);
            Params[13] = new SqlParameter("@Description", Description);
            Params[14] = new SqlParameter("@CompanyCode", CompanyCode);
            strres=obj.ExecuteNonQuery("Insert_Department", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Department(int CompanyID, string DName, string Phone, string Fax, string Address1, string Address2, string City, string State, string Country, string Zip, string URL, string DParent, string Owner, string Description,int DID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[16];
            Params[0] = new SqlParameter("@CompanyID", CompanyID);
            Params[1] = new SqlParameter("@DName", DName);
            Params[2] = new SqlParameter("@Phone", Phone);
            Params[3] = new SqlParameter("@Fax", Fax);
            Params[4] = new SqlParameter("@Address1", Address1);
            Params[5] = new SqlParameter("@Address2", Address2);
            Params[6] = new SqlParameter("@City", City);
            Params[7] = new SqlParameter("@State", State);
            Params[8] = new SqlParameter("@Country", Country);
            Params[9] = new SqlParameter("@Zip", Zip);
            Params[10] = new SqlParameter("@URL", URL);
            Params[11] = new SqlParameter("@DParent", DParent);
            Params[12] = new SqlParameter("@Owner", Owner);
            Params[13] = new SqlParameter("@Description", Description);
            Params[14] = new SqlParameter("@DID", DID);
            Params[15] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Department", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Department(int DID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@DID", DID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Departments", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Department_CName(string CompanyName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Department_CName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Department(string CompanyName, string DepartmentName,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@CompanyName", CompanyName);
            Params[1] = new SqlParameter("@DName", DepartmentName);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Department", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Contacts(string FirstName, string LastName, string DisplayName, int PrivateEntry, string JobTitle, string Company, string Department, string Title, string Types, string Address1, string Address2, string City, string State, string Zip, string Country, string Phone, string Phone2, string Fax, string MobileNo, string Email, string Email2, string URL, string Jabber, string ICQ, string AOL, string MSN, string Yahoo, DateTime Birthday, string Notes,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[30];
            Params[0] = new SqlParameter("@FirstName", FirstName);
            Params[1] = new SqlParameter("@LastName", LastName);
            Params[2] = new SqlParameter("@DisplayName", DisplayName);
            Params[3] = new SqlParameter("@PrivateEntry", PrivateEntry);
            Params[4] = new SqlParameter("@JobTitle", JobTitle);
            Params[5] = new SqlParameter("@Company", Company);
            Params[6] = new SqlParameter("@Department", Department);
            Params[7] = new SqlParameter("@Title", Title);
            Params[8] = new SqlParameter("@Types", Types);
            Params[9] = new SqlParameter("@Address1", Address1);
            Params[10] = new SqlParameter("@Address2", Address2);
            Params[11] = new SqlParameter("@City", City);
            Params[12] = new SqlParameter("@State", State);
            Params[13] = new SqlParameter("@Zip", Zip);
            Params[14] = new SqlParameter("@Country", Country);
            Params[15] = new SqlParameter("@Phone", Phone);
            Params[16] = new SqlParameter("@Phone2", Phone2);
            Params[17] = new SqlParameter("@Fax", Fax);
            Params[18] = new SqlParameter("@MobileNo", MobileNo);
            Params[19] = new SqlParameter("@Email", Email);
            Params[20] = new SqlParameter("@Email2", Email2);
            Params[21] = new SqlParameter("@URL", URL);
            Params[22] = new SqlParameter("@Jabber", Jabber);
            Params[23] = new SqlParameter("@ICQ", ICQ);
            Params[24] = new SqlParameter("@AOL", AOL);
            Params[25] = new SqlParameter("@MSN", MSN);
            Params[26] = new SqlParameter("@Yahoo", Yahoo);
            Params[27] = new SqlParameter("@Birthday",SqlDbType.DateTime,30, "Birthday");
            if (Birthday.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[27].Value = DBNull.Value;
            }
            else
            {
                Params[27].Value=Birthday;
            }
            Params[28] = new SqlParameter("@Notes", Notes);
            Params[29] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Contacts", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Contacts(string FirstName, string LastName, string DisplayName, int PrivateEntry, string JobTitle, string Company, string Department, string Title, string Types, string Address1, string Address2, string City, string State, string Zip, string Country, string Phone, string Phone2, string Fax, string MobileNo, string Email, string Email2, string URL, string Jabber, string ICQ, string AOL, string MSN, string Yahoo, DateTime Birthday, string Notes,int COID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[31];
            Params[0] = new SqlParameter("@FirstName", FirstName);
            Params[1] = new SqlParameter("@LastName", LastName);
            Params[2] = new SqlParameter("@DisplayName", DisplayName);
            Params[3] = new SqlParameter("@PrivateEntry", PrivateEntry);
            Params[4] = new SqlParameter("@JobTitle", JobTitle);
            Params[5] = new SqlParameter("@Company", Company);
            Params[6] = new SqlParameter("@Department", Department);
            Params[7] = new SqlParameter("@Title", Title);
            Params[8] = new SqlParameter("@Types", Types);
            Params[9] = new SqlParameter("@Address1", Address1);
            Params[10] = new SqlParameter("@Address2", Address2);
            Params[11] = new SqlParameter("@City", City);
            Params[12] = new SqlParameter("@State", State);
            Params[13] = new SqlParameter("@Zip", Zip);
            Params[14] = new SqlParameter("@Country", Country);
            Params[15] = new SqlParameter("@Phone", Phone);
            Params[16] = new SqlParameter("@Phone2", Phone2);
            Params[17] = new SqlParameter("@Fax", Fax);
            Params[18] = new SqlParameter("@MobileNo", MobileNo);
            Params[19] = new SqlParameter("@Email", Email);
            Params[20] = new SqlParameter("@Email2", Email2);
            Params[21] = new SqlParameter("@URL", URL);
            Params[22] = new SqlParameter("@Jabber", Jabber);
            Params[23] = new SqlParameter("@ICQ", ICQ);
            Params[24] = new SqlParameter("@AOL", AOL);
            Params[25] = new SqlParameter("@MSN", MSN);
            Params[26] = new SqlParameter("@Yahoo", Yahoo);
            Params[27] = new SqlParameter("@Birthday",SqlDbType.DateTime,30,"Birthday");
            if (Birthday.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[27].Value = DBNull.Value;
            }
            else
            {
                Params[27].Value = Birthday;
            }
            Params[28] = new SqlParameter("@Notes", Notes);
            Params[29] = new SqlParameter("@COID", COID);
            Params[30] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Contacts", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Contacts(int COID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@COID", COID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Contacts", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_Contacts(int COID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@COID", COID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Contacts", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_DepartmentName(int CompanyID,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@CompanyID", CompanyID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_DepartmentName", Params);
        }
        catch(Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Contacts(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Contacts",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Contacts_letter(string letter,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@letter", letter);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Contacts_letter", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Tasks(int PID, string TaskName, string Status, string Priority, string Progress, int Milestone)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@PID", PID);
            Params[1] = new SqlParameter("@TaskName", TaskName);
            Params[2] = new SqlParameter("@Status", Status);
            Params[3] = new SqlParameter("@Priority", Priority);
            Params[4] = new SqlParameter("@Progress", Progress);
            Params[5] = new SqlParameter("@Milestone", Milestone);
            strres = obj.ExecuteNonQuery("Insert_Tasks", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Task_Details(int TID, string TaskOwner, string TaskType, string Access, string WebAddress, string TaskParent, string TargetBudget, string Description)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[8];
            Params[0] = new SqlParameter("@TID", TID);
            Params[1] = new SqlParameter("@TaskOwner", TaskOwner);
            Params[2] = new SqlParameter("@TaskType", TaskType);
            Params[3] = new SqlParameter("@Access", Access);
            Params[4] = new SqlParameter("@WebAddress", WebAddress);
            Params[5] = new SqlParameter("@TaskParent", TaskParent);
            Params[6] = new SqlParameter("@TargetBudget", TargetBudget);
            Params[7] = new SqlParameter("@Description", Description);
            strres = obj.ExecuteNonQuery("Insert_Task_Details", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Task_Dates(DateTime StartDate, DateTime FinishDate, string duration, int ExDuartion, int TID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0]=new SqlParameter("@StartDate",SqlDbType.DateTime,30,"StartDate");
            if(StartDate.ToString()=="1/1/0001 12:00:00 AM")
            {
                Params[0].Value=DBNull.Value;
            }
            else
            {
                Params[0].Value=StartDate;
            }
            Params[1] = new SqlParameter("@FinishDate", SqlDbType.DateTime, 30, "FinishDate");
            if(FinishDate.ToString()=="1/1/0001 12:00:00 AM")
            {
                Params[0].Value=DBNull.Value;
            }
            else
            {
                Params[0].Value=FinishDate;
            }
            Params[2] = new SqlParameter("@duartion", duration);
            Params[3] = new SqlParameter("@ExDuration", ExDuartion);
            Params[4] = new SqlParameter("@TID", TID);
            strres = obj.ExecuteNonQuery("Insert_Task_Dates", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Task_Dependencies(int TID, string Tracking, int DynamicTask, int DoNotTrack, string TaskDependencies)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@TID", TID);
            Params[1] = new SqlParameter("@Tracking", Tracking);
            Params[2] = new SqlParameter("@DynamicTask", DynamicTask);
            Params[3] = new SqlParameter("@DoNotTrack", DoNotTrack);
            Params[4] = new SqlParameter("@TaskDependencies", TaskDependencies);
            strres = obj.ExecuteNonQuery("Insert_Task_Dependencies", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Task_HR(int TID, string AssignedToTask, string EmailComments, int Notify)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@TID", TID);
            Params[1] = new SqlParameter("@AssignedToTask", AssignedToTask);
            Params[2] = new SqlParameter("@EmailComments", EmailComments);
            Params[3] = new SqlParameter("@Notify", Notify);
            strres = obj.ExecuteNonQuery("Insert_Task_HR", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Task_Other(string Resources, string AssignedToTask, int TID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@Resources", Resources);
            Params[1] = new SqlParameter("@AssignedToTask", AssignedToTask);
            Params[2] = new SqlParameter("@TID", TID);
            strres = obj.ExecuteNonQuery("Insert_Task_Other", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_TaskName(string Project,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@Project", Project);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_TaskName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_ProjectOwner(int PID,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@PID", PID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_ProjectOwner", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Tickets(string Namee, string Email, string Subject, string Priority, string Company, string Project, string Description,DateTime TodayDate,string Status,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[10];
            Params[0] = new SqlParameter("@Namee", Namee);
            Params[1] = new SqlParameter("@Email", Email);
            Params[2] = new SqlParameter("@Subject", Subject);
            Params[3] = new SqlParameter("@Priority", Priority);
            Params[4] = new SqlParameter("@Company", Company);
            Params[5] = new SqlParameter("@Project", Project);
            Params[6] = new SqlParameter("@Description", Description);
            Params[7] = new SqlParameter("@TodayDate", TodayDate);
            Params[8] = new SqlParameter("@Status", Status);
            Params[9] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Tickets", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Tickets(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Tickets_My(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets_My",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Tickets_All(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets_All",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Tickets_Closed(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets_Closed",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Tickets_Open(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets_Open",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Tickets_Processing(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets_Processing",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Tickets_Deleted(string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tickets_Deleted",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Tickets(int TikID,string CompanyCode)
    {
        ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TikID", TikID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Tickets", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_Tickets(string Status, string Priority, int TikID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@Status", Status);
            Params[1] = new SqlParameter("@Priority", Priority);
            Params[2] = new SqlParameter("@TikID", TikID);
            Params[3] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Tickets", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Tickets(int TikID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TikID", TikID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Tickets", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Ticket_Followup(int TikID, string fromID, string toID, string subject, string cc, string description,DateTime TodayDate,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[8];
            Params[0] = new SqlParameter("@TikID", TikID);
            Params[1] = new SqlParameter("@fromID", fromID);
            Params[2] = new SqlParameter("@toID", toID);
            Params[3] = new SqlParameter("@subject", subject);
            Params[4] = new SqlParameter("@cc", cc);
            Params[5] = new SqlParameter("@description", description);
            Params[6] = new SqlParameter("@TodayDate", TodayDate);
            Params[7] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Ticket_Followup", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_Ticket_Followup(int TikID,string CompanyCode)
    {
        DataSet ds=new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TikID", TikID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Ticket_Followup", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Follwup(int TFID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TFID", TFID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Followup", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Ticket_Comment(int TikID, string fromID, string comment,DateTime TodayDate,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@TikID", TikID);
            Params[1] = new SqlParameter("@fromID", fromID);
            Params[2] = new SqlParameter("@comment", comment);
            Params[3] = new SqlParameter("@TodayDate", TodayDate);
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Ticket_Comment", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_Ticket_Comment(int TikID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TikID", TikID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Ticket_Comment", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Comment(int TCID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TCID", TCID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Comment", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Files(string Folder, int Version, string Category, string Project, string Task, string Description, string UploadFile,string FType,int FSize,DateTime TodayDate,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[11];
            Params[0] = new SqlParameter("@Folder", Folder);
            Params[1] = new SqlParameter("@Version", Version);
            Params[2] = new SqlParameter("@Category", Category);
            Params[3] = new SqlParameter("@Project", Project);
            Params[4] = new SqlParameter("@Task", Task);
            Params[5] = new SqlParameter("@Description", Description);
            Params[6] = new SqlParameter("@UploadFile", UploadFile);
            Params[7] = new SqlParameter("@FType", FType);
            Params[8] = new SqlParameter("@FSize", FSize);
            Params[9] = new SqlParameter("@TodayDate", TodayDate);
            Params[10] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExcuteQryProc("Insert_Files", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Files(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Files",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_File(int FID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@FID", FID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_File", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Delete_File(int FID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@FID", FID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_File", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet File_UnKnown(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("File_UnKnown",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet File_Document(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("File_Document",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet File_Application(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("File_Application",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataTable Root_Bind(string CompanyCode)
    {
        DataTable dt = new DataTable();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            dt = obj.ExecuteSelectDataTable("Root_Bind",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return dt;
    }

    public int NodeCount()
    {
        int strres = 0;
        try
        {
            
            
            strres = Convert.ToInt32(obj.ExecuteScalarint("NodeCount"));
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataTable Node_Bind(int mid,string CompanyCode)
    {
        DataTable dt = new DataTable();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@mid", mid);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            dt = obj.ExecuteSelectDataTable_Without("Node_Bind", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return dt;
    }

    public DataSet Bind_MFolder(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_MFolder",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_MFolder(string MFName, string Description,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@MFName", MFName);
            Params[1] = new SqlParameter("@Description", Description);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_MFolder", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_SFolder(int mid, string SFName, string Description,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@mid", mid);
            Params[1] = new SqlParameter("@SFName", SFName);
            Params[2] = new SqlParameter("@Description", Description);
            Params[3] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_SFolder", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_Roles()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_Roles");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_UserAdmin(string LoginName, string UserType, string UserRole, string Password, string ConfirmPassword, string Namee, string Company, string Department, string Email, string Signature, int EmailNotification,string CompanyCode,string Logo)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[13];
            Params[0] = new SqlParameter("@LoginName", LoginName);
            Params[1] = new SqlParameter("@UserType", UserType);
            Params[2] = new SqlParameter("@UserRole", UserRole);
            Params[3] = new SqlParameter("@Password", Password);
            Params[4] = new SqlParameter("@ConfirmPassword", ConfirmPassword);
            Params[5] = new SqlParameter("@Namee", Namee);
            Params[6] = new SqlParameter("@Company", Company);
            Params[7] = new SqlParameter("@Department", Department);
            Params[8] = new SqlParameter("@Email", Email);
            Params[9] = new SqlParameter("@Signature", Signature);
            Params[10] = new SqlParameter("@EmailNotification", EmailNotification);
            Params[11] = new SqlParameter("@CompanyCode", CompanyCode);
            Params[12] = new SqlParameter("@Logo", Logo);
            strres = obj.ExecuteNonQuery("Insert_UserAdmin", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_UserAdmin(int UID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@UID", UID);
            strres = obj.ExecuteNonQuery("Delete_UserAdmin", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_logdata(string userid, string IpAddr, DateTime loginTime, DateTime logoutTime,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@userid", userid);
            Params[1] = new SqlParameter("@IpAddr", IpAddr);
            Params[2] = new SqlParameter("@loginTime", loginTime);
            Params[3] = new SqlParameter("@logoutTime",SqlDbType.DateTime,30,"logoutTime");
            if (logoutTime.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[3].Value = DBNull.Value;
            }
            else
            {
                Params[3].Value = logoutTime;
            }
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_logdata", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_logdata(int id, DateTime logoutTime)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@id", id);
            Params[1] = new SqlParameter("@logoutTime", logoutTime);
            strres = obj.ExecuteNonQuery("Edit_logdata", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_maxlogid()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_maxlogid");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_user(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_user", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_User_Letter(string letter,string CompanyCode)
    {
        DataSet ds=new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@letter", letter);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_User_Letter", Params);
        }
        catch(Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_user_date(DateTime startdate, DateTime enddate,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@startdate", startdate);
            Params[1] = new SqlParameter("@enddate", enddate);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_user_date", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_User(int UID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@UID", UID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_User", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_UserAdmin(string LoginName, string UserType, string UserRole, string Namee, string Company, string Department, string Email, string Signature, int EmailNotification, int UID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[10];
            Params[0] = new SqlParameter("@LoginName", LoginName);
            Params[1] = new SqlParameter("@UserType", UserType);
            Params[2] = new SqlParameter("@UserRole", UserRole);
            Params[3] = new SqlParameter("@Namee", Namee);
            Params[4] = new SqlParameter("@Company", Company);
            Params[5] = new SqlParameter("@Department", Department);
            Params[6] = new SqlParameter("@Email", Email);
            Params[7] = new SqlParameter("@Signature", Signature);
            Params[8] = new SqlParameter("@EmailNotification", EmailNotification);
            Params[9] = new SqlParameter("@UID", UID);
            strres = obj.ExecuteNonQuery("Edit_User", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Pwd_Change(int UID, string Password, string ConfirmPassword)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@UID", UID);
            Params[1] = new SqlParameter("@Password", Password);
            Params[2] = new SqlParameter("@ConfirmPassword", ConfirmPassword);
            strres = obj.ExecuteNonQuery("Pwd_Change", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_UserPermission(string Module, string Status, int Access, int PView, int PAdd, int PEdit, int PDelete, int UID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[9];
            Params[0] = new SqlParameter("@Module", Module);
            Params[1] = new SqlParameter("@Status", Status);
            Params[2] = new SqlParameter("@Access", Access);
            Params[3] = new SqlParameter("@PView", PView);
            Params[4] = new SqlParameter("@PAdd", PAdd);
            Params[5] = new SqlParameter("@PEdit", PEdit);
            Params[6] = new SqlParameter("@PDelete", PDelete);
            Params[7] = new SqlParameter("@UID", UID);
            Params[8] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_UserPermissions", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Modules()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Modules");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Permissions()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Permissions");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Delete_Permission(int PID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@PID", PID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExcuteQryProc("Delete_Permission", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Permissions_UID(int UID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@UID", UID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Permission_UID", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Links(string LinkName, string Category, string Project, string Task, string Description, string LinkURL,DateTime TodayDate,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[8];
            Params[0] = new SqlParameter("@LinkName", LinkName);
            Params[1] = new SqlParameter("@Category", Category);
            Params[2] = new SqlParameter("@Project", Project);
            Params[3] = new SqlParameter("@Task", Task);
            Params[4] = new SqlParameter("@Description", Description);
            Params[5] = new SqlParameter("@LinkURL", LinkURL);
            Params[6] = new SqlParameter("@TodayDate", TodayDate);
            Params[7] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Links", Params).ToString();
        }
        catch(Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Links(string LinkName, string Category, string Project, string Task, string Description, string LinkURL,int LID,DateTime TodayDate,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[9];
            Params[0] = new SqlParameter("@LinkName", LinkName);
            Params[1] = new SqlParameter("@Category", Category);
            Params[2] = new SqlParameter("@Project", Project);
            Params[3] = new SqlParameter("@Task", Task);
            Params[4] = new SqlParameter("@Description", Description);
            Params[5] = new SqlParameter("@LinkURL", LinkURL);
            Params[6] = new SqlParameter("@LID", LID);
            Params[7] = new SqlParameter("@TodayDate", TodayDate);
            Params[8] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Links", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Links(int LID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@LID", LID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Link", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Links(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Links",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Links_unknown(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Links_unknown",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Links_document(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Links_document",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Links_application(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Links_application",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Link(int LID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@LID", LID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Link", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_History(string userid, DateTime loginTime, string Opeartion1,string module,string Namee,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[6];
            Params[0] = new SqlParameter("@userid", userid);
            Params[1] = new SqlParameter("@loginTime", loginTime);
            Params[2] = new SqlParameter("@Opeartion1", Opeartion1);
            Params[3] = new SqlParameter("@module", module);
            Params[4] = new SqlParameter("@Namee", Namee);
            Params[5] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_History", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_History(string CompanyCode)
    {
        DataSet ds=new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_History",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_history_add(string Company, string Description,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@Company", Company);
            Params[1] = new SqlParameter("@Description", Description);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_history_add", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_history_add(int HAID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@HAID", HAID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_history_add", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_History_Module(string Module,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@Module", Module);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_History_Module", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Resource(int ResID, string ResName, string Type, string MaxAlloc, string Notes,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[6];
            Params[0] = new SqlParameter("@ResourceID", ResID);
            Params[1] = new SqlParameter("@ResourceName", ResName);
            Params[2] = new SqlParameter("@ResourceType", Type);
            Params[3] = new SqlParameter("@MaxAllocPer", MaxAlloc);
            Params[4] = new SqlParameter("@Notes", Notes);
            Params[5] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Resource", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Resource(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Resource",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Resource(int RID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@RID", RID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Resource", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_Resource(int ResID, string ResName, string Type, string MaxAlloc, string Notes,int RID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[7];
            Params[0] = new SqlParameter("@ResourceID", ResID);
            Params[1] = new SqlParameter("@ResourceName", ResName);
            Params[2] = new SqlParameter("@ResourceType", Type);
            Params[3] = new SqlParameter("@MaxAllocPer", MaxAlloc);
            Params[4] = new SqlParameter("@Notes", Notes);
            Params[5] = new SqlParameter("@RID", RID);
            Params[6] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Resource", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Resource(int RID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@RID", RID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Resource", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Resource_All(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Resource_All",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Resource_Equipment(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Resource_Equipment",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Resource_Tool(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Resource_Tool",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Resource_Venue(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Resource_Venue",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Links_PName(string ProjectName,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@ProjectName", ProjectName);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Links_PName", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_PM_Events(string EventTitle, string EventType, string Project, DateTime StartDate, DateTime EndDate, string Recurs, string StartTime, string StartType, string EndTime, string EndType, int MailAttendees,string Description,int PrivateEntry,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[14];
            Params[0] = new SqlParameter("@EventTitle", EventTitle);
            Params[1] = new SqlParameter("@EventType", EventType);
            Params[2] = new SqlParameter("@Project", Project);
            Params[3] = new SqlParameter("@StartDate",SqlDbType.DateTime,30,"StartDate");
            if (StartDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[3].Value = DBNull.Value;
            }
            else
            {
                Params[3].Value = StartDate;
            }
            Params[4] = new SqlParameter("@EndDate",SqlDbType.DateTime,30,"EndDate");
            if (EndDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[4].Value = DBNull.Value;
            }
            else
            {
                Params[4].Value = EndDate;
            }
            Params[5] = new SqlParameter("@Recurs", Recurs);
            Params[6] = new SqlParameter("@StartTime", StartTime);
            Params[7] = new SqlParameter("@StartType", StartType);
            Params[8] = new SqlParameter("@EndTime", EndTime);
            Params[9] = new SqlParameter("@EndType", EndType);
            Params[10] = new SqlParameter("@MailAttendees", MailAttendees);
            Params[11] = new SqlParameter("@Description", Description);
            Params[12] = new SqlParameter("@PrivateEntry", PrivateEntry);
            Params[13] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_PM_Events", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_PM_Events(string EventTitle, string EventType, string Project, DateTime StartDate, DateTime EndDate, string Recurs, string StartTime, string StartType, string EndTime, string EndType, int MailAttendees, int EID, string Description, int PrivateEntry,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[15];
            Params[0] = new SqlParameter("@EventTitle", EventTitle);
            Params[1] = new SqlParameter("@EventType", EventType);
            Params[2] = new SqlParameter("@Project", Project);
            Params[3] = new SqlParameter("@StartDate", SqlDbType.DateTime, 30, "StartDate");
            if (StartDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[3].Value = DBNull.Value;
            }
            else
            {
                Params[3].Value = StartDate;
            }
            Params[4] = new SqlParameter("@EndDate", SqlDbType.DateTime, 30, "EndDate");
            if (EndDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[4].Value = DBNull.Value;
            }
            else
            {
                Params[4].Value = EndDate;
            }
            Params[5] = new SqlParameter("@Recurs", Recurs);
            Params[6] = new SqlParameter("@StartTime", StartTime);
            Params[7] = new SqlParameter("@StartType", StartType);
            Params[8] = new SqlParameter("@EndTime", EndTime);
            Params[9] = new SqlParameter("@EndType", EndType);
            Params[10] = new SqlParameter("@MailAttendees", MailAttendees);
            Params[11] = new SqlParameter("@EID", EID);
            Params[12] = new SqlParameter("@Description", Description);
            Params[13] = new SqlParameter("@PrivateEntry", PrivateEntry);
            Params[14] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_PM_Events", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_PM_Events(int EID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@EID", EID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_PM_Events", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Events_Attendees(int EID, string Attendees,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@EID", EID);
            Params[1] = new SqlParameter("@Attendees", Attendees);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Events_Attendees", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Events_Attendees(int EID, string Attendees,int EAID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@EID", EID);
            Params[1] = new SqlParameter("@Attendees", Attendees);
            Params[2] = new SqlParameter("@EAID", EAID);
            strres = obj.ExecuteNonQuery("Edit_Events_Attendees", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Events_Attendees(int EID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@EID", EID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Events_Attendees", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet UserNames(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("UserNames",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string MaxEventID()
    {
        string strres=string.Empty;
        try
        {
            strres = obj.ExecuteScalar("MaxEventID");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Events_Month(int month,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@month", month);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Events_Month", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Events(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Events",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Events(int EID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@EID", EID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Events", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Events_Attendees(int EID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@EID", EID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Events_Attendees", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet company_search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("company_search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet company_search_type(string type,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@type", type);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("company_search_type", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet company_search_name(string name,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@name", name);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("company_search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet projects_search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("projects_search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet projects_search_type(string type,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@type", type);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("projects_search_type", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet projects_search_name(string name,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@name", name);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("projects_search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet contacts_search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("contacts_search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet contacts_search_name(string name,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@name", name);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("contacts_search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Department_Search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Department_Search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Department_Search_name(int CID,int DID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@CompanyID", CID);
            Params[1] = new SqlParameter("@DID", DID);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Department_Search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet events_search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("events_search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet tickets_search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("tickets_search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet tickets_search_name(string name,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@name", name);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("tickets_search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet users_search(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("users_search",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet users_search_name(string name,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@name", name);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("users_search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Userpreferences(string Locale, string TabbedBoxView, string ShortDateFormat, string Timeformat, string CurrencyFormat, string UserInterfaceStyle, string UserTaskAssignment, string DefaultEventFilter, string TaskNotificationMethod, string EmailAssignees, string EmailTaskContacts, string EmailProjectContacts, string EmailSubject, string EmailRecordingMethod)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[14];
            Params[0] = new SqlParameter("@Locale", Locale);
            Params[1] = new SqlParameter("@TabbedBoxView", TabbedBoxView);
            Params[2] = new SqlParameter("@ShortDateFormat", ShortDateFormat);
            Params[3] = new SqlParameter("@Timeformat", Timeformat);
            Params[4] = new SqlParameter("@CurrencyFormat", CurrencyFormat);
            Params[5] = new SqlParameter("@UserInterfaceStyle", UserInterfaceStyle);
            Params[6] = new SqlParameter("@UserTaskAssignment", UserTaskAssignment);
            Params[7] = new SqlParameter("@DefaultEventFilter", DefaultEventFilter);
            Params[8] = new SqlParameter("@TaskNotificationMethod", TaskNotificationMethod);
            Params[9] = new SqlParameter("@EmailAssignees", EmailAssignees);
            Params[10] = new SqlParameter("@EmailTaskContacts", EmailTaskContacts);
            Params[11] = new SqlParameter("@EmailProjectContacts", EmailProjectContacts);
            Params[12] = new SqlParameter("@EmailSubject", EmailSubject);
            Params[13] = new SqlParameter("@EmailRecordingMethod", EmailRecordingMethod);
            strres = obj.ExcuteQryProc("Insert_Userpreferences", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Userpreferences(string Locale, string TabbedBoxView, string ShortDateFormat, string Timeformat, string CurrencyFormat, string UserInterfaceStyle, string UserTaskAssignment, string DefaultEventFilter, string TaskNotificationMethod, string EmailAssignees, string EmailTaskContacts, string EmailProjectContacts, string EmailSubject, string EmailRecordingMethod,int UPID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[15];
            Params[0] = new SqlParameter("@Locale", Locale);
            Params[1] = new SqlParameter("@TabbedBoxView", TabbedBoxView);
            Params[2] = new SqlParameter("@ShortDateFormat", ShortDateFormat);
            Params[3] = new SqlParameter("@Timeformat", Timeformat);
            Params[4] = new SqlParameter("@CurrencyFormat", CurrencyFormat);
            Params[5] = new SqlParameter("@UserInterfaceStyle", UserInterfaceStyle);
            Params[6] = new SqlParameter("@UserTaskAssignment", UserTaskAssignment);
            Params[7] = new SqlParameter("@DefaultEventFilter", DefaultEventFilter);
            Params[8] = new SqlParameter("@TaskNotificationMethod", TaskNotificationMethod);
            Params[9] = new SqlParameter("@EmailAssignees", EmailAssignees);
            Params[10] = new SqlParameter("@EmailTaskContacts", EmailTaskContacts);
            Params[11] = new SqlParameter("@EmailProjectContacts", EmailProjectContacts);
            Params[12] = new SqlParameter("@EmailSubject", EmailSubject);
            Params[13] = new SqlParameter("@EmailRecordingMethod", EmailRecordingMethod);
            Params[14] = new SqlParameter("@UPID", UPID);
            strres = obj.ExcuteQryProc("Edit_Userpreferences", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_Userpreferences()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_Userpreferences");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_BillingCodes(string BillingCode, string BValue, string Description,string CompanyName)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[4];
            Params[0] = new SqlParameter("@BillingCode", BillingCode);
            Params[1] = new SqlParameter("@BValue", BValue);
            Params[2] = new SqlParameter("@Description", Description);
            Params[3] = new SqlParameter("@CompanyName", CompanyName);
            strres = obj.ExecuteNonQuery("Insert_BillingCodes", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }


    public string Edit_BillingCodes(string BillingCode, string BValue, string Description,int BCID,string CompanyName)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@BillingCode", BillingCode);
            Params[1] = new SqlParameter("@BValue", BValue);
            Params[2] = new SqlParameter("@Description", Description);
            Params[3] = new SqlParameter("@BCID", BCID);
            Params[4] = new SqlParameter("@CompanyName", CompanyName);
            strres = obj.ExecuteNonQuery("Edit_BillingCodes", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_BillingCodes(int BCID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@BCID", BCID);
            strres = obj.ExecuteNonQuery("Delete_BillingCodes", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_BillingCodes()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Read_BillingCodes");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public Int32 FindMemberRecords(string CompanyCode,string userid,string password)
    {

        string qry = "select count(*) from UserAdmin where CompanyCode = '" + CompanyCode + "' and LoginName='"+userid+"' and Password='"+password+"'";
        int count = 0;
        try
        {
           count = obj.ExecuteScalarint(qry);
        }
        catch(Exception ex)
        {
            ex.ToString();
        }
        return count;
    }

    public DataSet getUserDetails(string CompanyCode,string username)
    {
        DataSet ds = new DataSet();
        string qry = string.Empty;

        try
        {
            qry = "select * from UserAdmin where CompanyCode='" + CompanyCode + "' and LoginName='"+username+"'";
            ds = obj.ExcuteQry(qry);
        }
        catch(Exception ex)
        {
            ex.ToString();
        }
        finally
        {
            ds.Dispose();
        }
        return ds;
    }

    public DataSet Bind_Employees(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Employees",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_Employees_ByID(string uid,string CompanyCode)
    {
        DataSet ds = new DataSet();
        string qry = "select * from UserAdmin where Namee='" + uid + "' and CompanyCode='"+CompanyCode+"'";
        try
        {

            ds = obj.ExcuteQry(qry);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_TimeSheet1(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours1, int BillableHours1, int NonBillableHours1, DateTime Day1, DateTime Day2, DateTime Day3, DateTime Day4, DateTime Day5, DateTime Day6, DateTime Day7, int Day1Work, int Day2Work, int Day3Work, int Day4Work, int Day5Work, int Day6Work, int Day7Work,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[21];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
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
            Params[20] = new SqlParameter("@CompanyCode", CompanyCode);

            strres = obj.ExecuteNonQuery("Insert_TimeSheet1", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet2(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours2, int BillableHours2, int NonBillableHours2, DateTime Day8, DateTime Day9, DateTime Day10, DateTime Day11, DateTime Day12, DateTime Day13, DateTime Day14, int Day8Work, int Day9Work, int Day10Work, int Day11Work, int Day12Work, int Day13Work, int Day14Work,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[21];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@EmployeeType", EmployeeType);
            Params[3] = new SqlParameter("@TotalHours2", TotalHours2);
            Params[4] = new SqlParameter("@BillableHours2", BillableHours2);
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
            Params[20] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_TimeSheet2", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet3(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours3, int BillableHours3, int NonBillableHours3, DateTime Day15, DateTime Day16, DateTime Day17, DateTime Day18, DateTime Day19, DateTime Day20, DateTime Day21, int Day15Work, int Day16Work, int Day17Work, int Day18Work, int Day19Work, int Day20Work, int Day21Work,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[21];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
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
            Params[20] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_TimeSheet3", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_TimeSheet4(int EmployeeID, int ProjectID, string EmployeeType, int TotalHours4, int BillableHours4, int NonBillableHours4, DateTime Day22, DateTime Day23, DateTime Day24, DateTime Day25, DateTime Day26, DateTime Day27, DateTime Day28, int Day22Work, int Day23Work, int Day24Work, int Day25Work, int Day26Work, int Day27Work, int Day28Work,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[21];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
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
            Params[20] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_TimeSheet4", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_TimeSheet1(int EmployeeID, int ProjectID, int CYear, int CMonth,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_TimeSheet1", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_TimeSheet2(int EmployeeID, int ProjectID, int CYear, int CMonth,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_TimeSheet2", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_TimeSheet3(int EmployeeID, int ProjectID, int CYear, int CMonth,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_TimeSheet3", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_TimeSheet4(int EmployeeID, int ProjectID, int CYear, int CMonth,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_TimeSheet4", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_AllDays(int @EmployeeID, int @ProjectID, int @CYear, int @CMonth,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@EmpID", EmployeeID);
            Params[1] = new SqlParameter("@ProjectID", ProjectID);
            Params[2] = new SqlParameter("@CYear", CYear);
            Params[3] = new SqlParameter("@CMonth", CMonth);
            Params[4] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_AllDays", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Tasks_New(string Company, string Project, string TaskBy, string TaskName, string TaskDescription, DateTime Date, string StartTime, string st1, string EndTime, string st2, int notify,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[12];
            Params[0] = new SqlParameter("@Company", Company);
            Params[1] = new SqlParameter("@Project", Project);
            Params[2] = new SqlParameter("@TaskBy", TaskBy);
            Params[3] = new SqlParameter("@TaskName", TaskName);
            Params[4] = new SqlParameter("@TaskDescription", TaskDescription);
            Params[5] = new SqlParameter("@Date", Date);
            Params[6] = new SqlParameter("@StartTime", StartTime);
            Params[7] = new SqlParameter("@st1", st1);
            Params[8] = new SqlParameter("@EndTime", EndTime);
            Params[9] = new SqlParameter("@st2", st2);
            Params[10] = new SqlParameter("@notify", notify);
            Params[11] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Tasks_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Tasks_New(string Company, string Project, string TaskBy, string TaskName, string TaskDescription, DateTime Date, string StartTime, string st1, string EndTime, string st2, int notify,int TKID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[13];
            Params[0] = new SqlParameter("@Company", Company);
            Params[1] = new SqlParameter("@Project", Project);
            Params[2] = new SqlParameter("@TaskBy", TaskBy);
            Params[3] = new SqlParameter("@TaskName", TaskName);
            Params[4] = new SqlParameter("@TaskDescription", TaskDescription);
            Params[5] = new SqlParameter("@Date", Date);
            Params[6] = new SqlParameter("@StartTime", StartTime);
            Params[7] = new SqlParameter("@st1", st1);
            Params[8] = new SqlParameter("@EndTime", EndTime);
            Params[9] = new SqlParameter("@st2", st2);
            Params[10] = new SqlParameter("@notify", notify);
            Params[11] = new SqlParameter("@TKID", TKID);
            Params[12] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Edit_Tasks_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Tasks_New(int TKID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TKID", TKID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Tasks_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Tasks_New_HR(int TKID, string AssignedToTask,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@TKID", TKID);
            Params[1] = new SqlParameter("@AssignedToTask", AssignedToTask);
            Params[2] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Insert_Tasks_New_HR", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Tasks_New_HR(int TKID, string AssignedToTask)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TKID", TKID);
            Params[1] = new SqlParameter("@AssignedToTask", AssignedToTask);
            strres = obj.ExecuteNonQuery("Edit_Tasks_New_HR", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Tasks_New_HR(int THID,string CompanyCode)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TKID", THID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            strres = obj.ExecuteNonQuery("Delete_Tasks_New_HR", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Tasks_MaxID(string CompanyCode)
    {
        string TMID = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            TMID = obj.ExecuteScalar("Tasks_MaxID",Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return TMID;
    }

    public DataSet Bind_Tasks_New(string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Bind_Tasks_New",Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Tasks_New(int TKID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TKID", TKID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Tasks_New", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Read_Tasks_New_HR(int TKID,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@TKID", TKID);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("Read_Tasks_New_HR", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet tasks_search_name(string company,string CompanyCode)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@Company", company);
            Params[1] = new SqlParameter("@CompanyCode", CompanyCode);
            ds = obj.ExcuteQryProc("tasks_search_name", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_Roles_New(string RoleName, string Description)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@RoleName", RoleName);
            Params[1] = new SqlParameter("@Description", Description);
            strres = obj.ExecuteNonQuery("Insert_Roles_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Roles_New(string RoleName, string Description,int ROID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@RoleName", RoleName);
            Params[1] = new SqlParameter("@Description", Description);
            Params[2] = new SqlParameter("@ROID", ROID);
            strres = obj.ExecuteNonQuery("Edit_Roles_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Roles_New(int ROID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@ROID", ROID);
            strres = obj.ExecuteNonQuery("Delete_Roles_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Roles_New()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_Roles_New");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet Bind_SysAdmin_Modules()
    {
        DataSet ds = new DataSet();
        try
        {
            ds = obj.ExcuteQry("Bind_SysAdmin_Modules");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_SysAdmin_Modules(int ID, string Status,string MenuStatus)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@ID", ID);
            Params[1] = new SqlParameter("@Status", Status);
            Params[2] = new SqlParameter("@MenuStatus", MenuStatus);
            strres = obj.ExecuteNonQuery("Edit_SysAdmin_Modules", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Read_UserType(int UID)
    {
        DataSet ds = new DataSet();
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@UID", UID);
            ds = obj.ExcuteQryProc("Read_UserType", Params);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Insert_CustomerInfo(string CompanyCode, string CompanyName, string Address1, string Address2, string City, string State, string Country, string Zip, string Website, string Logo, string ContactName, string ContactNo, string EmailID, string UserID, string Password,string ConfirmPassword)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[16];
            Params[0] = new SqlParameter("@CompanyCode", CompanyCode);
            Params[1] = new SqlParameter("@CompanyName", CompanyName);
            Params[2] = new SqlParameter("@Address1", Address1);
            Params[3] = new SqlParameter("@Address2", Address2);
            Params[4] = new SqlParameter("@City", City);
            Params[5] = new SqlParameter("@State", State);
            Params[6] = new SqlParameter("@Country", Country);
            Params[7] = new SqlParameter("@Zip", Zip);
            Params[8] = new SqlParameter("@Website", Website);
            Params[9] = new SqlParameter("@Logo", Logo);
            Params[10] = new SqlParameter("@ContactName", ContactName);
            Params[11] = new SqlParameter("@ContactNo", ContactNo);
            Params[12] = new SqlParameter("@EmailID", EmailID);
            Params[13] = new SqlParameter("@UserID", UserID);
            Params[14] = new SqlParameter("@Password", Password);
            Params[15] = new SqlParameter("@ConfirmPassword", ConfirmPassword);
            strres = obj.ExecuteNonQuery("Insert_CustomerInfo", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Department_New(string DeptName, string Description)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@DeptName", DeptName);
            Params[1] = new SqlParameter("@Description", Description);
            strres = obj.ExecuteNonQuery("Insert_Department_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Department_New(int DID, string DeptName, string Description)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@DID", DID);
            Params[1] = new SqlParameter("@DeptName", DeptName);
            Params[2] = new SqlParameter("@Description", Description);
            strres = obj.ExecuteNonQuery("Edit_Department_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Department_New(int DID)
    {
        string strres = string.Empty;
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@DID", DID);
            strres = obj.ExecuteNonQuery("Delete_Department_New", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet Bind_Department_New()
    {
        DataSet ds = new DataSet();
        try
        {
            ds=obj.ExcuteQry("Bind_Department_New");
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }


}
