var DisplayLength = 300;
var MessageText = "Welcome to OMSAI.com Yellow Pages  - Increase your Business Presence"
  var pos = 1 - DisplayLength;
  function ScrollInStatusBar(){
  var scroll = "";
  pos++;
  if (pos == MessageText.length) pos = 1 - DisplayLength;
  if (pos<0)
 {
  	for (var i=1; i<=Math.abs(pos); i++)
  	scroll = scroll + "";
  	    scroll = scroll + MessageText.substring(0, DisplayLength - i + 1);
  }
  else
      scroll = scroll + MessageText.substring(pos, pos + DisplayLength);
  //window.status = scroll;
  setTimeout("ScrollInStatusBar()",0);
  }
  ScrollInStatusBar()


function ViewDet(id)
	{
		
		h = 130; 
		w = 350;
		tw = window.screen.height;
		lw = window.screen.width;
	 	tv = tw - h ;
	 	lv = lw - w ; 
	 	t = tv / 2 ;
	 	l = lv / 2 ;

		prop = "scrollbars = yes , menubar=no, statusbar=no, width=566, height=600, Top=10, Left=10" ;

		url = "listing.asp?yid="+id;

		msgWindow = window.open(url,'Demo',prop);
	}



function passwordHelp()
	{
		
		h = 130; 
		w = 400;
		tw = window.screen.height;
		lw = window.screen.width;
	 	tv = tw - h ;
	 	lv = lw - w ; 
	 	t = tv / 2 ;
	 	l = lv / 2 ;

		prop = "scrollbars = no , menubar=no, statusbar=no, width=350, height=120, Top = " + t + "Left = " + l ;

		url = "passwordHelp.aspx";
		msgWindow = window.open(url,'Demo',prop);
	}

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

		url = "NameAvailability.aspx";
		msgWindow = window.open(url,'Demo',prop);
	}

function IFEmpty1()
{

	if ((document.quicksrch.srchname.value =="") && (document.quicksrch.srchtype.value=="")) 

	{
		alert ("Please Enter Category/Company Name") ;
		document.quicksrch.srchtype.focus();
		return false;
	}
	
	if ((!document.quicksrch.srchname.value=="") && (!document.quicksrch.srchtype.value=="")) 

	{
		alert (" Please fill in either the \n Category or Business Name. Not both.") ;
		document.quicksrch.srchtype.focus();
		return false;
	}


}


function IFEmpty()
{

	if (document.quicksrch.srchtype.value =="")

	{
		alert ("Please Enter Keyword/Business Name");
		document.quicksrch.srchtype.focus();
		return false;
	}
	

}




function sendrfi(form){
	var max = document.sendlist.chkbox.length;
	var sendmsg="",val="",k=0;
	for (var idx = 1; idx < max; idx++) {
		if (eval("document.sendlist.chkbox["+ idx +"].checked") == true) {
			sendmsg=document.sendlist.chkbox[idx].value;
			val=val+sendmsg+";";
			k=1;
		}
		
	}
	if(k!=1)
	{
	alert('Select atleast one company');
	}else {
		var PgUrl="http://202.138.122.4/fastlook/newform.asp?val="+val;
		window.open(PgUrl,'Home_Page', 'width=780,height=580,resizable=yes,scrollbars=yes,status=no');
		}
}

function footer()
{
document.write('<table align="center" class=text width=400 border=0><tr align=center class=footer><td>');
document.write('<a class=footer href=default.asp>Home</a> | ');
document.write('<a class=footer href=getlisting.asp>Get a Listing</a> | ');
document.write('<a class=footer href=aboutus.asp>About Us</a> | ');
document.write('<a class=footer href=contact.asp>Contact Us</a> | ');
document.write('</td>');
document.write('</td></tr></table>');
}


function openNew() {
  window.open('listing.asp','OmSai','scrollbars=yes,width=525,height=525');
}


function rtads()
{
document.write('<table cellpadding=0 width="185" align=center border=0 cellspacing=2>  <tbody><Tr><td><A href=javascript:openNew() ><img src=images/yplist.gif border=0></A></td></tr><tr valign=top>  <td width="43%" height="64"> <div align="center"><a href="member/pothys.htm" target="_new"><img src="images/pothys_logo1.gif" width="180" height="70" border="0" alt="Pothys"></a></div>    </td>  </tr>  <tr valign=top>     <td width="43%">       <div align="center"><a href="member/touchtel.htm" target="_new"><img src="images/touchtel.gif" width="180" height="70" border="0" vspace="2"></a></div>   </td>  </tr>  <tr valign=top>     <td width="43%" height="2">       <div align="center"><a href="member/ch_silks.htm" target="_new"><img src="images/chennaisilks.gif" width="180" height="70" border="0" vspace="2"></a></div>    </td>  </tr>  <tr valign=top>     <td width="43%" height="2">       <div align="center"><a href="req_form.htm"><img src="images/bigtop.gif" vspace="2" alt="Book Train Ticket Online" border="0" width="180" height="70"></a></div>    </td>  </tr>  </tbody> </table>');
}


