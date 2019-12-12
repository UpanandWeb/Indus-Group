using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for travelshome
/// </summary>
public class travelshome
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["TravelConnectionString"]);
    public travelshome()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void insertclient(string name, string email, string pwd, string cpwd, string mobile, string address, string date, int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into it_register values('" + name + "','" + email + "','" + pwd + "','" + cpwd + "','" + mobile + "','" + address + "','" + date + "','" + sts + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void inserwithimgcontent(string title, string cat, string subcat, string content, string image, int sts, string date, string subtitle, string pkg, string pkgtype)
    {
        SqlCommand cmd = new SqlCommand("insert into [dbo].[It_home] values('" + title.Replace("'", "''") + "','" + cat + "','" + subcat + "','" + content.Replace("'", "''") + "','" + image.Replace("'", "''") + "'," + sts + ",'" + date + "','" + subtitle.Replace("'", "''") + "','" + pkg.Replace("'", "''") + "','" + pkgtype.Replace("'", "''") + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void insertplace(int id, string name, int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into it_placename values(" + id + ",'" + name + "'," + sts + ")", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindplace(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_placename where status=1 and category=" + id + " order by id desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindhomedata()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select It_home.id,It_home.title,It_home.category,It_home.sub_cat, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id  order by it_home.id desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindplacedata()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_placename  order by id desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindstatusperid(string id)
    {

        SqlDataAdapter ad = new SqlDataAdapter("select * from It_home where id=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updatestatus(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update It_home set status='" + sts + "' where id= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void deletefromhome(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from It_home where id= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindstatusperplace(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_placename where id=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void updateplacestatus(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_placename set status='" + sts + "' where id= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void deleteplace(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_placename where id=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void addspecialoffer(string title, string cat, string subcat, string content, string img, int sts, string date)
    {
        SqlCommand cmd = new SqlCommand("insert into it_specialoffer values('" + title.Replace("'", "''") + "','" + cat + "','" + subcat + "','" + content.Replace("'", "''") + "','" + img.Replace("'", "''") + "','" + sts + "','" + date + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void addtourimg(string title, string imagename, string content, int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into it_tourismcountry values('" + title.Replace("'", "''") + "','" + imagename.Replace("'", "''") + "','" + content.Replace("'", "''") + "','" + sts + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void addedservices(string title, string category, string subcat, string content, string img, int sts, string date,string pg)
    {
        SqlCommand cmd = new SqlCommand("insert into it_addedservices values('" + title.Replace("'", "''") + "','" + category + "','" + subcat + "','" + content.Replace("'", "''") + "','" + img.Replace("'", "''") + "','" + sts + "','" + date + "','"+pg+"') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataTable bindwelcome()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from it_home where title='Welcome to Indus Travels' and status=1 order by id desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindomtour()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 8 It_home.id,It_home.title,It_home.category,It_home.sub_cat,it_home.subtitle, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id where it_home.title='Domestic Tours' and it_home.status=1  order by it_home.id asc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindinttour()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 8 It_home.id,It_home.title,It_home.category,It_home.sub_cat,it_home.subtitle, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id where it_home.title='International Tours' and it_home.status=1  order by it_home.id asc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindspecialoffer()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 6 * from it_specialoffer where status=1 order by oid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindspecialofferdata()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  * from it_specialoffer  order by oid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public DataTable bindtourismcountry()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 13 * from it_tourismcountry where status=1and title='Our Tourism Countries' order by tid desc ", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindtourismcountry1()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 13 * from it_tourismcountry where status=1 and title='Our Tourism Countries' order by tid asc ", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindinbound()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_addedservices where title='Inbound Tours' and status=1 order by eid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindoutbound()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_addedservices where title='Outbound Tours' and status=1 order by eid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindhotel()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_addedservices where title='Hotel Booking' and status=1 order by eid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindtravels()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_addedservices where title='Travel Services' and status=1 order by eid desc", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataTable bindairlines()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_tourismcountry where title=' Airline Services' and status=1 order by tid desc ", con);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public DataSet bindhomeedit(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select It_home.id,It_home.title,It_home.category,it_home.pkg_details,It_home.sub_cat,It_home.subtitle, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id  where It_home.id= " + id, con);
        DataSet ds = new DataSet();
        //SqlDataAdapter da = new SqlDataAdapter("select It_home.id,It_home.title,It_home.category,It_home.sub_cat, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id where It_home.id="+id , con);
        // DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    //public void updatehomedata(string title, string category, string subcat, string content, string sub, string date, string id)
    //{
    //    string str = "update It_home set title='" + title + "',category='" + category + "',sub_cat='" + subcat + "',conten='" + content + "',subtitle='" + sub + "',posteddate='" + date + "' where id='" + id + "'";
    //    string str="insert into "
    //    SqlCommand cmd = new SqlCommand(str, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();

    //}

    public void updatehomedata(string title, string category, string subcat, string content, string sub, string id, string package)
    {
        string str = "update It_home set title='" + title + "',category='" + category + "',sub_cat='" + subcat + "',conten='" + content + "',subtitle='" + sub + "',pkg_details='" + package + "' where id='" + id + "'";
        //string str="insert into "
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public DataSet bindplaceedit(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_placename where id=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
        //  SqlDataAdapter da = new SqlDataAdapter("select It_home.id,It_home.title,It_home.category,It_home.sub_cat,It_home.subtitle, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id  where it_placename.id= " + id, con);
        //DataSet ds = new DataSet();
        // da.Fill(ds);
        //return 
    }
    public void deletefromplace(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_placename where id=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindperplaceid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select It_home.pkg_details,  It_home.id,It_home.title,It_home.category,It_home.sub_cat,it_home.subtitle,It_home.conten as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on    It_home.sub_cat=it_placename.id where it_home.id='" + id + "' and it_home.status=1 ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindperstatusoffer(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter(" select * from it_specialoffer order by oid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updateperoffer(string id,string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_specialoffer set status='" + sts + "' where oid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void deleteperoffer(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_specialoffer where oid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindcompany()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from it_company where status=1 order by cid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindproducts()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from it_products where status=1 order by cid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void insertproduct(string title, string imagename, string content, int status, string posteddate)
    {
        SqlCommand cmd = new SqlCommand("insert into it_products values('" + title + "','" + imagename + "','" + content + "','" + status + "','" + posteddate + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindproductdata() 
    {
        //SqlDataAdapter da = new SqlDataAdapter("select top 1 * from it_products order by cid desc", con);
        SqlDataAdapter da = new SqlDataAdapter("select cid,title,status,substring(content,1,100) as cont from it_products order by cid desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet bindstatusforproducts(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from it_products where cid=" + id, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;

    }
    public DataSet bindstatusforcompany(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from it_company where cid=" + id, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;

    }
    public void updatestatustoproducts(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_products set status='" + sts + "' where cid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updatestatustocompany(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_company set status='" + sts + "' where cid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void deletefromproducts(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from It_products where cid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void deletefromcompany(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from It_company where cid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindeditcompanydata(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from it_company where cid=" + id, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public void updatecompanydata(string id, string title, string content, int status)
    {
        SqlCommand cmd = new SqlCommand("update it_company set title='" + title + "',content='" + content + "',status='" + status + "' where cid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindeditproductsdata(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from it_products where cid=" + id, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public void updateproducteditdata(string id, string title, string content, int status)
    {
        SqlCommand cmd = new SqlCommand("update it_products set title='" + title + "',content='" + content + "',status='" + status + "' where cid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindcompanydata()
    {
        SqlDataAdapter da = new SqlDataAdapter("select cid,title,status,substring(content,1,100) as cont from it_company order by cid desc", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public void insertcompany(string title, string imagename, string content, int status, string posteddate)
    {
        SqlCommand cmd = new SqlCommand("insert into it_company values('" + title + "','" + imagename + "','" + content + "','" + status + "','" + posteddate + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void insertdatavisa(string title,string address,string geninfo,string business,string tourist,int sts,string date)
    {
        SqlCommand cmd = new SqlCommand("insert into [it_visa] values('" + title + "','" + address.Replace("'", "''") + "','"+geninfo.Replace("'","''")+"','" + business.Replace("'", "''") + "','" + tourist.Replace("'", "''") + "','" + sts + "','" + date + "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindvisaperplace(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from it_visa where placename='" + id + "' and status=1 order by vid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet binddatavisa()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select vid,placename,substring (address,1,100)as address,genrequirements,business_details,tourist_details,status,posteddate  from  it_visa order by vid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void deletevisa(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_visa where vid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
            con.Close();
    }

    public void contactinsert(string name, string email, string ph, string place, string msg)
    {
        SqlCommand cmd = new SqlCommand("insert into iT_contact values('" + name.Replace("'", "''") + "','" + email + "','" + ph + "','" + place + "','" + msg.Replace("'", "''") + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    

    public void insertidea(string title, string content, int sts, string date)
    {
        SqlCommand cmd = new SqlCommand("insert into it_travelideas values('" + title + "','" + content.Replace("'", "''") + "','" + sts + "','" + date + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindideadata()
    {

        SqlDataAdapter ad = new SqlDataAdapter("select iid,posteddate,status,title,substring(content,1,50) as content  from it_travelideas  order by iid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindideaone()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from it_travelideas  where status=1 order by iid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindperidea(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from  it_travelideas where iid=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updateideastatus(string it, string st)
    {
        SqlCommand cmd = new SqlCommand("update it_travelideas set status='" + st + "' where iid= " + it, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void deletefromidea(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_travelideas where iid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void insertcareer(string desg, string exp, string location, string jobtype, string desp, string date, int status)
    {
        SqlCommand cmd = new SqlCommand("insert into it_career values('" + desg.Replace("'", "''") + "','" + exp + "','" + location + "','" + jobtype + "','" + desp.Replace("'", "''") + "','" + date + "','" + status + "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindjobs()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_career where status=1 order by cid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindjobperid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_career where cid= " + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindalljobs()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_career order by cid desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindpackages()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  It_home.id,It_home.title,It_home.category,It_home.sub_cat,it_home.subtitle, substring (It_home.conten,1,100) as content,It_home.imagename,It_home.status,It_home.posteddate,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on It_home.sub_cat=it_placename.id where it_home.title IN ('International Tours', 'Domestic Tours')  order by it_home.id desc", con);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }
    public DataSet bindpackageedit(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select It_home.title,It_home.category,It_home.sub_cat,it_home.subtitle,It_home.conten as content,It_home.imagename,It_home.status,It_home.posteddate,it_home.pkg_details,it_placename.place,it_placename.id as pid from  It_home inner join it_placename on It_home.sub_cat=it_placename.id where it_home.id=" + id, con);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }
    //parvathi
    public void updateplacename(string id, string category, string place)
    {
        SqlCommand cmd = new SqlCommand("update it_placename set category='" + category + "',place='" + place + "' where id=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void updatehomedatatour(string title, string category, string subcat, string content, string sub, string date, string id, string package, string packtype)
    {
        string str = "update It_home set title='" + title + "',category='" + category + "',sub_cat='" + subcat + "',conten='" + content + "',subtitle='" + sub + "',posteddate='" + date + "',pkg_details='" + package + "',pkgtype='" + packtype + "' where id='" + id + "'";
        //string str="insert into "
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    //swati
    public void updatestatusvisa(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_visa set status='" + sts + "' where vid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindvisaper(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_visa where vid= " + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void updatecareerstatus(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update it_career set status='" + sts + "' where cid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet bindcareerone(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_career where cid=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void deletecareer(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_career where cid=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public void updatecareer(string id,string desg,string exp,string loc, string job,string des )
    {
        SqlCommand cmd = new SqlCommand("update it_career set designation='" + desg + "',experience='" + exp + "',location='" + loc + "',jobtype='" + job + "', desp='" + des + "' where cid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void updatevisa(string id, string visapalce, string address, string generalinf, string businessdetails, string tourist)
    {
        string str = "update it_visa set placename='" + visapalce + "',address='" + address + "',genrequirements='" + generalinf + "',business_details='" + businessdetails + "',tourist_details='" + tourist + "' where vid=" + id;
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }

    public DataSet bindvaluepercat(string drop1, string drop2)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select  * from it_addedservices where title='" + drop1 + "' and subcat='" + drop2 + "' ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void updateservicepage(string id, string pagename)
    {
        SqlCommand cmd = new SqlCommand("update it_addedservices set pagename='" + pagename + "' where eid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataSet bindserviceperid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_addedservices where eid= " + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
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

    public void insertfeedback(string content, string email, string name, string date,int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into it_feedback values('" + content.Replace("'", "''") + "','" + email + "','" + name + "','" + date + "',"+sts+")", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    //public void updatehomedatawithimgtour(string title, string category, string subcat, string content, string sub, string packtype, string id, string filename)
    //{
    //    string str = "update It_home set title='" + title + "',category='" + category + "',sub_cat='" + subcat + "',conten='" + content + "',subtitle='" + sub + "',imagename='" + filename + "',pkgtype='" + packtype + "' where id='" + id + "'";
    //    //string str="insert into "
    //    SqlCommand cmd = new SqlCommand(str, con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();

    //}
    //public void inserwithimgcontent(string title, string cat, string subcat, string content, string image, int sts, string date, string subtitle, string pkg)
    //{
    //    SqlCommand cmd = new SqlCommand("insert into [dbo].[It_home] values('" + title.Replace("'", "''") + "','" + cat + "','" + subcat + "','" + content.Replace("'", "''") + "','" + image.Replace("'", "''") + "'," + sts + ",'" + date + "','" + subtitle.Replace("'", "''") + "','" + pkg.Replace("'", "''") + "')", con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //}
    public DataTable bindcontact()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from iT_contact order by cid desc", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }

    public void deletefromcontact(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from iT_contact where cid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
public DataTable bindfooter()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from IT_FooterPage order by pid desc", con);
        DataTable ds = new DataTable();
        ad.Fill(ds);
        return ds;
    }

    public void deletefromfooter(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from IT_FooterPage where pid= " + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void insertfooter(string page, string title, string content, string file,string date)
    {
        SqlCommand cmd = new SqlCommand("insert into IT_FooterPage(page,title,content,imagename,status,posteddate) values('" + page.Replace("'", "''") + "','" + title.Replace("'", "''") + "','" + content.Replace("'", "''") + "','" + file + "',1,'" + date + "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void insert_exception(Exception ex, string excep_page)
    {
        string excep1 = ex.StackTrace.ToString();
        string line = excep1.Substring(excep1.LastIndexOf("line"), (excep1.Length - excep1.LastIndexOf("line")));
        string exception_msg = ex.Message;
        DateTime date = Convert.ToDateTime(System.DateTime.Now.ToString());
        string excep_status = "0";
        SqlCommand cmd = new SqlCommand("spexception1", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Excep_desc", exception_msg);
        cmd.Parameters.AddWithValue("@Excep_postdate", date);

        cmd.Parameters.AddWithValue("@Excep_page", excep_page);
        cmd.Parameters.AddWithValue("@Linenumber", line);
        cmd.Parameters.AddWithValue("@Excep_status", excep_status);
        // error err = new error();
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        //return res;
    }

    public DataSet bindprivacy()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from IT_FooterPage where page='Privacy Policy' and status=1 order by pid desc", con);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        return dt;
    }

    public DataSet bindfaq()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from IT_FooterPage where page='FAQ' and status=1  order by pid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;

    }
 public DataSet bindconditions()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select top 1 * from IT_FooterPage where page='Terms & Conditions' and status=1 order by pid desc  ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
 public void insertads(string name, string business, string ph, string email, string page, string type, string size, string duration)
 {
     SqlCommand cmd = new SqlCommand("insert into [AdRequirement] values('" + name.Replace("'", "''") + "','" + business.Replace("'", "''") + "','" + ph + "','" + email + "','" + page + "','" + type + "','" + size + "','" + duration + "') ", con);
     con.Open();
     cmd.ExecuteNonQuery();
     con.Close();
 }

 public void insertairlines(string name, string ph, int sts)
 {
     SqlCommand cmd = new SqlCommand("insert into it_airline values('" + name + "','" + ph + "'," + sts + ")", con);
     con.Open();
     cmd.ExecuteNonQuery();
     con.Close();
 }
 public DataSet bindairlinesnum()
 {
     SqlDataAdapter ad = new SqlDataAdapter("select * from it_airline order by name ", con);
     DataSet ds = new DataSet();
     ad.Fill(ds);
     return ds;
 }
 public DataSet readstatusoffoote(string id)
 {

     SqlDataAdapter ad = new SqlDataAdapter("select * from IT_FooterPage where pid=" + id, con);
     DataSet ds = new DataSet();
     ad.Fill(ds);
     return ds;
 }

 public void updatefooterstatus(string id, string cat)
 {
     SqlCommand cmd = new SqlCommand("update IT_FooterPage set status='" + cat + "' where pid=" + id, con);
     con.Open();
     cmd.ExecuteNonQuery();
     con.Close();
 }
public void updateuserstatus(string id, string U_status)
    {
        SqlCommand cmd = new SqlCommand("update it_travel_admin_users set U_status='" + U_status + "' where Id=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataSet binduserone(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_travel_admin_users where Id=" + id, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void deleteUser(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from it_travel_admin_users where Id=" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void insertUser(string u_F_name, string u_L_name, string u_loginId, string u_password, string u_designation, string u_country, string u_mobile, string u_contact_no, string u_email, string u_address, int U_status, string u_address1)
    {
        SqlCommand cmd = new SqlCommand("insert into it_travel_admin_users(u_F_name, u_L_name, u_loginId, u_password, u_designation, u_country, u_mobile, u_contact_no, u_email, u_address, U_status, u_address1) values('" + u_F_name + "','" + u_L_name + "','" + u_loginId + "','" + u_password + "','" + u_designation.Replace("'", "''") + "','" + u_country + "','" + u_mobile + "','" + u_contact_no + "','" + u_email + "','" + u_address + "','" + U_status + "','" + u_address1 + "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
   
    public DataSet bindalluser()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_travel_admin_users order by Id desc ", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public int loginidcheck(string u_loginId)
    {
        SqlCommand com = new SqlCommand("select count(*)from it_travel_admin_users where u_loginId='" + u_loginId + "'", con);
        con.Open();
        int count = Convert.ToInt32(com.ExecuteScalar());
        con.Close();
        return count;
    }
    public int updateUser(string u_F_name, string u_L_name, string u_loginId, string u_password, string u_designation, string u_country, string u_mobile, string u_contact_no, string u_email, string u_address,  string u_address1,string id)
    {
        SqlCommand cmd = new SqlCommand("update it_travel_admin_users set u_F_name='" + u_F_name + "', u_L_name='" + u_L_name + "',u_loginId='" + u_loginId + "',u_password='" + u_password + "', u_designation='" + u_designation + "',u_country='" + u_country + "', u_mobile='" + u_mobile + "', u_contact_no='" + u_contact_no + "', u_email='" + u_email + "', u_address='" + u_address + "',  u_address1='" + u_address1 + "' where Id=" + id, con);
        con.Open();
        int i=cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

  

    public DataSet getUser(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_travel_admin_users where Id='"+ id+"'", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindfeedbackadmin()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from [dbo].[it_feedback] order by fid desc", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindperoffer(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from it_specialoffer where oid=" + id, con);
        DataSet ds = new DataSet();

        ad.Fill(ds);
        return ds;

    }

    public void inserjobapplication(string jobid, string name, string mail, string ph, string rm, string date, int flag)
    {
        SqlCommand cmd = new SqlCommand("insert into [Travel_Jobs_Apply1] values('" + jobid + "','" + name.Replace("'", "''") + "','" + mail + "','" + ph + "','" + rm.Replace("'", "''") + "','" + date + "'," + flag + ")", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

}