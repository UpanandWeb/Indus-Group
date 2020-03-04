using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class PackageDetails : System.Web.UI.Page
{
    travelshome tr = new travelshome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            DataSet ds = new DataSet();
            ds=  tr.bindperplaceid(id);
            plnm.Text = ds.Tables[0].Rows[0]["place"].ToString();
            plnm2.Text = ds.Tables[0].Rows[0]["place"].ToString();
            desc.Text = ds.Tables[0].Rows[0]["content"].ToString();
            pkg.Text = ds.Tables[0].Rows[0]["pkg_details"].ToString();
            if (plnm.Text == "Gujarath")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/gujarat2.jpg");
                back.Style.Add("background-position", "center");
                 back.Style.Add("background-repeat", "no-repeat");
                 back.Style.Add("background-size", "cover");
                 back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                 back.Style.Add("margin-top", "0px");
                
            }
            if (plnm.Text == "Kerala")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/kerala5.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }

            if (plnm.Text == "Kulumanali")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/manali6.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Agra")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/taj2.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Australia")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/lihgt-color1.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Dubai")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/dubaifinal.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Kashmir")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/jammu2.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Andaman")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/andamanu1.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }


            if (plnm.Text == "Australia")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/sydney-final.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "New Zealand")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/newzealand.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }




            if (plnm.Text == "South East Asia")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/asia1.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Sri Lanka")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/asia1.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Europe")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/europ.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
           

            if (plnm.Text == "Singapore")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/bg-singapore.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Thailand")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/thaifinal.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Malaysia")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/malay.png");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
            if (plnm.Text == "Russia")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/russia2.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
              if (plnm.Text == "UK")
            {

                //back.Attributes.Add("class", "background7");

                back.Style.Add("background-image", "images/uk1.jpg");
                back.Style.Add("background-position", "center");
                back.Style.Add("background-repeat", "no-repeat");
                back.Style.Add("background-size", "cover");
                back.Style.Add("background-attachment", "fixed");
                back.Style.Add("position", "relative");
                back.Style.Add("height", "50%");
                back.Style.Add("margin-top", "0px");

            }
              if (plnm.Text == "Goa")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/goa5.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Italy")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/italy.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Germany")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/ger.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Hyderabad")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/hyd.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Mumbai")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/mumbai.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Ooty")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/ooty4.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");
			//back.Style.Add("text-color", "#ffff");
			//text-manali.Style.Add("color","#ffff");
		//text-manali.Style.Add("font-family", "Roboto,sans-serif"); 
  
 			//text-manali.Style.Add("font-weight","600") ;




              }
            
              if (plnm.Text == "Maldives")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/main-htl3.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "HONG KONG WITH MACAU")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/main-htl4.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Turkey")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/main-htl1.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }

              if (plnm.Text == "France , Swiss Paris")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/main-htl5.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
              if (plnm.Text == "Sri Lanka")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/srilanka.jpg");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
 		if (plnm.Text == "Paris")
              {

                  //back.Attributes.Add("class", "background7");

                  back.Style.Add("background-image", "images/bg-france.png");
                  back.Style.Add("background-position", "center");
                  back.Style.Add("background-repeat", "no-repeat");
                  back.Style.Add("background-size", "cover");
                  back.Style.Add("background-attachment", "fixed");
                  back.Style.Add("position", "relative");
                  back.Style.Add("height", "50%");
                  back.Style.Add("margin-top", "0px");

              }
        }
    }
}