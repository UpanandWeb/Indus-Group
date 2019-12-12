using System;
using System.Data;
using System.Data.SqlClient;
using igiit.DALC;
namespace igiit.Includes
{
	/// <summary>
	/// Summary description for Signin.
	/// </summary>
	public class Signin
	{
		protected DataAccess csDataAccess=new DataAccess();
  
		public DataTable SearchUserMaster(string UserName,string Password)
		{
			DataTable dtRetStatus=new DataTable(); 
			SqlParameter[] colParams = new SqlParameter[2];
			colParams[0]= new SqlParameter("@UserName",UserName);
			colParams[1]= new SqlParameter("@Password",Password);
			
			try
			{
				dtRetStatus=csDataAccess.ExecuteSelectDataTable("usp_user_search",colParams);
			}
			catch(Exception ex)
			{
				colParams=null;
				throw ex;
			}
			return dtRetStatus;
		}

	}
}