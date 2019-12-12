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
 
using System.Data.SqlClient;

public partial class Usercontrols_AddModifyDelete : System.Web.UI.UserControl
{
    DataTable dxid = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            dxid = (DataTable)Session["UserPerm"];

            int xx = dxid.Columns.Count;


            //Company

            if (dxid.Rows[0][8].ToString() == "1")
            {

                if (dxid.Rows[0][10].ToString() == "1")
                {
                    tdnew.Visible = true;
                }
                else
                    tdnew.Visible = false;

                if (dxid.Rows[0][11].ToString() == "1")
                {
                    tdedit.Visible = true;
                }
                else
                    tdedit.Visible = false;

                if (dxid.Rows[0][12].ToString() == "1")
                {
                    tddel.Visible = true;
                }
                else
                    tddel.Visible = false;

                if (dxid.Rows[0][13].ToString() == "1")
                {
                    tdmail.Visible = true;
                }
                else
                    tdmail.Visible = false;

                if (dxid.Rows[0][14].ToString() == "1")
                {
                    tdview.Visible = true;
                }
                else
                    tdview.Visible = false;
            }
            else if (dxid.Rows[0][15].ToString() == "1")
            {

                //HR
                if (dxid.Rows[0][17].ToString() == "1")
                {
                    tdnew.Visible = true;
                }
                else
                    tdnew.Visible = false;

                if (dxid.Columns[18].ToString() == "1")
                {
                    tdedit.Visible = true;
                }
                else
                    tdedit.Visible = false;

                if (dxid.Columns[19].ToString() == "1")
                {
                    tddel.Visible = true;
                }
                else
                    tddel.Visible = false;

                if (dxid.Columns[20].ToString() == "1")
                {
                    tdmail.Visible = true;
                }
                else
                    tdmail.Visible = false;

                if (dxid.Columns[21].ToString() == "1")
                {
                    tdview.Visible = true;
                }
                else
                    tdview.Visible = false;
            }
            else if (dxid.Rows[0][29].ToString() == "1")
            {

                // Sales
                if (dxid.Rows[0][31].ToString() == "1")
                {
                    tdnew.Visible = true;
                }
                else
                    tdnew.Visible = false;


                if (dxid.Rows[0][33].ToString() == "1")
                {
                    tdedit.Visible = true;
                }
                else
                    tdedit.Visible = false;

                if (dxid.Rows[0][32].ToString() == "1")
                {
                    tddel.Visible = true;
                }
                else
                    tddel.Visible = false;

                if (dxid.Rows[0][34].ToString() == "1")
                {
                    tdmail.Visible = true;
                }
                else
                    tdmail.Visible = false;

                if (dxid.Rows[0][35].ToString() == "1")
                {
                    tdview.Visible = true;
                }
                else
                    tdview.Visible = false;
            }
            else if (dxid.Rows[0][36].ToString() == "1")
            {

                // Recruting
                if (dxid.Rows[0][38].ToString() == "1")
                {
                    tdnew.Visible = true;
                }
                else
                    tdnew.Visible = false;


                if (dxid.Rows[0][39].ToString() == "1")
                {
                    tdedit.Visible = true;
                }
                else
                    tdedit.Visible = false;

                if (dxid.Rows[0][40].ToString() == "1")
                {
                    tddel.Visible = true;
                }
                else
                    tddel.Visible = false;

                if (dxid.Rows[0][41].ToString() == "1")
                {
                    tdmail.Visible = true;
                }
                else
                    tdmail.Visible = false;

                if (dxid.Rows[0][42].ToString() == "1")
                {
                    tdview.Visible = true;
                }
                else
                    tdview.Visible = false;
            }
        }

    }

    public ImageButton imgbn
    {
        get
        {
            return ibtnNew;

        }
    }

    public ImageButton imgbe
    {
        get
        {
            return editbtn;

        }
    }

    public ImageButton imgbp
    {
        get
        {
            return ibtnPreview;

        }
    }

    public ImageButton imgbd
    {
        get
        {
            return ibtnDelete;

        }
    }

    public ImageButton imgbm
    {
        get
        {
            return mailbtn;

        }
    }

    protected void ibtnPreview_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void mailbtn_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ibtnNew_Click(object sender, ImageClickEventArgs e)
    {

    }
}

