using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);

    protected void Page_Load(object sender, EventArgs e)
    
   {

        using (DataSet dt12 = new DataSet())
        {
            ddlactors.BorderStyle = BorderStyle.None;
            ddlactors.Style.Clear();
            ddlheroins.BorderStyle = BorderStyle.None;
            SqlDataAdapter ad1 = new SqlDataAdapter("SI_new", con);
            SqlCommand cmd1 = new SqlCommand("SI_new", con);
            cmd1.Parameters.AddWithValue("@Action", "English");
            ad1.SelectCommand.CommandType = CommandType.StoredProcedure;
            cmd1.Connection = con;
            ad1.SelectCommand = cmd1;
            // adapter.SelectCommand = cmd;
            ad1.Fill(dt12);
            DataTable dt123 = new DataTable();
            dt123 = dt12.Tables[0];
            dlimagebind5.DataSource = dt123;
            dlimagebind5.DataBind();
            SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from sa_postnews where categeory='Political_News' order by pid desc ", con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            // Repeater1.DataSource = ds;
            // Repeater1.DataBind();

            DataSet dFilms = new DataSet();
            SqlDataAdapter ad5 = new SqlDataAdapter("select top 4 * from SA_postnews where  categeory='Film News' and languagetype=1 order by pid desc ", con);
            ad5.Fill(dFilms);
            //string categeoryfilm = lblfilmnews.Text;
            // dFilms = b.Filmnews(categeoryfilm);
            DataList1.DataSource = dFilms;                 //side content datalist 
            DataList1.DataBind();
            DataSet dFilms1 = new DataSet();
            SqlDataAdapter ad51 = new SqlDataAdapter("select top 4 * from SA_postnews where  categeory='Tollywood Buzz' and languagetype=1 order by pid desc ", con);
            ad51.Fill(dFilms1);
            Repeater1.DataSource = dFilms1;                 //side content datalist 
            Repeater1.DataBind();



            ///gossips
            DataSet dFilms11 = new DataSet();
            SqlDataAdapter ad511 = new SqlDataAdapter("select top 1 * from [dbo].[Salute_Gossips] where catagory='English' order by sid desc", con);
            ad511.Fill(dFilms11);
            Repeater2.DataSource = dFilms11;                 //side content datalist 
            Repeater2.DataBind();


            ///gossip slider
            ///
            DataSet dFilms112 = new DataSet();
            SqlDataAdapter ad5112 = new SqlDataAdapter("select top 6 * from [Salute_Gossips] where catagory='English' and sid not in (select top 1 sid  from [Salute_Gossips] where catagory='English' order by sid desc)order by sid desc", con);
            ad5112.Fill(dFilms112);
            Repeater3.DataSource = dFilms112;                 //side content datalist 
            Repeater3.DataBind();

            ///actor gallery

            string displayimages = "2";
            DataTable dt = new DataTable();
            ds = new DataSet();

            SqlDataAdapter adgal = new SqlDataAdapter("select top 2  *  from Sa_Gallery_Details where cid=1  order by did desc   ", con);
            adgal.Fill(ds);
            //  ds = ba.gallerycontentbycattype(1, displayimages);
            dt = new DataTable();
            dt.Columns.Add("did", typeof(int));
            dt.Columns.Add("actorimage", typeof(string));
            dt.Columns.Add("actorname", typeof(string));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string l = ds.Tables[0].Rows[i]["actorname"].ToString();

                string lll = ds.Tables[0].Rows[i]["actorimage"].ToString();
                string ll = "Upload Photos/" + lll;
                int id = Convert.ToInt32(ds.Tables[0].Rows[i]["did"].ToString());
                dt.Rows.Add(id, ll, l);
            }
            DataSet ds22 = new DataSet();
            ds22.Tables.Add(dt);
            ddlactors.DataSource = ds22;
            ddlactors.DataBind();

            ///actress galery
            ds = new DataSet();
            SqlDataAdapter adgal1 = new SqlDataAdapter("select top 2  *  from Sa_Gallery_Details where cid=2  order by did desc   ", con);
            adgal1.Fill(ds);
            // ds = ba.gallerycontentbycattype(2, displayimages);
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("did", typeof(int));
            dt1.Columns.Add("actorimage", typeof(string));
            dt1.Columns.Add("actorname", typeof(string));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string l = ds.Tables[0].Rows[i]["actorname"].ToString();

                string lll = ds.Tables[0].Rows[i]["actorimage"].ToString();
                string ll = "Upload Photos/" + lll;
                int id = Convert.ToInt32(ds.Tables[0].Rows[i]["did"].ToString());
                dt1.Rows.Add(id, ll, l);
            }
            DataSet ds21 = new DataSet();
            ds21.Tables.Add(dt1);
            ddlheroins.DataSource = ds21;
            ddlheroins.DataBind();

            ///gossips
            ///


            DataSet ds1 = new DataSet();
            SqlDataAdapter adcom = new SqlDataAdapter("select  top 9  * from sa_comedy where category !='Videos' and languagetype='English' order by cid desc  ", con);
            //DataTable dt = new DataTable();
            adcom.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                DataTable dt1234 = new DataTable();
                dt1234.Columns.Add("cid", typeof(int));
                dt1234.Columns.Add("imagename", typeof(string));
                dt1234.Columns.Add("title", typeof(string));
                for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                {
                    string lll = ds1.Tables[0].Rows[i]["imagename"].ToString();
                    string ll = "Jokes/" + lll;
                    string l = ds1.Tables[0].Rows[i]["title"].ToString();
                    int id1 = Convert.ToInt32(ds1.Tables[0].Rows[i]["cid"].ToString());
                    dt1234.Rows.Add(id1, ll, l);
                }
                // DataSet ds45 = new DataSet();
                Repeater4.DataSource = dt1234;
                Repeater4.DataBind();

                ///reviews
                ///

                SqlCommand cmd12 = new SqlCommand("Si_newreviewEng", con);
                SqlDataAdapter ad12 = new SqlDataAdapter("Si_newreviewEng", con);
                // cmd1.Parameters.AddWithValue("@Action", "reviewtelugu");
                ad12.SelectCommand.CommandType = CommandType.StoredProcedure;
                cmd12.Connection = con;
                ad12.SelectCommand = cmd12;

                try
                {
                    con.Open();
                    cmd12.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    con.Close();
                }
                // ds = ba.Revie();
                using (DataSet dt112 = new DataSet())
                {
                    // adapter.SelectCommand = cmd;
                    ad12.Fill(dt112);
                    DataTable dt1123 = new DataTable();
                    dt1123 = dt112.Tables[0];
                    ddlreviews.DataSource = dt1123;
                    ddlreviews.DataBind();
                    Repeater6.DataSource = dt1123;
                    Repeater6.DataBind();
                    Repeater5.DataSource = dt1123;
                    Repeater5.DataBind();
                }
                ///bhakti data 
                ///


                SqlCommand cmdbhakti = new SqlCommand("[tempmainbhakti]", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();
                SqlDataAdapter adbhakti = new SqlDataAdapter("[tempmainbhakti]", con);
                cmdbhakti.Parameters.AddWithValue("@Action", "bhaktihome");
                adbhakti.SelectCommand.CommandType = CommandType.StoredProcedure;
                cmdbhakti.Connection = con;
                adbhakti.SelectCommand = cmdbhakti;

                try
                {
                    con.Open();
                  //  cmdbhakti.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    con.Close();
                }
                using (DataSet dt12bhakti = new DataSet())
                {
                    // adapter.SelectCommand = cmd;
                   // SqlDataAdapter adbhakti = new SqlDataAdapter("select top 1 godname,imagename,id,title from tempgod where imagename !='' ", con);
                    adbhakti.Fill(dt12bhakti);
                   DataTable dt123bhakti = new DataTable();
                   dt123bhakti = dt12bhakti.Tables[1];
                   bhaktiddl.DataSource = dt123bhakti;
                    bhaktiddl.DataBind();
                }

                ///god left data 
                ///
                ///

                DataSet dt12bhakti1 = new DataSet();
                SqlDataAdapter adbhakti1 = new SqlDataAdapter("select top 2 godname,imagename,id,title,description from tempgod where imagename !='' ", con);
                adbhakti1.Fill(dt12bhakti1);
             
                Repeater8.DataSource = dt12bhakti1;
                Repeater8.DataBind();
                ///crime data
                ///
                SqlDataAdapter adcrime = new SqlDataAdapter("select top 1 * from [Sa_technews] where category='Crime' order by id desc", con);
                DataSet dscrime = new DataSet();
                adcrime.Fill(dscrime);
                Repeater7.DataSource = dscrime;
                Repeater7.DataBind();
                ////crime below data

                SqlDataAdapter adcrime1 = new SqlDataAdapter("select top 2 * from [Sa_technews] where category='Crime' order by id asc", con);
                DataSet dscrime1 = new DataSet();
                adcrime1.Fill(dscrime1);
                Repeater9.DataSource = dscrime1;
                Repeater9.DataBind();

                ///display popular news 
                ///
                SqlCommand cmd2 = new SqlCommand("PopularNews", con);    //for displying data in popular news
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@Action", "disply");
                SqlDataAdapter ad123 = new SqlDataAdapter();
                ad123.SelectCommand = cmd2;
                DataSet ds2 = new DataSet();
                ad123.Fill(ds2);
                con.Close();
                DataList2.DataSource = ds2;
                DataList2.DataBind();
            }
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "view")
        {
            //category = Convert.ToString(ViewState["pnews"]);

            Session["type"] = "Default.aspx";
            //Session["type1"] = "MovieNews1.aspx";
            //Response.Redirect("Details2.aspx?pid=" + id);
            SqlDataAdapter ad = new SqlDataAdapter("select * from sa_postnews where pid= " + id, con);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            string news = ds.Tables[0].Rows[0]["keywords"].ToString();
            //string strnews = rts.routingsymbol(news);


            // Response.RedirectToRoute("news", new { pid = id, keywords = strnews });

        }
    }
    protected void ddlheroins_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    protected void ddlactors_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    protected void Repeater5_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        try
        {
            //foreach (RepeaterItem item in Repeater5.Items)
            //{
            //    HyperLink lbl = new HyperLink();
            //int a = Repeater1.Items.Count;        // I'm only getting 1 item 
            //if (item.ItemType == ListItemType.AlternatingItem || item.ItemType == ListItemType.Item)
            //{

            //  string st = dt.Tables[0].Rows[0]["MReview_Rating"].ToString();
            int count = Repeater5.Items.Count;
            HyperLink lbl = new HyperLink();
            lbl = e.Item.FindControl("HyperLink23") as HyperLink;

            lbl.ID = (e.Item.FindControl("hfName") as HiddenField).Value;
            for (int i = 0; i < count; i++)
            {

                {
                    SqlDataAdapter ad = new SqlDataAdapter("select * from SA_MoviewReview_Discription  where MREview_TitleId='" + lbl.ID + "'", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    string st = ds.Tables[0].Rows[0]["MReview_Rating"].ToString();


                    if (st == "2")
                    {
                        string imagname = "rating-star2.png";
                        Image img = e.Item.FindControl("imgrat") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "3")
                    {
                        string imagname = "rating-star3.png";
                        Image img = e.Item.FindControl("imgrat") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "3.5")
                    {
                        string imagname = "rating-star3.5.png";
                        Image img = e.Item.FindControl("imgrat") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "4")
                    {
                        string imagname = "rating-star4.png";
                        Image img = e.Item.FindControl("imgrat") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "4.5")
                    {
                        string imagname = "rating-star4.5.png";
                        Image img = e.Item.FindControl("imgrat") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "5")
                    {
                        string imagname = "rating-star5.png";
                        Image img = e.Item.FindControl("imgrat") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                }
            }
        }

      //  }
        catch (Exception ex)
        {
            string str = ex.Message.ToString();

        }


    }
    protected void ddlreviews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
      
        try
        {
      
            int count = ddlreviews.Items.Count;
            Image lbl = new Image();
            lbl = e.Item.FindControl("img1") as Image;

            lbl.ID = (e.Item.FindControl("hfName1") as HiddenField).Value;
            for (int i = 0; i < count; i++)
            {

                {
                    SqlDataAdapter ad = new SqlDataAdapter("select * from SA_MoviewReview_Discription  where MREview_TitleId='" + lbl.ID + "'", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    string st = ds.Tables[0].Rows[0]["MReview_Rating"].ToString();


                    if (st == "2")
                    {
                        string imagname = "rating-star2.png";
                        Image img = e.Item.FindControl("imgrat2") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "3")
                    {
                        string imagname = "rating-star3.png";
                        Image img = e.Item.FindControl("imgrat2") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "3.5")
                    {
                        string imagname = "rating-star3.5.png";
                        Image img = e.Item.FindControl("imgrat2") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "4")
                    {
                        string imagname = "rating-star4.png";
                        Image img = e.Item.FindControl("imgrat2") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "4.5")
                    {
                        string imagname = "rating-star4.5.png";
                        Image img = e.Item.FindControl("imgrat2") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "5")
                    {
                        string imagname = "rating-star5.png";
                        Image img = e.Item.FindControl("imgrat2") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                }
            }
        }

             //  }
        catch (Exception ex)
        {
            string str = ex.Message.ToString();

        }
    }




    protected void Repeater6_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            int count = Repeater6.Items.Count;
            HyperLink lbl = new HyperLink();
            lbl = e.Item.FindControl("HyperLink24") as HyperLink;

            lbl.ID = (e.Item.FindControl("hfName2") as HiddenField).Value;
            for (int i = 0; i < count; i++)
            {

                {
                    SqlDataAdapter ad = new SqlDataAdapter("select * from SA_MoviewReview_Discription  where MREview_TitleId='" + lbl.ID + "'", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    string st = ds.Tables[0].Rows[0]["MReview_Rating"].ToString();


                    if (st == "2")
                    {
                        string imagname = "rating-star2.png";
                        Image img = e.Item.FindControl("imgrat1") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "3")
                    {
                        string imagname = "rating-star3.png";
                        Image img = e.Item.FindControl("imgrat1") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "3.5")
                    {
                        string imagname = "rating-star3.5.png";
                        Image img = e.Item.FindControl("imgrat1") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "4")
                    {
                        string imagname = "rating-star4.png";
                        Image img = e.Item.FindControl("imgrat1") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "4.5")
                    {
                        string imagname = "rating-star4.5.png";
                        Image img = e.Item.FindControl("imgrat1") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                    else if (st == "5")
                    {
                        string imagname = "rating-star5.png";
                        Image img = e.Item.FindControl("imgrat1") as Image;
                        img.ImageUrl = ("upload photos/" + imagname);
                    }
                }
            }
        }



             //  }
        catch (Exception ex)
        {
            string str = ex.Message.ToString();

        }
    }
}
    



