using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Mail;
using System.Web.SessionState;
using System.IO;

namespace igiit.BussinessLogic
{

    /// <summary>
    /// Summary description for Registration
    /// </summary>
    public class Registration
    {
        public Registration()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        string str = string.Empty;
        public bool Insert(string uname, string FName,string MName,string LName, 
                            string Password,
                            string CPassword,
                            string FatherName,string MotherName,string SpouseName,
                            string EMail,
                            string Street,
                            string Country1,
                            string state1,
                            string city1,
                            string zip,
                            string WorkPhone,
                            string HomePhone, 
                            string MobPhone,
                            DateTime bdate,
                            string citizenship,
                            string bcity,
                            string bstate,
                            string bcntry,
                            string passportno,
                            string passportissuedat,
                            DateTime issueddate,
                            DateTime dofexp,
                            string natiionality,
                            string cntryofpassport,
                            string cpname1,
                            string cpphone1,
                            string cpemail1,
                            string cpaddress1,
                            string cpname2,
                            string cpphone2,
                            string cpemail2,
                            string cpaddress2,
                            int ExpYears, int ExpMonths,
                            //string Skills,
                            string Rhead, string Fnarea, string IndType,
                            string Resume,  string Rpaste, string PDate)
                    {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();
            string strQuery = "INSERT INTO employeereg(username,emailid,pwd,confirmpwd,firstname,middlename,lastname,fathername,mothername,spousename,country1,state1,street,city1,zip,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,birthstate,birthcountry,passportno,passportissuedat,dateofissue, doexp,nationality,countryofpassport,contactpersonname1,cp1phone,cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2,totexptrs,totexpmonths,rhead,functionalarea,currentindustrytype,filename1,resumetxt,pdate) VALUES(@uname,@emailid,@pwd,@confirmpwd,@firstname,@middlename,@lastname,@fathername,@mothername,@spousename,@country1,@state1,@street,@city1,@zip,@workphone,@homephone,@mobile,@birthdate,@cntryofcitizenship,@birthcity,@birthstate,@birthcountry,@passportno,@passportissuedat,@dateofissue,@doexp,@nationality,@countryofpassport,@contactpersonname1,@cp1phone,@cp1email,@cpaddress1,@contactpersonname2,@cp2phone2,@cp2email,@cpaddress2,@totexptrs,@totexpmonths,@rhead,@functionalarea,@currentindustrytype,@filename1,@resumetxt,@pdate)";
            SqlCommand cmd = new SqlCommand(strQuery, connection);
             cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@emailid", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@confirmpwd", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@fname", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@firstname", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@middlename", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@lastname", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@fathername", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mothername", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@spousename", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@workphone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@country1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@state1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@street", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@city1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@zip", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@homephone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mobile", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@cntryofcitizenship", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthcity", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthstate", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthcountry", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@passportno", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@passportissuedat", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@dateofissue", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@doexp", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@nationality", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@countryofpassport", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@contactpersonname1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cp1phone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cp1email", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpaddress1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@contactpersonname2", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@cp2phone2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cp2email", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpaddress2", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@totexptrs", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@totexpmonths", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@rhead", SqlDbType.NVarChar));
            //@functionalarea
            cmd.Parameters.Add(new SqlParameter("@functionalarea", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@currentindustrytype", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@resumetxt", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@filename1", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@jobalertflag", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@traineeprgsflag", SqlDbType.NVarChar, 20000));

            //@newsflag,@termsandconditions,@pdate
            //cmd.Parameters.Add(new SqlParameter("@newsflag", SqlDbType.NVarChar, 20000));
            //cmd.Parameters.Add(new SqlParameter("@termsandconditions", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.NVarChar));
            cmd.Parameters["@uname"].Value = uname;
            cmd.Parameters["@emailid"].Value = EMail;
            cmd.Parameters["@pwd"].Value = Password;
            cmd.Parameters["@confirmpwd"].Value = CPassword;
            cmd.Parameters["@firstname"].Value = FName;
            cmd.Parameters["@middlename"].Value = MName;
            cmd.Parameters["@lastname"].Value = LName;
            cmd.Parameters["@fathername"].Value = FatherName;
            cmd.Parameters["@mothername"].Value = MotherName;
            cmd.Parameters["@spousename"].Value = SpouseName;
            cmd.Parameters["@country1"].Value = Country1;
            cmd.Parameters["@state1"].Value = state1;
            cmd.Parameters["@street"].Value = Street;
            cmd.Parameters["@city1"].Value = city1;
            cmd.Parameters["@zip"].Value = zip;
            cmd.Parameters["@workphone"].Value = HomePhone;
            cmd.Parameters["@homephone"].Value = HomePhone;
            cmd.Parameters["@mobile"].Value = MobPhone;
            cmd.Parameters["@birthdate"].Value = bdate;
            cmd.Parameters["@cntryofcitizenship"].Value = citizenship;
            cmd.Parameters["@birthcity"].Value = bcity;

            cmd.Parameters["@birthstate"].Value = bstate;

            cmd.Parameters["@birthcountry"].Value = bcntry;

            cmd.Parameters["@passportno"].Value = passportno;
            cmd.Parameters["@passportissuedat"].Value = passportissuedat;
            cmd.Parameters["@dateofissue"].Value = issueddate;
            //

            cmd.Parameters["@doexp"].Value = dofexp;
            cmd.Parameters["@nationality"].Value = natiionality;
            cmd.Parameters["@countryofpassport"].Value = cntryofpassport;
            cmd.Parameters["@contactpersonname1"].Value = cpname1;
            cmd.Parameters["@cp1phone"].Value = cpphone1;
            cmd.Parameters["@cp1email"].Value = cpemail1;
            cmd.Parameters["@cpaddress1"].Value = cpaddress1;
            cmd.Parameters["@contactpersonname2"].Value = cpname2;

            cmd.Parameters["@cp2phone2"].Value = cpphone2;
            cmd.Parameters["@cp2email"].Value = cpemail2;
            cmd.Parameters["@cpaddress2"].Value = cpaddress2;
            cmd.Parameters["@totexptrs"].Value = ExpYears;
            
            cmd.Parameters["@totexpmonths"].Value = ExpMonths;
            cmd.Parameters["@rhead"].Value = Rhead;
            cmd.Parameters["@functionalarea"].Value = Fnarea;
            cmd.Parameters["@currentindustrytype"].Value = IndType;
            cmd.Parameters["@resumetxt"].Value =Rpaste;

            cmd.Parameters["@filename1"].Value = Resume;
            cmd.Parameters["@pdate"].Value = PDate;

            
            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }


        public bool Updateres(string uname, string Country, string CurrentLoc, string WorkCcode, string WorkAcode, string WorkPhone,
                           string CurrentCom, string CurrentPos, string CurrentFmn, string CurrentFyr, string CurrentTmn, string CurrentTyr,
                           string HomeCcode, string HomeAcode, string HomePhone, string MobPhone,
                           string ExpYears, string ExpMonths, string Skills, string Rhead, string Fnarea, string IndType,
                           string Education, string Edu_Board, string Majorsub, string Edu_Year, string Edu_Score,
                           string Resume, string RType, string Rpaste, string PDate)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
                                        
            SqlCommand cmd = new SqlCommand("UPDATE employeereg set country=@acountry,currentcom=@acurrentcom,currentpos=@acurrentpos,currentfmn=@acurrentfmn,currentfyr=@acurrentfyr,currenttmn=@acurrenttmn,currenttyr=@acurrenttyr,currentloc=@acurrentloc,wccode=@awccode,wacode=@awacode,wphone=@awphone,hccode=@ahccode,hacode=@ahacode,hphone=@ahphone,mphone=@amphone,expyears=@aexpyears,expmonths=@aexpmonths,skills=@askills,rhead=@arhead,fnarea=@afnarea,indtype=@aindtype,education=@aeducation,education_board=@aeduboard,majorsub=@amajorsub,education_year=@aeduyear,education_score=@aeduscore,resume=@aresume,resumetype=@artype,rpaste=@arpaste,pdate=@apdate,flag1=@aflag where username='" + uname + "'", connection);

            
            cmd.Parameters.Add(new SqlParameter("@acountry", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrentcom", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrentpos", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrentfmn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrentfyr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrenttmn", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrenttyr", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@acurrentloc", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@awccode", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@awacode", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@awphone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ahccode", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ahacode", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@ahphone", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@amphone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@aexpyears", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@aexpmonths", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@askills", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@arhead", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@afnarea", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@aindtype", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@aeducation", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@aeduboard", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@amajorsub", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@aeduyear", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@aeduscore", SqlDbType.NVarChar));



            cmd.Parameters.Add(new SqlParameter("@aresume", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@artype", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@arpaste", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@apdate", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@aflag", SqlDbType.NChar));

            //cmd.Parameters["@ausername"].Value = UserName;
            //cmd.Parameters["@apassword"].Value = Password;
            //cmd.Parameters["@aname"].Value = Name;

            //cmd.Parameters["@aemail"].Value = EMail;

            cmd.Parameters["@acountry"].Value = Country;


            cmd.Parameters["@acurrentcom"].Value = CurrentCom;
            cmd.Parameters["@acurrentpos"].Value = CurrentPos;
            cmd.Parameters["@acurrentfmn"].Value = CurrentFmn;
            cmd.Parameters["@acurrentfyr"].Value = CurrentFyr;
            cmd.Parameters["@acurrenttmn"].Value = CurrentTmn;
            cmd.Parameters["@acurrenttyr"].Value = CurrentTyr;

            cmd.Parameters["@acurrentloc"].Value = CurrentLoc;

            cmd.Parameters["@awccode"].Value = WorkCcode;
            cmd.Parameters["@awacode"].Value = WorkAcode;
            cmd.Parameters["@awphone"].Value = WorkPhone;

            cmd.Parameters["@ahccode"].Value = HomeCcode;
            cmd.Parameters["@ahacode"].Value = HomeAcode;
            cmd.Parameters["@ahphone"].Value = HomePhone;

            cmd.Parameters["@amphone"].Value = MobPhone;
            cmd.Parameters["@aexpyears"].Value = ExpYears;
            cmd.Parameters["@aexpmonths"].Value = ExpMonths;

            cmd.Parameters["@askills"].Value = Skills;
            cmd.Parameters["@arhead"].Value = Rhead;
            cmd.Parameters["@afnarea"].Value = Fnarea;

            cmd.Parameters["@aindtype"].Value = IndType;
            cmd.Parameters["@aeducation"].Value = Education;
            cmd.Parameters["@aeduboard"].Value = Edu_Board;
            cmd.Parameters["@amajorsub"].Value = Majorsub;
            cmd.Parameters["@aeduyear"].Value = Edu_Year;
            cmd.Parameters["@aeduscore"].Value = Edu_Score;



            cmd.Parameters["@aresume"].Value = Resume;
            cmd.Parameters["@artype"].Value = RType;
            cmd.Parameters["@arpaste"].Value = Rpaste;
            cmd.Parameters["@apdate"].Value = PDate;
            cmd.Parameters["@aflag"].Value = "0";
            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }


        public bool Update(int  uid, string FName, string MName, string LName,
                            //string Password,
                           // string CPassword,
                            string FatherName, string MotherName, string SpouseName,
                            string EMail,
                            string Street,
                            string Country1,
                            string state1,
                            string city1,
                            string zip,
                            string WorkPhone,
                            string HomePhone,
                            string MobPhone,
                            DateTime bdate,
                            string citizenship,
                            string bcity,
                            string bstate,
                            string bcntry,
                            string passportno,
                            string passportissuedat,
                            DateTime issueddate,
                            DateTime dofexp,
                            string natiionality,
                            string cntryofpassport,
                            string cpname1,
                            string cpphone1,
                            string cpemail1,
                            string cpaddress1,
                            string cpname2,
                            string cpphone2,
                            string cpemail2,
                            string cpaddress2,
                            int ExpYears, int ExpMonths,
                            //string Skills,
                            string Rhead, string Fnarea, string IndType,
                            string Resume, string Rpaste, string PDate)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
                                
            SqlCommand cmd = new SqlCommand("UPDATE employeereg set emailid=@emailid,firstname=@firstname,middlename= @middlename,lastname=@lastname,fathername=@fathername,mothername=@mothername,spousename=@spousename,country1=@country1,state1=@state1,street=@street,city1=@city1,zip=@zip,homephone=@homephone,workphone=@workphone,mobile=@mobile,birthdate=@birthdate,cntryofcitizenship=@cntryofcitizenship,birthcity=@birthcity,birthstate=@birthstate,birthcountry=@birthcountry,passportno=@passportno,passportissuedat=@passportissuedat,dateofissue=@dateofissue,doexp=@doexp,nationality=@nationality,countryofpassport=@countryofpassport,contactpersonname1=@contactpersonname1,cp1phone = @cp1phone,cp1email = @cp1email,cpaddress1=@cpaddress1,contactpersonname2=@contactpersonname2,cp2phone2=@cp2phone2,cp2email=@cp2email,cpaddress2=@cpaddress2, totexptrs = @totexptrs,totexpmonths=@totexpmonths,rhead=@rhead,functionalarea=@functionalarea,currentindustrytype=@currentindustrytype,filename1=@filename1,resumetxt=@resumetxt,pdate=@pdate where userid='" + uid + "'", connection);

            cmd.Parameters.Add(new SqlParameter("@emailid", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@confirmpwd", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@fname", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@firstname", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@middlename", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@lastname", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@fathername", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mothername", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@spousename", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@workphone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@country1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@state1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@street", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@city1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@zip", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@homephone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@mobile", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@cntryofcitizenship", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthcity", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthstate", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@birthcountry", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@passportno", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@passportissuedat", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@dateofissue", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@doexp", SqlDbType.DateTime));
            cmd.Parameters.Add(new SqlParameter("@nationality", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@countryofpassport", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@contactpersonname1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cp1phone", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cp1email", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpaddress1", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@contactpersonname2", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@cp2phone2", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cp2email", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@cpaddress2", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@totexptrs", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@totexpmonths", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@rhead", SqlDbType.NVarChar));
            //@functionalarea
            cmd.Parameters.Add(new SqlParameter("@functionalarea", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@currentindustrytype", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@resumetxt", SqlDbType.NVarChar));

            cmd.Parameters.Add(new SqlParameter("@filename1", SqlDbType.NVarChar));
            //cmd.Parameters.Add(new SqlParameter("@jobalertflag", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@traineeprgsflag", SqlDbType.NVarChar, 20000));

            //@newsflag,@termsandconditions,@pdate
            //cmd.Parameters.Add(new SqlParameter("@newsflag", SqlDbType.NVarChar, 20000));
            //cmd.Parameters.Add(new SqlParameter("@termsandconditions", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.NVarChar));

            cmd.Parameters["@emailid"].Value = EMail;
            //cmd.Parameters["@pwd"].Value = Password;
            //cmd.Parameters["@confirmpwd"].Value = CPassword;
            cmd.Parameters["@firstname"].Value = FName;
            cmd.Parameters["@middlename"].Value = MName;
            cmd.Parameters["@lastname"].Value = LName;
            cmd.Parameters["@fathername"].Value = FatherName;
            cmd.Parameters["@mothername"].Value = MotherName;
            cmd.Parameters["@spousename"].Value = SpouseName;
            cmd.Parameters["@country1"].Value = Country1;
            cmd.Parameters["@state1"].Value = state1;
            cmd.Parameters["@street"].Value = Street;
            cmd.Parameters["@city1"].Value = city1;
            cmd.Parameters["@zip"].Value = zip;
            cmd.Parameters["@workphone"].Value = WorkPhone;
            cmd.Parameters["@homephone"].Value = HomePhone;
            cmd.Parameters["@mobile"].Value = MobPhone;
            cmd.Parameters["@birthdate"].Value = bdate;
            cmd.Parameters["@cntryofcitizenship"].Value = citizenship;
            cmd.Parameters["@birthcity"].Value = bcity;

            cmd.Parameters["@birthstate"].Value = bstate;

            cmd.Parameters["@birthcountry"].Value = bcntry;

            cmd.Parameters["@passportno"].Value = passportno;
            cmd.Parameters["@passportissuedat"].Value = passportissuedat;
            cmd.Parameters["@dateofissue"].Value = issueddate;
            //
            cmd.Parameters["@doexp"].Value = dofexp;
            cmd.Parameters["@nationality"].Value = natiionality;
            cmd.Parameters["@countryofpassport"].Value = cntryofpassport;
            cmd.Parameters["@contactpersonname1"].Value = cpname1;
            cmd.Parameters["@cp1phone"].Value = cpphone1;
            cmd.Parameters["@cp1email"].Value = cpemail1;
            cmd.Parameters["@cpaddress1"].Value = cpaddress1;
            cmd.Parameters["@contactpersonname2"].Value = cpname2;

            cmd.Parameters["@cp2phone2"].Value = cpphone2;
            cmd.Parameters["@cp2email"].Value = cpemail2;
            cmd.Parameters["@cpaddress2"].Value = cpaddress2;
            cmd.Parameters["@totexptrs"].Value = ExpYears;
            //
            //
            cmd.Parameters["@totexpmonths"].Value = ExpMonths;
            cmd.Parameters["@rhead"].Value = Rhead;
            cmd.Parameters["@functionalarea"].Value = Fnarea;
            cmd.Parameters["@currentindustrytype"].Value = IndType;
            cmd.Parameters["@resumetxt"].Value = Rpaste;

            cmd.Parameters["@filename1"].Value = Resume;
            cmd.Parameters["@pdate"].Value = PDate;
            
            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }

        public bool ClientPwdUpdate(string uname, string NewPwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand cmd = new SqlCommand("update clientregistration set password=@pwd where username ='"+ uname + "'",connection);
            cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.VarChar, 50));
            cmd.Parameters["@pwd"].Value = NewPwd;
            cmd.ExecuteNonQuery();
            connection.Close();
            return true;

        }
        public bool PwdUpdate(string uname, string NewPwd)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("UPDATE employeereg set pwd=@apassword where username='" + uname + "'", connection);
                      
             cmd.Parameters.Add(new SqlParameter("@apassword", SqlDbType.NVarChar, 50));
           
             cmd.Parameters["@apassword"].Value = NewPwd;
           
            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }



        public Int32 CheckEmailid(string emailid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg where emailid = '" + emailid + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }

        public Int32 CheckUserName(string uname)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg where username = '" + uname + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }



    }
    public class Checkuser
    {
        public string str = ConfigurationManager.AppSettings["ConnectionString"];
        public bool flag;

        public bool VeryfiUserPass(string UserId, string PassWord)
        {
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select * from employeereg", con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[1].ToString() == UserId && dr[2].ToString() == PassWord)
                {
                    flag = true;
                }
            }
            con.Close();
            return flag;
        }


        public Int32 FindRecords(string emailid, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg where emailid = '" + emailid + "' and pwd = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }

        public Int32 FindClientRecords(string uname, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where username = '" + uname + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }
        public Int32 FindEmpRecords(string uname, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg where username = '" + uname + "' and pwd = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }
        public DataSet FindAndGetUserDet(string uname)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username = '" + uname + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


        public DataSet getUserDet(string id, string name)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where userid = '" + id + "' and username = '" + name + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet getClientDet(string id, string name)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where userid = '" + id + "' and username = '" + name + "'", connection);
            sqlda.Fill(dsUDetails, "ClientDetails");
            return dsUDetails;
        }
        public DataSet getClientDetails(string id, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + id + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "ClientDetails");
            return dsUDetails;
        }

        //public DataSet getEmpDetails(string id, string pwd)
        //{
        //    DataSet dsUDetails = new DataSet();
        //    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //    connection.Open();
        //    SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where userid = '" + id + "' and password = '" + pwd + "'", connection);
        //    sqlda.Fill(dsUDetails, "empregistration");
        //    return dsUDetails;
        //}

        public DataSet getUserDetails(string id, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username = '" + id + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getRecDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getEmpDetails(string uname, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username= '" + uname + "' and pwd = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "EmpDetails");
            return dsUDetails;
        }

        public DataSet getNewUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where emailid = '" + emailid + "' and pwd = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public string userName(string user)
        {
            string connection = ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection cn = new SqlConnection(connection);
            SqlDataReader sdr;
            string s = "select emailid from employeereg where emailid='" + user + "'";
            SqlCommand cmdobj = new SqlCommand(s, cn);
            cn.Open();
            sdr = cmdobj.ExecuteReader();
            string userId = null;
            while (sdr.Read())
            {
                userId = Convert.ToString(sdr["username"]);

            }
            cn.Close();
            return userId;
        }

        public string getPassword(Int32 uid)
        {
            string connection = ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection cn = new SqlConnection(connection);
            SqlDataReader sdr;
            string s = "select pwd from employeereg where userid=" + uid + "";
            SqlCommand cmdobj = new SqlCommand(s, cn);
            cn.Open();
            sdr = cmdobj.ExecuteReader();
            string pwd = string.Empty;
            while (sdr.Read())
            {
                pwd = Convert.ToString(sdr["password"]);

            }
            cn.Close();
            return pwd;
        }

    }

    public class JobSearch
    {
        public string str = ConfigurationManager.AppSettings["ConnectionString"];
        public bool flag;
        public DataSet QuickSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select cg_jobpost.rowid as id,cg_jobpost.userid as uid,cg_jobpost.jobtitle as jobt,cg_jobpost.Edu_Min as edu,cg_jobpost.Min_Exp as min,cg_jobpost.Max_Exp as max,cg_jobpost.Location as loc,clientregistration.cname as comp from cg_jobpost,clientregistration where cg_jobpost.userid=clientregistration.userid and " + searchstr, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet GetJobDetails(string jid, string compid)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select cg_jobpost.jobtitle as desig,clientregistration.cname as comp,cg_jobpost.Min_Exp as min,cg_jobpost.Max_Exp as max,cg_jobpost.Functional_Area as fnarea,cg_jobpost.Keyskills as skills,cg_jobpost.Location as loc,cg_jobpost.Edu_Min as edu,clientregistration.indtype as ind,clientregistration.cdesc as descr from cg_jobpost,clientregistration where cg_jobpost.userid = clientregistration.userid and cg_jobpost.rowid=" + jid, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

       
        public DataSet CategSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select distinct Functional_Area as farea,userid from cg_jobpost order by Functional_Area", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


        public DataSet CompSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select distinct cname as cname, userid from clientregistration order by cname", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


        public DataSet InternSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select distinct Location as Location,userid from cg_jobpost order by Location", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet ResumeSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where " + searchstr, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


    }

    // Home Page Search

    public class HomeJobSearch
    {
        public string str = ConfigurationManager.AppSettings["ConnectionString"];
        public bool flag;
        public DataSet QuickSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select cg_jobpost.rowid as id,cg_jobpost.userid as uid,cg_jobpost.jobtitle as jobt,cg_jobpost.Edu_Min as edu,cg_jobpost.Min_Exp as min,cg_jobpost.Max_Exp as max,cg_jobpost.Location as loc,clientregistration.cname as comp from cg_jobpost,clientregistration where cg_jobpost.userid=clientregistration.userid and " + searchstr, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet GetJobDetails(string jid, string compid)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select cg_jobpost.jobtitle as desig,clientregistration.cname as comp,cg_jobpost.Min_Exp as min,cg_jobpost.Max_Exp as max,cg_jobpost.Functional_Area as fnarea,cg_jobpost.Keyskills as skills,cg_jobpost.Location as loc,cg_jobpost.Edu_Min as edu,clientregistration.indtype as ind,clientregistration.cdesc as descr from cg_jobpost,clientregistration where cg_jobpost.userid = clientregistration.userid and cg_jobpost.rowid=" + jid, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet ResumeSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where " + searchstr, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
    }





    // Employer Check User Starts Here ********************

    public class EmpCheckuser
    {
        public string str = ConfigurationManager.AppSettings["ConnectionString"];
        public bool flag;

        public bool VeryfiUserPass(string UserId, string PassWord)
        {
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select * from clientregistration", con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[1].ToString() == UserId && dr[2].ToString() == PassWord)
                {
                    flag = true;
                }
            }
            con.Close();
            return flag;
        }


        public Int32 FindRecords(string emailid, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }

        public DataSet FindAndGetUserDet(string uname)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + uname + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


        public DataSet getUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet getCompdetails(string id, string name)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where userid = '" + id + "' and username = '" + name + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet getRecDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getEmpDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


        public DataSet Checklastrow(string uname)
        {

            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_jobpost where rowid=(select max(rowid) from cg_jobpost)", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;

        }

        public DataSet getNewUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public string userName(string user)
        {
            string connection = ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection cn = new SqlConnection(connection);
            SqlDataReader sdr;
            string s = "select username from clientregistration where username='" + user + "'";
            SqlCommand cmdobj = new SqlCommand(s, cn);
            cn.Open();
            sdr = cmdobj.ExecuteReader();
            string userId = null;
            while (sdr.Read())
            {
                userId = Convert.ToString(sdr["username"]);

            }
            cn.Close();
            return userId;
        }
        public string getPassword(Int32 uid)
        {
            string connection = ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection cn = new SqlConnection(connection);
            SqlDataReader sdr;
            string s = "select password from clientregistration where userid=" + uid + "";
            SqlCommand cmdobj = new SqlCommand(s, cn);
            cn.Open();
            sdr = cmdobj.ExecuteReader();
            string pwd = string.Empty;
            while (sdr.Read())
            {
                pwd = Convert.ToString(sdr["password"]);

            }
            cn.Close();
            return pwd;
        }

        
        public Int32 JobFindRecords(string user)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from cg_jobpost where username = '" + user + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }


        public DataSet getNewJobDetails(string rd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_jobpost where rowid = '" + rd  + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getCareersDetails(string rd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from jobopenings where id = '" + rd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }


    }





    // Employer Check User Starts Here ********************



    // Recruiter Check User Starts Here ********************

    public class RecCheckuser
    {
        public string str = ConfigurationManager.AppSettings["ConnectionString"];
        public bool flag;

        public bool VeryfiUserPass(string UserId, string PassWord)
        {
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select * from cg_recregistration", con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[1].ToString() == UserId && dr[2].ToString() == PassWord)
                {
                    flag = true;
                }
            }
            con.Close();
            return flag;
        }


        public Int32 FindRecords(string emailid, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }

        public DataSet getUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getRecDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getEmpDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

        public DataSet getNewUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public string userName(string user)
        {
            string connection = ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection cn = new SqlConnection(connection);
            SqlDataReader sdr;
            string s = "select username from cg_recregistration where username='" + user + "'";
            SqlCommand cmdobj = new SqlCommand(s, cn);
            cn.Open();
            sdr = cmdobj.ExecuteReader();
            string userId = null;
            while (sdr.Read())
            {
                userId = Convert.ToString(sdr["username"]);

            }
            cn.Close();
            return userId;
        }
        public string getPassword(Int32 uid)
        {
            string connection = ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection cn = new SqlConnection(connection);
            SqlDataReader sdr;
            string s = "select password from cg_recregistration where userid=" + uid + "";
            SqlCommand cmdobj = new SqlCommand(s, cn);
            cn.Open();
            sdr = cmdobj.ExecuteReader();
            string pwd = string.Empty;
            while (sdr.Read())
            {
                pwd = Convert.ToString(sdr["password"]);

            }
            cn.Close();
            return pwd;
        }

    }





