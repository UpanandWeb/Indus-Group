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
/// Summary description for Binddata
/// </summary>
public class Binddata
{
    public DataAccess obj = new DataAccess();
	public Binddata()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //public DataSet cg_jobpost(string sid)
    //{
    //    string qry = "select rowid,jobtitle,jobdesc,Location,Min_Exp,Max_Exp,pdate from cg_jobpost where rowid like '" + sid + "%'";
    //    DataSet ds = new DataSet();
    //    ds = obj.ExcuteQry(qry);
    //    return ds;

    //}
    /// <summary>
    /// summary description of dataset to fill job post data and return it through sid.
    /// </summary>
    /// <param name="sid"></param>
    /// <returns></returns>
    public DataSet cg_jobpost(string sid)
    {
        //string qry = "select rowid,jobid,jobtitle,jobdesc,Location,Min_Exp,Max_Exp,convert(varchar(12),pdate,109) pdate from cg_jobpost where rowid like '" + sid + "%'";
      string qry = "select rowid,jobtitle,Location,Min_Exp,Max_Exp,convert(varchar(12),pdate,109) pdate from cg_jobpost where rowid like '" + sid + "%'";
      DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;

    }
    /// <summary>
    /// summary description of dataset to fill and get employee ID data and return it through sid.
    /// </summary>
    /// <returns></returns>
    public DataSet Get_Empid()
    {
        string qry = "select empid from employeereg1";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }
    /// <summary>
    /// summary description of dataset to fill and get career job details data and return it.
    /// </summary>
    
    public DataSet GetCurr_Openings()
    {
        string qry = "select * from careersnew order by PostedDate desc";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }
    /// <summary>
    /// summary description of dataset to fill and get career job details data and return it.
    /// </summary>
    /// <param name="jid"></param>
    /// <returns></returns>
    public DataSet GetJobDetails(string jid)
    { 
        //string qry="select jobid,jobtitle,Location from cg_jobpost where rowid = '"+ jid +"'";
        string qry = "select jobtitle,Location from cg_jobpost where rowid = '" + jid + "'";

        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;

    }
    /// <summary>
    /// summary description of dataset to fill and get career job details data and return it.
    /// </summary>
    /// <param name="jid"></param>
    /// <returns></returns>
    public DataSet GetJobidDet(string jid)
    {
        string qry = "select jobid,jobtitle,Location from cg_jobpost where rowid= '" +jid +"'";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }
    public DataSet GetJSDet(string id)
    {
        string qry = "select * from JDT_PersonalInfo1 where id = '" + id + "'";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }

    public DataSet GetJSEdu(string id)
    {
        string qry = "select * from JDT_Education1 where id = '" + id + "'";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }

    public DataSet GetJSWork(string id)
    {
        string qry = "select * from JDT_WorkExp1 where id = '" + id + "'";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }
    public DataSet BindFeedback_Det()
    {
        string qry = "select id,email=stuff(email,3,5,'*****'),phno,comment,postdate,status,name,nickname,country,address from feedbackform where (status=1 or status=0) order By id desc";
        DataSet ds = new DataSet();
        ds = obj.ExcuteQry(qry);
        return ds;
    }
    public Int32 CheckUserName(int Uid, string Aid, int Sid)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connection.Open();
        SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg1 where userid= " + Uid + "  and  Activeid = '" + Aid + "' and status =" + Sid + "", connection);              
        Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
        connection.Close();
        return count;       
    }
}








