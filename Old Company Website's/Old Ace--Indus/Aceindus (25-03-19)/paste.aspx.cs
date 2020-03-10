using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.Office.Interop.Word;

public partial class _paste : System.Web.UI.Page
{
    StreamWriter fp = default(StreamWriter);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Button click event for submitting the entaire form data into the mail
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void submitbutton_Click(object sender, EventArgs e)
    {

        // Convert text format to html format
        string text = txtformat.Text;
        string M = Regex.Replace(text, @"<(.|\n)*?>", string.Empty);
        string Mar = M.Replace("&nbsp;", " ");
        string[] split = Mar.Split(new Char[] { ' ', ',', '.', ':', '\t' }, StringSplitOptions.RemoveEmptyEntries);
        string[] Sid = M.Split(split, StringSplitOptions.RemoveEmptyEntries);
        // string filename = split[0].ToString() + ".docx";
        string dttym = DateTime.Now.ToString("dd-MMM-yyyy") + "_" + DateTime.Now.ToString("HH-mm-ss");
        string filename = split[0].ToString() + dttym + ".docx";
        //object fileName = Server.MapPath(@".\Docs\") + filename;
        object fileName = Server.MapPath("~/Docs/") + filename;
        object readOnly = false;
        object isVisible = true;
        object missing = System.Reflection.Missing.Value;
        Microsoft.Office.Interop.Word.ApplicationClass oWordApp = new Microsoft.Office.Interop.Word.ApplicationClass();
        Microsoft.Office.Interop.Word.Document oWordDoc = oWordApp.Documents.Add(ref missing, ref missing, ref missing, ref missing);
        oWordDoc.Activate();
        oWordApp.Selection.TypeText(text);
        oWordApp.Selection.TypeParagraph();
        oWordDoc.SaveAs(ref fileName, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
        oWordDoc.Close(ref missing, ref missing, ref missing);
        oWordApp.Application.Quit(ref missing, ref missing, ref missing);
    }
}