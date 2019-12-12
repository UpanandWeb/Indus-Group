using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for travelsadmin
/// </summary>
public class travelsadmin
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["TravelConnectionString"]);
	public travelsadmin()
	{
      
		
	}

    

    public void updatevisa(string id, string placename, string address, string gen, string business, string tourist)
    {
        SqlCommand cmd = new SqlCommand("update it_visa set placename='" + placename + "',address='" + address.Replace("'", "''") + "',genrequirements='" + gen.Replace("'", "''") + "',business_details='" + business.Replace("'", "''") + "',tourist_details='" + tourist.Replace("'", "''") + "' where vid="+id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updateidea(string id, string title, string content)
    {
        SqlCommand cmd = new SqlCommand("update it_travelideas set title='" + title + "',content='" + content.Replace("'", "''") + "' where iid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public void updatespecialofferwithimg(string id, string title, string sub, string content, string imagename)
    {
        SqlCommand cmd = new SqlCommand("update it_specialoffer set title='" + title + "',subcat='" + sub + "',content='" + content.Replace("'", "''") + "',imagename='" + imagename.Replace("'", "''") + "' where oid ="+id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updatespecialoffer(string id, string title, string sub, string content)
    {
        SqlCommand cmd = new SqlCommand("update it_specialoffer set title='" + title + "',subcat='" + sub + "',content='" + content.Replace("'", "''") + "'' where oid =" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindpercontact(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from iT_contact where cid=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void deletefeedback(string id)
    {
        SqlCommand cmd = new SqlCommand("delete  from [dbo].[it_feedback] where fid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindfeedbackperid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from [it_feedback] where fid= " + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updatestatusoffeedback(string id,string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_feedback set status='" + sts + "' where fid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
       
    }

    public void inserttravelerdetails(string country, string suminsured, string depart, string returndate, string noofdays, string nooftravelers, string travel1, string travel2, string travel3, string travel4, string tavel5, string travel6, string emailid, string ph, string type)
    {
        SqlCommand cmd = new SqlCommand("insert into TravelInsurence values('" + country + "','" + suminsured + "','" + depart + "','" + returndate + "','" + noofdays + "','" + nooftravelers + "','" + travel1 + "','" + travel2 + "','" + travel3 + "','" + travel4 + "','" + tavel5 + "','" + travel6 + "','" + emailid + "','" + ph + "','" + type + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Open();
    }

    public DataSet bindaairlinelike(string type)
    {
        SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM it_airline WHERE name LIKE '" + type + "%' ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataTable packagetourdetail()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 12 It_home.id,It_home.title,It_home.category,It_home.sub_cat,it_home.imagename,it_home.subtitle, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,It_home.pkgtype,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id where it_home.pkgtype in('Family Package','Tourist Package')  and it_home.status=1  order by it_home.id asc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
   
}