using System;
using System.Data;
using System.Data.SqlClient;
using igiit.DALC;
namespace igiit.Includes
{
	/// <summary>
	/// Summary description for SignUp.
	/// </summary>
	public class SignUp
	{
		public DataAccess csDataAccess=new DataAccess();
		DataSet dsCountries = new DataSet(); 
		# region "MyVariables and Properties Registration"
		private string Name=string.Empty;
		public string _Name
		{
			get
			{
				return Name;
			}
			set 
			{
				Name=value;
			}
		}
		private string UName=string.Empty;
		public string _UName
		{
			get
			{
				return UName;
			}
			set 
			{
				UName=value;
			}
		}

		private string DateofBirth=string.Empty;
		public string _DateofBirth
		{
			get
			{
				return DateofBirth;
			}
			set 
			{
				DateofBirth=value;
			}
		}

		private string MartialStatus=string.Empty;
		public string _MartialStatus
		{
			get
			{
				return MartialStatus;
			}
			set 
			{
				MartialStatus=value;
			}
		}

		private string Gender=string.Empty;
		public string _Gender
		{
			get
			{
				return Gender;
			}
			set 
			{
				Gender=value;
			}
		}

		private string HaveChild=string.Empty;
		public string _HaveChild
		{
			get
			{
				return HaveChild;
			}
			set 
			{
				HaveChild=value;
			}
		}

		private string Religion=string.Empty;
		public string _Religion
		{
			get
			{
				return Religion;
			}
			set 
			{
				Religion=value;
			}
		}

		private string CountryLiveIn=string.Empty;
		public string _CountryLiveIn
		{
			get
			{
				return CountryLiveIn;
			}
			set 
			{
				CountryLiveIn=value;
			}
		}
		private string Residentstatus=string.Empty;
		public string _Residentstatus
		{
			get
			{
				return Residentstatus;
			}
			set 
			{
				Residentstatus=value;
			}
		}
		

		
		private string EMail=string.Empty;
		public string _EMail
		{
			get
			{
				return EMail;
			}
			set 
			{
				EMail=value;
			}
		}


		private string Passwd=string.Empty;
		public string _Passwd
		{
			get
			{
				return Passwd;
			}
			set 
			{
				Passwd=value;
			}
		}



		#endregion

		#region "MyVariables and Properties Personnal Details"
		
		private string intHeight_Cms=string.Empty;
		public string _intHeight_Cms
		{
			get
			{
				return intHeight_Cms;
			}
			set 
			{
				intHeight_Cms=value;
			}
		}

		private double flHeight_Cms;
		public double _flHeight_Cms
		{
			get
			{
				return flHeight_Cms;
			}
			set 
			{
				flHeight_Cms=value;
			}
		}

		
		private string intWeight_Kg=string.Empty;
		public string _intWeight_Kg
		{
			get
			{
				return intWeight_Kg;
			}
			set 
			{
				intWeight_Kg=value;
			}
		}

		
		private string strComplexion=string.Empty;
		public string _strComplexion
		{
			get
			{
				return strComplexion;
			}
			set 
			{
				strComplexion=value;
			}
		}
		private string strBodytype=string.Empty;
		public string _strBodytype
		{
			get
			{
				return strBodytype;
			}
			set 
			{
				strBodytype=value;
			}
		}

		
		private string txtPhy_Status=string.Empty;
		public string _txtPhy_Status
		{
			get
			{
				return txtPhy_Status;
			}
			set 
			{
				txtPhy_Status=value;
			}
		}

		
		private string txtBlood_Group=string.Empty;
		public string _txtBlood_Group
		{
			get
			{
				return txtBlood_Group;
			}
			set 
			{
				txtBlood_Group=value;
			}
		}

		
		private string txtEdu_Cat=string.Empty;
		public string _txtEdu_Cat
		{
			get
			{
				return txtEdu_Cat;
			}
			set 
			{
				txtEdu_Cat=value;
			}
		}

		private string Diet=string.Empty;
		public string _Diet
		{
			get
			{
				return Diet;
			}
			set 
			{
				Diet=value;
			}
		}

