using System;
using System.Collections.Generic;

using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for home
/// </summary>
public class home
{
    SqlConnection con1 = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
    public home()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataSet checkuser(string email)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from OP_user where emailid='" + email + "' ", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet checkuserid(string userid)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from OP_user where userid='" + userid + "' ", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet userdata()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select fname+ ' '+lname as fname,designation,emailid,mobile,status,posteddate,id,userid,address from OP_user  order by fname ", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void insertuser(string fname, string lname, string desg, string email, string userid, string pwd, string cpwd, string add, string add2, string mobile, int sts, string date)
    {
        SqlCommand cmd = new SqlCommand("insert into OP_user values('" + fname.Replace("'", "''") + "','" + lname.Replace("'", "''") + "','" + desg.Replace("'", "''") + "','" + email + "','" + userid.Replace("'", "''") + "','" + pwd + "','" + cpwd + "','" + add.Replace("'", "''") + "','" + add2.Replace("'", "''") + "','" + mobile + "'," + sts + ",'" + date + "')", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void updatests(int sts, string id)
    {
        SqlCommand cmd = new SqlCommand("update OP_user set status=" + sts + " where id= " + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void deleteuser(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from OP_user where id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet binduserdata(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from OP_user where id= " + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;

    }
    public void edituserdata(string fname, string lname, string desg, string email, string userid, string pwd, string cpwd, string add, string add2, string mobile, string id)
    {
        SqlCommand cmd = new SqlCommand("update OP_user set fname='" + fname.Replace("'", "''") + "',lname='" + lname.Replace("'", "''") + "',emailid='" + email + "',pwd='" + pwd + "',userid='" + userid.Replace("'", "''") + "',cnfpwd='" + cpwd + "',address='" + add.Replace("'", "''") + "',address2='" + add2.Replace("'", "''") + "',mobile='" + mobile + "'   where id= " + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();

    }
    public void insertmenu(string name, string id)
    {
        SqlCommand cmd = new SqlCommand("insert into op_menu_subcat values('" + name.Replace("'", "''") + "'," + id + ")", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet bindmainmenu()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_mainmenu order by id asc", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;

    }
    public DataSet bindsubmenu(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_menu_subcat where id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;

    }
    public void addcategory(string name, string sid, string id)
    {
        SqlCommand cmd = new SqlCommand("insert into  op_subcat values ('" + name.Replace("'", "''") + "'," + sid + ",'" + id + "')", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();


    }
    public DataSet bindsubmenucat(string id, string sid)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_subcat where id=" + id + " and sid=" + sid + "", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;

    }
    public DataSet searchuser(string deg, string userid, string pwd)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from OP_user where designation='" + deg + "' and userid='" + userid + "' and pwd='" + pwd + "'", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void insertservices(string title, int category, int sub_cat, string content, string date, string image)
    {
        SqlCommand cmd = new SqlCommand("insert into op_services values('" + title.Replace("'", "''") + "','" + category + "','" + sub_cat + "','" + content.Replace("'", "''") + "','" + date + "','" + image + "')", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();

    }

    public DataSet bindservices()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select op_services.ser_id,op_services.title,op_services.category,op_services.sub_cat,op_services.content,op_services.posteddate,op_services.imagename,op_menu_subcat.subname, op_subcat.subcat_name from op_services inner join    op_menu_subcat on cast ( op_services.category as nvarchar(100))=  op_menu_subcat.sid   inner join op_subcat on    op_subcat.cid=op_services.sub_cat order by ser_id desc", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void deleteservice(int id)
    {
        SqlCommand cmd = new SqlCommand("delete from op_services where ser_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataSet bindserid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select op_services.ser_id,op_services.title,op_services.category,op_services.sub_cat,op_services.content,op_services.posteddate,op_services.imagename,op_menu_subcat.subname, op_subcat.subcat_name from op_services inner join    op_menu_subcat on cast ( op_services.category as nvarchar(100))=  op_menu_subcat.sid   inner join op_subcat on    op_subcat.cid=op_services.sub_cat where  op_services.ser_id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updateserwithimg(string title, string category, string subcat, string imagename, string content, string id)
    {
        SqlCommand cmd = new SqlCommand("update op_services set title='" + title.Replace("'", "''") + "',category='" + category + "',sub_cat='" + subcat + "',content='" + content.Replace("'", "''") + "',imagename='" + imagename + "' where ser_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void updateserwithoutimg(string title, string category, string subcat, string content, string id)
    {
        SqlCommand cmd = new SqlCommand("update op_services set title='" + title.Replace("'", "''") + "',category='" + category + "',sub_cat='" + subcat + "',content='" + content.Replace("'", "''") + "' where ser_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet bindhome()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from  orphan_home order by id desc", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindhomeperid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from  orphan_home where id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public void updatehome(string tilte, string category, string content, string id, string subcat, string img)
    {
        SqlCommand cmd = new SqlCommand("update orphan_home set title='" + tilte.Replace("'", "''") + "',category='" + category + "',content='" + content.Replace("'", "''") + "',su_cat='" + subcat + "', imagename='" + img + "' where id='" + id + "' ", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void insertevent(string title, string category, string imagename, string content, string date, int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into op_events values('" + title.Replace("'", "''") + "','" + category + "','" + imagename + "','" + content.Replace("'", "''") + "','" + date + "'," + sts + ")", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet bindevent()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_events order by eid desc", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void deleteevent(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from op_events where eid=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet evntperid(string id)
    {
        SqlDataAdapter cmd = new SqlDataAdapter("select * from op_events where eid=" + id, con1);
        DataSet ds = new DataSet();
        cmd.Fill(ds);
        return ds;
    }
    public void evntwithimg(string title, string cat, string img, string content, string id)
    {
        SqlCommand cmd = new SqlCommand("update op_events set title='" + title.Replace("'", "''") + "',category='" + cat + "',imagename='" + img + "',content='" + content.Replace("'", "''") + "' where eid=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();

    }
    public void evntoutimg(string title, string cat, string content, string id)
    {
        SqlCommand cmd = new SqlCommand("update op_events set title='" + title.Replace("'", "''") + "',category='" + cat + "',content='" + content.Replace("'", "''") + "' where eid=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();

    }
    public void insertsupportmenu(string name, string page, int sts)
    {
        SqlCommand cmd = new SqlCommand("insert into op_support_menu values( '" + name.Replace("'", "''") + "','" + page + "'," + sts + ")", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void insertsupport(string title, string category, string content, string date, int sts)
    {
        SqlCommand cmd = new SqlCommand("op_insertsupport", con1);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@category", category);

        cmd.Parameters.AddWithValue("@content", content);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@sts", sts);
        // error err = new error();
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void insertsupportimag(string image, string category, string date, string titl)
    {
        SqlCommand cmd = new SqlCommand("insert into op_support_img values('" + image.Replace("'", "''") + "','" + category + "','" + date + "','" + titl.Replace("'", "''") + "') ", con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }


    public DataTable bindsupportadmin()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select op_support.sup_id,op_support.status,op_support.title,op_support.category,op_support.content,op_support.posteddate,op_support_menu.sid,op_support_menu.menu_name from op_support inner join op_support_menu on op_support.category=op_support_menu.sid order by sup_id desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public void deletesupport(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from  op_support where sup_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataTable bindsupportmenu()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_menu order by sid asc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void deletefromsupmenu(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from op_support_menu where sid=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataSet bindstatusformenu(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_menu where sid=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void changestatusformenu(string id, string sts)
    {
        SqlCommand cmd = new SqlCommand("update op_support_menu set status='" + sts + "' where sid= " + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataSet bindstatusforsupport(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support where sup_id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void changestatusforsupport(string id, string status)
    {
        SqlCommand cmd = new SqlCommand("update  op_support set status='" + status + "' where sup_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataTable bindsupportimg()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_img order by iim desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void deletefromsupportimg(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from op_support_img where iim=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataTable bindspecialmenu()
    {
        SqlDataAdapter ad = new SqlDataAdapter("select op_specialmemu.mid,op_specialmemu.item_name,op_specialmemu.mealtype,op_support.sup_id,op_support_menu.sid,op_support_menu.menu_name from  op_specialmemu inner join  op_support on   op_support.sup_id=op_specialmemu.sup_id  inner join op_support_menu on op_support_menu.sid= op_specialmemu.sid order by mid desc", con1);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }
    public void deletefromfoodmenu(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from op_specialmemu where mid=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }


    public DataSet bindsupedit1(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select op_support.sup_id,op_support.status,op_support.title,op_support.category,op_support.content,op_support.posteddate,op_support_menu.sid,op_support_menu.menu_name from op_support inner join op_support_menu on op_support.category=op_support_menu.sid where op_support.sup_id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindfoodedit(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_specialmemu where sup_id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindsupporteditwithgrid(string id, string dl)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_details where sup_id='" + id + "' and category='" + dl + "'", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
    public DataSet bindsupporteditwithgridfood(string id, string dl)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_specialmemu  where sup_id='" + id + "' and sid='" + dl + "'", con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void updatesupport1(string title, string cat, string content, string id)
    {
        SqlCommand cmd = new SqlCommand("update  op_support set title='" + title.Replace("'", "''") + "',category='" + cat + "',content='" + title.Replace("'", "''") + "' where sup_id=" + id, con1);

        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }


    public void updatesupportmenu(string name, string page ,string id )
    {
        SqlCommand cmd = new SqlCommand("update  op_support_menu set  menu_name ='" + name.Replace("'", "''") + "',page_name='" + page + "' where sid="+id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataSet bindmenuperid(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_menu where sid=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet bindsupportimg(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from op_support_img where iim=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public void updatesupportimgwithimg(string image,string cat,string title,string id)
    {
        SqlCommand cmd = new SqlCommand("update op_support_img set imagename='" + image.Replace("'", "''") + "',category='" + cat + "',title='" + title.Replace("'", "''") + "' where iim=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public void updatesupportimg( string cat, string title, string id)
    {
        SqlCommand cmd = new SqlCommand("update op_support_img set category='" + cat + "',title='" + title.Replace("'", "''") + "' where iim=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }
    public DataSet galleryaddedid(string id)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from orphan_gallery where id=" + id, con1);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;

    }
    //public DataSet deletesupportstatus(string id)
    //{
    //    SqlDataAdapter dastatus = new SqlDataAdapter("select * from  op_support where sup_id=" + id, con1);
    //    DataSet dsstatus = new DataSet();
    //    dastatus.Fill(dsstatus);
    //    return dsstatus;
       
    //}
    public void deletesupmenu(string id)
    {
        SqlCommand cmd = new  SqlCommand("delete from op_specialmemu where sup_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public void deletesubdata(string id)
    {
        SqlCommand cmd = new SqlCommand("delete from op_support_details where sup_id=" + id, con1);
        con1.Open();
        cmd.ExecuteNonQuery();
        con1.Close();
    }

    public DataSet viewcat(string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select category from op_support where sup_id=" + id, con1);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
}