    // Recruiter Check User Starts Here ********************






    public class EmpRegistration
    {
        public EmpRegistration()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        string str = string.Empty;
        public bool InsertEmp(string UserName, string Password, string Name, string EMail, string IndType, string CPerson, string CPDesign, string Comp_URL, string Address,
                             string Street, string Country, string State, string City,
                            string Work1Ccode, string Work1Acode, string Work1Phone, string Work2Ccode, string Work2Acode, string Work2Phone, string Fax, string Desc, string PDate, string Flag1)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("INSERT INTO clientregistration (username,password,cname,cemail,indtype,cperson,cpdesig,comp_url,address,street,country,state,city,w1_ccode,w1_acode,w1_phone,w2_ccode,w2_acode,w2_phone,fax,cdesc,pdate,flag1) VALUES(@ausername,@apassword,@aname,@aemail,@aindtype,@acperson,@acpdesig,@acomp_url,@aaddress,@astreet,@acountry,@astate,@acity,@awork1ccode,@awork1acode,@awork1phone,@awork2ccode,@awork2acode,@awork2phone,@afax,@adesc,@apdate,@aflag);", connection);

            cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@apassword", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aname", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acountry", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@astreet", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork1ccode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork1acode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork1phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork2ccode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork2acode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork2phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@afax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@astate", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aindtype", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acity", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aaddress", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acperson", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acpdesig", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acomp_url", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@apdate", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@adesc", SqlDbType.VarChar, 20000));
            cmd.Parameters.Add(new SqlParameter("@aflag", SqlDbType.NChar, 10));