		private string Smoke=string.Empty;
		public string _Smoke
		{
			get
			{
				return Smoke;
			}
			set 
			{
				Smoke=value;
			}
		}

		private string Drink=string.Empty;
		public string _Drink
		{
			get
			{
				return Drink;
			}
			set 
			{
				Drink=value;
			}
		}
		private string Family=string.Empty;
		public string _Family
		{
			get
			{
				return Family;
			}
			set 
			{
				Family=value;
			}
		}

		private string txtEdu_Detail=string.Empty;
		public string _txtEdu_Detail
		{
			get
			{
				return txtEdu_Detail;
			}
			set 
			{
				txtEdu_Detail=value;
			}
		}

		
		private string txtOcu_Cat=string.Empty;
		public string _txtOcu_Cat
		{
			get
			{
				return txtOcu_Cat;
			}
			set 
			{
				txtOcu_Cat=value;
			}
		}

		
		private string txtOcu_Detail=string.Empty;
		public string _txtOcu_Detail
		{
			get
			{
				return txtOcu_Detail;
			}
			set 
			{
				txtOcu_Detail=value;
			}
		}

		
		private string txtIncome_Major=string.Empty;
		public string _txtIncome_Major
		{
			get
			{
				return txtIncome_Major;
			}
			set 
			{
				txtIncome_Major=value;
			}
		}

		
		private string intIncome_Amt=string.Empty;
		public string _intIncome_Amt
		{
			get
			{
				return intIncome_Amt;
			}
			set 
			{
				intIncome_Amt=value;
			}
		}


		
		private string txtCity=string.Empty;
		public string _txtCity
		{
			get
			{
				return txtCity;
			}
			set 
			{
				txtCity=value;
			}
		}

		
		private string intMt_Id=string.Empty;
		public string _intMt_Id
		{
			get
			{
				return intMt_Id;
			}
			set 
			{
				intMt_Id=value;
			}
		}

		
		private string intCaste_Id=string.Empty;
		public string _intCaste_Id
		{
			get
			{
				return intCaste_Id;
			}
			set 
			{
				intCaste_Id=value;
			}
		}

		
		private string blnCaste_no_Bar=string.Empty;
		public string _blnCaste_no_Bar
		{
			get
			{
				return blnCaste_no_Bar;
			}
			set 
			{
				blnCaste_no_Bar=value;
			}
		}

		
		private string txtSub_Caste=string.Empty;
		public string _txtSub_Caste
		{
			get
			{
				return txtSub_Caste;
			}
			set 
			{
				txtSub_Caste=value;
			}
		}

		
		private string txtGotra=string.Empty;
		public string _txtGotra
		{
			get
			{
				return txtGotra;
			}
			set 
			{
				txtGotra=value;
			}
		}

		
		private string txtStar=string.Empty;
		public string _txtStar
		{
			get
			{
				return txtStar;
			}
			set 
			{
				txtStar=value;
			}
		}

		
		private string txtRasi=string.Empty;
		public string _txtRasi
		{
			get
			{
				return txtRasi;
			}
			set 
			{
				txtRasi=value;
			}
		}

		
		private string txtHoroscope=string.Empty;
		public string _txtHoroscope
		{
			get
			{
				return txtHoroscope;
			}
			set 
			{
				txtHoroscope=value;
			}
		}

		
		private string txtKuja_Dosam=string.Empty;
		public string _txtKuja_Dosam
		{
			get
			{
				return txtKuja_Dosam;
			}
			set 
			{
				txtKuja_Dosam=value;
			}
		}

		
		private string intState_Id=string.Empty;
		public string _intState_Id
		{
			get
			{
				return intState_Id;
			}
			set 
			{
				intState_Id=value;
			}
		}

		
		private string intCountry_Id=string.Empty;
		public string _intCountry_Id
		{
			get
			{
				return intCountry_Id;
			}
			set 
			{
				intCountry_Id=value;
			}
		}

		
		private string txtAddr=string.Empty;
		public string _txtAddr
		{
			get
			{
				return txtAddr;
			}
			set 
			{
				txtAddr=value;
			}
		}

		
		private string txtPhone1=string.Empty;
		public string _txtPhone1
		{
			get
			{
				return txtPhone1;
			}
			set 
			{
				txtPhone1=value;
			}
		}

		
		private string txtPhone2=string.Empty;
		public string _txtPhone2
		{
			get
			{
				return txtPhone2;
			}
			set 
			{
				txtPhone2=value;
			}
		}

		
		private string txtAbt_Myself=string.Empty;
		public string _txtAbt_Myself
		{
			get
			{
				return txtAbt_Myself;
			}
			set 
			{
				txtAbt_Myself=value;
			}
		}
		private string txtAbt_Family=string.Empty;
		public string _txtAbt_Family
		{
			get
			{
				return txtAbt_Family;
			}
			set 
			{
				txtAbt_Family=value;
			}
		}

		
		private string txtCreated_By=string.Empty;
		public string _txtCreated_By
		{
			get
			{
				return txtCreated_By;
			}
			set 
			{
				txtCreated_By=value;
			}
		}
		
