using System;
using System.Data;
using System.Data.SqlClient;
using igiit.DALC;
namespace igiit.Includes
{
	/// <summary>
	/// Summary description for MessengerClass.
	/// </summary>
	public class MessengerClass
	{
		
		
		public MessengerClass()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		            public static DataSet GetBuddyList(string strUserId)
		{
			DataSet dsUsers = new DataSet(); 
			DataAccess csDataAccess=new DataAccess();
			SqlParameter[] colParams = new SqlParameter[1];
			colParams[0]= new SqlParameter("@UserId",strUserId);
			try
			{
				dsUsers = csDataAccess.ExecuteSQL("GetContactUsers_Messenger",colParams);
                //dsUsers = csDataAccess.ExecuteSQL("tblBuddyList", colParams);
			}
			catch(Exception)
			{
				colParams=null;
				
			}
			return dsUsers;
		}

		public static int SetStatus(string strUserId,bool blnlog)
		{
			DataSet dsUsers = new DataSet(); 
			DataAccess csDataAccess=new DataAccess();
			SqlParameter[] colParams = new SqlParameter[2];
			colParams[0]= new SqlParameter("@UserId",strUserId);
			colParams[1]= new SqlParameter("@IsOnline",blnlog);
			try
			{
				return csDataAccess.ExecuteNonQuery("SetStatus_Messenger",colParams);
			}
			catch(Exception)
			{
				colParams=null;
				return 0;
			}
			
		}

	}
}