            cmd.Parameters["@ausername"].Value = UserName;
            cmd.Parameters["@apassword"].Value = Password;
            cmd.Parameters["@aname"].Value = Name;

            cmd.Parameters["@aemail"].Value = EMail;
            cmd.Parameters["@acountry"].Value = Country;
            cmd.Parameters["@aindtype"].Value = IndType;

            cmd.Parameters["@awork1ccode"].Value = Work1Ccode;
            cmd.Parameters["@awork1acode"].Value = Work1Acode;
            cmd.Parameters["@awork1phone"].Value = Work1Phone;

            cmd.Parameters["@awork2ccode"].Value = Work2Ccode;
            cmd.Parameters["@awork2acode"].Value = Work2Acode;
            cmd.Parameters["@awork2phone"].Value = Work2Phone;


            cmd.Parameters["@acperson"].Value = CPerson;
            cmd.Parameters["@acpdesig"].Value = CPDesign;
            cmd.Parameters["@acomp_url"].Value = Comp_URL;

            cmd.Parameters["@aaddress"].Value = Address;
            cmd.Parameters["@astreet"].Value = Street;
            cmd.Parameters["@afax"].Value = Fax;

            cmd.Parameters["@astate"].Value = State;
            cmd.Parameters["@acity"].Value = City;
            cmd.Parameters["@apdate"].Value = PDate;
            cmd.Parameters["@adesc"].Value = Desc;
            cmd.Parameters["@aflag"].Value = Flag1;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }


        public bool UpdateEmp(string UserName, string Name, string EMail, string IndType, string CPerson, string CPDesign, string Comp_URL, string Address,
                            string Street, string Country, string State, string City,
                           string Work1Ccode, string Work1Acode, string Work1Phone, string Work2Ccode, string Work2Acode, string Work2Phone, string Fax, string Desc, string PDate, string Flag1)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("UPDATE clientregistration set cname=@aname,cemail=@aemail,indtype=@aindtype,cperson=@acperson,cpdesig=@acpdesig,comp_url=@acomp_url,address=@aaddress,street=@astreet,country=@acountry,state=@astate,city=@acity,w1_ccode=@awork1ccode,w1_acode=@awork1acode,w1_phone=@awork1phone,w2_ccode=@awork2ccode,w2_acode=@awork2acode,w2_phone=@awork2phone,fax=@afax,cdesc=@adesc,pdate=@apdate where username='" + UserName + "'", connection);

           // cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@apassword", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aname", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acountry", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@astreet", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork1ccode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork1acode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork1phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork2ccode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork2acode", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@awork2phone", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@afax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@astate", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aindtype", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acity", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aaddress", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acperson", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acpdesig", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acomp_url", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@apdate", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@adesc", SqlDbType.VarChar, 20000));
           // cmd.Parameters.Add(new SqlParameter("@aflag", SqlDbType.NChar, 10));

