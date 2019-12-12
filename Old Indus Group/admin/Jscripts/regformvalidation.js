
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
            
		    url = "Available.aspx?email=" + email +"&id=" + 1;
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

if((document.getElementById("txtusername").value=="")||(document.getElementById("txtpwd").value=="")||(document.getElementById("conpwd").value=="")||
(document.getElementById("txtname").value=="")||(document.getElementById("txtemail").value=="")||(document.getElementById("country").value=="")||
(document.getElementById("txtcloc").value=="")||(document.getElementById("H_ccode").value=="")||(document.getElementById("H_acode").value=="")||
(document.getElementById("H_phone").value=="")||(document.getElementById("mphone").value=="")||(document.getElementById("expyear").value=="")||
(document.getElementById("expmonths").value=="")||(document.getElementById("txtskill").value=="")||(document.getElementById("rhead").value=="")||
(document.getElementById("fnarea").value=="")||(document.getElementById("indtype").value=="")||(document.getElementById("edu").value=="")||
(document.getElementById("edu_major").value==""))
{

if(document.getElementById("txtusername").value=="")

messg=messg + "Enter UserName \n" ;


if(document.getElementById("txtpwd").value=="")

messg=messg + "Enter Password \n" ;

if(document.getElementById("conpwd").value=="")
messg=messg + "Confirm Password \n";

if(document.getElementById("txtname").value=="")
messg=messg + "Enter Full Name \n";

if(document.getElementById("txtemail").value=="")
messg=messg + "Enter Your Email \n" ;

if(document.getElementById("country").value=="")
messg=messg + "Select Your Country \n" ;

if(document.getElementById("txtcloc").value=="")
messg=messg + "Specify Your Current Location \n";

if(document.getElementById("H_ccode").value=="")
messg=messg + "Enter the CountryCode \n";

if(document.getElementById("H_acode").value=="")
messg=messg + "Enter the AreaCode \n" ;

if(document.getElementById("H_phone").value=="")
messg=messg + "Enter Your PhoneNumber \n" ;

if(document.getElementById("mphone").value=="")
messg=messg + "Enter Your Mobile Number \n";

if(document.getElementById("expyear").value=="")
messg=messg + "Specify Your Experience in Years \n";

if(document.getElementById("expmonths").value=="")
messg=messg + "Specify Your Experience in Months \n" ;

if(document.getElementById("txtskill").value=="")
messg=messg + "Specify Your Skillset \n" ;

if(document.getElementById("rhead").value=="")
messg=messg + "Specify resume head \n";

if(document.getElementById("fnarea").value=="")
messg=messg + "Enter Your Functional Area \n";

if(document.getElementById("indtype").value=="")
messg=messg + "Specify Your Industry Type \n" ;

if(document.getElementById("edu").value=="")
messg=messg + "Enter Your Basic Qualification \n" ;

if(document.getElementById("edu_major").value=="")
messg=messg + "Specify Your Major Subject \n";


alert(messg);
return false;

}

else if(document.frmRegistration.chkaccept.checked==false)
{
alert("You must agree the Terms and Condidtions before you can continue");
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
var cpwd=document.getElementById("conpwd").value;
if((pwd !="")&&(cpwd !=""))
{
if(pwd != cpwd)
{
alert("Passwords doesn't Match");
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

if((email !="")&&(cemail !=""))
{
if(email != cemail)
{
alert("Emails doesn't Match");
document.getElementById("txtconemail").select();
}
}
}
function echeck() {
        
        var str=document.getElementById("txtemail").value;
        if(str!="")
        {
		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   	   document.getElementById("txtemail").focus();
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   document.getElementById("txtemail").focus();
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		    document.getElementById("txtemail").focus();
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    document.getElementById("txtemail").focus();
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		    document.getElementById("txtemail").focus();
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
		    document.getElementById("txtemail").focus();
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    document.getElementById("txtemail").focus();
		    return false
		 }

 		 return true	
 		 }				
	}

function chknum(field)
{
if (isNaN(field.value)) {
            alert("Please enter Valid Phone Number")
           field.select();
        return false }
        }