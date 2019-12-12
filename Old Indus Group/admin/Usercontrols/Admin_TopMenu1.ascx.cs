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

public partial class Usercontrols_Admin_TopMenu : System.Web.UI.UserControl
{
    string Usertype;
    string LoginId;
    DataSet ds = new DataSet();
    AdminCS obj = new AdminCS();

    string ImmigView;
    string ImmigPost;
    string ImmigEdit;
    string ImmigDel;
    string ImmigDown;

    string HRView;
    string HRPost;
    string HREdit;
    string HRDel;
    string HRDown;

    string AccView;
    string AccPost;
    string AccEdit;
    string AccDel;
    string AccDown;

    string DRView;
    string DRPost;
    string DRDel;
    string DRDown;

    string LeavesView;
    string LeavesPost;
    string LeavesEdit;
    string LeavesDel;

    string ARPView;
    string ARPPost;
    string ARPEdit;
    string ARPDel;
    string ARPDown;

    string ExelView;
    string ExelPost;
    string ExelEdit;
    string ExelDel;
    string ExelDown;

    string EmpDocsView;
    string EmpDocsPost;
    string EmpDocsDown;
    string EmpDocsDel;

    string WordView;
    string WordPost;
    string WordEdit;
    string WordDel;
    string WordDown;

    string ResumeView;
    string ResumePost;
    string ResumeEdit;
    string ResumeDel;
    string ResumeDown; 

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["lid"] != null && Request.QueryString["utype"] != null)
        //{
        //    //DataSet dsgetid=
        //    Session["uid"] = Convert.ToString(Request.QueryString["lid"]);
        //    Session["utype"] = Convert.ToString(Request.QueryString["utype"]);
        //    Usertype = Convert.ToString(Session["utype"]);
        //    LoginId = Convert.ToString(Session["uid"]);
        //}
        //else
        //{
            
        //}            
            if (!Page.IsPostBack)
            {
                string sPath = HttpContext.Current.Request.Url.AbsolutePath;
                string[] strarry = sPath.Split('/');
                int lengh = strarry.Length;
                string sRet = strarry[lengh - 1];
                if (sRet == "Company.aspx")
                    ddltypes.SelectedValue = "Company";
                else if (sRet == "Departments.aspx")
                    ddltypes.SelectedValue = "Departments";
                else if (sRet == "Roles.aspx")
                    ddltypes.SelectedValue = "Roles";
                else if (sRet == "Projects.aspx")
                    ddltypes.SelectedValue = "Projects";
                else if (sRet == "Performance-Review.aspx")
                    ddltypes.SelectedValue = "Performance";
                     
                Usertype = Convert.ToString(Session["utype"]);
                LoginId = Convert.ToString(Session["uid"]);          
                GetPermissions();
                if (Usertype == "Admin")
                {
                    tdcreate.Visible = true;
                    tdSepcreate.Visible = true;
                }
                else if (Usertype == "Recruiter")
                {
                    tdcreate.Visible = true;
                    tdSepcreate.Visible = true;
                }
                else
                {
                    tdcreate.Visible = false;
                    tdSepcreate.Visible = false;
                }
                ImmigView = Convert.ToString(Session["ImmigView"]);
                HRView = Convert.ToString(Session["HRView"]);
                AccView = Convert.ToString(Session["AccView"]);
                DRView = Convert.ToString(Session["DRView"]);
                LeavesView = Convert.ToString(Session["LeavesView"]);
                ARPView = Convert.ToString(Session["ARPView"]);
                ExelView = Convert.ToString(Session["ExelView"]);
                EmpDocsView = Convert.ToString(Session["EmpDocsView"]);
                WordView = Convert.ToString(Session["WordView"]);
                ResumeView = Convert.ToString(Session["ResumeView"]);
                if (ImmigView == "1" || HRView == "1" || AccView == "1" || DRView == "1" || LeavesView == "1" || ARPView == "1" || ExelView == "1" || EmpDocsView == "1" || WordView == "1" || ResumeView=="1")
                {
                    tdEmpDocs.Visible = true;
                    tdEmpDocsSep.Visible = true;
                }
                else
                {
                    tdEmpDocs.Visible = false;
                    tdEmpDocsSep.Visible = false;
                }
            }
    }
    protected void lnkALog_click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Admin_Login.aspx");
    }
    protected void ddltype_Select(object sender, EventArgs e)
    {
        if (ddltypes.SelectedItem.Text == "Company")
            Response.Redirect("Company.aspx");
        else if (ddltypes.SelectedItem.Text == "Departments")
            Response.Redirect("Departments.aspx");
        else if (ddltypes.SelectedItem.Text == "Roles")
            Response.Redirect("Roles.aspx");
        else if (ddltypes.SelectedItem.Text == "Projects")
            Response.Redirect("Projects.aspx");
        else if (ddltypes.SelectedItem.Text == "Performance")
            Response.Redirect("Performance-Review.aspx");
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

            Session.Add("WordDel", ds.Tables[0].Rows[0]["WrdDocs_Delete"].ToString());
            Session.Add("WordDown", ds.Tables[0].Rows[0]["WrdDocs_Download"].ToString());
            Session.Add("WordEdit", ds.Tables[0].Rows[0]["WrdDocs_Edit"].ToString());
            Session.Add("WordPost", ds.Tables[0].Rows[0]["WrdDocs_Post"].ToString());
            Session.Add("WordView", ds.Tables[0].Rows[0]["WrdDocs_View"].ToString());


            Session.Add("ResumeDel", ds.Tables[0].Rows[0]["Resume_Delete"].ToString());
            Session.Add("ResumeDown", ds.Tables[0].Rows[0]["Resume_Download"].ToString());
            Session.Add("ResumeEdit", ds.Tables[0].Rows[0]["Resume_Edit"].ToString());
            Session.Add("ResumePost", ds.Tables[0].Rows[0]["Resume_Post"].ToString());
            Session.Add("ResumeView", ds.Tables[0].Rows[0]["Resume_View"].ToString());
        }
    }
}
