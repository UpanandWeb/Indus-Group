using System;
using System.Collections.Generic;
 
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using IndusAbroad.DataAccessLayer; 

/// <summary>
/// Summary description for AdminCS
/// </summary>
public class AdminCS
{
    public DataAccess obj = new DataAccess();
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
	public AdminCS()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private Int32 UId;
    private string UserId;
    private string Password;
    private string FName;
    private string LName;
    private string Desig;
    private string Address;
    private string ContactNo;
    private string EmailId;
    private int Status;
    private string Mobile;
    private string Country;
    private DateTime Createdon;

    private int ImmigView;
    private int ImmigPost;
    private int ImmigEdit;
    private int ImmigDel;
    private int ImmigDown;

    private int HRView;
    private int HRPost;
    private int HREdit;
    private int HRDel;
    private int HRDown;

    private int AccView;
    private int AccPost;
    private int AccEdit;
    private int AccDel;
    private int AccDown;

    private int DRView;
    private int DRPost;    
    private int DRDel;
    private int DRDown;
    private int DREdit;

    private int LeavesView;
    private int LeavesPost;
    private int LeavesEdit;
    private int LeavesDel;
    private int LeavesDown;

    private int ARPView;
    private int ARPPost;
    private int ARPEdit;
    private int ARPDel;
    private int ARPDown;

    private int ExelView;
    private int ExelPost;
    private int ExelEdit;
    private int ExelDel;
    private int ExelDown;

    private int EmpDocsView;
    private int EmpDocsPost;
    private int EmpDocsDown;
    private int EmpDocsDelete;
    private int EmpDocsEdit;

    private int WrdDocsView;
    private int WrdDocsPost;
    private int WrdDocsDown;
    private int WrdDocsEdit;
    private int WrdDocsDelete;

    private int ResumeView;
    private int ResumePost;
    private int ResumeEdit;
    private int ResumeDel;
    private int ResumeDown;

    public Int32 cUId
    {
        get { return UId; }
        set { UId = value; }
    }
    public DateTime cCreatedon
    {
        get { return Createdon; }
        set { Createdon = value; }
    }
    public string cFName
    {
        get { return FName; }
        set { FName = value; }
    }
    public string cLName
    {
        get { return LName; }
        set { LName = value; }
    }
    public string cUserId
    {
        get { return UserId; }
        set { UserId = value; }
    }
    public string cPassword
    {
        get { return Password; }
        set { Password = value; }
    }
    public string cDesig
    {
        get { return Desig; }
        set { Desig = value; }
    }
    public string cAddress
    {
        get { return Address; }
        set { Address = value; }
    }
    public string cContactNo
    {
        get { return ContactNo; }
        set { ContactNo = value; }
    }
    public string cEmailId
    {
        get { return EmailId; }
        set { EmailId = value; }
    }
    public string cMobile
    {
        get { return Mobile; }
        set { Mobile = value; }
    }
    public string cCountry
    {
        get { return Country; }
        set { Country = value; }
    }
    public int cStatus
    {
        get { return Status; }
        set { Status = value; }
    }
    public int cImmigDel
    {
        get { return ImmigDel; }
        set { ImmigDel = value; }
    }
    public int cImmigDown
    {
        get { return ImmigDown; }
        set { ImmigDown = value; }
    }
    public int cImmigEdit
    {
        get { return ImmigEdit; }
        set { ImmigEdit = value; }
    }
    public int cImmigPost
    {
        get { return ImmigPost; }
        set { ImmigPost = value; }
    }
    public int cImmigView
    {
        get { return ImmigView; }
        set { ImmigView = value; }
    }
    public int cAccDel
    {
        get { return AccDel; }
        set { AccDel = value; }
    }
    public int cAccDown
    {
        get { return AccDown; }
        set { AccDown = value; }
    }
    public int cAccEdit
    {
        get { return AccEdit; }
        set { AccEdit = value; }
    }
    public int cAccPost
    {
        get { return AccPost; }
        set { AccPost = value; }
    }
    public int cAccView
    {
        get { return AccView; }
        set { AccView = value; }
    }
    public int cHRDel
    {
        get { return HRDel; }
        set { HRDel = value; }
    }
    public int cHRDown
    {
        get { return HRDown; }
        set { HRDown = value; }
    }
    public int cHREdit
    {
        get { return HREdit; }
        set { HREdit = value; }
    }
    public int cHRPost
    {
        get { return HRPost; }
        set { HRPost = value; }
    }
    public int cHRView
    {
        get { return HRView; }
        set { HRView = value; }
    }
    public int cARPDel
    {
        get { return ARPDel; }
        set { ARPDel = value; }
    }
    public int cARPDown
    {
        get { return ARPDown; }
        set { ARPDown = value; }
    }
    public int cARPEdit
    {
        get { return ARPEdit; }
        set { ARPEdit = value; }
    }
    public int cARPPost
    {
        get { return ARPPost; }
        set { ARPPost = value; }
    }
    public int cARPView
    {
        get { return ARPView; }
        set { ARPView = value; }
    }
    public int cDRDel
    {
        get { return DRDel; }
        set { DRDel = value; }
    }
    public int cDRDown
    {
        get { return DRDown; }
        set { DRDown = value; }
    }
    public int cDRPost
    {
        get { return DRPost; }
        set { DRPost = value; }
    }
    public int cDRView
    {
        get { return DRView; }
        set { DRView = value; }
    }
    public int cDREdit
    {
        get { return DREdit; }
        set { DREdit = value; }
    }
    public int cLeavesDel
    {
        get { return LeavesDel; }
        set { LeavesDel = value; }
    }
    public int cLeavesEdit
    {
        get { return LeavesEdit; }
        set { LeavesEdit = value; }
    }
    public int cLeavesPost
    {
        get { return LeavesPost; }
        set { LeavesPost = value; }
    }
    public int cLeavesView
    {
        get { return LeavesView; }
        set { LeavesView = value; }
    }
    public int cExelDel
    {
        get { return ExelDel; }
        set { ExelDel = value; }
    }
    public int cExelDown
    {
        get { return ExelDown; }
        set { ExelDown = value; }
    }
    public int cExelEdit
    {
        get { return ExelEdit; }
        set { ExelEdit = value; }
    }
    public int cExelPost
    {
        get { return ExelPost; }
        set { ExelPost = value; }
    }
    public int cExelView
    {
        get { return ExelView; }
        set { ExelView = value; }
    }
    public int cEmpDocsDown
    {
        get { return EmpDocsDown; }
        set { EmpDocsDown = value; }
    }
    public int cEmpDocsPost
    {
        get { return EmpDocsPost; }
        set { EmpDocsPost = value; }
    }
    public int cEmpDocsView
    {
        get { return EmpDocsView; }
        set { EmpDocsView = value; }
    }
    public int cEmpDocsDelete
    {
        get { return EmpDocsDelete; }
        set { EmpDocsDelete = value; }
    }

