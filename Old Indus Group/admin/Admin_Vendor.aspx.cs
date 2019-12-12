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

public partial class Admin_Vendor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Admin_Login.aspx");
        }
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

        fulldet = "<br /><br /><table width='100%' border='1' cellspacing='0' cellpadding='0'>";

        fulldet = fulldet + "<tr> <td colspan='4' align='center' bgcolor='white' width='100%'><font color='#003399' size='3pt'><b>Vendors List</b></font> </td>";

        if (Session["Addp"].ToString() != "N")
            fulldet = fulldet + "<td colspan='3' align='center' bgcolor='white' width='100%'><font color='#003399' size='3pt'><b><a href='Admin_VendorCreate.aspx' >Post New Vendor Details</a></b></font> </td></tr>";
        else
            fulldet = fulldet + "<td colspan='3' align='center' bgcolor='white' width='100%'><font color='#003399' size='3pt'><b></b></font> </td></tr>";

        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='white' width='22%'><font color='#003399' size='2pt'><b>Vendor Name</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='12%'><font color='#003399' size='2pt'><b>Contact Person</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='10%'> <font color='#003399' size='2pt'><b>Company URL</b></font></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='11%'> <font color='#003399' size='2pt'><b>City</b></font></td>";


        fulldet = fulldet + "<td colspan='3' align='center' valign='middle' bgcolor='white' width='12%'> <font color='white' size='2pt'><b>Actions</b></font></td>";
        fulldet = fulldet + "<tr><td align='center' valign='middle' bgcolor='white' width='22%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='22%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='11%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='11%' border='0'></td>";
        fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>View</b></font> </td>";

        if (Session["Editp"].ToString() != "N" && Session["Deletep"].ToString() != "N")
        {
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Edit</b></font> </td>";
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Delete</b></font></td></tr>";
        }

        if (Session["Editp"].ToString() != "N" && Session["Deletep"].ToString() == "N")
        {
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Edit</b></font> </td>";
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'></td></tr>";
        }
        if (Session["Editp"].ToString() == "N" && Session["Deletep"].ToString() != "N")
        {
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Delete</b></font></td>";
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'></td></tr>";
        }

        if (Session["Editp"].ToString() == "N" && Session["Deletep"].ToString() == "N")
        {
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'></td>";
            fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'></td></tr>";
        }

        //fulldet = fulldet + "<td align='center' valign='middle' bgcolor='white' width='6%'><font color='#003399' size='2pt'><b>Delete</b></font></td></tr>";


        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        SqlDataAdapter imgtext = new SqlDataAdapter("Select * from clientregistration order by Pdate ", sqlConnection);
        imgtext.Fill(ds, "clientregistration");
        string cnm = string.Empty;

        if (!ds.Tables[0].Rows.Count.Equals(0))
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                fulldet = fulldet + "<tr><td align='left' class='lable' valign='middle' width='22%' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["cname"].ToString() + "</a>" + "</td><td align='center' class='lable' width='12%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["cperson"].ToString() + "</td><td align='center' class='lable' width='10%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["comp_url"].ToString() + "</td><td align='center' class='lable' width='11%' valign='center' bgcolor='white'>";
                fulldet = fulldet + ds.Tables[0].Rows[i]["city"].ToString() + "</td><td align='center' class='lable' width='11%' valign='center' bgcolor='white'>";

                fulldet = fulldet + "<a href='Admin_VendorView.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='View Vendors Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";

                if (Session["Editp"].ToString() != "N" && Session["Deletep"].ToString() != "N")
                {
                    fulldet = fulldet + "<a href='Admin_VendorEdit.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='Edit Vendors Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                    fulldet = fulldet + "<a href='Admin_VendorDelete.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/delete.gif' alt='Delete Vendors Details' width='16' height='16' border='0' /></a></td></tr>";
                }

                if (Session["Editp"].ToString() != "N" && Session["Deletep"].ToString() == "N")
                {
                    fulldet = fulldet + "<a href='Admin_VendorEdit.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='Edit Vendors Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                    fulldet = fulldet + "</td></tr>";
                }

                if (Session["Editp"].ToString() == "N" && Session["Deletep"].ToString() != "N")
                {
                    fulldet = fulldet + "<a href='Admin_VendorDelete.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/delete.gif' alt='Delete Vendors Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                    fulldet = fulldet + "</td></tr>";
                }

                if (Session["Editp"].ToString() == "N" && Session["Deletep"].ToString() == "N")
                {
                    fulldet = fulldet + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                    fulldet = fulldet + "</td></tr>";
                }



                //    if (Session["Editp"].ToString() != "N")
                //    fulldet = fulldet + "<a href='Admin_VendorEdit.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/edit.gif' alt='Edit Vendors Details' width='16' height='16' border='0' /></a>" + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";
                //else
                //    fulldet = fulldet + "</td><td align='center' class='lable' width='6%' valign='center' bgcolor='white'>";

                //if (Session["Deletep"].ToString() != "N")
                //    fulldet = fulldet + "<a href='Admin_VendorDelete.aspx?cid=" + ds.Tables[0].Rows[i]["userid"].ToString() + "'><img src='images/delete.gif' alt='Delete Vendors Details' width='16' height='16' border='0' /></a></td></tr>";
                //else
                //    fulldet = fulldet + "</td></tr>";
            }
        }

        fulldet = fulldet + "</table>";
        tdcontent.InnerHtml = fulldet;
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        base.OnInit(e);
        if (Session["UserName"] == null)
        {
            Session.Add("requestUrl", Request.Url);
            Response.Redirect("Admin_Login.aspx");
        }
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    #endregion
}
