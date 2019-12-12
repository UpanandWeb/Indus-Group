using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using System.Text;
using System.Collections.Generic;
using System.Diagnostics;
 



public partial class admin_Admin_UploadDocs : System.Web.UI.Page
{
    int count = 0;
    string dir;
    DirectoryInfo di;
    string activeDir;
    string path;
    string FilePath;
    string DocType;
    string Type;
    string PhotoName;
    string LoginId;
    string DocName;
    public static string folder ;
    public static string subfolder ;
    AdminCS obj = new AdminCS();
    bool t;
    public static string FileName;
    string FileContentType;
    string strScript;
    string Admin_Usertype;
    DataSet ds = new DataSet();
    DataSet dsall = new DataSet();
    string Usertype;
    string Postedby;
    int ImmigView;
    int ImmigPost;
    int ImmigEdit;
    int ImmigDel;
    int ImmigDown;

    int HRView;
    int HRPost;
    int HREdit;
    int HRDel;
    int HRDown;

    int AccView;
    int AccPost;
    int AccEdit;
    int AccDel;
    int AccDown;

    int DRView;
    int DRPost;
    int DRDel;
    int DRDown;

    int LeavesView;
    int LeavesPost;
    int LeavesEdit;
    int LeavesDel;

    int ARPView;
    int ARPPost;
    int ARPEdit;
    int ARPDel;
    int ARPDown;

    int ExelView;
    int ExelPost;
    int ExelEdit;
    int ExelDel;
    int ExelDown;

    int EmpDocsView;
    int EmpDocsPost;
    int EmpDocsDown;
    int EmpDocsDel;
    
    int ResumeView;
    int ResumePost;
    int ResumeEdit;
    int ResumeDel;
    int ResumeDown; 

    SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public static string own = "";

    protected void Page_Load(object sender, EventArgs e)
    {        
        LoginId = Convert.ToString(Session["LogInId"]); 
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
        else
        {
            textdiv.Attributes.Remove("src");
            if (LoginId != "")
            {
                // it will stays in the same page           
            }
            else
            {
                if (Request.QueryString["lid"] != null && Request.QueryString["utype"] != null)
                {
                    Session["uid"] = Convert.ToString(Request.QueryString["lid"]);
                    Session["utype"] = Convert.ToString(Request.QueryString["utype"]);

                    Usertype = Convert.ToString(Session["utype"]);
                    LoginId = Convert.ToString(Session["uid"]);
                    Session["LogInId"] = LoginId;
                }
                else if (Request.QueryString["utype"] == "Recruiter")
                {
                    Session["uid"] = Convert.ToString(Request.QueryString["lid"]);
                    Session["utype"] = Convert.ToString(Request.QueryString["utype"]);

                    Usertype = Convert.ToString(Session["utype"]);
                    LoginId = Convert.ToString(Session["uid"]);
                    Session["LogInId"] = LoginId;
                }
                else
                {
                    //After login into the account it will go Post ad
                    Response.Redirect("Default.aspx");
                }
            }
        }
        
        //Type = Convert.ToString(Request.QueryString["type"]);
        if (!Page.IsPostBack)
        {
            lblAcess.Text = Session["UserName"].ToString();

            ApplyPermissions();
            CheckPermissions();
            //GetEmpDocs();                                  
            if (Request.QueryString["type"] != null)
            {
                Type = Convert.ToString(Request.QueryString["type"]);
                if (Type == "AccDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "ImmigDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "HRDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "ARPDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "DRDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "Leaves")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "ExcelDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "EmpDocs")
                {
                    GetEmpDocs(Type);
                }
                else if (Type == "ResumeDocs")
                {
                    GetEmpDocs(Type);
                }
            }           
        }

    }

