using System;
using System.Collections;
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

public partial class account_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rbtupload.CheckedChanged += new EventHandler(rbtupload_CheckedChanged);
    }
    
    protected void rbtupload_CheckedChanged(object sender, EventArgs e)
    {
        pnlupload.Visible = true;
        pnlresumemaker.Visible = false;
        Pnlregisterwithoutresume.Visible = false;
        pnlpaste.Visible = false;
    }
    protected void rbtpaste_CheckedChanged(object sender, EventArgs e)
    {
        pnlupload.Visible = false;
        pnlresumemaker.Visible = false;
        Pnlregisterwithoutresume.Visible = false;
        pnlpaste.Visible = true;
    }
    protected void rbtresumemaker_CheckedChanged(object sender, EventArgs e)
    {
        pnlupload.Visible = false;
        pnlresumemaker.Visible = true;
        Pnlregisterwithoutresume.Visible = false;
        pnlpaste.Visible = false;
    }
    protected void rbtregisterwithoutresume_CheckedChanged(object sender, EventArgs e)
    {
        pnlupload.Visible = false;
        pnlresumemaker.Visible = false;
        Pnlregisterwithoutresume.Visible = true;
        pnlpaste.Visible = false;
    }
    protected void btnresumemaker_Click(object sender, EventArgs e)
    {

    }
}
