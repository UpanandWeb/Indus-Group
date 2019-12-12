using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for newtravels1
/// </summary>
public class newtravels1
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["TravelConnectionString"]);
	public newtravels1()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void inserwithimgcontenttour(string title, string cat, string subcat, string content, string image, int sts, string date, string subtitle, string pkg, string pkgtype)
    {
        SqlCommand cmd = new SqlCommand("insert into [dbo].[It_home] values('" + title.Replace("'", "''") + "','" + cat + "','" + subcat + "','" + content.Replace("'", "''") + "','" + image.Replace("'", "''") + "'," + sts + ",'" + date + "','" + subtitle.Replace("'", "''") + "','" + pkg.Replace("'", "''") + "','" + pkgtype.Replace("'", "''") + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updatehomedatawithimgtour(string title, string category, string subcat, string content, string sub, string packtype, string id, string filename)
    {
        string str = "update It_home set title='" + title + "',category='" + category + "',sub_cat='" + subcat + "',conten='" + content + "',subtitle='" + sub + "',imagename='" + filename + "',pkgtype='" + packtype + "' where id='" + id + "'";
        //string str="insert into "
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public void inserwithimgcontent(string title, string cat, string subcat, string content, string image, int sts, string date, string subtitle, string pkg)
    {
        SqlCommand cmd = new SqlCommand("insert into [dbo].[It_home] values('" + title.Replace("'", "''") + "','" + cat + "','" + subcat + "','" + content.Replace("'", "''") + "','" + image.Replace("'", "''") + "'," + sts + ",'" + date + "','" + subtitle.Replace("'", "''") + "','" + pkg.Replace("'", "''") + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updatehomedatatour(string title, string category, string subcat, string content, string sub, string id, string package, string packtype)
    {
        string str = "update It_home set title='" + title + "',category='" + category + "',sub_cat='" + subcat + "',conten='" + content + "',subtitle='" + sub + "',pkg_details='" + package + "',pkgtype='" + packtype + "' where id='" + id + "'";
        //string str="insert into "
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public DataSet bindpackageedit(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select It_home.title,It_home.category,It_home.sub_cat,it_home.pkgtype,it_home.subtitle,It_home.conten as content,It_home.imagename,It_home.status,It_home.posteddate,it_home.pkg_details,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on It_home.sub_cat=it_placename.id where it_home.id=" + id, con);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }
}