		private string strUserId=string.Empty;
		public string _strUserId
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


		#region "Add Xtras"
		private string AddHobbies=string.Empty;
		public string _AddHobbies
		{
			get
			{
				return AddHobbies;
			}
			set 
			{
				AddHobbies=value;
			}
		}

		private string AddIntrests=string.Empty;
		public string _AddIntrests
		{
			get
			{
				return AddIntrests;
			}
			set 
			{
				AddIntrests=value;
			}
		}


		private string AddMusic=string.Empty;
		public string _AddMusic
		{
			get
			{
				return AddMusic;
			}
			set 
			{
				AddMusic=value;
			}
		}


		private string AddReads=string.Empty;
		public string _AddReads
		{
			get
			{
				return AddReads;
			}
			set 
			{
				AddReads=value;
			}
		}

		private string AddMovies=string.Empty;
		public string _AddMovies
		{
			get
			{
				return AddMovies;
			}
			set 
			{
				AddMovies=value;
			}
		}

		private string AddSports=string.Empty;
		public string _AddSports
		{
			get
			{
				return AddSports;
			}
			set 
			{
				AddSports=value;
			}
		}


		private string AddCuisine=string.Empty;
		public string _AddCuisine
		{
			get
			{
				return AddCuisine;
			}
			set 
			{
				AddCuisine=value;
			}
		}

		private string AddDressStyle=string.Empty;
		public string _AddDressStyle
		{
			get
			{
				return AddDressStyle;
			}
			set 
			{
				AddDressStyle=value;
			}
		}


		private string AddLanguages=string.Empty;
		public string _AddLanguages
		{
			get
			{
				return AddLanguages;
			}
			set 
			{
				AddLanguages=value;
			}
		}
		private string Countrybirth=string.Empty;
		public string _Countrybirth
		{
			get
			{
				return Countrybirth;
			}
			set 
			{
				Countrybirth=value;
			}
		}
		private string Personalvalues=string.Empty;
		public string _Personalvalues
		{
			get
			{
				return Personalvalues;
			}
			set 
			{
				Personalvalues=value;
			}
		}
		private string Grewup=string.Empty;
		public string _Grewup
		{
			get
			{
				return Grewup;
			}
			set 
			{
				Grewup=value;
			}
		}

		#endregion

