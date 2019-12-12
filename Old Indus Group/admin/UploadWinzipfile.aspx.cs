using System;
using System.Collections;
using System.Configuration;
using System.Data;
 
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
 
using System.IO;

public partial class UploadWinzipfile : System.Web.UI.Page
{
    string PhotoName;
    string LoginId;
    AdminCS obj = new AdminCS();
    bool t;
    string FileName;
    string FileContentType;
    string strScript;
    DataSet ds = new DataSet();
    DataSet dsall = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        //LoginId = Convert.ToString(Session["LogInId"]);
        //if (LoginId != "")
        //{
        //    // it will stays in the same page
        //}

        //else
        //{
        //    //After login into the account it will go Post ad
        //    Response.Redirect("Default.aspx");

        //}
        if (!Page.IsPostBack)
        {
            GetEmpDocs();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        LoginId="Admin";
        FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);        
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/EmployeeDocs/" + FileName));
            FileContentType = FileUpload1.PostedFile.ContentType;
            obj.aFileName = FileName;
            obj.aFileContentType = FileContentType;           
            obj.aPostedby = LoginId;
            obj.aPostedate = System.DateTime.Now;
            t = obj.UploadFiles(obj.aFileName, obj.aFileContentType, obj.aPostedby, obj.aPostedate);
            strScript = "alert('File is uploaded successfully.');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertbox", strScript, true);
        }
    }
    protected void lnkDownload(object sender, CommandEventArgs e)
    {
        //To get id of a particular applicant
        Int32 FId = Convert.ToInt16(e.CommandArgument.ToString());
        // Get directory path
        DirectoryInfo directory = new DirectoryInfo(Server.MapPath("~/EmployeeDocs"));
        ////Fill dataset
        ds = obj.GetOneEmpDocs(FId);
        if (!ds.Tables[0].Rows.Count.Equals(0))
        {
            FileName = ds.Tables[0].Rows[0]["FileDocName"].ToString();
        }
        ////Directing to the page download reume by passing file name
        //Response.Redirect("Admin_DownloadDocs.aspx?fname=" + FileName);
        //// The file path to download.

        //string filepath = @"C:\shadow_copy.rar";
        string filepath1 = Server.MapPath("~/EmployeeDocs");
        string filepath = filepath1 + "/" + FileName;

// The file name used to save the file to the client's system..

//string filename = Path.GetFileName( filepath );
System.IO.Stream stream = null;
try
{
// Open the file into a stream.
    stream = new FileStream(filepath, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
   
// Total bytes to read:
long bytesToRead = stream.Length;
Response.ContentType = "application/octet-stream";
Response.AddHeader( "Content-Disposition", "attachment; filename=" + FileName );
// Read the bytes from the stream in small portions.
while ( bytesToRead > 0 )
{
// Make sure the client is still connected.
if ( Response.IsClientConnected )
{
// Read the data into the buffer and write into the
// output stream.
byte[] buffer = new Byte[10000];
int length = stream.Read( buffer, 0, 10000 );
Response.OutputStream.Write(buffer, 0, length);
Response.Flush();
// We have already read some bytes.. need to read
// only the remaining.
bytesToRead = bytesToRead - length;
}
else
{
// Get out of the loop, if user is not connected anymore..
bytesToRead = -1;
}
}
}
catch(Exception ex)
{
Response.Write(ex.Message);
// An error occurred..
}
finally
{
if ( stream != null ) {
stream.Close();
}
}

    }
    public void GetEmpDocs()
    {        
        dsall = obj.GetEmpDocs();
        if (!dsall.Tables[0].Rows.Count.Equals(0))
        {
            dlEmpDocs.DataSource = dsall;
            dlEmpDocs.DataBind();
        }
    }
}
