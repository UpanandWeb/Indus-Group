using System;
using System.Collections.Generic;

using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for home2
/// </summary>
public class home2
{
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
	public home2()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable binddata()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1  * from orphan_home where category='Top'  order by id desc ", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindevent()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 4 * from op_events where category!='Upcoming' order by eid desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindupcomingevent()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 4 * from op_events where category='Upcoming' order by eid desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable child()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from orphan_home where su_cat='Child Protection' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
   
    public DataTable childadopt()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from orphan_home where su_cat='Adoption Child' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable childcharity()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from orphan_home where su_cat='Charity Actions' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindsupport()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 3 * from orphan_home where su_cat='Support' order by id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataSet bindeventwithcat(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  * from op_events where category='Upcoming' and eid=" + id, con1);
        DataSet dt = new  DataSet();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindgallery()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 12  * from orphan_gallery where category='Home Images' order by id desc ", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindgalleryhome ()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  * from orphan_gallery where category='Multiple Images' order by id desc ", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindgallperid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  * from orphan_gallerymultiples where id= "+id, con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void insertclient(string name, string email, string pwd, string cpwd, string mobile, string city, string date,int stst)
    {
        SqlCommand cmd = new SqlCommand("insert into op_client values ('" + name + "','" + email + "','" + pwd + "','" + cpwd + "','" + mobile + "','" + city + "','" + date + "','"+stst+"')", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataTable clientperid(string email, string password)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_client where email='" + email + "' and pwd='" + password + "' and status=1 ", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindsupportmenu()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_menu where status=1  order by sid desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindperidmenu(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_menu where sid="+id, con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindsupport1()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support where category=7 order by sup_id desc" , con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindsupport2()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support where category=6 order by sup_id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindsupport1details()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_details where category=7 and sup_id=7 order by did desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataSet bindsupport1details2()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select   sum(CAST(details as int))as total from op_support_details where category=7 and sup_id=7  ", con1);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindsupport2details()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_details where category=6 order by did desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataSet bindsupport1details2nutrition()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select   sum(CAST(details as int))as total from op_support_details where category=6   ", con1);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }

    public DataTable monthlyexpenses()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select *  from op_support_details where category=5", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataSet monthlyexpensestotal()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select   sum(CAST(details as int))as total from op_support_details where category=5   ", con1);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }
    public DataTable monthlyexpensesmed()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select *  from op_support_details where category=8", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void insertcontact(string name, string email, string ph, string loc,string date)
    {
        SqlCommand cmd = new SqlCommand("insert into  op_contact values('" + name + "','" + email + "','" + ph + "','" + loc + "','"+date+"')", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataTable bindgrocerymonthly()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select *  from op_support_details where category=9", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindcurrentneeds()
    {

        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support where category=4 order by sup_id desc",con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }


    public DataTable bindvegmenu()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_specialmemu where mealtype='Veg Meal' and status=1", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindnonvegmenu()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_specialmemu where mealtype='Non Veg Meal' and status=1", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindcurrentimg()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_img where category='Current Need Images' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    //binding of support education side image 
    public DataTable bindcurrentneedsideimg()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support_img where category='Current Side Image' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable supportmainpageside()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support_img where category='Support page Side Image' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable binddatainnutrition()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support_img where category='Nutrition food Side Image' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable binddowndata()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 3  * from orphan_home where category='Bottom' and su_cat='How You Can Support Us'  order by id desc ", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindvegimg()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support_img where category='Image for Veg Meal' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
 public DataTable bindnonvegimg()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support_img where category='Image for Non Veg Meal' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
 public DataTable bindmonthlyside()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from op_support_img where category='Monthly Need Side Image' order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }



    public void updatemealvegsts(string id,string status)
    {
        SqlCommand cmd = new SqlCommand("update op_specialmemu set status='" + status + "' where sup_id='" + id + "'", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
}