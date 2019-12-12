using System;
using System.Data;
using System.Data.SqlClient;
using igiit.DALC;
namespace igiit.Includes
{
	/// <summary>
	/// Summary description for Favorities.
	/// </summary>
	public class Favorities
	{
		protected DataAccess csDataAccess=new DataAccess();
		#region "MyVariables and Properties"
		private string strClientId=string.Empty;
		public string _ClientId
		{
			get
			{
				return strClientId;
			}
			set 
			{
				strClientId=value;
			}
		}

		private string strUserId=string.Empty;
		public string _UserId
		{
			get
			{
				return strUserId;
			}
			set 
			{
				strUserId=value;
			}
		}

		#endregion


		public string InsertFavorities()
		{
			string strResult=string.Empty;
			try
			{
				SqlParameter[] colParams = new SqlParameter[2];
				colParams[0]= new SqlParameter("@UserId",strUserId);
				colParams[1]= new SqlParameter("@ClientId",strClientId);
                strResult=csDataAccess.ExecuteNonQuery("Insert_Favorities",colParams).ToString();

			}
			catch
			{
			}
				return strResult;
		}
		


		public DataSet GetFavorities()
		{
			DataSet dsDetails=new DataSet(); 
			try
			{
				SqlParameter[] colParams = new SqlParameter[1];
				colParams[0]= new SqlParameter("@UserId",strUserId);
				dsDetails=csDataAccess.ExecuteSQL("View_Favorities",colParams);

			}
			catch
			{
			}
			return dsDetails;
		}
	}
}