    public int cWrdDocsDown
    {
        get { return WrdDocsDown; }
        set { WrdDocsDown = value; }
    }
    public int cWrdDocsPost
    {
        get { return WrdDocsPost; }
        set { WrdDocsPost = value; }
    }
    public int cWrdDocsView
    {
        get { return WrdDocsView; }
        set { WrdDocsView = value; }
    }
    public int cWrdDocsEdit
    {
        get { return WrdDocsEdit; }
        set { WrdDocsEdit = value; }
    }
    public int cWrdDocsDelete
    {
        get { return WrdDocsDelete; }
        set { WrdDocsDelete = value; }
    }
    //Resume Properties

    public int cRDocsDown
    {
        get { return ResumeDown; }
        set { ResumeDown = value; }
    }
    public int cRDocsPost
    {
        get { return ResumePost; }
        set { ResumePost = value; }
    }
    public int cRDocsView
    {
        get { return ResumeView; }
        set { ResumeView = value; }
    }
    public int cRDocsEdit
    {
        get { return ResumeEdit; }
        set { ResumeEdit = value; }
    }
    public int cRDocsDelete
    {
        get { return ResumeDel; }
        set { ResumeDel = value; }
    }
    //Upload files
    private Int32 edocId;
    private string FileName;
    private string FileContentType;
    private string Postedby;
    private DateTime Postdate;
    private string UserType;
    private string Filepath;   
    private string DocType;
    private string FolderName;
    private string SubFolderName;