		public DataSet GetCasteDetails()
		{
			dsCountries=new DataSet(); 
			try
			{
				dsCountries=csDataAccess.ExecuteSQL("select intcaste_Id as CasteId,txtCaste as CasteName from tbl_Caste_master where Religion="+Religion); 
			}
			catch(Exception)
			{
				//int i=0;
			}
			return dsCountries;
		}
		public DataSet GetCastes()
		{
			dsCountries=new DataSet(); 
			try
			{
				dsCountries=csDataAccess.ExecuteSQL("select intcaste_Id as CasteId,txtCaste as CasteName from tbl_Caste_master"); 
			}
			catch(Exception)
			{
				//int i=0;
			}
			return dsCountries;
		}

		
		public string strEmailExists()
		{
			string Retstatus=string.Empty;
			try
			{
				Retstatus=csDataAccess.ExecuteScalar("select Count(*) From tbl_user_info where txtEmail='"+EMail+"' or txtUname='"+UName+"'"); 
			}
			catch
			{
			}
			return Retstatus;
		}
		public string strUnameExists()
		{
			string Retstatus=string.Empty;
			try
			{
				Retstatus=csDataAccess.ExecuteScalar("select Count(*) From tbl_user_info where txtUname='"+UName+"'"); 
			}
			catch
			{
			}
			return Retstatus;
		}
		public DataSet FillCountries()
		{
			try
			{
				dsCountries=csDataAccess.ExecuteSQL("GetCOuntry_Master"); 
			}
			catch(Exception)
			{
				//int i=0;
			}
			return dsCountries;

		}

		public string InsertRegistrationFirst()
		{
			string Retvalue=string.Empty;
			string RetStatus=string.Empty;
			try
			{
				SqlParameter[] colParams = new SqlParameter[13];
				
				colParams[0] = new SqlParameter("@txtFName",Name);
				colParams[1] = new SqlParameter("@txtDate_of_Birth",DateofBirth);
				colParams[2] = new SqlParameter("@txtGender",Gender);
				colParams[3] = new SqlParameter("@txtMarital_Status",MartialStatus);
				colParams[4] = new SqlParameter("@intNo_of_Children",HaveChild);
				//colParams[5] = new SqlParameter("@txtReligion",Religion);
                colParams[5] = new SqlParameter("@intCountry_Id",CountryLiveIn);
				colParams[6] = new SqlParameter("@txtEmail",EMail);
				colParams[7] = new SqlParameter("@txtPwd",Passwd);
				colParams[8] = new SqlParameter("@txtPhone1",txtPhone1);
				colParams[9] = new SqlParameter("@Enable","0");
				colParams[10] = new SqlParameter("@Retvalue",SqlDbType.Int,32);
				colParams[10].Direction = ParameterDirection.Output ;
				colParams[11] = new SqlParameter("@txtUname",UName);
				colParams[12]=new SqlParameter("@txtResident_status",Residentstatus);
				try
				{
					 RetStatus=csDataAccess.ExecuteNonQuery("Insert_User_info",colParams).ToString();
				}
				catch(Exception)
				{
					colParams=null;
					//throw ex;
				}

				Retvalue=colParams[10].Value.ToString() ;  
			}
			catch(Exception ex)
			{
                Retvalue = ex.Message.ToString();
			}
            
			return Retvalue; 
		}

		public DataSet GetCities()
		{
			DataSet dsReturns=new DataSet(); 
			try
			{
				SqlParameter[] colParams = new SqlParameter[1];
				colParams[0] = new SqlParameter("@StateId",intState_Id);

				dsReturns=csDataAccess.ExecuteSQL("GetCities_Master",colParams); 
			}
			catch(Exception)
			{
				//int i=0;
			}
			return dsReturns;
		}

		public DataSet GetStates()
		{
			DataSet dsReturns=new DataSet(); 
			try
			{
				SqlParameter[] colParams = new SqlParameter[1];
				colParams[0] = new SqlParameter("@COuntryId",intCountry_Id);
				dsReturns=csDataAccess.ExecuteSQL("GetStates_Master",colParams); 
			}
			catch(Exception)
			{
				//int i=0;
			}
			return dsReturns;
		}



