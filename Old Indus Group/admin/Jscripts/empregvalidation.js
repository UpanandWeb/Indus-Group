function NameAvailable()
	{
		
		h = 170; 
		w = 400;
		tw = window.screen.height;
		lw = window.screen.width;
	 	tv = tw - h ;
	 	lv = lw - w ; 
	 	t = tv / 2 ;
	 	l = lv / 2 ;

		prop = "scrollbars = no , menubar=no, statusbar=no, width=350, height=120, Top = " + t + "Left = " + l ;
        var email = document.getElementById("txtusername").value;
        //alert(email)
        if(email!="")
        {
            
		    url = "Available.aspx?email=" + email +"&id=" + 2;
		    msgWindow = window.open(url,'Demo',prop);
		}
		else
		{
		    alert("Please enter Username");
		}
		
	}
function validatefields()
{
var messg="";

alert(document.getElementById("state").value);

if((document.getElementById("txtusername").value=="")||(document.getElementById("txtpwd").value=="")||(document.getElementById("txtconpwd").value=="")||
(document.getElementById("txtcompname").value=="")||(document.getElementById("txtcompmail").value=="")||(document.getElementById("indtype").value=="")||
(document.getElementById("conperson").value=="")||(document.getElementById("cpersondesig").value=="")||(document.getElementById("txturl").value=="")||
(document.getElementById("praddr").value=="")||(document.getElementById("staddr").value=="")||(document.getElementById("country").value=="")||
(document.getElementById("state").value=="")||(document.getElementById("city").value=="")||(document.getElementById("W1_ccode").value=="")||
(document.getElementById("W1_acode").value=="")||(document.getElementById("W1_phno").value=="")||(document.getElementById("txtfax").value==""))
{

if(document.getElementById("txtusername").value=="")

messg=messg + "Enter UserName \n" ;


if(document.getElementById("txtpwd").value=="")

messg=messg + "Enter Password \n" ;

if(document.getElementById("txtconpwd").value=="")
messg=messg + "Confirm Password \n";

if(document.getElementById("txtcompname").value=="")
messg=messg + "Enter Company Name \n";

if(document.getElementById("txtcompmail").value=="")
messg=messg + "Enter Company Email \n" ;

if(document.getElementById("indtype").value=="")
messg=messg + "Select Your Industry Type \n" ;

if(document.getElementById("conperson").value=="")
messg=messg + "Specify the contact person \n";

if(document.getElementById("cpersondesig").value=="")
messg=messg + "Enter the contact person designation \n";

if(document.getElementById("txturl").value=="")
messg=messg + "Enter the Company URL \n" ;

if(document.getElementById("praddr").value=="")
messg=messg + "Enter the Primary Address \n" ;

if(document.getElementById("staddr").value=="")
messg=messg + "Enter the street address \n";

if(document.getElementById("country").value=="")
messg=messg + "Specify the country \n";

if(document.getElementById("state").value=="")
messg=messg + "Specify the state \n" ;

if(document.getElementById("city").value=="")
messg=messg + "Specify the city \n" ;

if(document.getElementById("W1_ccode").value=="")
messg=messg + "Specify Country code \n";

if(document.getElementById("W1_acode").value=="")
messg=messg + "Specify area code \n";

if(document.getElementById("W1_phno").value=="")
messg=messg + "Specify Workplace Telephone No \n" ;

if(document.getElementById("txtfax").value=="")
messg=messg + "Enter Fax \n" ;

alert(messg);
return false;

}

else if(document.regForm.chkaccept.checked==false)
{
alert("You must agree the Terms and Conditions before you can continue");
return false;
}
else
{
return true;
}
}

function checkpwd()
{
var pwd=document.getElementById("txtpwd").value;
var cpwd=document.getElementById("txtconpwd").value;
if((pwd !="")&&(cpwd!=""))
{
if(pwd != cpwd)
{
alert("Passwords doesn't Match");
document.getElementById("txtconpwd").focus();
}
}
}
function checkpwdlen()
{
var pwd=document.getElementById("txtpwd").value;
var l=pwd.length;
l=Number(l);
if(l !=0)
{
if(l<6)
{
alert("Password should Contain 6 or more characters");
}
}
}

function checkemail()
{
var email=document.getElementById("txtemail").value;
var cemail=document.getElementById("txtconemail").value;

if(email != cemail)
{
alert("Emails doesn't Match");
document.getElementById("txtconemail").select();
}
}

function echeck() {
        
        var str=document.getElementById("txtcompmail").value;
        if(str!="")
        {
		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   document.getElementById("txtcompmail").select();
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		      document.getElementById("txtcompmail").select();
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    document.getElementById("txtcompmail").select();
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		   document.getElementById("txtcompmail").select();
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
	   document.getElementById("txtcompmail").select();
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		   document.getElementById("txtcompmail").select();
		    return false
		 }

 		 return true	
 		 }				
	}

function chknum(field)
{
if (isNaN(field.value)) {
            alert("Only Numeric Values are allowed")
           field.select();
        return false }
        }


 