    public Int32 aedocId
    {
        get { return edocId; }
        set { edocId = value; }
    }
    public string aFileName
    {
        get { return FileName; }
        set { FileName = value; }
    }
    public string aFileContentType
    {
        get { return FileContentType; }
        set { FileContentType = value; }
    }
    public string aPostedby
    {
        get { return Postedby; }
        set { Postedby = value; }
    }
    public DateTime aPostedate
    {
        get { return Postdate; }
        set { Postdate = value; }
    }
    public string aDocType
    {
        get { return DocType; }
        set { DocType = value; }
    }
    public string aUserType
    {
        get { return UserType; }
        set { UserType = value; }
    }
    public string aFolderName
    {
        get { return FolderName; }
        set { FolderName = value; }
    }
    public string aSubFolderName
    {
        get { return SubFolderName; }
        set { SubFolderName = value; }
    }
    public string aFilepath
    {
        get { return Filepath; }
        set { Filepath = value; }
    }
    public bool FillDrop(System.Web.UI.WebControls.DropDownList dp, string stm, string ValueFld, string TextFld, string dfltTxt)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(stm, con);
        SqlDataReader rdr = cmd.ExecuteReader();
        try
        {
            dp.DataValueField = ValueFld;
            dp.DataTextField = TextFld;
            dp.DataSource = rdr;
            dp.DataBind();
        }
        finally
        {
            if (!(rdr == null))
            {
                rdr.Close();
            }
            dp.Items.Insert(0, dfltTxt);
            dp.SelectedIndex = 0;
            cmd.Dispose();
            con.Close();
        }
        return true;
    }
    //To populate Drop Down List with usertype
    public void FillUserType(DropDownList dpc)
    {
        FillDrop(dpc, "select UserType from UserType order by UserType", "UserType", "UserType", "Select User Type");
    }
    public void FillDesignation(DropDownList dpc)
    {
        FillDrop(dpc, "select UserType from UserType except (select UserType from UserType where UserType='Admin') order by UserType", "UserType", "UserType", "Select User Type");
    }
    public void FillEmpDesignation(DropDownList dpc)
    {
        FillDrop(dpc, "select UserType from UserType except (select UserType from UserType where UserType in('Admin','Employee','Employer')) order by UserType", "UserType", "UserType", "Select User Type");
    }

    /* Insert Records into Emolyee and User Information Table */
    public bool CreateUserId(string UserId,string Password,string FName,string LName,string Desig,
                             string Address,string ContactNo,string EmailId,int Status,DateTime Createdon,
                             int ImmigView,int ImmigPost,int ImmigEdit,int ImmigDel,int ImmigDown,
                             int AccView, int AccPost, int AccEdit, int AccDel, int AccDown,
                             int HRView,int HRPost,int HREdit,int HRDel,int HRDown,                             
                             int DRView,int DRPost,int DRDel,int DRDown,
                             int LeavesView,int LeavesPost,int LeavesEdit,int LeavesDel,
                             int ARPView,int ARPPost,int ARPEdit,int ARPDel,int ARPDown,
                             int ExelView,int ExelPost,int ExelEdit,int ExelDel,int ExelDown,
                             int EmpDocsView,int EmpDocsPost,int EmpDocsDown, int EmpDocsDel, int WrdDocsPost,
                             int WrdDocsEdit,int WrdDocsDelete,int WrdDocsView,int WrdDocsDown,int ResumeDocsPost,
                             int ResumeDocsEdit, int ResumeDocsDelete, int ResumeDocsView, int ResumeDocsDown,
                             string Country,string Mobile)
    {
        try
        {
            if (Desig == "Employee")
            {
                con.Open();
                SqlTransaction myTrans = con.BeginTransaction();
                SqlParameter[] parm = new SqlParameter[54];
                parm[0] = new SqlParameter("@UserId", SqlDbType.NVarChar);
                parm[0].Value = UserId;
                parm[1] = new SqlParameter("@Password", SqlDbType.NVarChar);
                parm[1].Value = Password;
                parm[2] = new SqlParameter("@FName", SqlDbType.NVarChar);
                parm[2].Value = FName;
                parm[3] = new SqlParameter("@LName", SqlDbType.NVarChar);
                parm[3].Value = LName;
                parm[4] = new SqlParameter("@Desig", SqlDbType.NVarChar);
                parm[4].Value = Desig;
                parm[5] = new SqlParameter("@Address", SqlDbType.NVarChar);
                parm[5].Value = Address;
                parm[6] = new SqlParameter("@ContactNo", SqlDbType.NVarChar);
                parm[6].Value = ContactNo;
                parm[7] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
                parm[7].Value = EmailId;
                parm[8] = new SqlParameter("@Status", SqlDbType.Int);
                parm[8].Value = 0;
                parm[9] = new SqlParameter("@Createdon", SqlDbType.DateTime);
                parm[9].Value = Createdon;
                parm[10] = new SqlParameter("@ImmigDel", SqlDbType.Int);
                parm[10].Value = ImmigDel;
                parm[11] = new SqlParameter("@ImmigDown", SqlDbType.Int);
                parm[11].Value = ImmigDown;
                parm[12] = new SqlParameter("@ImmigEdit", SqlDbType.Int);
                parm[12].Value = ImmigEdit;
                parm[13] = new SqlParameter("@ImmigPost", SqlDbType.Int);
                parm[13].Value = ImmigPost;
                parm[14] = new SqlParameter("@ImmigView", SqlDbType.Int);
                parm[14].Value = ImmigView;
                parm[15] = new SqlParameter("@AccDel", SqlDbType.Int);
                parm[15].Value = AccDel;
                parm[16] = new SqlParameter("@AccDown", SqlDbType.Int);
                parm[16].Value = AccDown;
                parm[17] = new SqlParameter("@AccEdit", SqlDbType.Int);
                parm[17].Value = AccEdit;
                parm[18] = new SqlParameter("@AccPost", SqlDbType.Int);
                parm[18].Value = AccPost;
                parm[19] = new SqlParameter("@AccView", SqlDbType.Int);
                parm[19].Value = AccView;
                parm[20] = new SqlParameter("@HRDel", SqlDbType.Int);
                parm[20].Value = HRDel;
                parm[21] = new SqlParameter("@HRDown", SqlDbType.Int);
                parm[21].Value = HRDown;
                parm[22] = new SqlParameter("@HREdit", SqlDbType.Int);
                parm[22].Value = HREdit;
                parm[23] = new SqlParameter("@HRPost", SqlDbType.Int);
                parm[23].Value = HRPost;
                parm[24] = new SqlParameter("@HRView", SqlDbType.Int);
                parm[24].Value = HRView;
                parm[25] = new SqlParameter("@ARPDel", SqlDbType.Int);
                parm[25].Value = ARPDel;
                parm[26] = new SqlParameter("@ARPDown", SqlDbType.Int);
                parm[26].Value = ARPDown;
                parm[27] = new SqlParameter("@ARPEdit", SqlDbType.Int);
                parm[27].Value = ARPEdit;
                parm[28] = new SqlParameter("@ARPPost", SqlDbType.Int);
                parm[28].Value = ARPPost;
                parm[29] = new SqlParameter("@ARPView", SqlDbType.Int);
                parm[29].Value = ARPView;
                parm[30] = new SqlParameter("@DRDel", SqlDbType.Int);
                parm[30].Value = DRDel;
                parm[31] = new SqlParameter("@DRDown", SqlDbType.Int);
                parm[31].Value = DRDown;
                parm[32] = new SqlParameter("@DRPost", SqlDbType.Int);
                parm[32].Value = DRPost;
                parm[33] = new SqlParameter("@DRView", SqlDbType.Int);
                parm[33].Value = DRView;
                parm[34] = new SqlParameter("@LeavesDel", SqlDbType.Int);
                parm[34].Value = LeavesDel;
                parm[35] = new SqlParameter("@LeavesEdit", SqlDbType.Int);
                parm[35].Value = LeavesEdit;
                parm[36] = new SqlParameter("@LeavesPost", SqlDbType.Int);
                parm[36].Value = LeavesPost;
                parm[37] = new SqlParameter("@LeavesView", SqlDbType.Int);
                parm[37].Value = LeavesView;
                parm[38] = new SqlParameter("@ExelDel", SqlDbType.Int);
                parm[38].Value = ExelDel;
                parm[39] = new SqlParameter("@ExelDown", SqlDbType.Int);
                parm[39].Value = ExelDown;
                parm[40] = new SqlParameter("@ExelEdit", SqlDbType.Int);
                parm[40].Value = ExelEdit;
                parm[41] = new SqlParameter("@ExelPost", SqlDbType.Int);
                parm[41].Value = ExelPost;
                parm[42] = new SqlParameter("@ExelView", SqlDbType.Int);
                parm[42].Value = ExelView;
                parm[43] = new SqlParameter("@EmpDocsView", SqlDbType.Int);
                parm[43].Value = EmpDocsView;
                parm[44] = new SqlParameter("@EmpDocsPost", SqlDbType.Int);
                parm[44].Value = EmpDocsPost;
                parm[45] = new SqlParameter("@EmpDocsDown", SqlDbType.Int);
                parm[45].Value = EmpDocsDown;
                parm[46] = new SqlParameter("@WrdDocsView", SqlDbType.Int);
                parm[46].Value = WrdDocsView;
                parm[47] = new SqlParameter("@WrdDocsPost", SqlDbType.Int);
                parm[47].Value = WrdDocsPost;
                parm[48] = new SqlParameter("@WrdDocsEdit", SqlDbType.Int);
                parm[48].Value = WrdDocsEdit;
                parm[49] = new SqlParameter("@WrdDocsDel", SqlDbType.Int);
                parm[49].Value = WrdDocsDelete;
                parm[50] = new SqlParameter("@WrdDocsDown", SqlDbType.Int);
                parm[50].Value = WrdDocsDown;
                parm[51] = new SqlParameter("@Country", SqlDbType.NVarChar);
                parm[51].Value = Country;
                parm[52] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
                parm[52].Value = Mobile;
                parm[53] = new SqlParameter("@EmpDocsDel", SqlDbType.NVarChar);
                parm[53].Value = EmpDocsDel;
                DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "EmpUserId_creation", parm);

                myTrans.Commit();
                con.Close();
            }
            else
            {
                con.Open();
                SqlTransaction myTrans = con.BeginTransaction();
                SqlParameter[] parm = new SqlParameter[54];
                parm[0] = new SqlParameter("@UserId", SqlDbType.NVarChar);
                parm[0].Value = UserId;
                parm[1] = new SqlParameter("@Password", SqlDbType.NVarChar);
                parm[1].Value = Password;
                parm[2] = new SqlParameter("@FName", SqlDbType.NVarChar);
                parm[2].Value = FName;
                parm[3] = new SqlParameter("@LName", SqlDbType.NVarChar);
                parm[3].Value = LName;
                parm[4] = new SqlParameter("@Desig", SqlDbType.NVarChar);
                parm[4].Value = Desig;
                parm[5] = new SqlParameter("@Address", SqlDbType.NVarChar);
                parm[5].Value = Address;
                parm[6] = new SqlParameter("@ContactNo", SqlDbType.NVarChar);
                parm[6].Value = ContactNo;
                parm[7] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
                parm[7].Value = EmailId;
                parm[8] = new SqlParameter("@Status", SqlDbType.Int);
                parm[8].Value = Status;
                parm[9] = new SqlParameter("@Createdon", SqlDbType.DateTime);
                parm[9].Value = Createdon;
                parm[10] = new SqlParameter("@ImmigDel", SqlDbType.Int);
                parm[10].Value = ImmigDel;
                parm[11] = new SqlParameter("@ImmigDown", SqlDbType.Int);
                parm[11].Value = ImmigDown;
                parm[12] = new SqlParameter("@ImmigEdit", SqlDbType.Int);
                parm[12].Value = ImmigEdit;
                parm[13] = new SqlParameter("@ImmigPost", SqlDbType.Int);
                parm[13].Value = ImmigPost;
                parm[14] = new SqlParameter("@ImmigView", SqlDbType.Int);
                parm[14].Value = ImmigView;
                parm[15] = new SqlParameter("@AccDel", SqlDbType.Int);
                parm[15].Value = AccDel;
                parm[16] = new SqlParameter("@AccDown", SqlDbType.Int);
                parm[16].Value = AccDown;
                parm[17] = new SqlParameter("@AccEdit", SqlDbType.Int);
                parm[17].Value = AccEdit;
                parm[18] = new SqlParameter("@AccPost", SqlDbType.Int);
                parm[18].Value = AccPost;
                parm[19] = new SqlParameter("@AccView", SqlDbType.Int);
                parm[19].Value = AccView;
                parm[20] = new SqlParameter("@HRDel", SqlDbType.Int);
                parm[20].Value = HRDel;
                parm[21] = new SqlParameter("@HRDown", SqlDbType.Int);
                parm[21].Value = HRDown;
                parm[22] = new SqlParameter("@HREdit", SqlDbType.Int);
                parm[22].Value = HREdit;
                parm[23] = new SqlParameter("@HRPost", SqlDbType.Int);
                parm[23].Value = HRPost;
                parm[24] = new SqlParameter("@HRView", SqlDbType.Int);
                parm[24].Value = HRView;
                parm[25] = new SqlParameter("@ARPDel", SqlDbType.Int);
                parm[25].Value = ARPDel;
                parm[26] = new SqlParameter("@ARPDown", SqlDbType.Int);
                parm[26].Value = ARPDown;
                parm[27] = new SqlParameter("@ARPEdit", SqlDbType.Int);
                parm[27].Value = ARPEdit;
                parm[28] = new SqlParameter("@ARPPost", SqlDbType.Int);
                parm[28].Value = ARPPost;
                parm[29] = new SqlParameter("@ARPView", SqlDbType.Int);
                parm[29].Value = ARPView;
                parm[30] = new SqlParameter("@DRDel", SqlDbType.Int);
                parm[30].Value = DRDel;
                parm[31] = new SqlParameter("@DRDown", SqlDbType.Int);
                parm[31].Value = DRDown;
                parm[32] = new SqlParameter("@DRPost", SqlDbType.Int);
                parm[32].Value = DRPost;
                parm[33] = new SqlParameter("@DRView", SqlDbType.Int);
                parm[33].Value = DRView;
                parm[34] = new SqlParameter("@LeavesDel", SqlDbType.Int);
                parm[34].Value = LeavesDel;
                parm[35] = new SqlParameter("@LeavesEdit", SqlDbType.Int);
                parm[35].Value = LeavesEdit;
                parm[36] = new SqlParameter("@LeavesPost", SqlDbType.Int);
                parm[36].Value = LeavesPost;
                parm[37] = new SqlParameter("@LeavesView", SqlDbType.Int);
                parm[37].Value = LeavesView;
                parm[38] = new SqlParameter("@ExelDel", SqlDbType.Int);
                parm[38].Value = ExelDel;
                parm[39] = new SqlParameter("@ExelDown", SqlDbType.Int);
                parm[39].Value = ExelDown;
                parm[40] = new SqlParameter("@ExelEdit", SqlDbType.Int);
                parm[40].Value = ExelEdit;
                parm[41] = new SqlParameter("@ExelPost", SqlDbType.Int);
                parm[41].Value = ExelPost;
                parm[42] = new SqlParameter("@ExelView", SqlDbType.Int);
                parm[42].Value = ExelView;
                parm[43] = new SqlParameter("@EmpDocsView", SqlDbType.Int);
                parm[43].Value = EmpDocsView;
                parm[44] = new SqlParameter("@EmpDocsPost", SqlDbType.Int);
                parm[44].Value = EmpDocsPost;
                parm[45] = new SqlParameter("@EmpDocsDown", SqlDbType.Int);
                parm[45].Value = EmpDocsDown;
                parm[46] = new SqlParameter("@WrdDocsView", SqlDbType.Int);
                parm[46].Value = WrdDocsView;
                parm[47] = new SqlParameter("@WrdDocsPost", SqlDbType.Int);
                parm[47].Value = WrdDocsPost;
                parm[48] = new SqlParameter("@WrdDocsEdit", SqlDbType.Int);
                parm[48].Value = WrdDocsEdit;
                parm[49] = new SqlParameter("@WrdDocsDel", SqlDbType.Int);
                parm[49].Value = WrdDocsDelete;
                parm[50] = new SqlParameter("@WrdDocsDown", SqlDbType.Int);
                parm[50].Value = WrdDocsDown;
                parm[51] = new SqlParameter("@Country", SqlDbType.NVarChar);
                parm[51].Value = Country;
                parm[52] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
                parm[52].Value = Mobile;
                parm[53] = new SqlParameter("@EmpDocsDel", SqlDbType.NVarChar);
                parm[53].Value = EmpDocsDel;

                DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "AdminUserId_creation", parm);

                myTrans.Commit();
                con.Close();
            }
        }
        catch (Exception ex)
        {
            //bool strScript = true; 
            //strScript = "alert('ex.ToString')";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
            ex.ToString();
        }
        return true;
    }

    public bool UpdateUserId(string UserId, string Password, string FName, string LName, string Desig, string Address, string ContactNo, string EmailId, int Uid,string Country,string Mobile)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[11];
        parm[0] = new SqlParameter("@UserId", SqlDbType.NVarChar);
        parm[0].Value = UserId;
        parm[1] = new SqlParameter("@Password", SqlDbType.NVarChar);
        parm[1].Value = Password;
        parm[2] = new SqlParameter("@FName", SqlDbType.NVarChar);
        parm[2].Value = FName;
        parm[3] = new SqlParameter("@LName", SqlDbType.NVarChar);
        parm[3].Value = LName;
        parm[4] = new SqlParameter("@Desig", SqlDbType.NVarChar);
        parm[4].Value = Desig;
        parm[5] = new SqlParameter("@Address", SqlDbType.NVarChar);
        parm[5].Value = Address;
        parm[6] = new SqlParameter("@ContactNo", SqlDbType.NVarChar);
        parm[6].Value = ContactNo;
        parm[7] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
        parm[7].Value = EmailId;
        parm[8] = new SqlParameter("@Country", SqlDbType.NVarChar);
        parm[8].Value = Country;
        parm[9] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
        parm[9].Value = Mobile;
        parm[10] = new SqlParameter("@Uid", SqlDbType.NVarChar);
        parm[10].Value = Uid;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "AdminUserId_Updation", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    
    public bool UpdatePermissionImmigDocs_View(Int32 Immig_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Immig_View", SqlDbType.Int);
        parm[0].Value = Immig_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateImmig_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionImmigDocs_Post(Int32 Immig_Post,Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Immig_Post", SqlDbType.Int);
        parm[0].Value = Immig_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateImmig_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionImmigDocs_Edit(Int32 Immig_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Immig_Edit", SqlDbType.Int);
        parm[0].Value = Immig_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateImmig_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionImmigDocs_Delete(Int32 Immig_Delete, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Immig_Delete", SqlDbType.Int);
        parm[0].Value = Immig_Delete;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateImmig_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionImmigDocs_Download(Int32 Immig_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Immig_Down", SqlDbType.Int);
        parm[0].Value = Immig_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateImmig_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionAccDocs_View(Int32 Acc_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Acc_View", SqlDbType.Int);
        parm[0].Value = Acc_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateAcc_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionAccDocs_Post(Int32 Acc_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Acc_Post", SqlDbType.Int);
        parm[0].Value = Acc_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateAcc_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionAccDocs_Edit(Int32 Acc_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Acc_Edit", SqlDbType.Int);
        parm[0].Value = Acc_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateAcc_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionAccDocs_Delete(Int32 Acc_Del, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Acc_Del", SqlDbType.Int);
        parm[0].Value = Acc_Del;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateAcc_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionAccDocs_Download(Int32 Acc_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Acc_Down", SqlDbType.Int);
        parm[0].Value = Acc_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateAcc_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionHRDocs_View(Int32 HR_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@HR_View", SqlDbType.Int);
        parm[0].Value = HR_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateHR_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionHRDocs_Post(Int32 HR_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@HR_Post", SqlDbType.Int);
        parm[0].Value = HR_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateHR_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionHRDocs_Edit(Int32 HR_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@HR_Edit", SqlDbType.Int);
        parm[0].Value = HR_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateHR_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionHRDocs_Delete(Int32 HR_Del, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@HR_Del", SqlDbType.Int);
        parm[0].Value = HR_Del;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateHR_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionHRDocs_Download(Int32 HR_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@HR_Down", SqlDbType.Int);
        parm[0].Value = HR_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateHR_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionARPDocs_View(Int32 ARP_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@ARP_View", SqlDbType.Int);
        parm[0].Value = ARP_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateARP_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionARPDocs_Post(Int32 ARP_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@ARP_Post", SqlDbType.Int);
        parm[0].Value = ARP_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateARP_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionARPDocs_Edit(Int32 ARP_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@ARP_Edit", SqlDbType.Int);
        parm[0].Value = ARP_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateARP_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionARPDocs_Delete(Int32 ARP_Del, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@ARP_Del", SqlDbType.Int);
        parm[0].Value = ARP_Del;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateARP_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionARPDocs_Download(Int32 ARP_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@ARP_Down", SqlDbType.Int);
        parm[0].Value = ARP_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateARP_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionDRDocs_View(Int32 DR_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@DR_View", SqlDbType.Int);
        parm[0].Value = DR_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateDR_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionDRDocs_Post(Int32 DR_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@DR_Post", SqlDbType.Int);
        parm[0].Value = DR_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateDR_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionDRDocs_Delete(Int32 DR_Del, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@DR_Del", SqlDbType.Int);
        parm[0].Value = DR_Del;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateDR_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionDRDocs_Download(Int32 DR_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@DR_Down", SqlDbType.Int);
        parm[0].Value = DR_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateDR_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionDRDocs_Edit(Int32 DR_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@DR_Edit", SqlDbType.Int);
        parm[0].Value = DR_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateDR_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionLeaves_View(Int32 LS_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@LS_View", SqlDbType.Int);
        parm[0].Value = LS_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateLS_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionLeaves_Post(Int32 LS_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@LS_Post", SqlDbType.Int);
        parm[0].Value = LS_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateLS_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionLeaves_Edit(Int32 LS_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@LS_Edit", SqlDbType.Int);
        parm[0].Value = LS_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateLS_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionLeaves_Delete(Int32 LS_Del, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@LS_Del", SqlDbType.Int);
        parm[0].Value = LS_Del;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateLS_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionLeaves_Down(Int32 LS_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@LS_Down", SqlDbType.Int);
        parm[0].Value = LS_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateLS_DownPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionExcel_View(Int32 Excel_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Excel_View", SqlDbType.Int);
        parm[0].Value = Excel_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateExcel_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionExcel_Post(Int32 Excel_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Excel_Post", SqlDbType.Int);
        parm[0].Value = Excel_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateExcel_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionExcel_Edit(Int32 Excel_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Excel_Edit", SqlDbType.Int);
        parm[0].Value = Excel_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateExcel_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionExcel_Delete(Int32 Excel_Del, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Excel_Del", SqlDbType.Int);
        parm[0].Value = Excel_Del;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateExcel_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionExcel_Download(Int32 Excel_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Excel_Down", SqlDbType.Int);
        parm[0].Value = Excel_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateExcel_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionEmpDoc_Post(Int32 EmpDoc_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@EmpDoc_Post", SqlDbType.Int);
        parm[0].Value = EmpDoc_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateEmpDoc_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionEmpDoc_Download(Int32 EmpDoc_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@EmpDoc_Down", SqlDbType.Int);
        parm[0].Value = EmpDoc_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateEmpDoc_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionEmpDoc_Edit(Int32 EmpDoc_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@EmpDoc_Edit", SqlDbType.Int);
        parm[0].Value = EmpDoc_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateEmpDoc_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionEmpDoc_Delete(Int32 EmpDoc_Delete, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@EmpDoc_Delete", SqlDbType.Int);
        parm[0].Value = EmpDoc_Delete;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateEmpDoc_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionEmpDoc_View(Int32 EmpDoc_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@EmpDoc_View", SqlDbType.Int);
        parm[0].Value = EmpDoc_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateEmpDoc_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }

    public bool UpdatePermissionWrdDocs_View(Int32 Wrd_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Wrd_View", SqlDbType.Int);
        parm[0].Value = Wrd_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateWrd_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionWrdDocs_Post(Int32 Wrd_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Wrd_Post", SqlDbType.Int);
        parm[0].Value = Wrd_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateWrd_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionWrdDocs_Edit(Int32 Wrd_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Wrd_Edit", SqlDbType.Int);
        parm[0].Value = Wrd_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateWrd_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionWrdDocs_Delete(Int32 Wrd_Delete, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Wrd_Delete", SqlDbType.Int);
        parm[0].Value = Wrd_Delete;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateWrd_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionWrdDocs_Download(Int32 Wrd_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Wrd_Down", SqlDbType.Int);
        parm[0].Value = Wrd_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateWrd_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    //Resume
    public bool UpdatePermissionResumeDocs_View(Int32 Resume_View, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Resume_View", SqlDbType.Int);
        parm[0].Value = Resume_View;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateResume_ViewPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionResumeDocs_Post(Int32 Resume_Post, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Resume_Post", SqlDbType.Int);
        parm[0].Value = Resume_Post;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateResume_PostPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionResumeDocs_Edit(Int32 Resume_Edit, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Resume_Edit", SqlDbType.Int);
        parm[0].Value = Resume_Edit;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateResume_EditPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionResumeDocs_Delete(Int32 Resume_Delete, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Resume_Delete", SqlDbType.Int);
        parm[0].Value = Resume_Delete;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateResume_DeletePermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool UpdatePermissionResumeDocs_Download(Int32 Resume_Down, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@Resume_Down", SqlDbType.Int);
        parm[0].Value = Resume_Down;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UpdateResume_DownloadPermission", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool ChangeUserStatus(Int32 status, Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@status", SqlDbType.Int);
        parm[0].Value = status;
        parm[1] = new SqlParameter("@UID", SqlDbType.Int);
        parm[1].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "ChangeAdminUserStatus", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public bool DeleteUser(Int32 UID)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[1];        
        parm[0] = new SqlParameter("@UID", SqlDbType.Int);
        parm[0].Value = UID;
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "DeleteUser", parm);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public DataSet GetAvailabilityofUserId(string UserId)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[1];
        parm[0] = new SqlParameter("@UserId", SqlDbType.NVarChar);
        parm[0].Value = UserId;
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetUserIdAvailability", parm);
        con.Close();
        return ds;
    }
    public DataSet GetAllUsersInfo()
    {
        con.Open();
        DataSet ds = new DataSet();
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetAllAdminUsersInfo");
        con.Close();
        return ds;
    }  
    public DataSet GetParticularUserData(Int32 uid)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[1];
        parm[0] = new SqlParameter("@uid", SqlDbType.NVarChar);
        parm[0].Value = uid;
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetParticularUserIdData", parm);
        con.Close();
        return ds;
    }   
    //Upload files
    public bool UploadFiles(string FileName, string FileContentType, string Postedby, DateTime Postdate,string UserType, string DocType,string SubFolderName,string FilePath,string Folder)
    {
        con.Open();
        SqlTransaction myTrans = con.BeginTransaction();
        SqlParameter[] parms = new SqlParameter[9];
        parms[0] = new SqlParameter("@FileName", SqlDbType.NVarChar);
        parms[0].Value = FileName;
        parms[1] = new SqlParameter("@FileContentType", SqlDbType.NVarChar);
        parms[1].Value = FileContentType;        
        parms[2] = new SqlParameter("@Postedby", SqlDbType.NVarChar);
        parms[2].Value = Postedby;
        parms[3] = new SqlParameter("@Postdate", SqlDbType.DateTime);
        parms[3].Value = Postdate;
        parms[4] = new SqlParameter("@UserType", SqlDbType.NVarChar);
        parms[4].Value = UserType;
        parms[5] = new SqlParameter("@DocType", SqlDbType.NVarChar);
        parms[5].Value = DocType;
        parms[6] = new SqlParameter("@SubFolderName", SqlDbType.NVarChar);
        if (SubFolderName != null)
        {
            parms[6].Value = SubFolderName;
        }
        else
        {
            parms[6].Value = DBNull.Value;
        }
        parms[7] = new SqlParameter("@FilePath", SqlDbType.NVarChar);
        parms[7].Value = FilePath;
        parms[8] = new SqlParameter("@FolderName", SqlDbType.NVarChar);
        parms[8].Value = FolderName;  
        DBOperations.ExecuteNonQuery(myTrans, CommandType.StoredProcedure, "UploadEmployeeDocs", parms);
        myTrans.Commit();
        con.Close();
        return true;
    }
    public DataSet GetOneEmpDocs(Int32 fid)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[1];
        parm[0] = new SqlParameter("@Id", SqlDbType.Int);
        parm[0].Value = fid;
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetOneEmpDocs", parm);
        con.Close();
        return ds;
    }
    //public DataSet GetSubFolderDocs(string folder,string subfolder,string doctype)
    //{
    //    con.Open();
    //    DataSet ds = new DataSet();
    //    SqlParameter[] parm = new SqlParameter[3];
    //    parm[0] = new SqlParameter("@folder", SqlDbType.NVarChar);
    //    parm[0].Value = folder;
    //    parm[1] = new SqlParameter("@subfolder", SqlDbType.NVarChar);
    //    parm[1].Value = subfolder;
    //    parm[1] = new SqlParameter("@doctype", SqlDbType.NVarChar);
    //    parm[1].Value = doctype;
    //    ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetSubFolderDocs", parm);
    //    con.Close();
    //    return ds;
    //}
    /* Individual Emp Documents*/
    public DataSet GetEmpDocs(string DocType, string Postedby,string UType)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[3];
        parm[0] = new SqlParameter("@DocType", SqlDbType.NVarChar);
        parm[1] = new SqlParameter("@Postedby", SqlDbType.NVarChar);
        parm[2] = new SqlParameter("@UserType", SqlDbType.NVarChar);
        parm[0].Value = DocType;
        parm[1].Value = Postedby;
        parm[2].Value = UType;

        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetEmpDocs",parm);
        con.Close();
        return ds;
    }
    /* Admin Emp Documents */
    public DataSet GetadminEmpDocs(string DocType)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[1];
        parm[0] = new SqlParameter("@DocType", SqlDbType.NVarChar);
        parm[0].Value = DocType;
        
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetadminEmpDocs", parm);
        con.Close();
        return ds;
    }
    public DataSet GetFileName(string filename, string filecontentType, string FilePath)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[3];
        parm[0] = new SqlParameter("@filename", SqlDbType.NVarChar);
        parm[0].Value = filename;
        parm[1] = new SqlParameter("@filecontentType", SqlDbType.NVarChar);
        parm[1].Value = filecontentType;
        parm[2] = new SqlParameter("@FilePath", SqlDbType.NVarChar);
        parm[2].Value = FilePath;
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetFileName", parm);
        con.Close();
        return ds;
    }
    public DataSet GetFileNameinFolder(string filename, string filecontentType,string DocType,string FolderName)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@filename", SqlDbType.NVarChar);
        parm[0].Value = filename;
        parm[1] = new SqlParameter("@filecontentType", SqlDbType.NVarChar);
        parm[1].Value = filecontentType;
        parm[2] = new SqlParameter("@filecontentType", SqlDbType.NVarChar);
        parm[2].Value = filecontentType;
        parm[3] = new SqlParameter("@filecontentType", SqlDbType.NVarChar);
        parm[3].Value = filecontentType;
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetFileName", parm);
        con.Close();
        return ds;
    }
    public DataSet GetSubFolderDocuments(string folder, string subfolder)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@folder", SqlDbType.NVarChar);
        parm[0].Value = folder;
        parm[1] = new SqlParameter("@subfolder", SqlDbType.NVarChar);
        parm[1].Value = subfolder;
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetSubFolderDocuments", parm);
        con.Close();
        return ds;
    }
    public bool Delete_Document(Int32 id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        conn.Open();
        SqlTransaction trans = conn.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[1];
        parm[0] = new SqlParameter("@id", SqlDbType.Int);
        parm[0].Value = id;
        DBOperations.ExecuteNonQuery(trans, CommandType.StoredProcedure, "DeleteDocument", parm);
        trans.Commit();
        conn.Close();
        return true;
    }
    public bool Delete_Folder(string folder,string subfolder)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        conn.Open();
        SqlTransaction trans = conn.BeginTransaction();
        SqlParameter[] parm = new SqlParameter[2];
        parm[0] = new SqlParameter("@folder", SqlDbType.NVarChar);
        parm[0].Value = folder;
        parm[1] = new SqlParameter("@subfolder", SqlDbType.NVarChar);
        parm[1].Value = subfolder;
        DBOperations.ExecuteNonQuery(trans, CommandType.StoredProcedure, "Delete_Folder", parm);
        trans.Commit();
        conn.Close();
        return true;
    }
    /// <summary>
    /// Getting Admin User Permissions
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public DataSet GetUserPermissions(string UType, string LoginId)
    {        
        con.Open();
        DataSet ds = new DataSet();      
        SqlParameter[] parm = new SqlParameter[2];

        parm[0] = new SqlParameter("@UType", SqlDbType.NVarChar);
        parm[0].Value = UType;
        
        parm[1] = new SqlParameter("@LoginId", SqlDbType.NVarChar);
        parm[1].Value = LoginId;

        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetUserPermissions", parm);
        con.Close();
        return ds;
    }
    /// <summary>
    /// Getting Employee User Permissions
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public DataSet GetUserPermissions1(string UType, string LoginId)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[2];
        
        parm[0] = new SqlParameter("@UType", SqlDbType.NVarChar);
        parm[0].Value = "Employee";

        parm[1] = new SqlParameter("@LoginId", SqlDbType.NVarChar);
        parm[1].Value = LoginId;
    
        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "GetUserPermissions", parm);
        con.Close();
        return ds;
    }
    public DataSet Emp_GetUserPermissions(string UType, string LoginId,string emailid)
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlParameter[] parm = new SqlParameter[3];

        parm[0] = new SqlParameter("@UType", SqlDbType.NVarChar);
        parm[0].Value = "Employee";

        parm[1] = new SqlParameter("@LoginId", SqlDbType.NVarChar);
        parm[1].Value = LoginId;
        parm[2] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
        parm[2].Value = emailid;

        ds = DBOperations.ExecuteDataset(con, CommandType.StoredProcedure, "Emp_GetUserPermissions", parm);
        con.Close();
        return ds;
    }
    public DataSet EmployeInfo()
    {
        con.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter sdaa=new SqlDataAdapter("select * from employeereg1",con);
        sdaa.Fill(ds);
        con.Close();
        return ds;
    }    
}