            //cmd.Parameters["@ausername"].Value = UserName;
            //cmd.Parameters["@apassword"].Value = Password;
            cmd.Parameters["@aname"].Value = Name;

            cmd.Parameters["@aemail"].Value = EMail;
            cmd.Parameters["@acountry"].Value = Country;
            cmd.Parameters["@aindtype"].Value = IndType;

            cmd.Parameters["@awork1ccode"].Value = Work1Ccode;
            cmd.Parameters["@awork1acode"].Value = Work1Acode;
            cmd.Parameters["@awork1phone"].Value = Work1Phone;

            cmd.Parameters["@awork2ccode"].Value = Work2Ccode;
            cmd.Parameters["@awork2acode"].Value = Work2Acode;
            cmd.Parameters["@awork2phone"].Value = Work2Phone;


            cmd.Parameters["@acperson"].Value = CPerson;
            cmd.Parameters["@acpdesig"].Value = CPDesign;
            cmd.Parameters["@acomp_url"].Value = Comp_URL;

            cmd.Parameters["@aaddress"].Value = Address;
            cmd.Parameters["@astreet"].Value = Street;
            cmd.Parameters["@afax"].Value = Fax;

            cmd.Parameters["@astate"].Value = State;
            cmd.Parameters["@acity"].Value = City;
            cmd.Parameters["@apdate"].Value = PDate;
            cmd.Parameters["@adesc"].Value = Desc;
            //cmd.Parameters["@aflag"].Value = Flag1;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }


        public bool PwdUpdate(string uname, string NewPwd)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("UPDATE clientregistration set password=@apassword where username='" + uname + "'", connection);


            cmd.Parameters.Add(new SqlParameter("@apassword", SqlDbType.NVarChar, 50));

            cmd.Parameters["@apassword"].Value = NewPwd;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }
        //Admin_JObEdit
        public bool AdminJobEdit(string Rid, string JobDEsc, string Position, string FnArea, string Location, string Jobfunction, string Specialization, string Industry, string Qual, string Exp)
        //, string PDate
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();
            int id = Convert.ToInt32(Rid.ToString());
            SqlCommand cmd = new SqlCommand("update jobopenings set jobdesc=@ajobdesc,position=@aposition,functionalarea=@afnarea,location=@alocation,jobfunction=@ajobfunction,specialization=@aspecialization,industry=@aindustry,qualification=@aqual,Experience=@aexp where id=" + id, connection);
            
            //cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@ausid", SqlDbType.Int, 20));
            cmd.Parameters.Add(new SqlParameter("@ajobdesc", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aposition", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@afnarea", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@alocation", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ajobfunction", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aspecialization", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aindustry", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aqual", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexp", SqlDbType.NVarChar, 50));

            // cmd.Parameters.Add(new SqlParameter("@adate", SqlDbType.DateTime, 20));