    public void CheckPermissions()
    {
        if (rbAcc.Checked == true)
        {
            BindSubfolders("Accounting_Docs");
            lblDoctype.Text = "AccDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbImmig.Checked == true)
        {
            BindSubfolders("Immigration_Docs");
            lblDoctype.Text = "ImmigDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbHR.Checked == true)
        {
            BindSubfolders("HR_Docs");
            lblDoctype.Text = "HRDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbARP.Checked == true)
        {
            BindSubfolders("ARP_Docs");
            lblDoctype.Text = "ARPDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbDR.Checked == true)
        {
            BindSubfolders("Daily_Reports");
            lblDoctype.Text = "DRDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbLeaves.Checked == true)
        {
            BindSubfolders("Leaves");
            lblDoctype.Text = "Leaves";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbExcel.Checked == true)
        {
            BindSubfolders("Excel_Docs");
            lblDoctype.Text = "ExcelDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbEmpDocs.Checked == true)
        {
            BindSubfolders("Employee_Docs");
            lblDoctype.Text = "EmpDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
        else if (rbResume.Checked == true)
        {
            BindSubfolders("Resume_Docs");
            lblDoctype.Text = "ResumeDocs";
            //GetEmpDocs(lblDoctype.Text);
        }
    }
    protected void UploadDocs_Click(object sender, EventArgs e)
    {
        string base_dir = System.AppDomain.CurrentDomain.BaseDirectory;
        DataSet dsfilename=new DataSet();
        path = lblpath.Text;
        DocType = lblDoctype.Text;
        Usertype = Convert.ToString(Session["utype"]);
        if (rbAcc.Checked == true || rbARP.Checked == true || rbDR.Checked == true || rbEmpDocs.Checked == true || rbExcel.Checked == true || rbHR.Checked == true || rbImmig.Checked == true || rbLeaves.Checked == true || rbWord.Checked == true || rbResume.Checked == true)
        {            
            foreach (DataListItem dl in dlSubFolders.Items)
            {
                System.Web.UI.WebControls.CheckBox chkboxFolder = dl.FindControl("chkboxFolder") as System.Web.UI.WebControls.CheckBox;
                if (chkboxFolder.Checked == true)
                    {
                        dir = chkboxFolder.Text;
                        //di = new DirectoryInfo(Server.MapPath("~/" + path + "/" + dir + "/"));
                        di = new DirectoryInfo(base_dir +"/admin/" + path + "/" + dir + "/");
                        activeDir = Convert.ToString(di);                       
                    }                
            }            
            if (FileUpload1.HasFile)
            {
                FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileContentType = FileUpload1.PostedFile.ContentType;
                FilePath = path + "/" + dir + "/" + FileName;
                dsfilename = obj.GetFileName(FileName, FileContentType, FilePath);

                if (dsfilename.Tables[0].Rows.Count.Equals(0))
                {
                    if (activeDir != null)
                    {
                        FileUpload1.SaveAs(activeDir + "\\" + System.IO.Path.GetFileName(FileUpload1.FileName));
                        FilePath = path + "/" + dir + "/" + FileName;
                    }
                    else  
                    {
                        FileUpload1.PostedFile.SaveAs(base_dir + "/admin/" +  path + "/" + FileName);
                        FilePath = path + "/" ;
                    }
                    
                    obj.aFileName = FileName;
                    obj.aFileContentType = FileContentType;
                    obj.aPostedby = LoginId;
                    obj.aPostedate = System.DateTime.Now;
                    obj.aDocType = DocType;
                    obj.aFolderName = path;
                    obj.aSubFolderName = dir;
                    obj.aFilepath = FilePath;
                    obj.aUserType = Usertype;
                    t = obj.UploadFiles(obj.aFileName, obj.aFileContentType, obj.aPostedby, obj.aPostedate,obj.aUserType,obj.aDocType,obj.aSubFolderName,obj.aFilepath,obj.aFolderName);
                    Session["folderstatus"] = null;
                    strScript = "alert('File is uploaded successfully.');location.replace('Admin_UploadDocs.aspx');";
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true); 
                }
                else
                {
                    DocType = dsfilename.Tables[0].Rows[0]["DocType"].ToString();
                    DocConditions(DocType);
                    subfolder = dsfilename.Tables[0].Rows[0]["SubFolder"].ToString();
                    if (subfolder != null)
                    {
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('File Name already existed in " + DocName + " of folder name " + subfolder +  ". ');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('File Name already existed in " + DocName + ". ');", true);
                    }
                }
            }
            else
            {                               
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Please browse a file');", true); 
            }
        }
        else
        {            
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Please select any one Document Type to upload');", true); 
        }        
    }

    
    protected void lnkDownload(object sender, CommandEventArgs e)
    {
        string fileloc = "";
        //object missingType = System.Type.Missing;
        //object readOnly = false;
        //object isVisible = false;
        //object documentFormat = 8;
        //string randomName = DateTime.Now.Ticks.ToString();
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if ((lblAcess.Text == own) || Session["utype"] == "Attorney")
        //{
            //To get id of a particular applicant
            Int32 FId = Convert.ToInt16(e.CommandArgument.ToString());
             //Get directory path
            //Fill dataset
            ds = obj.GetOneEmpDocs(FId);
            if (!ds.Tables[0].Rows.Count.Equals(0))
            {
                FileName = ds.Tables[0].Rows[0]["FileDocName"].ToString();
                folder = ds.Tables[0].Rows[0]["Folder"].ToString();
                subfolder = ds.Tables[0].Rows[0]["SubFolder"].ToString();
            }          
            
            try
            {
                pnlpop.Visible = true;
                string srcloc = string.Empty;
                if (subfolder != "")
                {
                    fileloc = "~/admin/" + folder + "/" + subfolder + "/";
                    srcloc = folder + "/" + subfolder + "/";
                }
                else
                {
                    fileloc = "~/admin/" + folder + "/";
                    srcloc = folder + "/";
                }
                textdiv.Visible = true;
                textdiv.Attributes.Add("src", "https://docs.google.com/viewer?url=http://1indus.com/admin/" + srcloc + FileName + "&embedded=true");
                mdpop.Show();
                //string ext = Path.GetExtension(Server.MapPath(fileloc) + FileName);
                //if (ext == ".doc")
                //{
                //    textdiv.Visible = true;
                //    grd1.Visible = true;
                //    string fpath = Path.GetFullPath(Server.MapPath(fileloc) + FileName);
                //    string[] readText = File.ReadAllLines(fpath);
                //    string[] s1 = new string[readText.Length];
                //    for (int i = 0; i < readText.Length; i++)
                //    {
                //        string s = readText[i];                        
                //        if ((s.Contains("\0") == true) || (s.Contains("�") == true))
                //        {                           
                //            s1[i] = " ";
                //        }
                //        else
                //        {
                //            s1[i] = readText[i].Replace("HYPERLINK", " ");                           
                //        }
                //    }
                //    ArrayList al = new ArrayList(s1);
                //    grd1.DataSource = al;
                //    grd1.DataBind();
                //    //textdiv.InnerHtml = System.Text.Encoding.UTF7.GetString(bytes);
                //    mdpop.Show();
                //}
                //else if ((ext == ".docx") || (ext == ".pdf"))
                //{
                //    textdiv.Visible = true;
                //    grd1.Visible = false;                   
                //    textdiv.Attributes.Add("src", (srcloc + FileName));                    
                //    mdpop.Show();
                    
                //}                
                //else
                //{
                //    pnlpop.Visible = false;
                //    //Response.Redirect("Admin_DownloadDocs.aspx?fname=" + FileName + "&folder=" + folder + "&subfolder=" + subfolder);
                //    ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Message", "<script type='text/javascript'>alert('Unsuppoted file format for preview!!! anyhaw download the file'); window.location='Admin_DownloadDocs.aspx?fname=" + FileName + "&folder=" + folder + "&subfolder=" + subfolder + "';</script>");
                //}               
            }
            catch
            {
                pnlpop.Visible = false;
                //Response.Redirect("Admin_DownloadDocs.aspx?fname=" + FileName + "&folder=" + folder + "&subfolder=" + subfolder);
                ClientScript.RegisterStartupScript(typeof(System.Web.UI.Page), "Message", "<script type='text/javascript'>alert('Unsuppoted file format for preview!!! anyhaw download the file'); window.location='Admin_DownloadDocs.aspx?fname=" + FileName + "&folder=" + folder + "&subfolder=" + subfolder + "';</script>");
                //body1.Attributes.Add("onload", "return fileformat()");        
            }
            //killproc();             
            GetEmpDocs(lblDoctype.Text);
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");
    }   
    //void killproc()
    //{
    //    Process[] procs = Process.GetProcessesByName("winword");
    //    foreach (Process proc in procs)
    //        proc.Kill();
    //}
    protected void btncan_Click(object sender, EventArgs e)
    {
        GetEmpDocs(lblDoctype.Text);
    }

    protected void btnprint_Click(object sender, EventArgs e)
    {
        GetEmpDocs(lblDoctype.Text);
    }

    protected void btndown_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_DownloadDocs.aspx?fname=" + FileName + "&folder=" + folder + "&subfolder=" + subfolder);
    }

    protected void lnkView(object sender, CommandEventArgs e)
    {
        trSubFiles.Visible = true;
        DataSet dssubdoc = new DataSet();
        string[] arg = new string[2];
        arg = e.CommandArgument.ToString().Split(';');
        lblFolder.Text = arg[0];
        lblSubFolder.Text = arg[1];
        obj.aFolderName = arg[0];
        obj.aSubFolderName = arg[1];
        lblDoctype.Text = arg[2];
        dssubdoc = obj.GetSubFolderDocuments(obj.aFolderName, obj.aSubFolderName);
        if (!dssubdoc.Tables[0].Rows.Count.Equals(0))
        {
            dlSubFolderFiles.DataSource = dssubdoc;
            dlSubFolderFiles.DataBind();
            dlSubFolderFiles.Visible = true;
            GetEmpDocs(lblDoctype.Text);
        }
        else
        {
            dlSubFolderFiles.Visible = false;
            GetEmpDocs(lblDoctype.Text);
        }        
    }
    public void GetEmpDocs(string DocType1)
    {
        DocConditions(DocType1);
        Postedby = Session["uid"].ToString();
        Usertype = Convert.ToString(Session["utype"]);
        if (Postedby == "admin")
        {
            dsall = obj.GetadminEmpDocs(DocType1);
        }
        else if (Usertype == "Recruiter")
        {           
            dsall = obj.GetEmpDocs(DocType1, Postedby,Usertype);
        }
        else
        {
            dsall = obj.GetEmpDocs(DocType1, Postedby, Usertype);
        }

        DataTable dt = dsall.Tables[0];
        String[] keycolumns = new String[] { "SubFolder" };
        RemoveDuplicates(dt, keycolumns);
        if (!dsall.Tables[0].Rows.Count.Equals(0))
        {
            dlEmpDocs.DataSource = dsall;
            dlEmpDocs.DataBind();
            dlEmpDocs.Visible = true;
            lbllMsg.Text = "";            
            lblDoc.Text = DocName;
        }
        else
        {
            dlSubFolderFiles.Visible = false;
            dlEmpDocs.Visible = false;
            trSubFiles.Visible = false;
            lbllMsg.Text = "No records found for " + DocName;
            lblDoc.Text = "";
        }
    }

    public void DocConditions(string DocType)
    {
        if (DocType == "AccDocs")
        {
            DocName = "Accounting Documents";
        }
        else if (DocType == "ImmigDocs")
        {
            DocName = "Immigration Documents";
        }
        else if (DocType == "HRDocs")
        {
            DocName = "HR Documents";
        }
        else if (DocType == "ARPDocs")
        {
            DocName = "ARP Documents";
        }
        else if (DocType == "DRDocs")
        {
            DocName = "Daily Reports";
        }
        else if (DocType == "Leaves")
        {
            DocName = "Leaves";
        }
        else if (DocType == "ExcelDocs")
        {
            DocName = "Excel Documents";
        }
        else if (DocType == "EmpDocs")
        {
            DocName = "Employee Documents";
        }
        else if (DocType == "WordDocs")
        {
            DocName = "Word Documents";
        }
        else if (DocType == "Resumes")
        {
            DocName = "Resumes";
        }
    }
    /// <summary>
    /// To remove duplicate values from data table
    /// </summary>
    /// <param name="tbl"></param>
    /// <param name="keyColumns"></param>
    /// <returns></returns>
    private DataTable RemoveDuplicates(DataTable tbl, String[] keyColumns)
    {
        int rowNdx = 0;
        try
        {
            while (rowNdx < tbl.Rows.Count - 1)
            {
                DataRow[] dups = FindDups(tbl, rowNdx, keyColumns);
                if (dups.Length > 0)
                {
                    foreach (DataRow dup in dups)
                    {
                        tbl.Rows.Remove(dup);
                    }
                }
                else
                {
                    rowNdx++;

                }
            }
        }
        catch (Exception ex)
        {

        }
        return tbl;
    }

    /// <summary>
    /// To find duplicate values
    /// </summary>
    /// <param name="tbl"></param>
    /// <param name="sourceNdx"></param>
    /// <param name="keyColumns"></param>
    /// <returns></returns>
    private DataRow[] FindDups(DataTable tbl, int sourceNdx, String[] keyColumns)
    {
        ArrayList retVal = new ArrayList();
        try
        {
            DataRow sourceRow = tbl.Rows[sourceNdx];
            for (int i = sourceNdx + 1; i < tbl.Rows.Count; i++)
            {
                DataRow targetRow = tbl.Rows[i];
                if (IsDup(sourceRow, targetRow, keyColumns))
                {
                    if (retVal.Count.Equals(0))
                        retVal.Add(sourceRow);
                    //retVal.Add(targetRow);
                }
            }
        }
        catch (Exception ex)
        {

        }
        return (DataRow[])retVal.ToArray(typeof(DataRow));
    }
    /// <summary>
    /// Executes when the data row has duplicate
    /// </summary>
    /// <param name="sourceRow"></param>
    /// <param name="targetRow"></param>
    /// <param name="keyColumns"></param>
    /// <returns></returns>
    private bool IsDup(DataRow sourceRow, DataRow targetRow, String[] keyColumns)
    {
        bool retVal = true;
        try
        {
            foreach (String column in keyColumns)
            {
                if (sourceRow.Table.Columns.Contains(column))
                {
                    retVal = retVal && sourceRow[column].Equals(targetRow[column]);
                    if (!retVal) break;
                }
            }
        }
        catch (Exception ex)
        {

        }
        return retVal;
    }

    protected void lnkDeleteDoc(object sender, CommandEventArgs e)
    {
        //own = ConfigurationManager.AppSettings["owner"].ToString();
        //if (lblAcess.Text == own)
        //{
            string Base_Direc = System.AppDomain.CurrentDomain.BaseDirectory;
            DataSet dsdelete = new DataSet();
            Int32 Id = Convert.ToInt32(e.CommandArgument.ToString());
            dsdelete = obj.GetOneEmpDocs(Id);
            if (!dsdelete.Tables[0].Rows.Count.Equals(0))
            {
                folder = dsdelete.Tables[0].Rows[0]["Folder"].ToString();
                subfolder = dsdelete.Tables[0].Rows[0]["SubFolder"].ToString();
                FileName = dsdelete.Tables[0].Rows[0]["FileDocName"].ToString();
                Type = dsdelete.Tables[0].Rows[0]["DocType"].ToString();
            }
            if (subfolder != "")
            {
                FilePath = folder + "/" + subfolder + "/" + FileName;
            }
            else
            {
                FilePath = folder + "/" + FileName;
            }
            string strPath = Base_Direc + "/admin/"+ FilePath;
            System.IO.File.Delete(strPath);
            t = obj.Delete_Document(Id);
            if (t == true)
            {
                strScript = "alert('Document is deleted Successfully');location.replace('Admin_UploadDocs.aspx?type=" + Type + "');";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
            }
        //}
        //else
        //    body1.Attributes.Add("onload", "return alertdelete12()");


        //GetEmpDocs(lblDoctype.Text);
    }

    public void ApplyPermissions()
    {
        Usertype = Convert.ToString(Session["utype"]);
        if (Usertype == "Recruiter")
        {
            GetPermissions();
            trrbAcc.Visible = false;
            trrbARP.Visible = false;
            trrbDR.Visible = false;
            trrbEmpDocs.Visible = false;
            trrbExcel.Visible = false;
            trrbHR.Visible = false;
            trrbImmig.Visible = false;
            trrbLeaves.Visible = false;
            trWord.Visible = false;
            trResume.Visible = true;
            tdlnkAccDos.Visible = false;
            tdlnkARPDocs.Visible = false;
            tdlnkDR.Visible = false;
            tdlnkEmpDocs.Visible = false;
            tdlnkExcel.Visible = false;
            tdlnkHRDocs.Visible = false;
            tdlnkImmigDocs.Visible = false;
            tdlnkLeaves.Visible = false;
            tdlnkResume.Visible = true;
            tdlnkResume.Align = "Center";
            tdlnkWord.Visible = false;

        }
        else
        {
            GetPermissions();

            // Immigration Documents
            ImmigView = Convert.ToInt16(Session["ImmigView"]);
            ImmigPost = Convert.ToInt16(Session["ImmigPost"]);
            ImmigDel = Convert.ToInt16(Session["ImmigDel"]);
            ImmigDown = Convert.ToInt16(Session["ImmigDown"]);
            ImmigEdit = Convert.ToInt16(Session["ImmigEdit"]);
            if (ImmigView == 1)
            {
                tdlnkImmigDocs.Visible = true;
            }
            else if (ImmigView == 0)
            {
                tdlnkImmigDocs.Visible = false;
            }
            if (ImmigPost == 1)
            {
                rbImmig.Visible = true;
            }
            else if (ImmigPost == 0)
            {
                rbImmig.Visible = false;
            }
            if (ImmigDown == 1)
            {
            }
        //resume
            //ResumeView = Convert.ToInt16(Session["ResumeView"]);
            //ResumePost = Convert.ToInt16(Session["ResumePost"]);
            //ResumeDel = Convert.ToInt16(Session["ResumeDel"]);
            //ResumeDown = Convert.ToInt16(Session["ResumeDown"]);
            //ResumeEdit = Convert.ToInt16(Session["ResumeEdit"]);

            //if (ResumeView == 1)
            //{
            //    tdlnkResume.Visible = true;
            //}
            //else if (ResumeView == 0)
            //{
            //    tdlnkResume.Visible = false;
            //}
            //if (ResumePost == 1)
            //{
            //    rbResume.Visible = true;
            //}
            //else if (ResumePost == 0)
            //{
            //    rbResume.Visible = false;
            //}
            //if (ResumeDown == 1)
            //{
            //}

            // Accounting Documents
            AccDel = Convert.ToInt16(Session["AccDel"]);
            AccDown = Convert.ToInt16(Session["AccDown"]);
            AccEdit = Convert.ToInt16(Session["AccEdit"]);
            AccPost = Convert.ToInt16(Session["AccPost"]);
            AccView = Convert.ToInt16(Session["AccView"]);
            if (AccView == 1)
            {
                tdlnkAccDos.Visible = true;
            }
            else if (AccView == 0)
            {
                tdlnkAccDos.Visible = false;
            }
            if (AccPost == 1)
            {
                rbAcc.Visible = true;
            }
            else if (AccPost == 0)
            {
                rbAcc.Visible = false;
            }

            // HR
            HRDel = Convert.ToInt16(Session["HRDel"]);
            HRDown = Convert.ToInt16(Session["HRDown"]);
            HREdit = Convert.ToInt16(Session["HREdit"]);
            HRPost = Convert.ToInt16(Session["HRPost"]);
            HRView = Convert.ToInt16(Session["HRView"]);
            if (HRView == 1)
            {
                tdlnkHRDocs.Visible = true;
            }
            else if (HRView == 0)
            {
                tdlnkHRDocs.Visible = false;
            }
            if (HRPost == 1)
            {
                rbHR.Visible = true;
            }
            else if (HRPost == 0)
            {
                rbHR.Visible = false;
            }

            // ARP
            ARPDel = Convert.ToInt16(Session["ARPDel"]);
            ARPDown = Convert.ToInt16(Session["ARPDown"]);
            ARPEdit = Convert.ToInt16(Session["ARPEdit"]);
            ARPPost = Convert.ToInt16(Session["ARPPost"]);
            ARPView = Convert.ToInt16(Session["ARPView"]);
            if (ARPView == 1)
            {
                tdlnkARPDocs.Visible = true;
            }
            else if (ARPView == 0)
            {
                tdlnkARPDocs.Visible = false;
            }
            if (ARPPost == 1)
            {
                rbARP.Visible = true;
            }
            else if (ARPPost == 0)
            {
                rbARP.Visible = false;
            }

            // Employee
            if (EmpDocsDel != 0 || EmpDocsDel != 1 || EmpDocsDown != 0 || EmpDocsDown != 1 || EmpDocsPost != 0 || EmpDocsPost != 1 || EmpDocsView != 0 || EmpDocsView != 0)
            {
            }
            else
            {
                EmpDocsDel = Convert.ToInt16(Session["EmpDocsDel"]);
                EmpDocsDown = Convert.ToInt16(Session["EmpDocsDown"]);
                EmpDocsPost = Convert.ToInt16(Session["EmpDocsPost"]);
                EmpDocsView = Convert.ToInt16(Session["EmpDocsView"]);

                if (EmpDocsView == 1)
                {
                    tdlnkEmpDocs.Visible = true;
                }
                else if (EmpDocsView == 0)
                {
                    tdlnkEmpDocs.Visible = false;
                }
                if (EmpDocsPost == 1)
                {
                    rbEmpDocs.Visible = true;
                }
                else if (EmpDocsPost == 0)
                {
                    rbEmpDocs.Visible = false;
                }
            }

            // Daily Reports
            DRDel = Convert.ToInt16(Session["DRDel"]);
            DRDown = Convert.ToInt16(Session["DRDown"]);
            DRPost = Convert.ToInt16(Session["DRPost"]);
            DRView = Convert.ToInt16(Session["DRView"]);
            if (DRView == 1)
            {
                tdlnkDR.Visible = true;
            }
            else if (DRView == 0)
            {
                tdlnkDR.Visible = false;
            }
            if (DRPost == 1)
            {
                rbDR.Visible = true;
            }
            else if (DRPost == 0)
            {
                rbDR.Visible = false;
            }

            // Time & Attendance
            LeavesDel = Convert.ToInt16(Session["LeavesDel"]);
            LeavesEdit = Convert.ToInt16(Session["LeavesEdit"]);
            LeavesPost = Convert.ToInt16(Session["LeavesPost"]);
            LeavesView = Convert.ToInt16(Session["LeavesView"]);
            if (LeavesView == 1)
            {
                tdlnkLeaves.Visible = true;
            }
            else if (LeavesView == 0)
            {
                tdlnkLeaves.Visible = false;
            }
            if (LeavesPost == 1)
            {
                rbLeaves.Visible = true;
            }
            else if (LeavesPost == 0)
            {
                rbLeaves.Visible = false;
                trUpload.Visible = false;
            }

            // Excell
            ExelDel = Convert.ToInt16(Session["ExelDel"]);
            ExelDown = Convert.ToInt16(Session["ExelDown"]);
            ExelEdit = Convert.ToInt16(Session["ExelEdit"]);
            ExelPost = Convert.ToInt16(Session["ExelPost"]);
            ExelView = Convert.ToInt16(Session["ExelView"]);
            if (ExelView == 1)
            {
                tdlnkExcel.Visible = true;
            }
            else if (ExelView == 0)
            {
                tdlnkExcel.Visible = false;
            }
            if (ExelPost == 1)
            {
                rbExcel.Visible = true;
                trUpload.Visible = true;
            }
            else if (ExelPost == 0)
            {
                rbExcel.Visible = false;
            }


            if (ImmigPost == 1 || AccPost == 1 || HRPost == 1 || ARPPost == 1 || DRPost == 1 || LeavesPost == 1 || ExelPost == 1 || EmpDocsPost == 1 )
            {
                trUpload.Visible = true;
                trViewFolders.Visible = true;
                trSubfoldersView.Visible = true;
                trsubfolderHeading.Visible = true;
                trSubFolderCreation.Visible = true;
                trRFVFolder.Visible = true;
                trselectType.Visible = true;
                trHeading.Visible = true;
            }
            else
            {
                trUpload.Visible = false;
                trViewFolders.Visible = false;
                trSubfoldersView.Visible = false;
                trsubfolderHeading.Visible = false;
                trSubFolderCreation.Visible = false;
                trRFVFolder.Visible = false;
                trselectType.Visible = false;
                trHeading.Visible = false;
            }
            if (ImmigView == 1 || AccView == 1 || HRView == 1 || ARPView == 1 || DRView == 1 || LeavesView == 1 || ExelView == 1 || EmpDocsView == 1 )
            {
                trViewFolders.Visible = true;
            }
            else
            {
                trViewFolders.Visible = false;
            }

        }
    }

    protected void lnkImmigDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "ImmigDocs";       
        GetEmpDocs("ImmigDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;                
    }

    protected void lnkAccDos_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "AccDocs";        
        GetEmpDocs("AccDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;  
    }

    protected void lnkHRDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "HRDocs";       
        GetEmpDocs("HRDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkARPDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "ARPDocs";       
        GetEmpDocs("ARPDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkEmpDocs_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "EmpDocs";        
        GetEmpDocs("EmpDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkDR_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "DRDocs";        
        GetEmpDocs("DRDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkLeaves_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblDoctype.Text = "Leaves";
        GetEmpDocs("Leaves");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkExcel_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblpath.Text = "Excel_Docs";
        GetEmpDocs("ExcelDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkWord_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblpath.Text = "Word_Docs";
        GetEmpDocs("WordDocs");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    protected void lnkResume_Click(object sender, EventArgs e)
    {
        Usertype = Convert.ToString(Session["utype"]);
        lblpath.Text = "Resume_Docs";
        GetEmpDocs("Resumes");
        trSubFiles.Visible = false;
        dlSubFolderFiles.Visible = false;
        trEmployeeDocs.Visible = true;
    }

    private void BindSubfolders(string foldername)
    {
        string Base_Direc = System.AppDomain.CurrentDomain.BaseDirectory;
        DirectoryInfo di = new DirectoryInfo(Base_Direc + "/admin/" + foldername + "/" );
      
        string[] folders = System.IO.Directory.GetDirectories(Base_Direc + "/admin/" + foldername + "/", "*", System.IO.SearchOption.AllDirectories);
        if (folders.Length != 0)
        {
            trFolderheading.Visible = true;
            dlSubFolders.DataSource = di.GetDirectories();
            dlSubFolders.DataBind();
            lblFolderExistance.Visible = false;
            dlSubFolders.Visible = true;
        }
        else
        {
            trFolderheading.Visible = false;
            lblFolderExistance.Visible = true;
            dlSubFolders.Visible = false;
        }
    }
    protected void btnCreateFolder_Click(object sender, EventArgs e)
    {
        string Base_Di = System.AppDomain.CurrentDomain.BaseDirectory;
        dir = txtFolderName.Text;
        path = lblpath.Text;
        //string query = "select count(SubFolder) as count from EmployeeDocs where Folder='" + path + "'";
        //DataSet dsSubFolder = new DataSet();
        //SqlDataAdapter sdaSubFolder = new SqlDataAdapter(query, sqlConnection);
        //sdaSubFolder.Fill(dsSubFolder);

        if (dir != "")
        {
            if (path != "")
            {
                di = new DirectoryInfo(Base_Di +"/admin/" +  path + "/" + dir + "/");
                activeDir = Convert.ToString(di);
                count = dlSubFolders.Items.Count;

                if (count <= 10)
                {
                    if (!Directory.Exists(activeDir))
                    {
                        Directory.CreateDirectory(activeDir);
                        strScript = "alert('Folder created Successfully');";
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
                        Session["folderstatus"] = null;
                        //lblFolderStatus.Text = "directory created sucefully";
                    }
                    else
                    {
                        //strScript = "alert('" + dir + " already exists');";
                        strScript = "alert('Please Create folder');";
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
                        //lblFolderStatus.Text = dir + " already exists";
                        Session["folderstatus"] = null;
                    }
                    BindSubfolders(path);
                }
                else
                {
                    strScript = "alert('sorry! You can create only five folders .');";
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
                    Session["folderstatus"] = null;
                }
            }
            else
            {
                strScript = "alert('Please select document type to create new folder');";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
                Session["folderstatus"] = null;
            }
        }
        else
        {
            strScript = "alert('Please create folder');";
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
        }
        txtFolderName.Text = "";
    }

    protected void rbImmig_CheckedChanged(object sender, EventArgs e)
    {
        if (rbImmig.Checked == true)
        {
            BindSubfolders("Immigration_Docs");
            lblpath.Text="Immigration_Docs";
            lblDoctype.Text = "ImmigDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Immigration Documents";            
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbAcc_CheckedChanged(object sender, EventArgs e)
    {
        if (rbAcc.Checked == true)
        {
            BindSubfolders("Accounting_Docs");
            lblpath.Text="Accounting_Docs";
            lblDoctype.Text = "AccDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Accounting Documents";
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbHR_CheckedChanged(object sender, EventArgs e)
    {
        if (rbHR.Checked == true)
        {
            BindSubfolders("HR_Docs");
            lblpath.Text="HR_Docs";
            lblDoctype.Text = "HRDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "HR Documents";
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbARP_CheckedChanged(object sender, EventArgs e)
    {
        if (rbARP.Checked == true)
        {
            BindSubfolders("ARP_Docs");
            lblpath.Text="ARP_Docs";
            lblDoctype.Text = "ARPDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "ARP Documents";
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbDR_CheckedChanged(object sender, EventArgs e)
    {
        if (rbDR.Checked == true)
        {
            BindSubfolders("Daily_Reports");
            lblpath.Text="Daily_Reports";
            lblDoctype.Text = "DRDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Daily Reports";
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbLeaves_CheckedChanged(object sender, EventArgs e)
    {
        if (rbLeaves.Checked == true)
        {
            BindSubfolders("Leaves");
            lblpath.Text="Leaves";
            lblDoctype.Text = "Leaves";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Leaves";
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbExcel_CheckedChanged(object sender, EventArgs e)
    {
        if (rbExcel.Checked == true)
        {
            BindSubfolders("Excel_Docs");
            lblpath.Text="Excel_Docs";
            lblDoctype.Text = "ExcelDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Excel Documents";
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbEmpDocs_CheckedChanged(object sender, EventArgs e)
    {
        if (rbEmpDocs.Checked == true)
        {
            BindSubfolders("Employee_Docs");
            lblpath.Text="Employee_Docs";
            lblDoctype.Text = "EmpDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Employee Documents";            
            trEmployeeDocs.Visible = false;
            DocName=Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbWord_CheckedChanged(object sender, EventArgs e)
    {
        if (rbWord.Checked == true)
        {
            BindSubfolders("Word_Docs");
            lblpath.Text = "Word_Docs";
            lblDoctype.Text = "WordDocs";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Word Documents";
            trEmployeeDocs.Visible = false;
            DocName = Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void rbResume_CheckedChanged(object sender, EventArgs e)
    {
        if (rbResume.Checked == true)
        {
            BindSubfolders("Resume_Docs");
            lblpath.Text = "Resume_Docs";
            lblDoctype.Text = "Resumes";
            trSubFiles.Visible = false;
            dlEmpDocs.Visible = false;
            dlSubFolderFiles.Visible = false;
            Session["folderstatus"] = null;
            lblDocName.Text = "Resumes";
            trEmployeeDocs.Visible = false;
            DocName = Convert.ToString(lblDocName.Text);
            lblFolderExistance.Text = "No Folders are available in " + DocName;
        }
    }

    protected void dlEmpDocs_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblSubFolder=(Label)e.Item.FindControl("lblSubFolder");
        LinkButton lnkBtnDownload = (LinkButton)e.Item.FindControl("lnkBtnDownload");
        LinkButton lnkFolderName = (LinkButton)e.Item.FindControl("lnkFolderName");
        //LinkButton lnkBtnDeleteFile = (LinkButton)e.Item.FindControl("lnkBtnDeleteFile");
       // LinkButton lnkBtnDeleteFolder = (LinkButton)e.Item.FindControl("lnkBtnDeleteFolder");
        if (lblSubFolder != null)
        {
            if (lblSubFolder.Text != "")
            {
                lnkFolderName.Visible = true;
                lnkBtnDownload.Visible = false;
                //lnkBtnDeleteFile.Visible = false;
                //lnkBtnDeleteFolder.Visible = true;
            }
            else
            {
                lnkBtnDownload.Visible = true;
                lnkFolderName.Visible = false;
                //lnkBtnDeleteFile.Visible = true;
                //lnkBtnDeleteFolder.Visible = false;
            }
        }        
    }

    protected void chkboxFolder_CheckChanged(object sender, EventArgs e)
    {
        string checkedStatus;
        System.Web.UI.WebControls.CheckBox chkboxFolder = sender as System.Web.UI.WebControls.CheckBox;
        if (chkboxFolder.Checked == true)
        {
            if (Session["folderstatus"] == null)
            {
                checkedStatus ="Checked";
                Session["folderstatus"] = checkedStatus;
            }
            else
            {
                strScript = "alert('You should select only one check box');";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), strScript, true);
                chkboxFolder.Checked = false;
            }
        }
        else if (chkboxFolder.Checked == false)
        {
            Session["folderstatus"] = null;
            chkboxFolder.Checked = false;
        }
    }

    public void GetPermissions()
    {
        ds = obj.GetUserPermissions(Usertype, LoginId);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            Session.Add("ImmigDel", ds.Tables[0].Rows[0]["ImmigDocs_Delete"].ToString());
            Session.Add("ImmigDown", ds.Tables[0].Rows[0]["ImmigDocs_Download"].ToString());
            Session.Add("ImmigEdit", ds.Tables[0].Rows[0]["ImmigDocs_Edit"].ToString());
            Session.Add("ImmigPost", ds.Tables[0].Rows[0]["ImmigDocs_Post"].ToString());
            Session.Add("ImmigView", ds.Tables[0].Rows[0]["ImmigDocs_View"].ToString());

            Session.Add("HRDel", ds.Tables[0].Rows[0]["HRDocs_Delete"].ToString());
            Session.Add("HRDown", ds.Tables[0].Rows[0]["HRDocs_Download"].ToString());
            Session.Add("HREdit", ds.Tables[0].Rows[0]["HRDocs_Edit"].ToString());
            Session.Add("HRPost", ds.Tables[0].Rows[0]["HRDocs_Post"].ToString());
            Session.Add("HRView", ds.Tables[0].Rows[0]["HRDocs_View"].ToString());

            Session.Add("AccDel", ds.Tables[0].Rows[0]["AccDocs_Delete"].ToString());
            Session.Add("AccDown", ds.Tables[0].Rows[0]["AccDocs_Download"].ToString());
            Session.Add("AccEdit", ds.Tables[0].Rows[0]["AccDocs_Edit"].ToString());
            Session.Add("AccPost", ds.Tables[0].Rows[0]["AccDocs_Post"].ToString());
            Session.Add("AccView", ds.Tables[0].Rows[0]["AccDocs_View"].ToString());

            Session.Add("DRDel", ds.Tables[0].Rows[0]["DailyReports_Delete"].ToString());
            Session.Add("DRDown", ds.Tables[0].Rows[0]["DailyReports_Download"].ToString());
            Session.Add("DRPost", ds.Tables[0].Rows[0]["DailyReports_Post"].ToString());
            Session.Add("DRView", ds.Tables[0].Rows[0]["DailyReports_View"].ToString());

            Session.Add("LeavesDel", ds.Tables[0].Rows[0]["Leaves_Delete"].ToString());
            Session.Add("LeavesEdit", ds.Tables[0].Rows[0]["Leaves_Edit"].ToString());
            Session.Add("LeavesPost", ds.Tables[0].Rows[0]["Leaves_Post"].ToString());
            Session.Add("LeavesView", ds.Tables[0].Rows[0]["Leaves_View"].ToString());

            Session.Add("ARPDel", ds.Tables[0].Rows[0]["ARPDocs_Delete"].ToString());
            Session.Add("ARPDown", ds.Tables[0].Rows[0]["ARPDocs_Download"].ToString());
            Session.Add("ARPEdit", ds.Tables[0].Rows[0]["ARPDocs_Edit"].ToString());
            Session.Add("ARPPost", ds.Tables[0].Rows[0]["ARPDocs_Post"].ToString());
            Session.Add("ARPView", ds.Tables[0].Rows[0]["ARPDocs_View"].ToString());

            Session.Add("ExelDel", ds.Tables[0].Rows[0]["Excel_Delete"].ToString());
            Session.Add("ExelDown", ds.Tables[0].Rows[0]["Excel_Download"].ToString());
            Session.Add("ExelEdit", ds.Tables[0].Rows[0]["Excel_Edit"].ToString());
            Session.Add("ExelPost", ds.Tables[0].Rows[0]["Excel_Post"].ToString());
            Session.Add("ExelView", ds.Tables[0].Rows[0]["Excel_View"].ToString());

            Session.Add("EmpDocsDel", ds.Tables[0].Rows[0]["EmpDoc_Delete"].ToString());
            Session.Add("EmpDocsDown", ds.Tables[0].Rows[0]["EmpDoc_Download"].ToString());
            Session.Add("EmpDocsPost", ds.Tables[0].Rows[0]["EmpDoc_Post"].ToString());
            Session.Add("EmpDocsView", ds.Tables[0].Rows[0]["EmpDoc_View"].ToString());

            Session.Add("ResumeDel", ds.Tables[0].Rows[0]["Resume_Delete"].ToString());
            Session.Add("ResumeDown", ds.Tables[0].Rows[0]["Resume_Download"].ToString());
            Session.Add("ResumeEdit", ds.Tables[0].Rows[0]["Resume_Edit"].ToString());
            Session.Add("ResumePost", ds.Tables[0].Rows[0]["Resume_Post"].ToString());
            Session.Add("ResumeView", ds.Tables[0].Rows[0]["Resume_View"].ToString());
        }
    }
}
