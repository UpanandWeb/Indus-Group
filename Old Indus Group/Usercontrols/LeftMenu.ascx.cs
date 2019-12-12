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


public partial class Usercontrols_LeftMenu : System.Web.UI.UserControl
{
    DataTable xid = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usdid"] != null)
        {
            xid = (DataTable)Session["UserPerm"];

            int x = xid.Columns.Count;
            string xx = xid.Rows[0][8].ToString();
            td1.Visible = true;

            if (xid.Rows[0][8].ToString() == "1")
            {
                tdcomp.Visible = true;
            }
            else
                tdcomp.Visible = false;

            if (xid.Rows[0][15].ToString() == "1")
            {
              tdhr.Visible = true;
            }
            else
               tdhr.Visible = false;

            //if (xid.Rows[0][22].ToString() == "1")
            //{
            //  tdim.Visible = true;
            //}
            //else
            //  tdim.Visible = false;

            if (xid.Rows[0][29].ToString() == "1")
            {
                tdsales.Visible = true;
            }
            else
                tdsales.Visible = false;

            if (xid.Rows[0][36].ToString() == "1")
            {
                tdrec.Visible = true;
            }
            else
                tdrec.Visible = false;

            //if (xid.Rows[0][42].ToString() == "1")
            //{
            //    tdpayroll.Visible = true;
            //}
            //else
            //    tdpayroll.Visible = false;

            //if (xid.Rows[0][49].ToString() == "1")
            //{
            //  tdaccounts.Visible = true;
            //}
            //else
            //  tdaccounts.Visible = false;

            if (Session["Ccode"].ToString() == "5555" ||
                Session["Ccode"].ToString() == "7777" ||
                Session["Ccode"].ToString() == "3333" ||
                Session["Ccode"].ToString() == "2222")
            {
                trcompany.Visible = false;
                trhr.Visible = false;
                trlogins.Visible = false;
            }


        }
    }
}