            //cmd.Parameters["@ausername"].Value = UserName;
            //cmd.Parameters["@ausid"].Value = Usid;
            cmd.Parameters["@ajobdesc"].Value = JobDEsc;

            cmd.Parameters["@aposition"].Value = Position;
            cmd.Parameters["@afnarea"].Value = FnArea;
            cmd.Parameters["@alocation"].Value = Location;

            cmd.Parameters["@ajobfunction"].Value = Jobfunction;
            cmd.Parameters["@aspecialization"].Value = Specialization;
            cmd.Parameters["@aindustry"].Value = Industry;

            cmd.Parameters["@aqual"].Value = Qual;
            cmd.Parameters["@aexp"].Value = Exp;

            //cmd.Parameters["@adate"].Value = PDate;
            //cmd.Parameters["@aflag"].Value = Flag;




            strs1 = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }
        //AdminJobPost
        string strs1 = string.Empty;

        public bool AdminJobPost( string JobDEsc, string Position, string FnArea, string Location, string Jobfunction, string Specialization, string Industry, string Qual, string Exp)
        //, string PDate
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("INSERT INTO jobopenings(jobdesc,position,functionalarea,location,jobfunction,specialization,industry,qualification,Experience) VALUES(@ajobdesc,@aposition,@afnarea,@alocation,@ajobfunction,@aspecialization,@aindustry,@aqual,@aexp);", connection);

            //cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@ausid", SqlDbType.Int, 20));
            cmd.Parameters.Add(new SqlParameter("@ajobdesc", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aposition", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@afnarea", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@alocation", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ajobfunction", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aspecialization", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aindustry", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aqual", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexp", SqlDbType.NVarChar, 50));
            
           // cmd.Parameters.Add(new SqlParameter("@adate", SqlDbType.DateTime, 20));
          

            //cmd.Parameters["@ausername"].Value = UserName;
            //cmd.Parameters["@ausid"].Value = Usid;
            cmd.Parameters["@ajobdesc"].Value = JobDEsc;

            cmd.Parameters["@aposition"].Value = Position;
            cmd.Parameters["@afnarea"].Value = FnArea;
            cmd.Parameters["@alocation"].Value = Location;

            cmd.Parameters["@ajobfunction"].Value = Jobfunction;
            cmd.Parameters["@aspecialization"].Value = Specialization;
            cmd.Parameters["@aindustry"].Value = Industry;

            cmd.Parameters["@aqual"].Value = Qual;
            cmd.Parameters["@aexp"].Value = Exp;
            
            //cmd.Parameters["@adate"].Value = PDate;
            //cmd.Parameters["@aflag"].Value = Flag;

           


            strs1 = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }
        
        string strs = string.Empty;
        public bool PostJob(string Usid, string UserName, string JobTitle, string Posts, string Skills, string Education, string ExpMin, string ExpMax, string Fnarea, string MinSal, string MaxSal, string Currency,
                             string CurrentLoc, string CPerson, string MobPhone, string EMail, string PDate)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("INSERT INTO cg_jobpost (userid,username,jobtitle,no_posts,Keyskills,Edu_Min,Min_Exp,Max_Exp,Functional_Area,minsal,maxsal,currency,Location,Contact_Person,Contact_Phone,Contact_Email,pdate) VALUES(@ausid,@ausername,@ajtitle,@aposts,@askill,@aedu,@aexpmin,@aexpmax,@afnarea,@aminsal,@amaxsal,@acurrency,@aloc,@acperson,@aphno,@aemail,@adate);", connection);

            cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ausid", SqlDbType.Int, 20));
            cmd.Parameters.Add(new SqlParameter("@ajtitle", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aposts", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@askill", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aedu", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexpmin", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexpmax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@afnarea", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aloc", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acperson", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aphno", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@adate", SqlDbType.DateTime, 20));
            //cmd.Parameters.Add(new SqlParameter("@aflag", SqlDbType.NChar, 10));

            cmd.Parameters.Add(new SqlParameter("@aminsal", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@amaxsal", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acurrency", SqlDbType.NVarChar, 50));

            cmd.Parameters["@ausername"].Value = UserName;
            cmd.Parameters["@ausid"].Value = Usid;
            cmd.Parameters["@ajtitle"].Value = JobTitle;

            cmd.Parameters["@aposts"].Value = Posts;
            cmd.Parameters["@askill"].Value = Skills;
            cmd.Parameters["@aedu"].Value = Education;

            cmd.Parameters["@aexpmin"].Value = ExpMin;
            cmd.Parameters["@aexpmax"].Value = ExpMax;
            cmd.Parameters["@afnarea"].Value = Fnarea;

            cmd.Parameters["@aloc"].Value = CurrentLoc;
            cmd.Parameters["@acperson"].Value = CPerson;
            cmd.Parameters["@aphno"].Value = MobPhone;


            cmd.Parameters["@aemail"].Value = EMail;
            cmd.Parameters["@adate"].Value = PDate;
            //cmd.Parameters["@aflag"].Value = Flag;

            cmd.Parameters["@aminsal"].Value = MinSal;
            cmd.Parameters["@amaxsal"].Value = MaxSal;
            cmd.Parameters["@acurrency"].Value = Currency;



            strs = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }
        public bool SkillsEdit(string Usid, string Skills, string exptLevel,string expYears)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();
            int id = Convert.ToInt32(Usid);
            SqlCommand cmd = new SqlCommand("UPDATE cg_jsskills set skill=@ajtitle,exptlevel=@aexptlevel,expyears=@aexpyrs where id=" + id , connection);

            //cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@ausid", SqlDbType.Int, 20));
            cmd.Parameters.Add(new SqlParameter("@aSkills", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexptlevel", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexpyrs", SqlDbType.NVarChar, 50));
            
            //cmd.Parameters["@ausername"].Value = UserName;
            //cmd.Parameters["@ausid"].Value = Usid;
            cmd.Parameters["@aSkills"].Value = Skills;

            cmd.Parameters["@aexptlevel"].Value = exptLevel;
            cmd.Parameters["@askill"].Value = Skills;
            cmd.Parameters["@aexpyrs"].Value = expYears;

            


            strs = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }

        public bool JobEdit(string Usid, string UserName, string JobTitle, string Posts, string Skills, string Education, string ExpMin, string ExpMax, string Fnarea, string MinSal, string MaxSal, string Currency,
                            string CurrentLoc, string CPerson, string MobPhone, string EMail, string PDate)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("UPDATE cg_jobpost set jobtitle=@ajtitle,no_posts=@aposts,Keyskills=@askill,Edu_Min=@aedu,Min_Exp=@aexpmin,Max_Exp=@aexpmax,Functional_Area=@afnarea,minsal=@aminsal,maxsal=@amaxsal,currency=@acurrency,Location=@aloc,Contact_Person=@acperson,Contact_Phone=@aphno,Contact_Email=@aemail,pdate=@adate where rowid='" + Usid + "'", connection);

            //cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
            //cmd.Parameters.Add(new SqlParameter("@ausid", SqlDbType.Int, 20));
            cmd.Parameters.Add(new SqlParameter("@ajtitle", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aposts", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@askill", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aedu", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexpmin", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aexpmax", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@afnarea", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aloc", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acperson", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aphno", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@adate", SqlDbType.DateTime, 20));
            //cmd.Parameters.Add(new SqlParameter("@aflag", SqlDbType.NChar, 10));

            cmd.Parameters.Add(new SqlParameter("@aminsal", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@amaxsal", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@acurrency", SqlDbType.NVarChar, 50));

            //cmd.Parameters["@ausername"].Value = UserName;
            //cmd.Parameters["@ausid"].Value = Usid;
            cmd.Parameters["@ajtitle"].Value = JobTitle;

            cmd.Parameters["@aposts"].Value = Posts;
            cmd.Parameters["@askill"].Value = Skills;
            cmd.Parameters["@aedu"].Value = Education;

            cmd.Parameters["@aexpmin"].Value = ExpMin;
            cmd.Parameters["@aexpmax"].Value = ExpMax;
            cmd.Parameters["@afnarea"].Value = Fnarea;

            cmd.Parameters["@aloc"].Value = CurrentLoc;
            cmd.Parameters["@acperson"].Value = CPerson;
            cmd.Parameters["@aphno"].Value = MobPhone;


            cmd.Parameters["@aemail"].Value = EMail;
            cmd.Parameters["@adate"].Value = PDate;
            //cmd.Parameters["@aflag"].Value = Flag;

            cmd.Parameters["@aminsal"].Value = MinSal;
            cmd.Parameters["@amaxsal"].Value = MaxSal;
            cmd.Parameters["@acurrency"].Value = Currency;



            strs = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return true;
        }



        //public DataSet Checklastrow(string uname)
        //{
            
        //    DataSet dsUDetails = new DataSet();
        //    SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        //    connection.Open();
        //    SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_jobpost where rowid=(select max(rowid) from cg_jobpost)", connection);
        //    sqlda.Fill(dsUDetails, "UserDetails");
        //    return dsUDetails;

        //}

       

        public Int32 CheckEmailid(string emailid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where cemail = '" + emailid + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }
        public Int32 CheckUserName(string uname)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where username = '" + uname + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }



    }

    public class Checkemp
    {
        public string str = ConfigurationManager.AppSettings["ConnectionString"];
        public bool flag;

        public bool VeryfiUserPass(string UserId, string PassWord)
        {
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select * from clientregistration", con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[1].ToString() == UserId && dr[2].ToString() == PassWord)
                {
                    flag = true;
                }
            }
            con.Close();
            return flag;
        }

        public Int32 FindRecords(string emailid, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where cemail = '" + emailid + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            return count;
        }

        public DataSet getNewUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where cemail = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }

       
    }
}
