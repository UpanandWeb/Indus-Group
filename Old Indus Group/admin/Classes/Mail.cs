using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using igiit.DALC;
namespace igiit.Includes
{
	/// <summary>
	/// Summary description for Mail.
	/// </summary>
	public class Mail
	{
		public DataAccess csDataAccess=new DataAccess();
		protected DataSet dsInboxDetails=new DataSet(); 
		protected StringBuilder sbQuery=new StringBuilder();
        protected StringBuilder tdstr = new StringBuilder();
        protected StringBuilder tdmlstr = new StringBuilder();
 
		#region "MyVariables and Properties"
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


		private string strMailId=string.Empty;
		public string _MailId
		{
			get
			{
				return strMailId;
			}
			set 
			{
				strMailId=value;
			}
		}

		private string strMailToId=string.Empty;
		public string _MailToId
		{
			get
			{
				return strMailToId;
			}
			set 
			{
				strMailToId=value;
			}
		}

		private string strMailFromId=string.Empty;
		public string _MailFromId
		{
			get
			{
				return strMailFromId;
			}
			set 
			{
				strMailFromId=value;
			}
		}

		private string strSubject=string.Empty;
		public string _Subject
		{
			get
			{
				return strSubject;
			}
			set 
			{
				strSubject=value;
			}
		}


		private string strMessage=string.Empty;
		public string _Message
		{
			get
			{
				return strMessage;
			}
			set 
			{
				strMessage=value;
			}
		}

		#endregion

		public DataSet GetInboxDetails()
		{
			try
			{
				sbQuery.Append("select  intMailId as MailId,txtFName as FromId,Subject,Message,intRead,Convert(varchar(11),MailDate,103) as MailDate from tbl_Mail_info ");
				sbQuery.Append(" Inner Join tbl_User_info on intUser_Id=intFromId where intUserId=" + strUserId);
				dsInboxDetails=csDataAccess.ExecuteSQL(sbQuery.ToString());
			}
			catch
			{
			}
			return dsInboxDetails; 
		}


		public string InsertMailDetails()
		{
            DataSet tdres = new DataSet();
            //DataSet tdresml = new DataSet();
            string tdresml = string.Empty;
            string strResult=string.Empty;
            int toid = 0;
            int mlid = 0;
            string strid = string.Empty;
            string strmid = string.Empty;
            tdmlstr = new StringBuilder();
            tdstr = new StringBuilder();
			sbQuery=new StringBuilder();


            //tdres = csDataAccess.ExecuteScalar("select Count(*) From tbl_user_info where txtEmail='" + strMailToId + "'"); 
            tdstr.Append("select intUser_Id as Toid from tbl_User_info where txtEmail='" + strMailToId + "'");
            tdres = csDataAccess.ExecuteSQL(tdstr.ToString());

            tdmlstr.Append("select Max(intMailId) as mlid from tbl_Mail_info");
            tdresml = csDataAccess.ExecuteScalar(tdmlstr.ToString()).ToString();

            
             if (tdres.Tables[0] != null)
                {
                    if (tdres.Tables[0].Rows.Count > 0)
                    {
                        strid = (tdres.Tables[0].Rows[0]["Toid"]).ToString();
                        
                    }
                    toid = Int32.Parse(strid);
                    mlid = Int32.Parse(tdresml) + 1;
                try
                {
                    // sbQuery.Append("Declare @Toid INT ");
                    // sbQuery.Append("if exists(select intUser_Id from tbl_User_info where txtEmail='" + strMailToId + "') ");
                    // sbQuery.Append("Begin ");
                    // sbQuery.Append("Set @Toid=(select intUser_Id from tbl_User_info where txtEmail='" + strMailToId + "') ");
                    // sbQuery.Append("Insert into tbl_Mail_info(intUserId,intFromId,Subject,Message,intRead,Maildate) ");
                    // sbQuery.Append("values( @Toid," + strMailFromId + ",'" + strSubject + "','" + strMessage + "',0,'" + DateTime.Today.ToShortDateString() + "')");
                    // sbQuery.Append("End ");
                    // sbQuery.Append("else ");
                    // sbQuery.Append("Begin ");
                    // sbQuery.Append("Select 0 ");
                    // sbQuery.Append("End");
                    // strResult=csDataAccess.ExecuteNonQuery(sbQuery.ToString()).ToString();
                    //// strResult = csDataAccess.ExecuteScalar(sbQuery.ToString()).ToString();

                    sbQuery.Append("Insert into tbl_Mail_info(intMailId,intUserId,intFromId,Subject,Message,intRead,Maildate) ");
                    sbQuery.Append("values( " + mlid + ", " + toid + "," + strMailFromId + ",'" + strSubject + "','" + strMessage + "',0,'" + DateTime.Today.ToShortDateString() + "')");
                    // sbQuery.Append("End ");
                    // sbQuery.Append("else ");
                    // sbQuery.Append("Begin ");
                    // sbQuery.Append("Select 0 ");
                    // sbQuery.Append("End");
                    strResult = csDataAccess.ExecuteNonQuery(sbQuery.ToString()).ToString();
                    //strResult = csDataAccess.ExecuteScalar(sbQuery.ToString()).ToString();

                }
                catch
                {

                }
            }
			return strResult;
		}

        private string max(object p)
        {
            throw new Exception("The method or operation is not implemented.");
        }



		public DataSet GetMailDetails()
		{
			sbQuery=new StringBuilder(); 
			try
			{
                sbQuery.Append("select intMailId as MailId,a.txtEmail as FromId,b.txtEmail as ToId,Subject,Message,intRead,Convert(varchar(11),MailDate,103) as MailDate from tbl_Mail_info ");
				sbQuery.Append(" Inner Join tbl_User_info a on a.intUser_Id=intFromId Inner jOin tbl_User_info b on b.intUser_Id=intUserId where intUserId=" + strUserId +" and intMailId=" + strMailToId);
				dsInboxDetails=csDataAccess.ExecuteSQL(sbQuery.ToString());
			}
			catch
			{
			}
			return dsInboxDetails; 
		}


		public string FoundMailDetails()
		{
			sbQuery=new StringBuilder();
			string strResult=string.Empty;
			try
			{
				sbQuery.Append("if exists(select txtPwd from tbl_User_info where txtEmail='"+strMailId+"') ");
				sbQuery.Append(" Begin  select txtPwd from tbl_User_info where txtEmail='"+strMailId + "' ");
				sbQuery.Append(" End  else Begin select 0 End ");
				strResult=csDataAccess.ExecuteScalar(sbQuery.ToString()).ToString();
			}
			catch
			{
			}
			return strResult; 
		}


		public string RemoveMailDetails()
		{
			string strResult=string.Empty;
			sbQuery=new StringBuilder(); 
			try
			{
				sbQuery.Append("Delete from tbl_Mail_info where intMailId="+strMailId);
				strResult=csDataAccess.ExecuteNonQuery(sbQuery.ToString()).ToString();
			}
			catch
			{
				
			}
			return strResult;
		}
		
	}
}