function isLogin()
{
 with (document.loginForm) 
{
	if (!emailLogin.value) {alert("Please Enter email.."); !emailLogin.focus();  return false } 
	if (!emailLogin.value.match(/^\w+((-\w+)|(\.\w+|-))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		alert("Invalid E-mail! Please re-enter."); !emailLogin.focus();  return false } 

	if (!pass.value) {alert("Enter password..."); !pass.focus();  return false } 

}
return true;
}

function isEmail()
{
 with (document.regForm) 
{
	if (!firstName.value) {alert("Enter your Name..."); !firstName.focus();  return false } 
	if (!phoneNo.value) {alert("Enter your Phone No..."); !phoneNo.focus();  return false } 
	if (!emailLogin.value) {alert("Please Enter email.."); !emailLogin.focus();  return false } 
	if (!emailLogin.value.match(/^\w+((-\w+)|(\.\w+|-))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		alert("Invalid E-mail! Please re-enter."); !emailLogin.focus();  return false } 
	if (!pass.value) {alert("Enter password..."); !pass.focus();  return false } 

	if (DD.value=='0')  {alert("Select Date of Birth: Date..");!DD.focus();  return false } 
	if (MM.value=='0')  {alert("Select Date of Birth: Month..");!MM.focus();  return false } 
	if (YY.value=='0')  {alert("Select Date of Birth: Year..");!YY.focus();  return false } 
}

return true;
}

 
  function showIt()
        {
        if (document.regForm.Mar_sts.selectedIndex == 1)
            {
            document.regForm.wdd.style.visibility = 'hidden';
            document.regForm.wmm.style.visibility = 'hidden';
            document.regForm.wyy.style.visibility = 'hidden';
          
            }
        else
            {
            document.regForm.wdd.style.visibility = 'visible';
            document.regForm.wmm.style.visibility = 'visible';
            document.regForm.wyy.style.visibility = 'visible';
            document.regForm.wdd.focus();
            }
        }

function wordCounter(field, countfield, maxlimit) {
wordcounter=0;
for (x=0;x<field.value.length;x++) {
      if (field.value.charAt(x) == " " && field.value.charAt(x-1) != " ")  {wordcounter++}  
// Counts the spaces while ignoring double spaces, usually one in between each word.
      if (wordcounter > 100) {field.value = field.value.substring(0, x);}
      else {countfield.value = maxlimit - wordcounter;}
      }
   }

	function countWords() {
	document.forms[0].elements["count_display"].value=document.forms[0].elements[this.document.forms[0].id+"desc"].value.length;
	}

function myDescription() {
	document.forms[0].elements["keycount"].value=document.forms[0].elements[this.document.forms[0].id+"keywords"].value.length;
	}


var totalCBs = 0;
var maxChecked = 5;

function keepTrack(c) {
    totalCBs += c.checked ? 1 : -1;
    enableDisable( c.form, totalCBs == maxChecked );
}

function enableDisable(f, b) {
    var e = f.elements;
    for (var i = 0; i < e.length; i++) {
        if (e[i].type == 'checkbox' && !e[i].checked) e[i].disabled = b;
    }
}
function chck()

{
 with (document.frm) 
{

var checkSelected = false;

if (!NAME.value) {alert("Enter Your Company Name.."); !NAME.focus();  return false } 

if (!fname.value) {alert("Please enter your FirstName..."); !fname.focus();  return false } 
if (!lname.value) {alert("Please enter your LastName..."); !lname.focus();  return false } 

if (!DOORNO.value) {alert("Enter Door No... "); !DOORNO.focus();  return false } 
if (!STREET.value) {alert("Enter Address line 1 ... "); !STREET.focus();  return false } 

if (!AREA.value) {alert("Enter City name...."); !AREA.focus();  return false } 
if (STATE.value=='0')  {alert("Select State..."); !STATE.focus();  return false } 	

if (STATE.value=='NotIN' && !Ostate.value)
	{alert("Enter Other State Name..."); !Ostate.focus();  return false } 	


if (!zip.value) {alert("Enter zip code"); !zip.focus();  return false } 
if (!zip.value.match(/^\d/)) {alert("Zip code must be number"); !zip.focus(); return false } 

if (!PhoneNo.value) {alert("Enter Phone No"); !PhoneNo.focus();  return false } 
if (!PhoneNo.value.match(/^\d/)) {alert("Phone No. must start with a number "); !PhoneNo.focus(); return false } 

if (!EMAIL.value.match(/^\w+((-\w+)|(\.\w+|-))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		alert("Invalid E-mail Address! Please re-enter."); !EMAIL.focus();  return false } 


for (i = 0;  i < cb1.length;  i++)
{
if (cb1[i].checked)
checkSelected = true;
}
if (!checkSelected)
{
alert("Please select at least one of the \"Business Categories\" options.");
return (false);
}

}
	return true;
}

  function showIt1()
        {
        if (document.frm.STATE.selectedIndex != 1)
            {
            document.frm.Ostate.style.visibility = 'hidden';
                 
            }
        else
            {
            document.frm.Ostate.style.visibility = 'visible';
            document.frm.Ostate.focus();
            }
        }


function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit) 
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}

function terms()
{
window.open("terms.htm","","width=430,height=300,scrollbars=yes")
}

