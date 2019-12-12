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


public partial class Admin_States : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ret"] == "ok")
        {
            body1.Attributes.Add("onload", "return alertdelete()");

        }
        if (Request.QueryString["ret"] == "edit")
        {
            body1.Attributes.Add("onload", "return alertedit()");

        }

        DataSet ds = new DataSet();
        string fulldet = string.Empty;

        fulldet = "<br /><br /><table align='center' width='70%' border='1' valign='top' cellspacing='0' cellpadding='0'>";

        fulldet = fulldet + "<tr> <td colspan='4' align='center' bgcolor='#cccccc' width='100%'><font color='#003399' size='3pt'><b><a href='Admin_States_Create.aspx' >Post New State Name</a></b></font> </td></tr>";

        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='#ffcc99' width='12%'><font color='#cc0099' size='2pt'><b>State Name</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='#ffcc99' width='12%'><font color='#cc0099' size='2pt'><b>Country Code</b></font></td>";

        //fulldet = fulldet + "<td align='center' valign='middle' bgcolor='#ffcc99' width='11%'> <font color='#cc0099' size='2pt'><b>Posted On</b></font></td>";

        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='#ffcc99' width='6%'><font color='#cc0099' size='2pt'><b>Edit</b></font> </td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='#ffcc99' width='6%'><font color='#cc0099' size='2pt'><b>Delete</b></font></td></tr>";

        //String strConnectionString = ConfigurationSettings.AppSettings["DB_Connect"];
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

        //SqlDataAdapter imgtext = new SqlDataAdapter("Select * from cg_State_Master", sqlConnection);
        //SqlDataAdapter imgtext = new SqlDataAdapter("s.intState_id,s.txtState,c.txtCountry_name from cg_State_Master s, cg_Country_Master c where s.intCountryId = c.intCountry_id", sqlConnection);

        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from State_Master left outer join Country_Master on Country_Master.intCountry_id = State_Master.intCountryId order by State_Master.intCountryId", sqlConnection);
        imgtext.Fill(ds, "samp");
        string cnm = string.Empty;

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                cnm = ds.Tables[0].Rows[i]["txtState"].ToString();

                fulldet = fulldet + "<tr><td align='left' class='lable' valign='middle' width='12%' bgcolor='#ffffcc'>";

                fulldet = fulldet + "<a>" + ds.Tables[0].Rows[i]["txtState"].ToString() + "</a>" + "</td><td align='right' class='lable' width='12%' valign='center' bgcolor='#ffffcc'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["txtCountry_name"].ToString() + "</td><td align='right' class='lable' width='12%' valign='center' bgcolor='#ffffcc'>";
                //fulldet = fulldet + ds.Tables[0].Rows[i]["dtEntrydate"].ToString() + "</td><td align='center'class='content' width='6%' valign='center' bgcolor='#ffffcc'>";
                fulldet = fulldet + "<a href='Admin_States_Edit.aspx?cid=" + ds.Tables[0].Rows[i]["intState_id"].ToString() + "'><img src='edit.gif' alt='Edit State Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='#ffffcc'>";
                fulldet = fulldet + "<a href='Admin_States_Delete.aspx?cid=" + ds.Tables[0].Rows[i]["intState_id"].ToString() + "'><img src='delete.gif' alt='Delete State Details' width='16' height='16' border='0' /></a></td></tr>";

            }
        }

        fulldet = fulldet + "</table>";
        tdcontent.InnerHtml = fulldet;

    }


    //protected void gobut_Click(object sender, EventArgs e)
    //{

    //    if (srchtxt.Text != "")
    //    {
    //        DataSet dss = new DataSet();
    //        string fulldets = string.Empty;

    //        fulldets = "<br /><br /><table align='center' width='70%' border='1' valign='top' cellspacing='0' cellpadding='0'>";

    //        fulldets = fulldets + "<tr> <td colspan='4' align='center' bgcolor='#cccccc' width='100%'><font color='#003399' size='3pt'><b>Search Result</b></font> </td></tr>";

    //        fulldets = fulldets + "<tr><td align='center' valign='middle' bgcolor='#ffcc99' width='12%'><font color='#cc0099' size='2pt'><b>State Name</b></font></td>";

    //        fulldets = fulldets + "<td align='center' valign='middle' bgcolor='#ffcc99' width='12%'><font color='#cc0099' size='2pt'><b>Coutnry Code</b></font></td>";

    //      //  fulldets = fulldets + "<td align='center' valign='middle' bgcolor='#ffcc99' width='11%'> <font color='#cc0099' size='2pt'><b>Posted On</b></font></td>";

    //        fulldets = fulldets + "<td align='center' valign='middle' bgcolor='#ffcc99' width='6%'><font color='#cc0099' size='2pt'><b>Edit</b></font> </td>";
    //        fulldets = fulldets + "<td align='center' valign='middle' bgcolor='#ffcc99' width='6%'><font color='#cc0099' size='2pt'><b>Delete</b></font></td></tr>";

    //        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    //        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from cg_State_Master where txtState LIKE " + "'%" + srchtxt.Text.ToString() + "%'", sqlConnection);
    //        imgtext.Fill(dss, "cg_State_Master");

    //        if (!dss.Tables[0].Rows.Count.Equals(0))
    //        {

    //            for (int i = 0; i < dss.Tables[0].Rows.Count; i++)
    //            {

    //                fulldets = fulldets + "<tr><td align='left' class='lable' valign='middle' width='12%' bgcolor='#ffffcc'>";

    //                fulldets = fulldets + "<a>" + dss.Tables[0].Rows[i]["txtState"].ToString() + "</a>" + "</td><td align='right' class='lable' width='12%' valign='center' bgcolor='#ffffcc'>";
    //                fulldets = fulldets + dss.Tables[0].Rows[i]["txtCountry_name"].ToString() + "</td><td align='right' class='lable' width='12%' valign='center' bgcolor='#ffffcc'>";
    //               // fulldets = fulldets + dss.Tables[0].Rows[i]["dtEntrydate"].ToString() + "</td><td align='center' class='content' width='6%' valign='center' bgcolor='#ffffcc'>";
    //                fulldets = fulldets + "<a href='Admin_States_Edit.aspx?cid=" + dss.Tables[0].Rows[i]["intState_id"].ToString() + "'><img src='edit.gif' alt='Edit State Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='#ffffcc'>";
    //                fulldets = fulldets + "<a href='Admin_States_Delete.aspx?cid=" + dss.Tables[0].Rows[i]["intState_id"].ToString() + "'><img src='delete.gif' alt='Delete State Details' width='16' height='16' border='0' /></a></td></tr>";
    //            }
    //        }

    //        fulldets = fulldets + "</table>";
    //        tdcontents.InnerHtml = fulldets;
    //    }
    //    else
    //    {
    //        Response.Redirect("Admin_States.aspx");
    //    }

    //}
}
