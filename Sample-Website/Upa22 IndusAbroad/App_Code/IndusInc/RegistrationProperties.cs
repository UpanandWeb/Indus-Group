using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace igiit.PropertiesLayer
{
    /// <summary>
    /// Summary description for RegistrationProperties
    /// </summary>
    public class RegistrationProperties
    {
        public RegistrationProperties()
        {

        }
        private string RowId;
        
        private string UserName;
        private string Name;
        private string Password;
        private string CPassword;
        private string EMail;
        private string CurrentCom;
        private string CurrentPos;
        private string CurrentFmn;
        private string CurrentFyr;
        private string CurrentTmn;
        private string CurrentTyr;
        private string CurrentLoc;
       // private string WorkCcode;
        //private string WorkAcode;
        private string WorkPhone;
        private string Country;
        //private string HomeCcode;
        //private string HomeAcode;

        private string HomePhone;
        private string MobPhone;
        private string ExpYears;
        private string ExpMonths;
        private string Skills;
        private string Rhead;
        private string Fnarea;
        private string IndType;
        private string Education;
        private string EducationBoard;
        private string Majorsub;
        private string EducationYear;
        private string EducationScore;
        private string PG;
        private string PGBoard;
        private string PGMajorsub;
        private string PGYear;
        private string PGScore;
        private string PostPG;
        private string PostPGBoard;
        private string PostPGMajorsub;
        private string PostPGYear;
        private string PostPGScore;
        private string Resume;
        private string RType;
        private string Rpaste;

        private string Work1Ccode;
        private string Work1Acode;
        private string Work1Phone;
        private string Work2Ccode;
        private string Work2Acode;
        private string Work2Phone;

        private string CPerson;
        private string CPDesig;
        private string Comp_URL;

        private string Address;
        private string Street;
        private string State;
        private string City;
        private string Fax;
        private string Desc;
        private string PDate;

        private string Usid;
        private string JobTitle;
        private string Posts;
        private string ExpMin;
        private string ExpMax;
        private string Flag;
        private string Jpostid;
        private string Stsearch;

        private string MinSal;
        private string MaxSal;
        private string Currency;
        private string Flag1;
        private string FName;
        private string MName;
        private string LName;
        private string Father;
        private string Mother;
        private string Spouse;
        //private string vStreet;
        //private string vCountry;
        private string state;
        private string city;
        private string zip;
        
        private DateTime BDate;
        private string citizenship;
        private string BCity;
        private string BState;

        private string BCountry;
        private string Passportno;
        private string Passportissuedat;
        private DateTime Dofissue;
        private DateTime DofExp;
        private string Nationality;
        private string CntryOfPassport;
        private string ContactPersonName1;
        private string CPhone1;
        private string CPEmail1;
        private string CPAddress1;
        private string ContactPersonName2;
        private string CPhone2;
        private string CPEmail2;
        private string CPAddress2;
        private int TotExpYrs;
        private int TotExpMonths;
        private string ExptLevel;
        private string ExpYear;
        private int Id;
        private string JobDesc;
        private string Position;
        private string Location;
        private string JobFunc;
        private string Specialization;
        private string Industry;
        private string Qualification;
        private string Exp;
        

        //private string ResumeText;
        //private string Filename;
        //private int JobFlag;
        //private int TraineePrgsFlag;
        //private int NewsFlag;

        //private int TermsandConditionsFlag;

        //

        public string vRowId
        {
            get { return RowId; }
            set { RowId = value; }
        }

        public string vNationality
        {
            get { return Nationality; }
            set { Nationality = value; }
        }
        public string vCntryOfPassport
        {
            get { return CntryOfPassport; }
            set { CntryOfPassport = value; }
        }
        public string vContactPersonName1
        {
            get { return ContactPersonName1; }
            set { ContactPersonName1 = value; }
        }
        public string vCPhone1
        {
            get { return CPhone1; }
            set { CPhone1 = value; }
        }
        public string vCPEmail1
        {
            get { return CPEmail1; }
            set { CPEmail1 = value; }
        }
        public string vCPAddress1
        {
            get { return CPAddress1; }
            set { CPAddress1 = value; }
        }
        public string vContactPersonName2
        {
            get { return ContactPersonName2; }
            set { ContactPersonName2 = value; }
        }
        public string vCPhone2
        {
            get { return CPhone2; }
            set { CPhone2 = value; }
        }
        public string vCPEmail2
        {
            get { return CPEmail2; }
            set { CPEmail2 = value; }
        }
        public string vCPAddress2
        {
            get { return CPAddress2; }
            set { CPAddress2 = value; }
        }
        //TotExpYrs
        public int vTotExpYrs
        {
            get { return TotExpYrs; }
            set { TotExpYrs = value; }
        }
        public int vTotExpMonths
        {
            get { return TotExpMonths; }
            set { TotExpMonths = value; }
        }
        

        
        
        //FName
        public string vFName
        {
            get { return FName; }
            set { FName = value; }
        }
        public string vMName
        {
            get { return MName; }
            set { MName = value; }
        }
        public string vLName
        {
            get { return LName; }
            set { LName = value; }
        }
        public string vFather
        {
            get { return Father; }
            set { Father = value; }
        }
        public string vMother
        {
            get { return Mother; }
            set { Mother = value; }
        }
        public string vSpouse
        {
            get { return Spouse; }
            set { Spouse = value; }
        }
        //
        public string vstate
        {
            get { return state; }
            set { state = value; }
        }
        public string vcity
        {
            get { return city; }
            set { city = value; }
        }
        public string vzip
        {
            get { return zip; }
            set { zip = value; }
        }
        public string vHomePhone
        {
            get { return HomePhone; }
            set { HomePhone = value; }

        }
        public string vMobPhone
        {
            get { return MobPhone; }
            set { MobPhone = value; }
        }
        //
        public DateTime vBDate
        {
            get { return BDate; }
            set { BDate = value; }
        }
        public string vcitizenship
        {
            get { return citizenship; }
            set { citizenship = value; }
        }
        public string vBCity
        {
            get { return BCity; }
            set { BCity = value; }
        }
        public string vBState
        {
            get { return BState; }
            set { BState = value; }
        }
        public string vBCountry
        {
            get { return BCountry; }
            set { BCountry = value; }

        }
        public string vPassportno
        {
            get { return Passportno; }
            set { Passportno = value; }
        }
        public string vPassportissuedat
        {
            get { return Passportissuedat; }
            set { Passportissuedat = value; }
        }
        public DateTime vDofissue
        {
            get { return Dofissue; }
            set { Dofissue = value; }
        }
        public DateTime vDofExp
        {
            get { return DofExp; }
            set { DofExp = value; }
        }
        //
        public string vFlag1
        {
            get { return Flag1; }
            set { Flag1 = value; }
        }
        public string vMinSal
        {
            get { return MinSal; }
            set { MinSal = value; }
        }
        public string vMaxSal
        {
            get { return MaxSal; }
            set { MaxSal = value; }
        }
        public string vCurrency
        {
            get { return Currency; }
            set { Currency = value; }
        }
        public string vJpostid
        {
            get { return Jpostid; }
            set { Jpostid = value; }
        }

        public string vStsearch
        {
            get { return Stsearch; }
            set { Stsearch = value; }
        }

        public string vFlag
        {
            get { return Flag; }
            set { Flag = value; }
        }
        public string vUsid
        {
            get { return Usid; }
            set { Usid = value; }
        }
        public string vJobTitle
        {
            get { return JobTitle; }
            set { JobTitle = value; }
        }
        
        //vExptLevel
        public string vExptLevel
        {
            get { return ExptLevel; }
            set { ExptLevel = value; }
        }
        
        //vExpYears
        public string vExpYear
        {
            get { return ExpYear; }
            set { ExpYear = value; }
        }

        public string vPosts
        {
            get { return Posts; }
            set { Posts = value; }
        }

        public string vExpMin
        {
            get { return ExpMin; }
            set { ExpMin = value; }
        }

        public string vExpMax
        {
            get { return ExpMax; }
            set { ExpMax = value; }
        }
        public string vUserName
        {
            get { return UserName; }
            set { UserName = value; }
        }
        public string vName
        {
            get { return Name; }
            set { Name = value; }

        }
        public string vCurrentLoc
        {
            get { return CurrentLoc; }
            set { CurrentLoc = value; }

        }


        public string vCurrentCom
        {
            get { return CurrentCom; }
            set { CurrentCom = value; }

        }
        
        public string vCurrentPos
        {
            get { return CurrentPos; }
            set { CurrentPos = value; }

        }

         public string vCurrentFmn
        {
            get { return CurrentFmn; }
            set { CurrentFmn = value; }

        }
         
         public string vCurrentFyr
        {
            get { return CurrentFyr; }
            set { CurrentFyr = value; }

        }

        public string vCurrentTmn
        {
            get { return CurrentTmn; }
            set { CurrentTmn = value; }

        }
                  
          public string vCurrentTyr
        {
            get { return CurrentTyr; }
            set { CurrentTyr = value; }

        }
        
        public string vPassword
        {
            get { return Password; }
            set { Password = value; }

        }
        //vCPassword
        public string vCPassword
        {
            get { return CPassword; }
            set { CPassword = value; }

        }
        public string vEMail
        {
            get { return EMail; }
            set { EMail = value; }

        }
        //public string vWorkCcode
        //{
        //    get { return WorkCcode; }
        //    set { WorkCcode = value; }

        //}
        //public string vWorkAcode
        //{
        //    get { return WorkAcode; }
        //    set { WorkAcode = value; }

        //}
        public string vWorkPhone
        {
            get { return WorkPhone; }
            set { WorkPhone = value; }

        }
        //public string vHomeCcode
        //{
        //    get { return HomeCcode; }
        //    set { HomeCcode = value; }

        //}
        public string vCountry
        {
            get { return Country; }
            set { Country = value; }

        }
        //public string vHomeAcode
        //{
        //    get { return HomeAcode; }
        //    set { HomeAcode = value; }

        //}
        //public string vHomePhone
        //{
        //    get { return HomePhone; }
        //    set { HomePhone = value; }

        //}
        //public string vMobPhone
        //{
        //    get { return MobPhone; }
        //    set { MobPhone = value; }

        //}
        public string vExpYears
        {
            get { return ExpYears; }
            set { ExpYears = value; }

        }
        public string vExpMonths
        {
            get { return ExpMonths; }
            set { ExpMonths = value; }
        }
        public string vSkills
        {
            get { return Skills; }
            set { Skills = value; }
        }
        //vId
        public int  vId
        {
            get { return Id; }
            set { Id = value; }
        }
        public string vRhead
        {
            get { return Rhead; }
            set { Rhead = value; }

        }
        public string vFnarea
        {
            get { return Fnarea; }
            set { Fnarea = value; }

        }
        public string vIndType
        {
            get { return IndType; }
            set { IndType = value; }

        }
        public string vEducation
        {
            get { return Education; }
            set { Education = value; }

        }

        public string vEducationBoard
        {
            get { return EducationBoard; }
            set { EducationBoard = value; }

        }


        public string vMajorsub
        {
            get { return Majorsub; }
            set { Majorsub = value; }

        }

        public string vEducationYear
        {
            get { return EducationYear; }
            set { EducationYear = value; }

        }

        public string vEducationScore
        {
            get { return EducationScore; }
            set { EducationScore = value; }

        }

        public string vPG
        {
            get { return PG; }
            set { PG = value; }

        }

        public string vPGBoard
        {
            get { return PGBoard; }
            set { PGBoard = value; }

        }


        public string vPGMajorsub
        {
            get { return PGMajorsub; }
            set { PGMajorsub = value; }

        }

        public string vPGYear
        {
            get { return PGYear; }
            set { PGYear = value; }

        }

        public string vPGScore
        {
            get { return PGScore; }
            set { PGScore = value; }

        }



        public string vPostPG
        {
            get { return PostPG; }
            set { PostPG = value; }

        }

        public string vPostPGBoard
        {
            get { return PostPGBoard; }
            set { PostPGBoard = value; }

        }


        public string vPostPGMajorsub
        {
            get { return PostPGMajorsub; }
            set { PostPGMajorsub = value; }

        }

        public string vPostPGYear
        {
            get { return PostPGYear; }
            set { PostPGYear = value; }

        }

        public string vPostPGScore
        {
            get { return PostPGScore; }
            set { PostPGScore = value; }

        }



        public string vResume
        {
            get { return Resume; }
            set { Resume = value; }

        }
        public string vRType
        {
            get { return RType; }
            set { RType = value; }

        }

        public string vRpaste
        {
            get { return Rpaste; }
            set { Rpaste = value; }

        }

        public string vCPerson
        {
            get { return CPerson; }
            set { CPerson = value; }

        }
        public string vCPDesig
        {
            get { return CPDesig; }
            set { CPDesig = value; }

        }
        public string vComp_URL
        {
            get { return Comp_URL; }
            set { Comp_URL = value; }

        }
        public string vAddress
        {
            get { return Address; }
            set { Address = value; }

        }
        public string vStreet
        {
            get { return Street; }
            set { Street = value; }

        }
        public string vState
        {
            get { return State; }
            set { State = value; }

        }
        public string vCity
        {
            get { return City; }
            set { City = value; }

        }
        public string vWork1Ccode
        {
            get { return Work1Ccode; }
            set { Work1Ccode = value; }

        }
        public string vWork1Acode
        {
            get { return Work1Acode; }
            set { Work1Acode = value; }

        }
        public string vWork1Phone
        {
            get { return Work1Phone; }
            set { Work1Phone = value; }

        }
        public string vWork2Ccode
        {
            get { return Work2Ccode; }
            set { Work2Ccode = value; }

        }
        public string vWork2Acode
        {
            get { return Work2Acode; }
            set { Work2Acode = value; }

        }
        public string vWork2Phone
        {
            get { return Work2Phone; }
            set { Work2Phone = value; }

        }
        public string vFax
        {
            get { return Fax; }
            set { Fax = value; }

        }
        public string vDesc
        {
            get { return Desc; }
            set { Desc = value; }

        }
        //vCntryOfPassport
        //public string vCntryOfPassport
        //{
        //    get { return CntryOfPassport; }
        //    set { CntryOfPassport = value; }

        //}
        public string vPDate
        {
            get { return PDate; }
            set { PDate = value; }

        }
       // vJobDesc
        public string vJobDesc
        {
            get { return JobDesc; }
            set { JobDesc = value; }

        }
        //vPosition
        public string vPosition
        {
            get { return Position; }
            set { Position = value; }

        }
        //vLocation
        public string vLocation
        {
            get { return Location; }
            set { Location = value; }

        }

        //vJobFunc
        public string vJobFunc
        {
            get { return JobFunc; }
            set { JobFunc = value; }

        }
        //vSpecialization
        public string vSpecialization
        {
            get { return Specialization; }
            set { Specialization = value; }

        }

        //vIndustry
        public string vIndustry
        {
            get { return Industry; }
            set { Industry = value; }

        }
        //vQualification
        public string vQualification
        {
            get { return Qualification; }
            set { Qualification = value; }

        }
        //vExp
        public string vExp
        {
            get { return Exp; }
            set { Exp = value; }

        }

        
    }
}