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
/// Summary description for cis
/// </summary>
public class cis
{
    public DataAccess obj = new DataAccess();

	public cis()
	{
	}

    public DateTime Date;
    public string CompanyName;
    public string CoApplicant1Name;
    public string CoApplicant1Mobile;
    public string CoApplicant1Designation;
    public string CoApplicant2Name;
    public string CoApplicant2Mobile;
    public string CoApplicant2Designation;
    public string CoApplicant3Name;
    public string CoApplicant3Mobile;
    public string CoApplicant3Designation;
    public string ResiAddress;
    public string ResiLandmark;
    public string ResiLandlineNo;
    public string ResiFalg;
    public string OffAddress;
    public string OffLandmark;
    public string OffLandlineNo;
    public string OffFlag;
    public string ContactPersonName;
    public string CntMobileNo;
    public string CntDesignation;
    public string NatureOfBusiness;
    public DateTime IncDate;
    public string BusinessStability;
    public string LatestAccountingYear;
    public string LatestAssesmentYear;
    public string LatestTurnover;
    public string LatestNetProfit;
    public string LatestInterest;
    public string LatestEMI;
    public string LatestPartner;
    public string LatestDepreciation;
    public string LastAccountingYear;
    public string LastAssesmentYear;
    public string LastTurnover;
    public string LastNetProfit;
    public string LastInterest;
    public string LastEMI;
    public string LastPartner;
    public string LastDepreciation;
    public string BuyerReference1;
    public string Buyer1Mobile;
    public string Buyer1CompanyName;
    public string Buyer1Landline;
    public string Buyer1Address;
    public string BuyerReference2;
    public string Buyer2Mobile;
    public string Buyer2CompanyName;
    public string Buyer2Landline;
    public string Buyer2Address;
    public string SellerReference1;
    public string Seller1Mobile;
    public string Seller1Landline;
    public string Seller1Address;
    public string SellerReference2;
    public string Seller2Mobile;
    public string Seller2Landline;
    public string Seller2Address;
    public string RelativeReference;
    public string RelativeMobile;
    public string RelativeLandline;
    public string RelativeAddress;
    public string FriendReference;
    public string FriendMobile;
    public string FriendLandline;
    public string FriendAddress;
    public string EmailID;

    //Company Loans

    public int CID;
    public int COID;
    public string Bank;
    public string TypeOfLoan;
    public string LoanAmount;
    public string LoanAccountNo;
    public string RateofInterest;
    public string EMIMonth;
    public string Tenure;
    public DateTime EMIStartDate;
    public DateTime EMIEndDate;

    // vehicle owned

    public int VID;
    public string VehicleModel;
    public string RegistrationNo;
    public string FinancedBy;
    public string YearofManufacture;

    public string strres;