function checkDomain()
{
var arr = new Array(
'.com','.net','.org','.biz','.coop','.info','.museum','.name',
'.pro','.edu','.gov','.int','.mil','.ac','.ad','.ae','.af','.ag',
'.ai','.al','.am','.an','.ao','.aq','.ar','.as','.at','.au','.aw',
'.az','.ba','.bb','.bd','.be','.bf','.bg','.bh','.bi','.bj','.bm',
'.bn','.bo','.br','.bs','.bt','.bv','.bw','.by','.bz','.ca','.cc',
'.cd','.cf','.cg','.ch','.ci','.ck','.cl','.cm','.cn','.co','.cr',
'.cu','.cv','.cx','.cy','.cz','.de','.dj','.dk','.dm','.do','.dz',
'.ec','.ee','.eg','.eh','.er','.es','.et','.fi','.fj','.fk','.fm',
'.fo','.fr','.ga','.gd','.ge','.gf','.gg','.gh','.gi','.gl','.gm',
'.gn','.gp','.gq','.gr','.gs','.gt','.gu','.gv','.gy','.hk','.hm',
'.hn','.hr','.ht','.hu','.id','.ie','.il','.im','.in','.io','.iq',
'.ir','.is','.it','.je','.jm','.jo','.jp','.ke','.kg','.kh','.ki',
'.km','.kn','.kp','.kr','.kw','.ky','.kz','.la','.lb','.lc','.li',
'.lk','.lr','.ls','.lt','.lu','.lv','.ly','.ma','.mc','.md','.mg',
'.mh','.mk','.ml','.mm','.mn','.mo','.mp','.mq','.mr','.ms','.mt',
'.mu','.mv','.mw','.mx','.my','.mz','.na','.nc','.ne','.nf','.ng',
'.ni','.nl','.no','.np','.nr','.nu','.nz','.om','.pa','.pe','.pf',
'.pg','.ph','.pk','.pl','.pm','.pn','.pr','.ps','.pt','.pw','.py',
'.qa','.re','.ro','.rw','.ru','.sa','.sb','.sc','.sd','.se','.sg',
'.sh','.si','.sj','.sk','.sl','.sm','.sn','.so','.sr','.st','.sv',
'.sy','.sz','.tc','.td','.tf','.tg','.th','.tj','.tk','.tm','.tn',
'.to','.tp','.tr','.tt','.tv','.tw','.tz','.ua','.ug','.uk','.um',
'.us','.uy','.uz','.va','.vc','.ve','.vg','.vi','.vn','.vu','.ws',
'.wf','.ye','.yt','.yu','.za','.zm','.zw');

var nname=document.getElementById("txturl").value;

var mai = nname;
var val = true;

var dot = mai.lastIndexOf(".");
var dname = mai.substring(0,dot);
var ext = mai.substring(dot,mai.length);
//alert(ext);
	
if(dot>2 && dot<57)
{
	for(var i=0; i<arr.length; i++)
	{
	  if(ext == arr[i])
	  {
	 	val = true;
		break;
	  }	
	  else
	  {
	 	val = false;
	  }
	}
	if(val == false)
	{
	  	 alert("Your domain extension "+ext+" is not correct");
		 return false;
	}
	else
	{
		for(var j=0; j<dname.length; j++)
		{
		  var dh = dname.charAt(j);
		  var hh = dh.charCodeAt(0);
		  if((hh > 47 && hh<59) || (hh > 64 && hh<91) || (hh > 96 && hh<123) || hh==45 || hh==46)
		  {
			 if((j==0 || j==dname.length-1) && hh == 45)	
		  	 {
		 	  	 alert("Domain name should not begin are end with '-'");
			      return false;
		 	 }
		  }
		else	{
		  	 alert("Your domain name should not have special characters");
			 return false;
		  }
		}
	}
}
else
{
 alert("Your Domain name is too short/long");
 return false;
}	

return true;
}

function validatejobfields()
{
var messg="";


if((document.getElementById("txtjobtitle").value=="")||(document.getElementById("txtposts").value=="")||(document.getElementById("txtskill").value=="")||
(document.getElementById("txtqual").value=="")||(document.getElementById("expmin").value=="")||(document.getElementById("expmax").value=="")||
(document.getElementById("txtfnarea").value=="")||(document.getElementById("txtloc").value=="")||(document.getElementById("txtcperson").value=="")||
(document.getElementById("txtphno").value=="")||(document.getElementById("txtcompmail").value==""))
{

if(document.getElementById("txtjobtitle").value=="")

messg=messg + "Enter JobTitle \n" ;


if(document.getElementById("txtposts").value=="")

messg=messg + "Specify No of Posts \n" ;

if(document.getElementById("txtskill").value=="")
messg=messg + "Enter Key Skills \n";

if(document.getElementById("txtqual").value=="")
messg=messg + "Enter basic Qualification \n";

if(document.getElementById("expmin").value=="")
messg=messg + "Enter Minimum Experience \n" ;

if(document.getElementById("expmax").value=="")
messg=messg + "Enter Maximum Experience \n" ;

if(document.getElementById("txtfnarea").value=="")
messg=messg + "Select the Functional Area \n" ;

if(document.getElementById("txtloc").value=="")
messg=messg + "Specify the Job Location \n";

if(document.getElementById("txtcperson").value=="")
messg=messg + "Enter the condact person \n";

if(document.getElementById("txtphno").value=="")
messg=messg + "Enter the Phone Number \n" ;

if(document.getElementById("txtcompmail").value=="")
messg=messg + "Enter the Email Address \n" ;

alert(messg);
return false;
}
else
{
return true;
}
}