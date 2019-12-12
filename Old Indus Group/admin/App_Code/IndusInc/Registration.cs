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
            string strQuery = "INSERT INTO employeereg(username,emailid,pwd,firstname,middlename,lastname,fathername,mothername,spousename,country1,state1,street,city1,zip,workphone,homephone,mobile,birthdate,cntryofcitizenship,birthcity,birthstate,birthcountry,passportno,passportissuedat,dateofissue, doexp,nationality,countryofpassport,contactpersonname1,cp1phone,cp1email,cpaddress1,contactpersonname2,cp2phone2,cp2email,cpaddress2,totexptrs,totexpmonths,rhead,functionalarea,currentindustrytype,filename1,resumetxt,pdate) VALUES(@uname,@emailid,@pwd,@confirmpwd,@firstname,@middlename,@lastname,@fathername,@mothername,@spousename,@country1,@state1,@street,@city1,@zip,@workphone,@homephone,@mobile,@birthdate,@cntryofcitizenship,@birthcity,@birthstate,@birthcountry,@passportno,@passportissuedat,@dateofissue,@doexp,@nationality,@countryofpassport,@contactpersonname1,@cp1phone,@cp1email,@cpaddress1,@contactpersonname2,@cp2phone2,@cp2email,@cpaddress2,@totexptrs,@totexpmonths,@rhead,@functionalarea,@currentindustrytype,@filename1,@resumetxt,@pdate)";
            SqlCommand cmd = new SqlCommand(strQuery, connection);
             cmd.Parameters.Add(new SqlParameter("@uname", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@emailid", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@pwd", SqlDbType.NVarChar));
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
            cmd.Parameters["@uname"].Value = uname;
            cmd.Parameters["@emailid"].Value = EMail;
            cmd.Parameters["@pwd"].Value = Password;
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
            connection.Close();
            return count;
        }

        public Int32 CheckUserName(string uname)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg where username = '" + uname + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }
        public Int32 CheckVendorName(string uname)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from vendorreg where username = '" + uname + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }
        public bool InsertEmpFirst(string eid, string aeid, string pwd, string sdt)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            try
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO employeereg(username,emailid,pwd,confirmpwd,pdate) VALUES(@ausername,@aemail,@apassword,@acpword,@apdate);", connection);

                cmd.Parameters.Add(new SqlParameter("@ausername", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@apassword", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@acpword", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@aemail", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@apdate", SqlDbType.DateTime, 20));

                cmd.Parameters["@ausername"].Value = eid;
                cmd.Parameters["@apassword"].Value = pwd;
                cmd.Parameters["@acpword"].Value = pwd;
                cmd.Parameters["@aemail"].Value = aeid;
                cmd.Parameters["@apdate"].Value = DateTime.Now;

                str = cmd.ExecuteNonQuery().ToString();
                connection.Close();
                if (str == "1")
                    return true;
            }
            catch
            {
            }
            return true;
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
            connection.Close();
            return count;
        }

        public Int32 FindClientRecords(string uname, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where username = '" + uname + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }
        public Int32 FindEmpRecords(string uname, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from employeereg where username = '" + uname + "' and pwd = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }
        public DataSet FindAndGetUserDet(string uname)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username = '" + uname + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet getUserDet(string id, string name)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where userid = '" + id + "' and username = '" + name + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
            connection.Close();
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
            connection.Close();
            return dsUDetails;
        }

        public DataSet getRecDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet getEmpDetails(string uname, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where username= '" + uname + "' and pwd = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "EmpDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet getNewUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where emailid = '" + emailid + "' and pwd = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
            connection.Close();
            return dsUDetails;
        }
        public DataSet GetJobDetails(string jid, string compid)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select cg_jobpost.jobtitle as desig,clientregistration.cname as comp,cg_jobpost.Min_Exp as min,cg_jobpost.Max_Exp as max,cg_jobpost.Functional_Area as fnarea,cg_jobpost.Keyskills as skills,cg_jobpost.Location as loc,cg_jobpost.Edu_Min as edu,clientregistration.indtype as ind,clientregistration.cdesc as descr from cg_jobpost,clientregistration where cg_jobpost.userid = clientregistration.userid and cg_jobpost.rowid=" + jid, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }       
        public DataSet CategSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select distinct Functional_Area as farea,userid from cg_jobpost order by Functional_Area", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet CompSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select distinct cname as cname, userid from clientregistration order by cname", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet InternSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select distinct Location as Location,userid from cg_jobpost order by Location", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet ResumeSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where " + searchstr, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
            connection.Close();
            return dsUDetails;
        }
        public DataSet GetJobDetails(string jid, string compid)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select cg_jobpost.jobtitle as desig,clientregistration.cname as comp,cg_jobpost.Min_Exp as min,cg_jobpost.Max_Exp as max,cg_jobpost.Functional_Area as fnarea,cg_jobpost.Keyskills as skills,cg_jobpost.Location as loc,cg_jobpost.Edu_Min as edu,clientregistration.indtype as ind,clientregistration.cdesc as descr from cg_jobpost,clientregistration where cg_jobpost.userid = clientregistration.userid and cg_jobpost.rowid=" + jid, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet ResumeSearch(string searchstr)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from employeereg where " + searchstr, connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
        public Int32 FindVendorRecords(string uname, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from vendorreg where username = '" + uname + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }

        public Int32 FindRecords(string emailid, string pwd)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }

        public DataSet FindAndGetUserDet(string uname)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + uname + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet FindAndGetVendorDet(string uname)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from vendorreg where username = '" + uname + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet getUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
        public DataSet getCompvendordetails(string id, string name)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from vendorreg where userid = '" + id + "' and username = '" + name + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet getRecDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet getEmpDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet Checklastrow(string uname)
        {

            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_jobpost where rowid=(select max(rowid) from cg_jobpost)", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
        public DataSet getNewVendorDetails(string uname, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from vendorreg where username = '" + uname + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            return dsUDetails;
        }
        public DataSet getNewUserDetails(string uname, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where username = '" + uname + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
            connection.Close();
            return count;
        }


        public DataSet getNewJobDetails(string rd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_jobpost where rowid = '" + rd  + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet getCareersDetails(string rd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from jobopenings where id = '" + rd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet getnewCareersDetails(string rd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from careersnew where id = '" + rd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
            connection.Close();
            return count;
        }

        public DataSet getUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }

        public DataSet getRecDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from cg_recregistration where username = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
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
            connection.Close();
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

            SqlCommand cmd = new SqlCommand("INSERT INTO clientregistration(username,password,cname,cemail,indtype,cperson,cpdesig,comp_url,address,street,country,state,city,w1_ccode,w1_acode,w1_phone,w2_ccode,w2_acode,w2_phone,fax,cdesc,pdate,flag1) VALUES(@ausername,@apassword,@aname,@aemail,@aindtype,@acperson,@acpdesig,@acomp_url,@aaddress,@astreet,@acountry,@astate,@acity,@awork1ccode,@awork1acode,@awork1phone,@awork2ccode,@awork2acode,@awork2phone,@afax,@adesc,@apdate,@aflag);", connection);

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
        public bool InsertVendor(string UserName, string Password, string Name, string EMail, string IndType, string CPerson, string CPDesign, string Comp_URL, string Address,
                             string Street, string Country, string State, string City,
                            string Work1Ccode, string Work1Acode, string Work1Phone, string Work2Ccode, string Work2Acode, string Work2Phone, string Fax, string Desc, string PDate, string Flag1)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("INSERT INTO vendorreg(username,password,cname,cemail,indtype,cperson,cpdesig,comp_url,address,street,country,state,city,w1_ccode,w1_acode,w1_phone,w2_ccode,w2_acode,w2_phone,fax,cdesc,pdate,flag1) VALUES(@ausername,@apassword,@aname,@aemail,@aindtype,@acperson,@acpdesig,@acomp_url,@aaddress,@astreet,@acountry,@astate,@acity,@awork1ccode,@awork1acode,@awork1phone,@awork2ccode,@awork2acode,@awork2phone,@afax,@adesc,@apdate,@aflag);", connection);

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

        public bool UpdateVendor(string UserName, string Name, string EMail, string IndType, string CPerson, string CPDesign, string Comp_URL, string Address,
                            string Street, string Country, string State, string City,
                           string Work1Ccode, string Work1Acode, string Work1Phone, string Work2Ccode, string Work2Acode, string Work2Phone, string Fax, string Desc, string PDate, string Flag1)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //SqlTransaction myTrans = connection.BeginTransaction();

            SqlCommand cmd = new SqlCommand("UPDATE vendorreg set cname=@aname,cemail=@aemail,indtype=@aindtype,cperson=@acperson,cpdesig=@acpdesig,comp_url=@acomp_url,address=@aaddress,street=@astreet,country=@acountry,state=@astate,city=@acity,w1_ccode=@awork1ccode,w1_acode=@awork1acode,w1_phone=@awork1phone,w2_ccode=@awork2ccode,w2_acode=@awork2acode,w2_phone=@awork2phone,fax=@afax,cdesc=@adesc,pdate=@apdate where username='" + UserName + "'", connection);

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


        public string CareerJobEdit(string jid, string jtitle, string skills, string jqual, string location, string jfrom, string jto, string jdes, string rid)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            int id = Convert.ToInt32(rid.ToString());
            SqlCommand cmd = new SqlCommand("update careersnew set jobid=@jobid,jobtitle=@jtitle,skills=@skills,qualification=@qual,location=@location,openfrom=@jofrom,opento=@joto,description=@jdes,posteddate=@pdt where id=" + id, connection);

            cmd.Parameters.Add(new SqlParameter("@jobid", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@jtitle", SqlDbType.VarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@skills", SqlDbType.VarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@qual", SqlDbType.VarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@location", SqlDbType.VarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@jofrom", SqlDbType.DateTime,15));
            cmd.Parameters.Add(new SqlParameter("@joto", SqlDbType.DateTime, 15));
            cmd.Parameters.Add(new SqlParameter("@jdes", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime, 15));
            
            cmd.Parameters["@jobid"].Value = jid;
            cmd.Parameters["@jtitle"].Value = jtitle;
            cmd.Parameters["@skills"].Value = skills;
            cmd.Parameters["@qual"].Value = jqual;
            cmd.Parameters["@location"].Value = location;
            cmd.Parameters["@jofrom"].Value = Convert.ToDateTime(jfrom);
            cmd.Parameters["@joto"].Value =  Convert.ToDateTime(jto);
            cmd.Parameters["@jdes"].Value = jdes;
            cmd.Parameters["@pdt"].Value = DateTime.Now;

           string strs1 = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return strs1;
        }

        public string CareerJobInsert(string jid, string jtitle, string skills, string jqual, string location, string jfrom, string jto, string jdes)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            //int id = Convert.ToInt32(rid.ToString());
            SqlCommand cmd = new SqlCommand("insert into careersnew(jobid,jobtitle,skills,qualification,location,openfrom,opento,description) values(@jobid,@jtitle,@skills,@qual,@location,@jofrom,@joto,@jdes)", connection);

            cmd.Parameters.Add(new SqlParameter("@jobid", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@jtitle", SqlDbType.VarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@skills", SqlDbType.VarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@qual", SqlDbType.VarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@location", SqlDbType.VarChar, 150));
            cmd.Parameters.Add(new SqlParameter("@jofrom", SqlDbType.DateTime, 15));
            cmd.Parameters.Add(new SqlParameter("@joto", SqlDbType.DateTime, 15));
            cmd.Parameters.Add(new SqlParameter("@jdes", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime, 15));

            cmd.Parameters["@jobid"].Value = jid;
            cmd.Parameters["@jtitle"].Value = jtitle;
            cmd.Parameters["@skills"].Value = skills;
            cmd.Parameters["@qual"].Value = jqual;
            cmd.Parameters["@location"].Value = location;
            cmd.Parameters["@jofrom"].Value = Convert.ToDateTime(jfrom);
            cmd.Parameters["@joto"].Value = Convert.ToDateTime(jto);
            cmd.Parameters["@jdes"].Value = jdes;
            cmd.Parameters["@pdt"].Value = DateTime.Now;

            string strs1 = cmd.ExecuteNonQuery().ToString();
            connection.Close();
            return strs1;


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
            connection.Close();
            return count;
        }
        public Int32 CheckUserName(string uname)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from clientregistration where username = '" + uname + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }

        public Int32 CheckVendorEmailid(string emailid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from vendorreg where cemail = '" + emailid + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
            return count;
        }
        public Int32 CheckVendorName(string uname)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlCommand sqlcmd = new SqlCommand("select count(*) from vendorreg where username = '" + uname + "'", connection);
            Int32 count = Convert.ToInt32(sqlcmd.ExecuteScalar());
            connection.Close();
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
            connection.Close();
            return count;
        }

        public DataSet getNewUserDetails(string emailid, string pwd)
        {
            DataSet dsUDetails = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from clientregistration where cemail = '" + emailid + "' and password = '" + pwd + "'", connection);
            sqlda.Fill(dsUDetails, "UserDetails");
            connection.Close();
            return dsUDetails;
        }
    }

    public class StateCountry
    {
        public DataSet GetCounty()
        {
            DataSet ds = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from Country_Master", connection);
            sqlda.Fill(ds);
            connection.Close();
            return ds;
        }

        public DataSet GetState(string id)
        {
            DataSet ds = new DataSet();
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("select * from State_Master where intCountryId = " + id, connection);
            sqlda.Fill(ds);
            connection.Close();
            return ds;
        }

    }

    public class EmployeeDetails
    {
        
        public bool UpdateEmp(string uid, string fn, string ln, string mn,string ss1, string gn, 
            string sn,string sb, string ssn2, string spg, string fatn, string motn,
            string k1, string k2, string k3, string k1b, string k2b, string k3b, string k1s, string k2s, string k3s,
            string k1g, string k2g, string k3g, string co, string str, string sta, string ci, string zp, 
            string wp, string hp, string mb, string bd, string bco, string bsta, string bci, string cco,
            string pn, string pco, string idt, string exdt, string nco, string cpport, string cpn1,
            string cpph1, string cpml1, string cpadr1, string cpn2, string cpph2, string cpml2,
            string cpadr2, string exyr, string fnar, string cind, string sk1, string sk1yr, string sk1ex,
            string sk2, string sk2yr, string sk2ex, string sk3, string sk3yr, string sk3ex, 
            string sk4, string sk4yr, string sk4ex, string sk5, string sk5yr, string sk5ex, 
            string sk6, string sk6yr, string sk6ex, string ed1,
            string ed1bd, string ed1sb, string ed1y, string ed1pe, string ed2, string ed2bd, string ed2sb,
            string ed2y, string ed2pe, string ed3, string ed3bd, string ed3sb, string ed3y, string ed3pe,
            string ed4, string ed4bd, string ed4sb, string ed4y, string ed4pe,
            string ed5, string ed5bd, string ed5sb, string ed5y, string ed5pe,
            string ed6, string ed6bd, string ed6sb, string ed6y, string ed6pe,
            string ed7, string ed7bd, string ed7sb, string ed7y, string ed7pe,
            string rtit, string rfil, string rtxt, string exmn, string sdt, string pplc)
        {
            string strx = string.Empty;
            try
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
                connection.Open();
                //SqlTransaction myTrans = connection.BeginTransaction();
                string strQry = "update employeereg set firstname=@fn,middlename=@mn,";
                strQry = strQry + "lastname=@ln,fathername=@fatn,mothername=@motn,spousename=@spn,";
                strQry = strQry + "gender=@gn,ssn=@ss1,spousegender=@spg,spousessn=@ssn2,spousedob=@sb,";
                
               // if (sb != "")
                 //   strQry = strQry + "spousedob=@sb,";

                strQry = strQry + "kid1=@k1,kid2=@k2,kid3=@k3,";
                strQry = strQry + "child1gender=@k1g,child2gender=@k2g,child3gender=@k3g,";

                //if (k1b != "")
                    strQry = strQry + "child1dob=@k1b,";

               // if (k2b != "")
                    strQry = strQry + "child2dob=@k2b,";

                //if (k3b != "")
                    strQry = strQry + "child3dob=@k3b,";


                //strQry = strQry + "child1dob=@k1b,child2dob=@k2b,child3dob=@k3b,";
                strQry = strQry + "child1ssn=@k1s,child2ssn=@k2s,child3ssn=@k3s,";
                strQry = strQry + "country1=@co,state1=@sta,street=@str,city1=@ci,zip=@zp,workphone=@wp,";
                strQry = strQry + "homephone=@hp,mobile=@mb,birthdate=@bdt,cntryofcitizenship=@cco,birthcity=@bco,";
                strQry = strQry + "birthstate=@bsta,birthcountry=@bco,passportno=@pn,passportissuedat=@pco,";
                strQry = strQry + "nationality=@nco,countryofpassport=@cpco,";

                if (idt !="")
                    strQry = strQry + "dateofissue=@idt,";
                if (exdt != "")
                   strQry = strQry + "doexp=@expd,";

                strQry = strQry + "contactpersonname1=@cpn1,cp1phone=@cpph1,cp1email=@cpml1,cpaddress1=@cpadr1,";
                strQry = strQry + "contactpersonname2=@cpn2,cp2phone2=@cpph2,cp2email=@cpml2,cpaddress2=@cpadr2,";
                strQry = strQry + "totexptrs=@exyr,totexpmonths=@exmn,rhead=@rtit,functionalarea=@fnar,currentindustrytype=@cind,";
                strQry = strQry + "skills1=@sk1,sk1years=@sk1yr,sk1exp=@sk1ex,skills2=@sk2,sk2years=@sk2yr,sk2exp=@sk2ex,";
                strQry = strQry + "skills3=@sk3,sk3years=@sk3yr,sk3exp=@sk3ex,skills4=@sk4,sk4years=@sk4yr,sk4exp=@sk4ex,";
                strQry = strQry + "skills5=@sk5,sk5years=@sk5yr,sk5exp=@sk5ex,";
                strQry = strQry + "skills6=@sk6,sk6years=@sk6yr,sk6exp=@sk6ex,edu1=@ed1,ed1brd=@ed1bd,ed1sub=@ed1sb,ed1year=@ed1y,ed1per=@ed1pe,";
                strQry = strQry + "edu2=@ed2,ed2brd=@ed2bd,ed2sub=@ed2sb,ed2year=@ed2y,ed2per=@ed2pe,";
                strQry = strQry + "edu3=@ed3,ed3brd=@ed3bd,ed3sub=@ed3sb,ed3year=@ed3y,ed3per=@ed3pe,";
                strQry = strQry + "edu4=@ed4,ed4brd=@ed4bd,ed4sub=@ed4sb,ed4year=@ed4y,ed4per=@ed4pe,";
                strQry = strQry + "edu5=@ed5,ed5brd=@ed5bd,ed5sub=@ed5sb,ed5year=@ed5y,ed5per=@ed5pe,";
                strQry = strQry + "edu6=@ed6,ed6brd=@ed6bd,ed6sub=@ed6sb,ed6year=@ed6y,ed6per=@ed6pe,";
                strQry = strQry + "edu7=@ed7,ed7brd=@ed7bd,ed7sub=@ed7sb,ed7year=@ed7y,ed7per=@ed7pe,filename1=@rfil,resumetxt=@rtxt,pdate=@pdt,piss_place=@pplc where username='" + uid + "'";

                SqlCommand cmd = new SqlCommand(strQry, connection);
                
                cmd.Parameters.Add(new SqlParameter("@fn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@mn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ln", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@ss1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@gn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@spg", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ssn2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sb", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@fatn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@motn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@spn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k3", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@k1s", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k2s", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k3s", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@k1b", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k2b", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k3b", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@k1g", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k2g", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@k3g", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@wp", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@co", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sta", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@str", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ci", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@zp", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@hp", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@mb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@bdt", SqlDbType.DateTime));
                cmd.Parameters.Add(new SqlParameter("@cco", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@bci", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@bsta", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@bco", SqlDbType.NVarChar));
                //cmd.Parameters.Add(new SqlParameter("@birthdate", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@pn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpco", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@idt", SqlDbType.DateTime));
                cmd.Parameters.Add(new SqlParameter("@expd", SqlDbType.DateTime));
                cmd.Parameters.Add(new SqlParameter("@nco", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@pco", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpn1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpph1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpml1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpadr1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpn2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpph2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpml2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cpadr2", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@exyr", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@exmn", SqlDbType.Int));
                cmd.Parameters.Add(new SqlParameter("@rtit", SqlDbType.NVarChar));
                //@functionalarea
                cmd.Parameters.Add(new SqlParameter("@fnar", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@cind", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@sk1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk1yr", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk1ex", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk2yr", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk2ex", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk3", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk3yr", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk3ex", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk4", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk4yr", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk4ex", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk5", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk5yr", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk5ex", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk6", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk6yr", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@sk6ex", SqlDbType.NVarChar));


                cmd.Parameters.Add(new SqlParameter("@ed1", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed1bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed1sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed1y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed1pe", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed2", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed2bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed2sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed2y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed2pe", SqlDbType.NVarChar));

                cmd.Parameters.Add(new SqlParameter("@ed3", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed3bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed3sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed3y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed3pe", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed4", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed4bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed4sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed4y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed4pe", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed5", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed5bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed5sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed5y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed5pe", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed6", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed6bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed6sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed6y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed6pe", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed7", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed7bd", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed7sb", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed7y", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@ed7pe", SqlDbType.NVarChar));


                cmd.Parameters.Add(new SqlParameter("@rfil", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@rtxt", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@pplc", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime));


                //cmd.Parameters.Add(new SqlParameter("@pdate", SqlDbType.NVarChar));
                // cmd.Parameters["@uname"].Value = fn;
                
                cmd.Parameters["@fn"].Value = fn;
                cmd.Parameters["@mn"].Value = mn;
                cmd.Parameters["@ln"].Value = ln;
                cmd.Parameters["@gn"].Value = gn;
                cmd.Parameters["@ss1"].Value = ss1;
                cmd.Parameters["@fatn"].Value = fatn;
                cmd.Parameters["@motn"].Value = motn;
                cmd.Parameters["@spn"].Value = sn;
                cmd.Parameters["@spg"].Value = spg;

                //if (sb != "")
                //    cmd.Parameters["@sb"].Value = Convert.ToDateTime(sb);
                //else
                //    cmd.Parameters["@sb"].Value = null;


                cmd.Parameters["@sb"].Value = sb;

                cmd.Parameters["@ssn2"].Value = ssn2;

                cmd.Parameters["@k1"].Value = k1;
                cmd.Parameters["@k2"].Value = k2;
                cmd.Parameters["@k3"].Value = k3;

                //if (k1b != "")
                //    cmd.Parameters["@k1b"].Value = Convert.ToDateTime(k1b);
                //else
                //    cmd.Parameters["@k1b"].Value = Convert.ToDateTime(null);

                //if (k2b != "")
                //    cmd.Parameters["@k2b"].Value = Convert.ToDateTime(k2b);
                //else
                //    cmd.Parameters["@k2b"].Value = Convert.ToDateTime(null);


                //if (k3b != "")
                //    cmd.Parameters["@k3b"].Value = Convert.ToDateTime(k3b);
                //else
                //    cmd.Parameters["@k3b"].Value = Convert.ToDateTime(null);
                cmd.Parameters["@k1b"].Value = k1b;
                cmd.Parameters["@k2b"].Value = k2b;
                cmd.Parameters["@k3b"].Value = k3b;

                cmd.Parameters["@k1s"].Value = k1s;
                cmd.Parameters["@k2s"].Value = k2s;
                cmd.Parameters["@k3s"].Value = k3s;

                cmd.Parameters["@k1g"].Value = k1g;
                cmd.Parameters["@k2g"].Value = k2g;
                cmd.Parameters["@k3g"].Value = k3g;


                cmd.Parameters["@co"].Value = co;
                cmd.Parameters["@sta"].Value = sta;
                cmd.Parameters["@str"].Value = str;
                cmd.Parameters["@ci"].Value = ci;
                cmd.Parameters["@zp"].Value = zp;
                cmd.Parameters["@wp"].Value = wp;
                cmd.Parameters["@hp"].Value = hp;
                cmd.Parameters["@mb"].Value = mb;

                if (bd != "")
                    cmd.Parameters["@bdt"].Value = Convert.ToDateTime(bd);
                else
                    cmd.Parameters["@bdt"].Value = "";

                cmd.Parameters["@cco"].Value = cco;
                cmd.Parameters["@bci"].Value = bci;

                cmd.Parameters["@bsta"].Value = bsta;

                cmd.Parameters["@bco"].Value = bco;

                cmd.Parameters["@pn"].Value = pn;
                if (idt != "")
                    cmd.Parameters["@idt"].Value = Convert.ToDateTime(idt);
                else
                    cmd.Parameters["@idt"].Value = "";

                cmd.Parameters["@cpco"].Value = cpport;

                if (exdt != "")
                    cmd.Parameters["@expd"].Value = Convert.ToDateTime(exdt);
                else
                    cmd.Parameters["@expd"].Value = "";

                cmd.Parameters["@nco"].Value = nco;
                cmd.Parameters["@pco"].Value = pco;
                cmd.Parameters["@cpn1"].Value = cpn1;
                cmd.Parameters["@cpph1"].Value = cpph1;
                cmd.Parameters["@cpml1"].Value = cpml1;
                cmd.Parameters["@cpadr1"].Value = cpadr1;
                cmd.Parameters["@cpn2"].Value = cpn2;
                cmd.Parameters["@cpph2"].Value = cpph2;
                cmd.Parameters["@cpml2"].Value = cpml2;
                cmd.Parameters["@cpadr2"].Value = cpadr2;
                
                if (exyr != "")
                    cmd.Parameters["@exyr"].Value = Convert.ToInt32(exyr);
                else
                    cmd.Parameters["@exyr"].Value = 0;

                if (exmn != "")
                    cmd.Parameters["@exmn"].Value = Convert.ToInt32(exmn);
                else
                    cmd.Parameters["@exmn"].Value = 0;

                cmd.Parameters["@rtit"].Value = rtit;
                cmd.Parameters["@fnar"].Value = fnar;
                cmd.Parameters["@cind"].Value = cind;

                cmd.Parameters["@sk1"].Value = sk1;
                cmd.Parameters["@sk1yr"].Value = sk1yr;
                cmd.Parameters["@sk1ex"].Value = sk1ex;
                cmd.Parameters["@sk2"].Value = sk2;
                cmd.Parameters["@sk2yr"].Value = sk2yr;
                cmd.Parameters["@sk2ex"].Value = sk2ex;
                cmd.Parameters["@sk3"].Value = sk3;
                cmd.Parameters["@sk3yr"].Value = sk3yr;
                cmd.Parameters["@sk3ex"].Value = sk3ex;

                cmd.Parameters["@sk4"].Value = sk4;
                cmd.Parameters["@sk4yr"].Value = sk4yr;
                cmd.Parameters["@sk4ex"].Value = sk4ex;

                cmd.Parameters["@sk5"].Value = sk5;
                cmd.Parameters["@sk5yr"].Value = sk5yr;
                cmd.Parameters["@sk5ex"].Value = sk5ex;

                cmd.Parameters["@sk6"].Value = sk6;
                cmd.Parameters["@sk6yr"].Value = sk6yr;
                cmd.Parameters["@sk6ex"].Value = sk6ex;

                cmd.Parameters["@ed1"].Value = ed1;
                cmd.Parameters["@ed1bd"].Value = ed1bd;
                cmd.Parameters["@ed1sb"].Value = ed1sb;
                cmd.Parameters["@ed1y"].Value = ed1y;
                cmd.Parameters["@ed1pe"].Value = ed1pe;
                cmd.Parameters["@ed2"].Value = ed2;
                cmd.Parameters["@ed2bd"].Value = ed2bd;
                cmd.Parameters["@ed2sb"].Value = ed2sb;
                cmd.Parameters["@ed2y"].Value = ed2y;
                cmd.Parameters["@ed2pe"].Value = ed2pe;
                cmd.Parameters["@ed3"].Value = ed3;
                cmd.Parameters["@ed3bd"].Value = ed3bd;
                cmd.Parameters["@ed3sb"].Value = ed3sb;
                cmd.Parameters["@ed3y"].Value = ed3y;
                cmd.Parameters["@ed3pe"].Value = ed3pe;

                cmd.Parameters["@ed4"].Value = ed4;
                cmd.Parameters["@ed4bd"].Value = ed4bd;
                cmd.Parameters["@ed4sb"].Value = ed4sb;
                cmd.Parameters["@ed4y"].Value = ed4y;
                cmd.Parameters["@ed4pe"].Value = ed4pe;

                cmd.Parameters["@ed5"].Value = ed5;
                cmd.Parameters["@ed5bd"].Value = ed5bd;
                cmd.Parameters["@ed5sb"].Value = ed5sb;
                cmd.Parameters["@ed5y"].Value = ed5y;
                cmd.Parameters["@ed5pe"].Value = ed5pe;

                cmd.Parameters["@ed6"].Value = ed6;
                cmd.Parameters["@ed6bd"].Value = ed6bd;
                cmd.Parameters["@ed6sb"].Value = ed6sb;
                cmd.Parameters["@ed6y"].Value = ed6y;
                cmd.Parameters["@ed6pe"].Value = ed6pe;

                cmd.Parameters["@ed7"].Value = ed7;
                cmd.Parameters["@ed7bd"].Value = ed7bd;
                cmd.Parameters["@ed7sb"].Value = ed7sb;
                cmd.Parameters["@ed7y"].Value = ed7y;
                cmd.Parameters["@ed7pe"].Value = ed7pe;
                cmd.Parameters["@pplc"].Value = pplc;

                cmd.Parameters["@rtxt"].Value = rtxt;
                cmd.Parameters["@rfil"].Value = rfil;
                cmd.Parameters["@pdt"].Value = Convert.ToDateTime(sdt);

                strx = cmd.ExecuteNonQuery().ToString();
                connection.Close();                
            }
            catch
            {

            }

            if (strx == "1")

                return true;
            else
                return false;
        }
           public bool AddTimeSheet(string uid, string whr, string ot, string rem, 
            string x1, string x2, string x3, string x4, string x5, string x6, string x7, string x8, string x9, string x10,
            string x11, string x12, string x13, string x14, string x15, string x16, string x17, string x18,
            string x19, string x20, string x21, string x22, string x23, string x24, string x25, string x26,
            string x27, string x28, string x29, string x30,
            string y1, string y2, string y3, string y4, string y5, string y6, string y7, string y8, string y9, string y10,
            string y11, string y12, string y13, string y14, string y15, string y16, string y17, string y18,
            string y19, string y20, string y21, string y22, string y23, string y24, string y25, string y26,
            string y27, string y28, string y29, string y30, string sdt)
    {
        string str = string.Empty;
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "insert into timesheet(userid,pdate,workhrs,overtime,rd1,rd2,rd3,rd4,rd5,rd6,rd7,rd8,rd9,rd10,";
            qry = qry + "rd11,rd12,rd13,rd14,rd15,rd16,rd17,rd18,rd19,rd20,rd21,rd22,rd23,rd24,rd25,rd26,rd27,rd28,rd29,rd30,";
            qry = qry + "ot1,ot2,ot3,ot4,ot5,ot6,ot7,ot8,ot9,ot10,ot11,ot12,ot13,ot14,ot15,ot16,ot17,ot18,ot19,ot20,";
            qry = qry + "ot21,ot22,ot23,ot24,ot25,ot26,ot27,ot28,ot29,ot30,remarks) values(@uid,@pdt,@whr,@ot,";
            qry = qry + "@lx1,@lx2,@lx3,@lx4,@lx5,@lx6,@lx7,@lx8,@lx9,@lx10,@lx11,@lx12,@lx13,@lx14,@lx15,@lx16,@lx17,@lx18,@lx19,@lx20,@lx21,@lx22,@lx23,@lx24,@lx25,@lx26,@lx27,@lx28,@lx29,@lx30,";
            qry = qry + "@ly1,@ly2,@ly3,@ly4,@ly5,@ly6,@ly7,@ly8,@ly9,@ly10,@ly11,@ly12,@ly13,@ly14,@ly15,@ly16,@ly17,@ly18,@ly19,@ly20,@ly21,@ly22,@ly23,@ly24,@ly25,@ly26,@ly27,@ly28,@ly29,@ly30,";
            qry = qry + "@rem)";

            SqlCommand cmd = new SqlCommand(qry, connection);

            cmd.Parameters.Add(new SqlParameter("@uid", SqlDbType.Int));
            cmd.Parameters.Add(new SqlParameter("@pdt", SqlDbType.DateTime, 20));
            cmd.Parameters.Add(new SqlParameter("@whr", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@ot", SqlDbType.NVarChar, 250));
            cmd.Parameters.Add(new SqlParameter("@lx1", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx2", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx3", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx4", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx5", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx6", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx7", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx8", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx9", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx10", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx11", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx12", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx13", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx14", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx15", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx16", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx17", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx18", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx19", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx20", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx21", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx22", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx23", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx24", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx25", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx26", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx27", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx28", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx29", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@lx30", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly1", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly2", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly3", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly4", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly5", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly6", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly7", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly8", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly9", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly10", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly11", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly12", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly13", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly14", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly15", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly16", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly17", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly18", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly19", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly20", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly21", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly22", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly23", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly24", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly25", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly26", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly27", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly28", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly29", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@ly30", SqlDbType.NChar, 10));
            cmd.Parameters.Add(new SqlParameter("@rem", SqlDbType.NVarChar, 500));

            cmd.Parameters["@uid"].Value = Convert.ToInt32(uid);
            cmd.Parameters["@pdt"].Value = Convert.ToDateTime(sdt);
            cmd.Parameters["@whr"].Value = whr;
            cmd.Parameters["@ot"].Value = ot;
            cmd.Parameters["@lx1"].Value = x1;
            cmd.Parameters["@lx2"].Value = x2;
            cmd.Parameters["@lx3"].Value = x3;
            cmd.Parameters["@lx4"].Value = x4;
            cmd.Parameters["@lx5"].Value = x5;
            cmd.Parameters["@lx6"].Value = x6;
            cmd.Parameters["@lx7"].Value = x7;
            cmd.Parameters["@lx8"].Value = x8;
            cmd.Parameters["@lx9"].Value = x9;
            cmd.Parameters["@lx10"].Value = x10;
            cmd.Parameters["@lx11"].Value = x11;
            cmd.Parameters["@lx12"].Value = x12;
            cmd.Parameters["@lx13"].Value = x13;
            cmd.Parameters["@lx14"].Value = x14;
            cmd.Parameters["@lx15"].Value = x15;
            cmd.Parameters["@lx16"].Value = x16;
            cmd.Parameters["@lx17"].Value = x17;
            cmd.Parameters["@lx18"].Value = x18;
            cmd.Parameters["@lx19"].Value = x19;
            cmd.Parameters["@lx20"].Value = x20;
            cmd.Parameters["@lx21"].Value = x21;
            cmd.Parameters["@lx22"].Value = x22;
            cmd.Parameters["@lx23"].Value = x23;
            cmd.Parameters["@lx24"].Value = x24;
            cmd.Parameters["@lx25"].Value = x25;
            cmd.Parameters["@lx26"].Value = x26;
            cmd.Parameters["@lx27"].Value = x27;
            cmd.Parameters["@lx28"].Value = x28;
            cmd.Parameters["@lx28"].Value = x29;
            cmd.Parameters["@lx30"].Value = x30;
            cmd.Parameters["@ly1"].Value = y1.ToString();
            cmd.Parameters["@ly2"].Value = y2;
            cmd.Parameters["@ly3"].Value = y3;
            cmd.Parameters["@ly4"].Value = y4;
            cmd.Parameters["@ly5"].Value = y5;
            cmd.Parameters["@ly6"].Value = y6;
            cmd.Parameters["@ly7"].Value = y7;
            cmd.Parameters["@ly8"].Value = y8;
            cmd.Parameters["@ly9"].Value = y9;
            cmd.Parameters["@ly10"].Value = y10;
            cmd.Parameters["@ly11"].Value = y11;
            cmd.Parameters["@ly12"].Value = y12;
            cmd.Parameters["@ly13"].Value = y13;
            cmd.Parameters["@ly14"].Value = y14;
            cmd.Parameters["@ly15"].Value = y15;
            cmd.Parameters["@ly16"].Value = y16;
            cmd.Parameters["@ly17"].Value = y17;
            cmd.Parameters["@ly18"].Value = y18;
            cmd.Parameters["@ly19"].Value = y19;
            cmd.Parameters["@ly20"].Value = y20;
            cmd.Parameters["@ly21"].Value = y21;
            cmd.Parameters["@ly22"].Value = y22;
            cmd.Parameters["@ly23"].Value = y23;
            cmd.Parameters["@ly24"].Value = y24;
            cmd.Parameters["@ly25"].Value = y25;
            cmd.Parameters["@ly26"].Value = y26;
            cmd.Parameters["@ly27"].Value = y27;
            cmd.Parameters["@ly28"].Value = y28;
            cmd.Parameters["@ly28"].Value = y29;
            cmd.Parameters["@ly30"].Value = y30;
            cmd.Parameters["@rem"].Value = rem;

            str = cmd.ExecuteNonQuery().ToString();
            connection.Close();
        }
        catch
        {
        }
        if (str == "1")
            return true;
        else
            return false;
    }
           public DataSet GetEmpDetails(string uid)
           {
               DataSet ds = new DataSet();
               string qry = "select * from employeereg where username='" + uid + "'";
               try
               {
                   SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
                   connection.Open();
                   SqlDataAdapter da = new SqlDataAdapter(qry, connection);
                  
                   da.Fill(ds);
                   connection.Close();                  
               }
               catch
               {
               }
               return ds;
           }


           public bool addts(string uid, string whr, string otxk, string rem, string sdt,
               string x1, string y1, string x2, string y2, string x3, string y3, string x4, string y4, string x5, string y5,
           string x6, string y6, string x7, string y7, string x8, string y8, string x9, string y9, string x10, string y10,
           string x11, string y11, string x12, string y12, string x13, string y13, string x14, string y14, string x15, string y15,
           string x16, string y16, string x17, string y17, string x18, string y18, string x19, string y19, string x20, string y20,
           string x21, string y21, string x22, string y22, string x23, string y23, string x24, string y24, string x25, string y25,
           string x26, string y26, string x27, string y27, string x28, string y28, string x29, string y29, string x30, string y30, string x31, string y31,
           string cname, string clname, string timeper, string frdate, string trdate, string emid, string flg)
           {
               string str = string.Empty;
               try
               {
                   SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
                   connection.Open();

                   string qry = "insert into timesheet(userid,pdate,workhrs,overtime,rd1,ot1,rd2,ot2,rd3,ot3,rd4,ot4,rd5,ot5,rd6,ot6,rd7,ot7,rd8,ot8,rd9,ot9,rd10,ot10,";
                   qry = qry + "rd11,ot11,rd12,ot12,rd13,ot13,rd14,ot14,rd15,ot15,rd16,ot16,rd17,ot17,rd18,ot18,rd19,ot19,rd20,ot20,";
                   qry = qry + "rd21,ot21,rd22,ot22,rd23,ot23,rd24,ot24,rd25,ot25,rd26,ot26,rd27,ot27,rd28,ot28,rd29,ot29,rd30,ot30,rd31,ot31,remarks,consname,clientname,timeperiod,fromdate,todate,flag,empid) ";
                   qry = qry + "values(@ud,@pd,@wh,@ovt,@lx1,@ly1,@lx2,@ly2,@lx3,@ly3,@lx4,@ly4,@lx5,@ly5,@lx6,@ly6,@lx7,@ly7,@lx8,@ly8,@lx9,@ly9,@lx10,@ly10,";
                   qry = qry + "@lx11,@ly11,@lx12,@ly12,@lx13,@ly13,@lx14,@ly14,@lx15,@ly15,@lx16,@ly16,@lx17,@ly17,@lx18,@ly18,@lx19,@ly19,@lx20,@ly20,";
                   qry = qry + "@lx21,@ly21,@lx22,@ly22,@lx23,@ly23,@lx24,@ly24,@lx25,@ly25,@lx26,@ly26,@lx27,@ly27,@lx28,@ly28,@lx29,@ly29,@lx30,@ly30,@lx31,@ly31,@rm,@cnm,@clnm,@timper,@frdt,@trdt,@flg,@emid)";
                   SqlCommand cmd = new SqlCommand(qry, connection);

                   cmd.Parameters.Add(new SqlParameter("@ud", SqlDbType.Int));
                   cmd.Parameters.Add(new SqlParameter("@pd", SqlDbType.DateTime, 20));
                   cmd.Parameters.Add(new SqlParameter("@wh", SqlDbType.NVarChar, 250));
                   cmd.Parameters.Add(new SqlParameter("@ovt", SqlDbType.NVarChar, 250));
                   cmd.Parameters.Add(new SqlParameter("@lx1", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly1", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx2", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly2", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx3", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly3", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx4", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly4", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx5", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly5", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx6", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly6", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx7", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly7", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx8", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly8", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx9", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly9", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx10", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly10", SqlDbType.NVarChar, 50));


                   cmd.Parameters.Add(new SqlParameter("@lx11", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly11", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx12", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly12", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx13", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly13", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx14", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly14", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx15", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly15", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx16", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly16", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx17", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly17", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx18", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly18", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx19", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly19", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx20", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly20", SqlDbType.NVarChar, 50));


                   cmd.Parameters.Add(new SqlParameter("@lx21", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly21", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx22", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly22", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx23", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly23", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx24", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly24", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx25", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly25", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx26", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly26", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx27", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly27", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx28", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly28", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx29", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly29", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx30", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly30", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@lx31", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@ly31", SqlDbType.NVarChar, 50));

                   cmd.Parameters.Add(new SqlParameter("@cnm", SqlDbType.NVarChar, 150));
                   cmd.Parameters.Add(new SqlParameter("@clnm", SqlDbType.NVarChar, 150));
                   cmd.Parameters.Add(new SqlParameter("@timper", SqlDbType.NVarChar, 150));
                   cmd.Parameters.Add(new SqlParameter("@frdt", SqlDbType.DateTime, 20));
                   cmd.Parameters.Add(new SqlParameter("@trdt", SqlDbType.DateTime, 20));
                   cmd.Parameters.Add(new SqlParameter("@rm", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@flg", SqlDbType.NVarChar, 50));
                   cmd.Parameters.Add(new SqlParameter("@emid", SqlDbType.NVarChar, 50));

                   cmd.Parameters["@ud"].Value = Convert.ToInt32(uid);
                   cmd.Parameters["@pd"].Value = Convert.ToDateTime(sdt);
                   cmd.Parameters["@wh"].Value = whr;
                   cmd.Parameters["@ovt"].Value = otxk;
                   cmd.Parameters["@lx1"].Value = x1;
                   cmd.Parameters["@ly1"].Value = y1;
                   cmd.Parameters["@lx2"].Value = x2;
                   cmd.Parameters["@ly2"].Value = y2;
                   cmd.Parameters["@lx3"].Value = x3;
                   cmd.Parameters["@ly3"].Value = y3;
                   cmd.Parameters["@lx4"].Value = x4;
                   cmd.Parameters["@ly4"].Value = y4;
                   cmd.Parameters["@lx5"].Value = x5;
                   cmd.Parameters["@ly5"].Value = y5;
                   cmd.Parameters["@lx6"].Value = x6;
                   cmd.Parameters["@ly6"].Value = y6;
                   cmd.Parameters["@lx7"].Value = x7;
                   cmd.Parameters["@ly7"].Value = y7;
                   cmd.Parameters["@lx8"].Value = x8;
                   cmd.Parameters["@ly8"].Value = y8;
                   cmd.Parameters["@lx9"].Value = x9;
                   cmd.Parameters["@ly9"].Value = y9;
                   cmd.Parameters["@lx10"].Value = x10;
                   cmd.Parameters["@ly10"].Value = y10;


                   cmd.Parameters["@lx11"].Value = x11;
                   cmd.Parameters["@ly11"].Value = y11;
                   cmd.Parameters["@lx12"].Value = x12;
                   cmd.Parameters["@ly12"].Value = y12;
                   cmd.Parameters["@lx13"].Value = x13;
                   cmd.Parameters["@ly13"].Value = y13;
                   cmd.Parameters["@lx14"].Value = x14;
                   cmd.Parameters["@ly14"].Value = y14;
                   cmd.Parameters["@lx15"].Value = x15;
                   cmd.Parameters["@ly15"].Value = y15;
                   cmd.Parameters["@lx16"].Value = x16;
                   cmd.Parameters["@ly16"].Value = y16;
                   cmd.Parameters["@lx17"].Value = x17;
                   cmd.Parameters["@ly17"].Value = y17;
                   cmd.Parameters["@lx18"].Value = x18;
                   cmd.Parameters["@ly18"].Value = y18;
                   cmd.Parameters["@lx19"].Value = x19;
                   cmd.Parameters["@ly19"].Value = y19;
                   cmd.Parameters["@lx20"].Value = x20;
                   cmd.Parameters["@ly20"].Value = y20;


                   cmd.Parameters["@lx21"].Value = x21;
                   cmd.Parameters["@ly21"].Value = y21;
                   cmd.Parameters["@lx22"].Value = x22;
                   cmd.Parameters["@ly22"].Value = y22;
                   cmd.Parameters["@lx23"].Value = x23;
                   cmd.Parameters["@ly23"].Value = y23;
                   cmd.Parameters["@lx24"].Value = x24;
                   cmd.Parameters["@ly24"].Value = y24;
                   cmd.Parameters["@lx25"].Value = x25;
                   cmd.Parameters["@ly25"].Value = y25;
                   cmd.Parameters["@lx26"].Value = x26;
                   cmd.Parameters["@ly26"].Value = y26;
                   cmd.Parameters["@lx27"].Value = x27;
                   cmd.Parameters["@ly27"].Value = y27;
                   cmd.Parameters["@lx28"].Value = x28;
                   cmd.Parameters["@ly28"].Value = y28;
                   cmd.Parameters["@lx29"].Value = x29;
                   cmd.Parameters["@ly29"].Value = y29;
                   cmd.Parameters["@lx30"].Value = x30;
                   cmd.Parameters["@ly30"].Value = y30;
                   cmd.Parameters["@lx31"].Value = x31;
                   cmd.Parameters["@ly31"].Value = y31;

                   cmd.Parameters["@cnm"].Value = cname;
                   cmd.Parameters["@clnm"].Value = clname;
                   cmd.Parameters["@timper"].Value = timeper;
                   cmd.Parameters["@frdt"].Value = Convert.ToDateTime(frdate);
                   cmd.Parameters["@trdt"].Value = Convert.ToDateTime(trdate);
                   cmd.Parameters["@rm"].Value = rem;
                   cmd.Parameters["@flg"].Value = flg;
                   cmd.Parameters["@emid"].Value = emid;

                   str = cmd.ExecuteNonQuery().ToString();
                   connection.Close();
               }
               catch
               {
               }
               if (str == "1")
                   return true;
               else
                   return false;
           }


           public DataSet GetTimeSheet(string uid)
           {
               SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
               connection.Open();

               //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
               string qry = "select * from timesheet where userid=" + uid;
               SqlDataAdapter da = new SqlDataAdapter(qry, connection);
               DataSet ds = new DataSet();

               da.Fill(ds);
               connection.Close();
               return ds;
           }

           public DataSet GetMailTimeSheet(string uid)
           {
               SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
               connection.Open();

               //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
               string qry = "select * from timesheet where id=" + uid;
               SqlDataAdapter da = new SqlDataAdapter(qry, connection);
               DataSet ds = new DataSet();

               da.Fill(ds);
               connection.Close();
               return ds;
           }
           public DataSet GetCareers()
           {
               SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
               connection.Open();

               string qry = "select * from careers";
               SqlDataAdapter da = new SqlDataAdapter(qry, connection);
               DataSet ds = new DataSet();

               da.Fill(ds);
               connection.Close();
               return ds;
           }

           public DataSet GetNewCareers()
           {
               SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
               connection.Open();

               string qry = "select ID, JobID,JobTitle,Skills,Qualification,Location,convert(varchar,OpenFrom,7)OpenFrom,convert(varchar,OpenTo,7)OpenTo,PostedDate from careersnew order by posteddate Desc";
               SqlDataAdapter da = new SqlDataAdapter(qry, connection);
               DataSet ds = new DataSet();

               da.Fill(ds);
               connection.Close();
               return ds;
           }

           public string DeleteCareers(string id)
           {
               SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
               connection.Open();
               string qry = "delete from careersnew where id=" + id;
               SqlCommand cmd = new SqlCommand(qry, connection);
               string x = cmd.ExecuteNonQuery().ToString();
               connection.Close();
               return x;
           }

           public string GetTS(string uid)
           {
                SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
               connection.Open();
               string qry = "select max(id) from timesheet where userid=" + uid;
               SqlCommand cmd = new SqlCommand(qry, connection);
               string x = cmd.ExecuteScalar().ToString();
               connection.Close();
               return x;
           }
    }
    public class clsIGIIT
    {
        DAL.DataLayer objdataapplication = new DAL.DataLayer();

        public bool AddEmpForm1(string fmnm, string fnm, string mnm, string anm, string pradd,
             string peadd, string peaddf, string dob, string bpl, string cct, string ssno,
             string aregno, string dtaxno, string ncstat, string dtadm, string i94no)
        {
            try
            {
                DAL.DataLayer.SqlCommandParams[] Param = new DAL.DataLayer.SqlCommandParams[16];

                Param[0].ParamName = "@fmname";
                Param[0].ParamValue = fmnm.ToString();
                Param[0].ParamType = SqlDbType.VarChar;
                Param[0].ParamDirection = ParameterDirection.Input;

                Param[1].ParamName = "fname";
                Param[1].ParamValue = fnm.ToString();
                Param[1].ParamType = SqlDbType.VarChar;
                Param[1].ParamDirection = ParameterDirection.Input;

                Param[2].ParamName = "@mname";
                Param[2].ParamValue = mnm.ToString();
                Param[2].ParamType = SqlDbType.VarChar;
                Param[2].ParamDirection = ParameterDirection.Input;

                Param[3].ParamName = "aname";
                Param[3].ParamValue = anm.ToString();
                Param[3].ParamType = SqlDbType.VarChar;
                Param[3].ParamDirection = ParameterDirection.Input;

                Param[4].ParamName = "presaddr";
                Param[4].ParamValue = pradd.ToString();
                Param[4].ParamType = SqlDbType.VarChar;
                Param[4].ParamDirection = ParameterDirection.Input;

                Param[5].ParamName = "permaddr";
                Param[5].ParamValue = peadd.ToString();
                Param[5].ParamType = SqlDbType.VarChar;
                Param[5].ParamDirection = ParameterDirection.Input;

                Param[6].ParamName = "permaddr_F";
                Param[6].ParamValue = peaddf.ToString();
                Param[6].ParamType = SqlDbType.VarChar;
                Param[6].ParamDirection = ParameterDirection.Input;

                Param[7].ParamName = "dob";
                Param[7].ParamValue = dob.ToString();
                Param[7].ParamType = SqlDbType.DateTime;
                Param[7].ParamDirection = ParameterDirection.Input;

                Param[8].ParamName = "bplace";
                Param[8].ParamValue = bpl.ToString();
                Param[8].ParamType = SqlDbType.VarChar;
                Param[8].ParamDirection = ParameterDirection.Input;

                Param[9].ParamName = "c_citizen";
                Param[9].ParamValue = cct.ToString();
                Param[9].ParamType = SqlDbType.VarChar;
                Param[9].ParamDirection = ParameterDirection.Input;

                Param[10].ParamName = "ssno";
                Param[10].ParamValue = ssno.ToString();
                Param[10].ParamType = SqlDbType.VarChar;
                Param[10].ParamDirection = ParameterDirection.Input;

                Param[11].ParamName = "aregno";
                Param[11].ParamValue = aregno.ToString();
                Param[11].ParamType = SqlDbType.VarChar;
                Param[11].ParamDirection = ParameterDirection.Input;

                Param[12].ParamName = "Dtaxid";
                Param[12].ParamValue = dtaxno.ToString();
                Param[12].ParamType = SqlDbType.VarChar;
                Param[12].ParamDirection = ParameterDirection.Input;

                Param[13].ParamName = "nimgr";
                Param[13].ParamValue = ncstat.ToString();
                Param[13].ParamType = SqlDbType.VarChar;
                Param[13].ParamDirection = ParameterDirection.Input;

                Param[14].ParamName = "rdt";
                Param[14].ParamValue = dtadm.ToString();
                Param[14].ParamType = SqlDbType.DateTime;
                Param[14].ParamDirection = ParameterDirection.Input;

                Param[15].ParamName = "i94no";
                Param[15].ParamValue = i94no.ToString();
                Param[15].ParamType = SqlDbType.VarChar;
                Param[15].ParamDirection = ParameterDirection.Input;

                DAL.DataLayer objdataapplication = new DAL.DataLayer();
                objdataapplication.WithOut_ExecuteStoredProcedure("empform1", Param);
                return true;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public string GetEmpForm()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            string qry = "select max(id) from EmpForm";
            SqlCommand cmd = new SqlCommand(qry, connection);
            string x = cmd.ExecuteScalar().ToString();
            connection.Close();
            return x;
        }
        public bool AddEmpForm2(
               string eid, string exdt, string psno, string pss, string dtiss, string dtex,
               string vs1, string dtda1,
               string dtdd1, string vs2, string dtda2, string dtdd2, string vs3, string dtda3, string dtdd3,
               string usc, string yfadd, string h1b, string nm1, string nvs1, string in91, string pn1,
               string cp1, string nm2, string nvs2, string in92, string pn2, string cp2, string nm3,
               string nvs3, string in93, string pn3, string cp3, string nm4, string nvs4, string in94,
               string pn4, string cp4
               )
        {
            try
            {
                DAL.DataLayer.SqlCommandParams[] Param = new DAL.DataLayer.SqlCommandParams[38];

                Param[0].ParamName = "@eid";
                Param[0].ParamValue = eid.ToString();
                Param[0].ParamType = SqlDbType.Int;
                Param[0].ParamDirection = ParameterDirection.Input;

                Param[1].ParamName = "exdt_i94";
                Param[1].ParamValue = exdt.ToString();
                Param[1].ParamType = SqlDbType.DateTime;
                Param[1].ParamDirection = ParameterDirection.Input;

                Param[2].ParamName = "@passno";
                Param[2].ParamValue = psno.ToString();
                Param[2].ParamType = SqlDbType.VarChar;
                Param[2].ParamDirection = ParameterDirection.Input;

                Param[3].ParamName = "country_iss";
                Param[3].ParamValue = pss.ToString();
                Param[3].ParamType = SqlDbType.VarChar;
                Param[3].ParamDirection = ParameterDirection.Input;

                Param[4].ParamName = "dt_iss";
                Param[4].ParamValue = dtiss.ToString();
                Param[4].ParamType = SqlDbType.DateTime;
                Param[4].ParamDirection = ParameterDirection.Input;

                Param[5].ParamName = "dt_exp";
                Param[5].ParamValue = dtex.ToString();
                Param[5].ParamType = SqlDbType.DateTime;
                Param[5].ParamDirection = ParameterDirection.Input;

                Param[6].ParamName = "vt1";
                Param[6].ParamValue = vs1.ToString();
                Param[6].ParamType = SqlDbType.VarChar;
                Param[6].ParamDirection = ParameterDirection.Input;

                Param[7].ParamName = "dt_adm1";
                Param[7].ParamValue = dtda1.ToString();
                Param[7].ParamType = SqlDbType.DateTime;
                Param[7].ParamDirection = ParameterDirection.Input;

                Param[8].ParamName = "dt_dep1";
                Param[8].ParamValue = dtdd1.ToString();
                Param[8].ParamType = SqlDbType.DateTime;
                Param[8].ParamDirection = ParameterDirection.Input;

                Param[9].ParamName = "vt2";
                Param[9].ParamValue = vs2.ToString();
                Param[9].ParamType = SqlDbType.VarChar;
                Param[9].ParamDirection = ParameterDirection.Input;

                Param[10].ParamName = "dt_adm2";
                Param[10].ParamValue = dtda2.ToString();
                Param[10].ParamType = SqlDbType.DateTime;
                Param[10].ParamDirection = ParameterDirection.Input;

                Param[11].ParamName = "dt_dep2";
                Param[11].ParamValue = dtdd2.ToString();
                Param[11].ParamType = SqlDbType.DateTime;
                Param[11].ParamDirection = ParameterDirection.Input;

                Param[12].ParamName = "vt3";
                Param[12].ParamValue = vs3.ToString();
                Param[12].ParamType = SqlDbType.VarChar;
                Param[12].ParamDirection = ParameterDirection.Input;

                Param[13].ParamName = "dt_adm3";
                Param[13].ParamValue = dtda3.ToString();
                Param[13].ParamType = SqlDbType.DateTime;
                Param[13].ParamDirection = ParameterDirection.Input;

                Param[14].ParamName = "dt_dep3";
                Param[14].ParamValue = dtdd3.ToString();
                Param[14].ParamType = SqlDbType.DateTime;
                Param[14].ParamDirection = ParameterDirection.Input;

                Param[15].ParamName = "usa_cons";
                Param[15].ParamValue = usc.ToString();
                Param[15].ParamType = SqlDbType.VarChar;
                Param[15].ParamDirection = ParameterDirection.Input;

                Param[16].ParamName = "addr_F";
                Param[16].ParamValue = yfadd.ToString();
                Param[16].ParamType = SqlDbType.VarChar;
                Param[16].ParamDirection = ParameterDirection.Input;

                Param[17].ParamName = "h1bclass";
                Param[17].ParamValue = h1b.ToString();
                Param[17].ParamType = SqlDbType.VarChar;
                Param[17].ParamDirection = ParameterDirection.Input;

                Param[18].ParamName = "nm1";
                Param[18].ParamValue = nm1.ToString();
                Param[18].ParamType = SqlDbType.VarChar;
                Param[18].ParamDirection = ParameterDirection.Input;

                Param[19].ParamName = "vtt1";
                Param[19].ParamValue = nvs1.ToString();
                Param[19].ParamType = SqlDbType.VarChar;
                Param[19].ParamDirection = ParameterDirection.Input;

                Param[20].ParamName = "i94no1";
                Param[20].ParamValue = in91.ToString();
                Param[20].ParamType = SqlDbType.VarChar;
                Param[20].ParamDirection = ParameterDirection.Input;

                Param[21].ParamName = "passno1";
                Param[21].ParamValue = pn1.ToString();
                Param[21].ParamType = SqlDbType.VarChar;
                Param[21].ParamDirection = ParameterDirection.Input;

                Param[22].ParamName = "country_p1";
                Param[22].ParamValue = cp1.ToString();
                Param[22].ParamType = SqlDbType.VarChar;
                Param[22].ParamDirection = ParameterDirection.Input;


                Param[23].ParamName = "nm2";
                Param[23].ParamValue = nm2.ToString();
                Param[23].ParamType = SqlDbType.VarChar;
                Param[23].ParamDirection = ParameterDirection.Input;

                Param[24].ParamName = "vtt2";
                Param[24].ParamValue = nvs2.ToString();
                Param[24].ParamType = SqlDbType.VarChar;
                Param[24].ParamDirection = ParameterDirection.Input;

                Param[25].ParamName = "i94no2";
                Param[25].ParamValue = in92.ToString();
                Param[25].ParamType = SqlDbType.VarChar;
                Param[25].ParamDirection = ParameterDirection.Input;

                Param[26].ParamName = "passno2";
                Param[26].ParamValue = pn2.ToString();
                Param[26].ParamType = SqlDbType.VarChar;
                Param[26].ParamDirection = ParameterDirection.Input;

                Param[27].ParamName = "country_p2";
                Param[27].ParamValue = cp2.ToString();
                Param[27].ParamType = SqlDbType.VarChar;
                Param[27].ParamDirection = ParameterDirection.Input;

                Param[28].ParamName = "nm3";
                Param[28].ParamValue = nm3.ToString();
                Param[28].ParamType = SqlDbType.VarChar;
                Param[28].ParamDirection = ParameterDirection.Input;

                Param[29].ParamName = "vtt3";
                Param[29].ParamValue = nvs3.ToString();
                Param[29].ParamType = SqlDbType.VarChar;
                Param[29].ParamDirection = ParameterDirection.Input;

                Param[30].ParamName = "i94no3";
                Param[30].ParamValue = in93.ToString();
                Param[30].ParamType = SqlDbType.VarChar;
                Param[30].ParamDirection = ParameterDirection.Input;

                Param[31].ParamName = "passno3";
                Param[31].ParamValue = pn3.ToString();
                Param[31].ParamType = SqlDbType.VarChar;
                Param[31].ParamDirection = ParameterDirection.Input;

                Param[32].ParamName = "country_p3";
                Param[32].ParamValue = cp3.ToString();
                Param[32].ParamType = SqlDbType.VarChar;
                Param[32].ParamDirection = ParameterDirection.Input;

                Param[33].ParamName = "nm4";
                Param[33].ParamValue = nm4.ToString();
                Param[33].ParamType = SqlDbType.VarChar;
                Param[33].ParamDirection = ParameterDirection.Input;

                Param[34].ParamName = "vtt4";
                Param[34].ParamValue = nvs4.ToString();
                Param[34].ParamType = SqlDbType.VarChar;
                Param[34].ParamDirection = ParameterDirection.Input;

                Param[35].ParamName = "i94no4";
                Param[35].ParamValue = in94.ToString();
                Param[35].ParamType = SqlDbType.VarChar;
                Param[35].ParamDirection = ParameterDirection.Input;

                Param[36].ParamName = "passno4";
                Param[36].ParamValue = pn4.ToString();
                Param[36].ParamType = SqlDbType.VarChar;
                Param[36].ParamDirection = ParameterDirection.Input;

                Param[37].ParamName = "country_p4";
                Param[37].ParamValue = cp4.ToString();
                Param[37].ParamType = SqlDbType.VarChar;
                Param[37].ParamDirection = ParameterDirection.Input;

                DAL.DataLayer objdataapplication = new DAL.DataLayer();
                objdataapplication.WithOut_ExecuteStoredProcedure("empform2", Param);
                return true;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public bool AddEmpForm3(
              string eid, string conno, string conno1, string emailid, string pdt
              )
        {
            try
            {
                DAL.DataLayer.SqlCommandParams[] Param = new DAL.DataLayer.SqlCommandParams[5];

                Param[0].ParamName = "@eid";
                Param[0].ParamValue = eid.ToString();
                Param[0].ParamType = SqlDbType.Int;
                Param[0].ParamDirection = ParameterDirection.Input;

                Param[1].ParamName = "conno";
                Param[1].ParamValue = conno.ToString();
                Param[1].ParamType = SqlDbType.VarChar;
                Param[1].ParamDirection = ParameterDirection.Input;

                Param[2].ParamName = "@conno1";
                Param[2].ParamValue = conno1.ToString();
                Param[2].ParamType = SqlDbType.VarChar;
                Param[2].ParamDirection = ParameterDirection.Input;

                Param[3].ParamName = "emailid";
                Param[3].ParamValue = emailid.ToString();
                Param[3].ParamType = SqlDbType.VarChar;
                Param[3].ParamDirection = ParameterDirection.Input;

                Param[4].ParamName = "pdt";
                Param[4].ParamValue = pdt.ToString();
                Param[4].ParamType = SqlDbType.DateTime;
                Param[4].ParamDirection = ParameterDirection.Input;

                DAL.DataLayer objdataapplication = new DAL.DataLayer();
                objdataapplication.WithOut_ExecuteStoredProcedure("empform3", Param);
                return true;
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
        public DataSet GetEmpFormDet(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            //string qry = "select e.userid EmpID, e.firstname EmpName,e.consname Consultant,e.clientname Client,e.projname Project,e.projtime TimePeriod,Convert(varchar,t.pdate,101) Date,t.workhrs WorkHours,t.overtime OverTime,t.remarks Remarks from employeereg e, timesheet t where t.userid=e.userid and t.userid=" + uid + " order by Date";
            string qry = "select * from EmpForm where id=" + uid;
            SqlDataAdapter da = new SqlDataAdapter(qry, connection);
            DataSet ds = new DataSet();

            da.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataSet GetEmpClientDet(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "select * from clientform where id=" + uid;
            SqlDataAdapter da = new SqlDataAdapter(qry, connection);
            DataSet ds = new DataSet();

            da.Fill(ds);
            connection.Close();
            return ds;
        }

        public DataSet GetEmpClientDetall(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "select * from clientform where userid=" + uid;
            SqlDataAdapter da = new SqlDataAdapter(qry, connection);
            DataSet ds = new DataSet();

            da.Fill(ds);
            connection.Close();
            return ds;
        }
        public string ClientIdMax(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            string qry = "select max(id) from clientform";
            SqlCommand cmd = new SqlCommand(qry, connection);
            string x = cmd.ExecuteScalar().ToString();
            connection.Close();
            return x;
        }
        public DataSet GetEmpVendorDet(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "select * from vendorform where id=" + uid;
            SqlDataAdapter da = new SqlDataAdapter(qry, connection);
            DataSet ds = new DataSet();

            da.Fill(ds);
            connection.Close();
            return ds;
        }

        public DataSet GetEmpVendorDetall(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();

            string qry = "select * from vendorform where userid=" + uid;
            SqlDataAdapter da = new SqlDataAdapter(qry, connection);
            DataSet ds = new DataSet();

            da.Fill(ds);
            connection.Close();
            return ds;
        }
        public string VendorIdMax(string uid)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connection.Open();
            string qry = "select max(id) from vendorform";
            SqlCommand cmd = new SqlCommand(qry, connection);
            string x = cmd.ExecuteScalar().ToString();
            connection.Close();
            return x;
        }
    }
}
