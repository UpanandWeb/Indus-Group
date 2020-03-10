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
using System.Text;
using Matrimonials.Includes;
using Matrimonials.DALC;
using Matrimonials.BLC;

public partial class ProfileSearch : System.Web.UI.Page
{
    protected StringBuilder strQry = new StringBuilder(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sUserName"] == null)
        {
            tdLogin.Visible = true;
            tdLogout.InnerHtml = "<table><tr><td class=regions>&nbsp;</td><td class=mn-txt>&nbsp;</td><td class=content>&nbsp;</td></tr></table>";
        }
        else
        {
            tdLogout.Visible = true;
            tdLogin.Visible = false;
            //string str = Convert.ToString(Session["
            tdLogout.InnerHtml = "<table><tr><td class=regions>Welcome : </td><td class=mn-txt>" + Session["sUserName"].ToString() + "</td><td class=content>&nbsp;&nbsp;&nbsp;&nbsp;<a href='Logout.aspx' class=white-font>Logout</a></td></tr></table>";
        }
    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.ImgbtnSearch.Click += new System.Web.UI.ImageClickEventHandler(this.ImgbtnSearch_Click);

    }
    #endregion
    protected void ImgbtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        strQry.Append("select distinct intUser_Id as UserId,txtFname as Username,IsNull(Convert(varchar(32),intAge) ,'WIll be Informed Later') as Age,IsNull(Convert(varchar(32),txtDate_of_Birth),'WIll be Informed Later') as DOB,IsNull(Convert(varchar(32),txtMarital_Status) ,'WIll be Informed Later') as Status,IsNull(Convert(varchar(32),RelegionName) ,'WIll be Informed Later') as Relegion,IsNull(Convert(varchar(32),tbl_User_info.intCountry_id) ,'WIll be Informed Later') as CountryId,  ");
        strQry.Append("IsNull(Convert(varchar(32),txtCountry_name) ,'WIll be Informed Later')as ContryName,IsNull(Convert(varchar(32),txtComplexion) ,'WIll be Informed Later') as Complexion,IsNull(Convert(varchar(32),intHeight_Cms) ,'WIll be Informed Later') as Height,IsNull(Convert(varchar(32),txtEdu_Cat) ,'WIll be Informed Later') as Education,IsNull(Convert(varchar(32),txtOcu_Cat) ,'WIll be Informed Later') as Occupation, IsNull(Convert(varchar(32),intState_Id) ,'WIll be Informed Later') as State, IsNull(Convert(varchar(32),intCity_Id) ,'WIll be Informed Later') as City, IsNull(Convert(varchar(500),txtAbt_Myself) ,'WIll be Informed Later') as AboutMySelf     ");
        strQry.Append("from tbl_User_info Inner Join RelegionMaster on RelegionId=txtReligion ");
        strQry.Append(" Inner Join tblCountry_Master on tblCountry_Master.intCountry_Id=tbl_User_info.intCountry_id");
        if (txtPfid.Text != "")
        {
            strQry.Append(" where  txtUname = '" + txtPfid.Text.ToString().Trim() + "'");
        
        Session.Add("strExeQry", strQry.ToString());
        Response.Redirect("Searchups.aspx"); 
        }
          else  
        {
            string strScript = "alert('Please Enter Profile ID').location.Replace('ProfileSearch.aspx');";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alertBox", strScript, true);
        }
    }
}