		public string InsertRegistrationPersonnalDetails()
		{
			string Retvalue=string.Empty;
			string RetStatus=string.Empty;
			try
			{
				SqlParameter[] colParams = new SqlParameter[32];
				colParams[0] = new SqlParameter("@intHeight_Cms",intHeight_Cms);
				colParams[1] = new SqlParameter("@intWeight_Kg",intWeight_Kg);
				colParams[2] = new SqlParameter("@txtComplexion",strComplexion);
				colParams[11] = new SqlParameter("@txtBodytype",strBodytype);
				
				colParams[3] = new SqlParameter("@txtDiet",Diet);
				colParams[4] = new SqlParameter("@txtSmoke",Smoke);
				colParams[5] = new SqlParameter("@txtDrink",Drink);

				colParams[6] = new SqlParameter("@txtPhy_Status",txtPhy_Status);
				colParams[7] = new SqlParameter("@txtBlood_Group",txtBlood_Group);

				colParams[8] = new SqlParameter("@txtEdu_Cat",txtEdu_Cat);
				colParams[9] = new SqlParameter("@txtEdu_Detail",txtEdu_Detail);
				colParams[10] = new SqlParameter("@txtOcu_Cat",txtOcu_Cat);
			
				colParams[12] = new SqlParameter("@txtIncome_Major",txtIncome_Major);
			
				colParams[13] = new SqlParameter("@intMt_Id",intMt_Id);
				
				colParams[14] = new SqlParameter("@txtFamilies",Family);
				colParams[15] = new SqlParameter("@txtRelegion",Religion);

				colParams[16] = new SqlParameter("@intCaste_Id",intCaste_Id);

				
				colParams[17] = new SqlParameter("@txtSub_Caste",txtSub_Caste);

				colParams[18] = new SqlParameter("@txtGotra",txtGotra);
				colParams[19] = new SqlParameter("@txtStar",txtStar);

				colParams[20] = new SqlParameter("@txtRasi",txtRasi);
				colParams[21] = new SqlParameter("@txtHoroscope",txtHoroscope);
				colParams[22] = new SqlParameter("@txtKuja_Dosam",txtKuja_Dosam);
				colParams[23] = new SqlParameter("@intState_Id",intState_Id);
				colParams[24] = new SqlParameter("@txtCity",txtCity);


				colParams[25] = new SqlParameter("@txtAddr",txtAddr);
				colParams[26] = new SqlParameter("@txtAbt_Myself",txtAbt_Myself);

				colParams[27] = new SqlParameter("@txtCreated_By",txtCreated_By);
				
				colParams[28] = new SqlParameter("@Enable","1");
				colParams[29]=new SqlParameter("@UserId",strUserId); 
				colParams[30] = new SqlParameter("@txtAbout_Family",txtAbt_Family);
				colParams[31]=new SqlParameter("@flHeight",flHeight_Cms);
				try
				{
					RetStatus=csDataAccess.ExecuteNonQuery("User_info_Personnal_Details",colParams).ToString();
				}
				catch(Exception ex)
				{
					colParams=null;
					RetStatus=ex.ToString();
					//throw ex;
				}

			}
			catch(Exception ex)
			{
				RetStatus=ex.ToString();
			}

			return RetStatus; 
		}

		public string UpdateExtras()
		{
			string Retvalue=string.Empty;
			string RetStatus=string.Empty;
			try
			{
				SqlParameter[] colParams = new SqlParameter[13];
				colParams[0] = new SqlParameter("@UserId",strUserId);
				colParams[1] = new SqlParameter("@txtHobbies",AddHobbies);
				colParams[2] = new SqlParameter("@txtInterests",AddIntrests);
				colParams[3] = new SqlParameter("@txtMusic",AddMusic);
				colParams[4] = new SqlParameter("@txtReads",AddReads);
				colParams[5] = new SqlParameter("@txtMovies",AddMovies);
				colParams[6] = new SqlParameter("@txtSports_Acti",AddSports);
				colParams[7] = new SqlParameter("@txtCuisine",AddCuisine);
				colParams[8] = new SqlParameter("@txtDress_Style",AddDressStyle);
				colParams[9] = new SqlParameter("@txtLanguages",AddLanguages);
				colParams[10] = new SqlParameter("@txtCbirth",Countrybirth);
				colParams[11] = new SqlParameter("@txtPersonalvalues",Personalvalues);
				colParams[12] = new SqlParameter("@txtGrewup",Grewup);
				try
				{
					Retvalue=csDataAccess.ExecuteNonQuery("Insert_Xtras_info",colParams).ToString();
				}
				catch(Exception)
				{
					colParams=null;
					//throw ex;
				}

				
			}
			catch
			{
			}

			return Retvalue; 
		}


	}
}