    public string Insert_Customer()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[68];
            Params[0] = new SqlParameter("@Date",SqlDbType.DateTime,30,"Date");
            if (Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[0].Value = DBNull.Value;
            }
            else
            {
                Params[0].Value = Date;
            }
            Params[1] = new SqlParameter("@CompanyName", CompanyName);
            Params[2] = new SqlParameter("@CoApplicant1Name", CoApplicant1Name);
            Params[3] = new SqlParameter("@CoApplicant1Mobile", CoApplicant1Mobile);
            Params[4] = new SqlParameter("@CoApplicant1Designation", CoApplicant1Designation);
            Params[5] = new SqlParameter("@CoApplicant2Name", CoApplicant2Name);
            Params[6] = new SqlParameter("@CoApplicant2Mobile", CoApplicant2Mobile);
            Params[7] = new SqlParameter("@CoApplicant2Designation", CoApplicant2Designation);
            Params[8] = new SqlParameter("@CoApplicant3Name", CoApplicant3Name);
            Params[9] = new SqlParameter("@CoApplicant3Mobile", CoApplicant3Mobile);
            Params[10] = new SqlParameter("@CoApplicant3Designation", CoApplicant3Designation);
            Params[11] = new SqlParameter("@ResiAddress", ResiAddress);
            Params[12] = new SqlParameter("@ResiLandmark", ResiLandmark);
            Params[13] = new SqlParameter("@ResiLandlineNo", ResiLandlineNo);
            Params[14] = new SqlParameter("@ResiFlag", ResiFalg);
            Params[15] = new SqlParameter("@OffAddress", OffAddress);
            Params[16] = new SqlParameter("@OffLandmark", OffLandmark);
            Params[17] = new SqlParameter("@OffLandlineNo", OffLandlineNo);
            Params[18] = new SqlParameter("@OffFlag", OffFlag);
            Params[19] = new SqlParameter("@ContactPersonName", ContactPersonName);
            Params[20] = new SqlParameter("@CntMobileNo", CntMobileNo);
            Params[21] = new SqlParameter("@CntDesignation", CntDesignation);
            Params[22] = new SqlParameter("@NatureOfBusiness", NatureOfBusiness);
            Params[23] = new SqlParameter("@IncDate",SqlDbType.DateTime,30,"IncDate");
            if (IncDate.ToString() == "01/01/001 12:00:00 AM")
            {
                Params[23].Value = DBNull.Value;
            }
            else
            {
                Params[23].Value = IncDate;
            }
            Params[24] = new SqlParameter("@BusinessStability", BusinessStability);
            Params[25] = new SqlParameter("@LatestAccountingYear", LatestAccountingYear);
            Params[26] = new SqlParameter("@LatestAssesmentYear", LatestAssesmentYear);
            Params[27] = new SqlParameter("@LatestTurnover", LatestTurnover);
            Params[28] = new SqlParameter("@LatestNetProfit", LatestNetProfit);
            Params[29] = new SqlParameter("@LatestInterest", LatestInterest);
            Params[30] = new SqlParameter("@LatestEMI", LatestEMI);
            Params[31] = new SqlParameter("@LatestPartner", LatestPartner);
            Params[32] = new SqlParameter("@LatestDepreciation", LatestDepreciation);
            Params[33] = new SqlParameter("@LastAccountingYear", LastAccountingYear);
            Params[34] = new SqlParameter("@LastAssesmentYear", LastAssesmentYear);
            Params[35] = new SqlParameter("@LastTurnover", LastTurnover);
            Params[36] = new SqlParameter("@LastNetProfit", LastNetProfit);
            Params[37] = new SqlParameter("@LastInterest", LastInterest);
            Params[38] = new SqlParameter("@LastEMI", LastEMI);
            Params[39] = new SqlParameter("@LastPartner", LastPartner);
            Params[40] = new SqlParameter("@LastDepreciation", LastDepreciation);
            Params[41] = new SqlParameter("@BuyerReference1", BuyerReference1);
            Params[42] = new SqlParameter("@Buyer1Mobile", Buyer1Mobile);
            Params[43] = new SqlParameter("@Buyer1CompanyName", Buyer1CompanyName);
            Params[44] = new SqlParameter("@Buyer1Landline", Buyer1Landline);
            Params[45] = new SqlParameter("@Buyer1Address", Buyer1Address);
            Params[46] = new SqlParameter("@BuyerReference2", BuyerReference2);
            Params[47] = new SqlParameter("@Buyer2Mobile", Buyer2Mobile);
            Params[48] = new SqlParameter("@Buyer2CompanyName", Buyer2CompanyName);
            Params[49] = new SqlParameter("@Buyer2Landline", Buyer2Landline);
            Params[50] = new SqlParameter("@Buyer2Address", Buyer2Address);
            Params[51] = new SqlParameter("@SellerReference1", SellerReference1);
            Params[52] = new SqlParameter("@Seller1Mobile", Seller1Mobile);
            Params[53] = new SqlParameter("@Seller1LandlineNo", Seller1Landline);
            Params[54] = new SqlParameter("@Seller1Address", Seller1Address);
            Params[55] = new SqlParameter("@SellerReference2", SellerReference2);
            Params[56] = new SqlParameter("@Seller2Mobile", Seller2Mobile);
            Params[57] = new SqlParameter("@Seller2LandlineNo", Seller2Landline);
            Params[58] = new SqlParameter("@Seller2Address", Seller2Address);
            Params[59] = new SqlParameter("@RelativeReference", RelativeReference);
            Params[60] = new SqlParameter("@RelativeMobile", RelativeMobile);
            Params[61] = new SqlParameter("@RelativeLandline", RelativeLandline);
            Params[62] = new SqlParameter("@RelativeAddress", RelativeAddress);
            Params[63] = new SqlParameter("@FriendReference", FriendReference);
            Params[64] = new SqlParameter("@FriendMobile", FriendMobile);
            Params[65] = new SqlParameter("@FriendLandline", FriendLandline);
            Params[66] = new SqlParameter("@FriendAddress", FriendAddress);
            Params[67] = new SqlParameter("@EmailID", EmailID);
             strres = obj.ExecuteNonQuery("Insert_Customer", Params).ToString();
            
        }
        catch (Exception ex)
        {
            ex.ToString();
         }
        return strres;
    }

    public string Read_MaxCustID()
    {
        try
        {
            string str = "select max(cid) from Customer";
            strres = Convert.ToString(obj.ExecuteScalarint(str));
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Customer_CompanyLoans()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[10];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@Bank", Bank);
            Params[2] = new SqlParameter("@TypeOfLoan", TypeOfLoan);
            Params[3] = new SqlParameter("@LoanAmount", LoanAmount);
            Params[4] = new SqlParameter("@LoanAccountNo", LoanAccountNo);
            Params[5] = new SqlParameter("@RateofInterest", RateofInterest);
            Params[6] = new SqlParameter("@EMIMonth", EMIMonth);
            Params[7] = new SqlParameter("@Tenure", Tenure);
            Params[8] = new SqlParameter("@EMIStartDate", EMIStartDate);
            Params[9] = new SqlParameter("@EMIEndDate", EMIEndDate);
            strres = obj.ExecuteNonQuery("Insert_Customer_CompanyLoans", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Customer_CoApplicantLoans()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[10];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@Bank", Bank);
            Params[2] = new SqlParameter("@TypeOfLoan", TypeOfLoan);
            Params[3] = new SqlParameter("@LoanAmount", LoanAmount);
            Params[4] = new SqlParameter("@LoanAccountNo", LoanAccountNo);
            Params[5] = new SqlParameter("@RateofInterest", RateofInterest);
            Params[6] = new SqlParameter("@EMIMonth", EMIMonth);
            Params[7] = new SqlParameter("@Tenure", Tenure);
            Params[8] = new SqlParameter("@EMIStartDate", EMIStartDate);
            Params[9] = new SqlParameter("@EMIEndDate", EMIEndDate);
            strres = obj.ExecuteNonQuery("Insert_Customer_CoApplicantLoans", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Insert_Customer_VehicleOwned()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[5];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@VehicleModel", VehicleModel);
            Params[2] = new SqlParameter("@RegistrationNo", RegistrationNo);
            Params[3] = new SqlParameter("@FinancedBy", FinancedBy);
            Params[4] = new SqlParameter("@YearofManufacture", YearofManufacture);
            strres = obj.ExecuteNonQuery("Insert_Customer_VehicleOwned", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public DataSet GetCustomerData(string CID)
    {
        DataSet ds = new DataSet();
        try
        {
            string str = "select * from Customer where CID='" + CID.ToString() + "'";
            ds = obj.ExcuteQry(str);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet GetCustomerCompanyLoans(string CID)
    {
        DataSet ds = new DataSet();
        try
        {
            string str = "select * from Customer_CompanyLoans where CID='" + CID.ToString() + "'";
            ds = obj.ExcuteQry(str);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet GetCustomerCoApplicantLoans(string CID)
    {
        DataSet ds = new DataSet();
        try
        {
            string str = "select * from Customer_CoApplicantLoans where CID='" + CID.ToString() + "'";
            ds = obj.ExcuteQry(str);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public DataSet GetCustomerVehicle(string CID)
    {
        DataSet ds = new DataSet();
        try
        {
            string str = "select * from Customer_VehicleOwned where CID='" + CID.ToString() + "'";
            ds = obj.ExcuteQry(str);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return ds;
    }

    public string Edit_Customer()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[69];
            Params[0] = new SqlParameter("@Date", SqlDbType.DateTime, 30, "Date");
            if (Date.ToString() == "1/1/0001 12:00:00 AM")
            {
                Params[0].Value = DBNull.Value;
            }
            else
            {
                Params[0].Value = Date;
            }
            Params[1] = new SqlParameter("@CompanyName", CompanyName);
            Params[2] = new SqlParameter("@CoApplicant1Name", CoApplicant1Name);
            Params[3] = new SqlParameter("@CoApplicant1Mobile", CoApplicant1Mobile);
            Params[4] = new SqlParameter("@CoApplicant1Designation", CoApplicant1Designation);
            Params[5] = new SqlParameter("@CoApplicant2Name", CoApplicant2Name);
            Params[6] = new SqlParameter("@CoApplicant2Mobile", CoApplicant2Mobile);
            Params[7] = new SqlParameter("@CoApplicant2Designation", CoApplicant2Designation);
            Params[8] = new SqlParameter("@CoApplicant3Name", CoApplicant3Name);
            Params[9] = new SqlParameter("@CoApplicant3Mobile", CoApplicant3Mobile);
            Params[10] = new SqlParameter("@CoApplicant3Designation", CoApplicant3Designation);
            Params[11] = new SqlParameter("@ResiAddress", ResiAddress);
            Params[12] = new SqlParameter("@ResiLandmark", ResiLandmark);
            Params[13] = new SqlParameter("@ResiLandlineNo", ResiLandlineNo);
            Params[14] = new SqlParameter("@ResiFlag", ResiFalg);
            Params[15] = new SqlParameter("@OffAddress", OffAddress);
            Params[16] = new SqlParameter("@OffLandmark", OffLandmark);
            Params[17] = new SqlParameter("@OffLandlineNo", OffLandlineNo);
            Params[18] = new SqlParameter("@OffFlag", OffFlag);
            Params[19] = new SqlParameter("@ContactPersonName", ContactPersonName);
            Params[20] = new SqlParameter("@CntMobileNo", CntMobileNo);
            Params[21] = new SqlParameter("@CntDesignation", CntDesignation);
            Params[22] = new SqlParameter("@NatureOfBusiness", NatureOfBusiness);
            Params[23] = new SqlParameter("@IncDate", SqlDbType.DateTime, 30, "IncDate");
            if (IncDate.ToString() == "01/01/001 12:00:00 AM")
            {
                Params[23].Value = DBNull.Value;
            }
            else
            {
                Params[23].Value = IncDate;
            }
            Params[24] = new SqlParameter("@BusinessStability", BusinessStability);
            Params[25] = new SqlParameter("@LatestAccountingYear", LatestAccountingYear);
            Params[26] = new SqlParameter("@LatestAssesmentYear", LatestAssesmentYear);
            Params[27] = new SqlParameter("@LatestTurnover", LatestTurnover);
            Params[28] = new SqlParameter("@LatestNetProfit", LatestNetProfit);
            Params[29] = new SqlParameter("@LatestInterest", LatestInterest);
            Params[30] = new SqlParameter("@LatestEMI", LatestEMI);
            Params[31] = new SqlParameter("@LatestPartner", LatestPartner);
            Params[32] = new SqlParameter("@LatestDepreciation", LatestDepreciation);
            Params[33] = new SqlParameter("@LastAccountingYear", LastAccountingYear);
            Params[34] = new SqlParameter("@LastAssesmentYear", LastAssesmentYear);
            Params[35] = new SqlParameter("@LastTurnover", LastTurnover);
            Params[36] = new SqlParameter("@LastNetProfit", LastNetProfit);
            Params[37] = new SqlParameter("@LastInterest", LastInterest);
            Params[38] = new SqlParameter("@LastEMI", LastEMI);
            Params[39] = new SqlParameter("@LastPartner", LastPartner);
            Params[40] = new SqlParameter("@LastDepreciation", LastDepreciation);
            Params[41] = new SqlParameter("@BuyerReference1", BuyerReference1);
            Params[42] = new SqlParameter("@Buyer1Mobile", Buyer1Mobile);
            Params[43] = new SqlParameter("@Buyer1CompanyName", Buyer1CompanyName);
            Params[44] = new SqlParameter("@Buyer1Landline", Buyer1Landline);
            Params[45] = new SqlParameter("@Buyer1Address", Buyer1Address);
            Params[46] = new SqlParameter("@BuyerReference2", BuyerReference2);
            Params[47] = new SqlParameter("@Buyer2Mobile", Buyer2Mobile);
            Params[48] = new SqlParameter("@Buyer2CompanyName", Buyer2CompanyName);
            Params[49] = new SqlParameter("@Buyer2Landline", Buyer2Landline);
            Params[50] = new SqlParameter("@Buyer2Address", Buyer2Address);
            Params[51] = new SqlParameter("@SellerReference1", SellerReference1);
            Params[52] = new SqlParameter("@Seller1Mobile", Seller1Mobile);
            Params[53] = new SqlParameter("@Seller1LandlineNo", Seller1Landline);
            Params[54] = new SqlParameter("@Seller1Address", Seller1Address);
            Params[55] = new SqlParameter("@SellerReference2", SellerReference2);
            Params[56] = new SqlParameter("@Seller2Mobile", Seller2Mobile);
            Params[57] = new SqlParameter("@Seller2LandlineNo", Seller2Landline);
            Params[58] = new SqlParameter("@Seller2Address", Seller2Address);
            Params[59] = new SqlParameter("@RelativeReference", RelativeReference);
            Params[60] = new SqlParameter("@RelativeMobile", RelativeMobile);
            Params[61] = new SqlParameter("@RelativeLandline", RelativeLandline);
            Params[62] = new SqlParameter("@RelativeAddress", RelativeAddress);
            Params[63] = new SqlParameter("@FriendReference", FriendReference);
            Params[64] = new SqlParameter("@FriendMobile", FriendMobile);
            Params[65] = new SqlParameter("@FriendLandline", FriendLandline);
            Params[66] = new SqlParameter("@FriendAddress", FriendAddress);
            Params[67] = new SqlParameter("@CID", CID);
            Params[68] = new SqlParameter("@EmailID", EmailID);
            strres = obj.ExecuteNonQuery("Edit_Customer", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Customer_CompanyLoans()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[11];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@Bank", Bank);
            Params[2] = new SqlParameter("@TypeOfLoan", TypeOfLoan);
            Params[3] = new SqlParameter("@LoanAmount", LoanAmount);
            Params[4] = new SqlParameter("@LoanAccountNo", LoanAccountNo);
            Params[5] = new SqlParameter("@RateofInterest", RateofInterest);
            Params[6] = new SqlParameter("@EMIMonth", EMIMonth);
            Params[7] = new SqlParameter("@Tenure", Tenure);
            Params[8] = new SqlParameter("@EMIStartDate", EMIStartDate);
            Params[9] = new SqlParameter("@EMIEndDate", EMIEndDate);
            Params[10] = new SqlParameter("@COID", COID);
            strres = obj.ExecuteNonQuery("Edit_Customer_CompanyLoans", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Customer_CoApplicantLoans()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[11];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@Bank", Bank);
            Params[2] = new SqlParameter("@TypeOfLoan", TypeOfLoan);
            Params[3] = new SqlParameter("@LoanAmount", LoanAmount);
            Params[4] = new SqlParameter("@LoanAccountNo", LoanAccountNo);
            Params[5] = new SqlParameter("@RateofInterest", RateofInterest);
            Params[6] = new SqlParameter("@EMIMonth", EMIMonth);
            Params[7] = new SqlParameter("@Tenure", Tenure);
            Params[8] = new SqlParameter("@EMIStartDate", EMIStartDate);
            Params[9] = new SqlParameter("@EMIEndDate", EMIEndDate);
            Params[10] = new SqlParameter("@COID", COID);
            strres = obj.ExecuteNonQuery("Edit_Customer_CoApplicantLoans", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Edit_Customer_VehicleOwned()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[6];
            Params[0] = new SqlParameter("@CID", CID);
            Params[1] = new SqlParameter("@VehicleModel", VehicleModel);
            Params[2] = new SqlParameter("@RegistrationNo", RegistrationNo);
            Params[3] = new SqlParameter("@FinancedBy", FinancedBy);
            Params[4] = new SqlParameter("@YearofManufacture", YearofManufacture);
            Params[5] = new SqlParameter("@VID", VID);
            strres = obj.ExecuteNonQuery("Edit_Customer_VehicleOwned", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Customer_CompanyLoans()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CID", CID);
            strres = obj.ExecuteNonQuery("Delete_Customer_CompanyLoans", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Customer_CoApplicantLoans()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CID", CID);
            strres = obj.ExecuteNonQuery("Delete_Customer_CoApplicantLoans", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Customer_VehicleOwned()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CID", CID);
            strres = obj.ExecuteNonQuery("Delete_Customer_VehicleOwned", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }

    public string Delete_Customer()
    {
        try
        {
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = new SqlParameter("@CID", CID);
            strres = obj.ExecuteNonQuery("Delete_Customer", Params).ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        return strres;
    }
    


}
