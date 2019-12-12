/*Category and Subcategory details in the form of an array*/
// Categories Array

/*City Name Array list*/
var IndianCitiesArr=new Array("Ahmedabad","Bangalore","Chennai","Delhi","Hyderabad","Kolkata","Mumbai","Pune");
var UsCitiesArr=new Array("Atlanta","Austin","Bay Area","Boston","Chicago","Dallas","Houston","Los Angeles","Maryland","New Jersey","New York","Philadelphia","Seattle","Toronto","Virginia","Washington Dc");
						
												
/*Category and Subcategory details in the form of an array*/


google_ad_client = "pub-3470583419345383";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "text_image";
//2006-11-28: Yellow Pages
google_ad_channel = "6769498093";
google_color_border = "99C9FF";
google_color_bg = "FFFFFF";
google_color_link = "0066CC";
google_color_text = "000000";
google_color_url = "008000";




	function MM_showHideLayers(Id,Mode) 
	{ //v6.0
	//alert("s")
		var i,p,v,obj,args;
		try
		{
			obj=document.getElementById(Id);
			if (obj!=null)
			{
				//alert(obj);
				v=Mode;
				if (obj.style) 
					{ 
						obj=obj.style; 
						v=(v=='show')?'visible':(v=='hide')?'hidden':v; 
					}
					//alert(v);
				obj.visibility=v; 
			}

			obj=document.getElementById("loc");
			if (obj!=null)
			{
				//alert(obj);
				v=Mode;
				if (obj.style) 
					{ 
						obj=obj.style; 
						v=(v=='show')?'hidden':(v=='hide')?'visible':v; 
					}
					//alert(v);
				obj.visibility=v; 
			}

			obj=document.getElementById("area");
			if (obj!=null)
			{
				//alert(obj);
				v=Mode;
				if (obj.style) 
					{ 
						obj=obj.style; 
						v=(v=='show')?'hidden':(v=='hide')?'visible':v; 
					}
					//alert(v);
				obj.visibility=v; 
			}

			obj=document.getElementById("cmbAreaName");
			if (obj!=null)
			{
				//alert(obj);
				v=Mode;
				if (obj.style) 
					{ 
						obj=obj.style; 
						v=(v=='show')?'hidden':(v=='hide')?'visible':v; 
					}
					//alert(v);
				obj.visibility=v; 
			}
		}
		catch(error)
		{
			//alert("");
		}
	}
	
	function customHandler()
	{
		return true;
	}
	
	window.onerror=customHandler



		function SelectCities()
		{
			//alert(event.y)
			//var popupurl= "http://www.sulekha.com/ypbeta/Templates/ChangeLocation.htm";
			var popupurl="http://localhost/ypbeta/Templates/ChangeLocation.htm";
			helpwindow = window.open("http://localhost/ypbeta/Templates/ChangeLocation.htm","cities","toolbar=0,locationbar=0;menubar=0,resizable=0,scrollbars=0,width=150,height=155,left=" + event.x +",top=" + event.y );
			helpwindow.location = popupurl;
			
		}
		
		function ChangeLocation()
		{
			alert("hai");
		}

		function ChangeLocation(SelectedValue)
		{
			//alert(SelectedValue);
			window.location.href="../default.aspx?Loc=" + SelectedValue ;
			//alert(location.href);
			//window.location.reload();
		}

		/*function EmailCheck(Email)
		{		
			var emailReg = "^[\\w-_\.]*[\\w-_\.]\@[\\w]\.+[\\w]+[\\w]$";
			var regex = new RegExp(emailReg);
			return regex.test(Email);
		}*/
		
		function EmailCheck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   //alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   //alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    //alert("Invalid E-mail ID")
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    //alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    //alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    //alert("Invalid E-mail ID")
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

 		 return true					
	}
		
		
//<!-- Begin

// this is for checking email for email to business
function CheckEmailbus(stremail)
{
	var stremail = trim(stremail);
if (stremail.length > 0)
{
	if (!fnEmailCheck(stremail))
	{
		document.getElementById('EmailErr').style.border = "#ff0066 1px solid";
		document.getElementById('EmailErr').style.color = "#ff0066";
  		document.getElementById('EmailErr').innerText = "Please enter a valid email id.";
  		document.getElementById('EmailErr').textContent = "Please enter a valid email id.";
	}
	else
	{
		document.getElementById('EmailErr').style.border = "#ffffff 1px solid";
		document.getElementById('EmailErr').style.color = "#ffffff";
		document.getElementById('EmailErr').innerText = "";
		document.getElementById('EmailErr').textContent = "";
	}
}
else
{
	document.getElementById('EmailErr').style.border = "#ff0066 1px solid";
	document.getElementById('EmailErr').style.color = "#ff0066";
	document.getElementById('EmailErr').innerText = "Please enter a valid email id.";
	document.getElementById('EmailErr').textContent = "Please enter a valid email id.";
 
}
}
function fnEmailCheck (emailStr)
 {
	var checkTLD=1;
	var knownDomsPat=/^(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum)$/;
	var emailPat=/^(.+)@(.+)$/;
	var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";
	var validChars="\[^\\s" + specialChars + "\]";
	var quotedUser="(\"[^\"]*\")";
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
	var atom=validChars + '+';
	var word="(" + atom + "|" + quotedUser + ")";
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) 
	{
		//alert("Email address seems incorrect (check @ and .'s)");
		return false;
	}
	var user=matchArray[1];
	var domain=matchArray[2];

	for (i=0; i<user.length; i++)
	{
		if (user.charCodeAt(i)>127) 
  		{
			//alert("Ths username contains invalid characters.");
			return false;
   		}
	}

	for (i=0; i<domain.length; i++) 
	{
		if (domain.charCodeAt(i)>127) 
			{
			//alert("Ths domain name contains invalid characters.");
			return false;
		}
	}

	if (user.match(userPat)==null) 
	{
		//alert("The username doesn't seem to be valid.");
		return false;
	}


	var IPArray=domain.match(ipDomainPat);
	if (IPArray!=null) 
	{
		for (var i=1;i<=4;i++) 
		{
			if (IPArray[i]>255) 
			{
				//alert("Destination IP address is invalid!");
				return false;
	   		}
		}
		return true;
	}
	 
	var atomPat=new RegExp("^" + atom + "$");
	var domArr=domain.split(".");
	var len=domArr.length;
	for (i=0;i<len;i++) 
	{
		if (domArr[i].search(atomPat)==-1) 
  		{
			//alert("The domain name does not seem to be valid.");
			return false;
		}
	}


	if (checkTLD && domArr[domArr.length-1].length!=2 && domArr[domArr.length-1].search(knownDomsPat)==-1) 
	{
		//alert("The address must end in a well-known domain or two letter " + "country.");
		return false;
	}

	if (len<2) 
	{
		//alert("This address is missing a hostname!");
		return false;
	}

	return true;
}

//  End -->

		/* function MobileCheck(Mobile) 
		{
			if (isNaN(Mobile))
				return false;
			else
			{
				if (Mobile.length>9)
					return true;
				else
					return false;
			}	 
		}*/
		
		
		function MobileCheck(Mobile) 
		{
	
			if (isNaN(Mobile))
				return false;
			else
			{
				if (Mobile.length > 9 && Mobile.length < 12)
				{
					if (Mobile.length == 10 && Mobile.substring(0,1) == "9")
					{
						return true;
					}
					else if (Mobile.length == 11 && Mobile.substring(0,2) == "09")
					{
						return true;
					}
					else
					{
						return false;
					}
				}
				else
					return false;
			}	 
		}
		function MobileCheckemailbus(Mobile) 
		{	
			if (Mobile.length == 0)
				return true;
	
			if (isNaN(Mobile))
				return false;
			else
			{
				if (Mobile.length > 9 && Mobile.length < 12 )
				{
					if (Mobile.length == 10 && Mobile.substring(0,1) == "9")
					{
						return true;
					}
					else if (Mobile.length == 11 && Mobile.substring(0,2) == "09")
					{
						return true;
					}
					else
					{
						return false;
					}
				}
				else
					return false;
			}	 
		}
		function fnValidateSMS()
		{				
			
			if(document.Business.txtMobileNumber.value=="" ||document.Business.txtMobileNumber.value=="Enter mobile no.")	
				{
					alert("Please Enter Mobile Number.The mobile number should start with 9 or 09. If your entry starts with 9 your entry should have 10 digits, if your entry starts with 09 it should have 11 digits.");
					document.Business.txtMobileNumber.focus();
					return false;
				}
			else if (!(MobileCheck(document.Business.txtMobileNumber.value)))
				{
					alert("Mobile number must be valid number.The mobile number should start with 9 or 09. If your entry starts with 9 your entry should have 10 digits, if your entry starts with 09 it should have 11 digits.");
					document.Business.txtMobileNumber.focus();
					return false;
				}				
			
			var query = window.location.search.substring(1);
			
			var qsParm = new Array();									
			qsParm['cid'] = '';									
			qs(qsParm);				
			
			Business.method="post";			
			//Business.action="/smsverification.aspx?cid="+ qsParm['cid'] + "&txtMobileNumber="+document.Business.txtMobileNumber.value+"&loc="+document.Business.hidsmscity.value;			
			Business.action="smsverification.aspx?cid="+ qsParm['cid'] + "&txtMobileNumber="+document.Business.txtMobileNumber.value;			
			document.Business.submit();
			
			return true;
		}		
		
		function ValidateSendESMS()
		{		
			if (document.SendToBusiness.txtName.value =="")
			{
				alert("Name cannot be empty");
				document.SendToBusiness.txtName.focus();
				return false;
			}			
			else if(document.SendToBusiness.txtEmail.value=="")
			{
				alert("Email cannot be empty");
				document.SendToBusiness.txtEmail.focus();
				return false;
			}
			else if (!(EmailCheck(document.SendToBusiness.txtEmail.value)))
			{
				alert("Email must be valid format.");
				document.SendToBusiness.txtEmail.focus();
				return false;
			}		
			else if(document.SendToBusiness.txtMobile.value=="")
			{
				alert("Mobile cannot be empty");
				document.SendToBusiness.txtMobile.focus();
				return false;
			}
			else if (!(MobileCheck(document.SendToBusiness.txtMobile.value)))
			{
				alert("Mobile number must be valid number.");
				document.SendToBusiness.txtMobile.focus();
				return false;
			}
			else if(document.SendToBusiness.txtCmt.value=="")
			{
				alert("Comments cannot be empty");
				document.SendToBusiness.txtCmt.focus();
				return false;
			}									
		}


		function ValidateSearch()
		{			
			if(document.AdvanceSearch.txtKeyword.value=="")	
			{
				alert("Please Enter Keyword");			
				document.AdvanceSearch.txtKeyword.focus();
				return false;
			}
			return true;
		}  

		function ValidateFriendDetails()	
		{			
				if (document.SendToFriend.txtName_Frd.value =="")
				{
					alert("Your Name cannot be empty");
					document.SendToFriend.txtName_Frd.focus();
					return false;
				}
				else if(document.SendToFriend.txtEmail_Frd.value=="")
				{
					alert("Your Email Id cannot be empty");
					document.SendToFriend.txtEmail_Frd.focus();
					return false;
				}
				else if (!(EmailCheck(document.SendToFriend.txtEmail_Frd.value)))
				{
					alert("Email must be valid format.");
					document.SendToFriend.txtEmail_Frd.focus();
					return false;
				}
				else if(document.SendToFriend.txtFriendName_Frd.value=="")
				{
					alert("Your Friend Name cannot be empty");
					document.SendToFriend.txtFriendName_Frd.focus();
					return false;
				}				
				else if(document.SendToFriend.txtFriendEmail_Frd.value=="")
				{
					alert("Your Friend Email cannot be empty");
					document.SendToFriend.txtFriendEmail_Frd.focus();
					return false;
				}
				else if (!(EmailCheck(document.SendToFriend.txtFriendEmail_Frd.value)))
				{
					alert("Email must be valid format.");
					document.SendToFriend.txtFriendEmail_Frd.focus();
					return false;
				}					
	
			return true;
		}

		
		function ValidateFriendDetailsold()
		{					
				if (document.Business.txtName_Frd.value =="")
				{
					alert("Your Name cannot be empty");
					document.Business.txtName_Frd.focus();
					return false;
				}
				else if(document.Business.txtEmail_Frd.value=="")
				{
					alert("Your Email Id cannot be empty");
					document.Business.txtEmail_Frd.focus();
					return false;
				}
				else if (!(EmailCheck(document.Business.txtEmail_Frd.value)))
				{
					alert("Email must be valid format.");
					document.Business.txtEmail_Frd.focus();
					return false;
				}
				else if(document.Business.txtFriendName_Frd.value=="")
				{
					alert("Your Friend Name cannot be empty");
					document.Business.txtFriendName_Frd.focus();
					return false;
				}
				
				else if(document.Business.txtFriendEmail_Frd.value=="")
				{
					alert("Your Friend Email cannot be empty");
					document.Business.txtFriendEmail_Frd.focus();
					return false;
				}
				else if (!(EmailCheck(document.Business.txtFriendEmail_Frd.value)))
				{
					alert("Email must be valid format.");
					document.Business.txtFriendEmail_Frd.focus();
					return false;
				}		
	
			return true;
		}

		function ClearText()
		{	
			document.Business.txtMobileNumber.value="";
		}
		
		function EnterText()
		{
			if (document.Business.txtMobileNumber.value=="")
			{
				document.Business.txtMobileNumber.value="Enter mobile no.";
			}
			else
			{
				if (!(MobileCheck(document.Business.txtMobileNumber.value)))
				{
					alert("Mobile number must be valid number.");
					document.Business.txtMobileNumber.focus();
				}
					
			}
		}
		
	
		function MessageAlert(Mess)
		{
			alert(Mess);
		}


	function AddLocation(City)
	{
		//alert(City);
		var wo = window.opener;	
		//alert(wo);
		wo.ChangeLocation(City);
		window.close();	
	}



		function MM_findObj(n, d) 
		{ //v4.01
			var p,i,x;  
			if(!d) d=document; 
			if((p=n.indexOf("?"))>0&&parent.frames.length) 
			{
				d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
			}
			if(!(x=d[n])&&d.all) x=d.all[n]; 
			for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
			for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
			if(!x && d.getElementById) x=d.getElementById(n); 
			return x;
		}



		/*function test(cmdId)
			{				
				
				var SelectedArea=cmdId.options[cmdId.selectedIndex].value;
				var Url=window.location.toString();			
				
				//alert(SelectedArea.indexOf("All"));				
				//alert(Url);										
				
				if (Url.indexOf("?Area")!=-1)
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("?Area")) //window.location.href=Url;
					else 
						window.location.href=Url.substring(0,Url.indexOf("?Area")) + "?Area=" + SelectedArea;			
						
				}
				else if (Url.indexOf("&Area")!=-1)
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("&Area")) //window.location.href=Url;
					else 
						window.location.href=Url.substring(0,Url.indexOf("&Area")) + "&Area=" + SelectedArea;			
						
				}
				else if (Url.indexOf("&pageno")!=-1)
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("&pageno")) //window.location.href=Url;
					else
						window.location.href=Url.substring(0,Url.indexOf("&pageno")) + "&pageno=1&Area=" + SelectedArea;
						
				}				
				else
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("?Area")) //window.location.href=Url; // + "&Area=" + cmdId.options[cmdId.selectedIndex].value;
					else
					{
						if(Url.indexOf("?")!=-1) 
							window.location.href=Url + "&Area=" + cmdId.options[cmdId.selectedIndex].value;											
						else
							window.location.href=Url + "?Area=" + cmdId.options[cmdId.selectedIndex].value;											
					}
				}
				
				
				
			}*/
			
			
			function test(cmdId)
			{				
				
				var SelectedArea=cmdId.options[cmdId.selectedIndex].value;
				var Url=window.location.toString();			
				var urls = window.location.href.split('/');
				var htm = urls[urls.length-1];
				var fnd = /-[0-9]*.htm/g;
				Url = htm.replace(fnd,'.htm');
				try
				{
					if(Url.charAt(Url.length - 1) == '?')
						Url = Url.substring(0, Url.length - 2);
				}
				catch(err) {}
				
				//alert(SelectedArea.indexOf("All"));				
				//alert(Url);										
				
				if (Url.indexOf("?area")!=-1) // Replace "?Area" to "?" for page navigation link on upload
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("?area")) //window.location.href=Url;
					else 
						window.location.href=Url.substring(0,Url.indexOf("?area")) + "?area=" + SelectedArea;	
				}
				else if (Url.indexOf("&area")!=-1)
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("&area")) //window.location.href=Url;
					else 
						window.location.href=Url.substring(0,Url.indexOf("&area")) + "&area=" + SelectedArea;			
						
				}
				else if (Url.indexOf("&pageno")!=-1)
				{
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("&pageno")) //window.location.href=Url;
					else
						window.location.href=Url.substring(0,Url.indexOf("&pageno")) + "&pageno=1&area=" + SelectedArea;
						
				}				
				else
				{
					/*Url = Url.replace('?alpha=#','');
					if (SelectedArea.indexOf("All")!=-1)
						window.location.href=Url.substring(0,Url.indexOf("?area")) //window.location.href=Url; // + "&Area=" + cmdId.options[cmdId.selectedIndex].value;
					else
					{
						if(Url.indexOf("?")!=-1) 
							window.location.href=Url + "&area=" + cmdId.options[cmdId.selectedIndex].value;											
						else
							window.location.href=Url + "?area=" + cmdId.options[cmdId.selectedIndex].value;											
					}*/

					if (SelectedArea.indexOf("All")!=-1)
					{
						if(Url.indexOf("?area") != -1)
						{
							window.location.href=Url.substring(0,Url.indexOf("?area")) //window.location.href=Url; // + "&Area=" + cmdId.options[cmdId.selectedIndex].value;						
						}
						else
						{
							window.location.href=Url;
						}
						//window.location.href=Url.substring(0,Url.indexOf("?area")) //window.location.href=Url; // + "&Area=" + cmdId.options[cmdId.selectedIndex].value;
					}
					else
					{
						if(Url.indexOf("?")!=-1) 
						{
							window.location.href=Url + "&area=" + cmdId.options[cmdId.selectedIndex].value;	
						}										
						else
						{
							window.location.href=Url + "?area=" + cmdId.options[cmdId.selectedIndex].value;											
						}
					}

				}
				
							
			}
		

		function SetCookies(Mess)
		{
			var objStr=window.location.search;
			var c_name="yplocation";
			var expiration_date = new Date ();
			delete_cookie(c_name,'');
			expiration_date . setYear (expiration_date . getYear () + 1);
			expiration_date = expiration_date . toGMTString ();
			document.cookie=c_name+ "=" + escape(Mess) + "; expires=" + expiration_date;
			//alert(Mess);
			//alert("cookies created successfully");
		}
		function delete_cookie (name, path)
			{
				// Build expiration date string:
				var expiration_date = new Date ();
				expiration_date . setYear (expiration_date . getYear () - 1);
				expiration_date = expiration_date . toGMTString();

				// Build set-cookie string:
				var cookie_string = escape (name) + "=; expires=" + expiration_date;
				if (path != null)
					cookie_string += "; path=" + path;

				// Delete the cookie:
				document . cookie = cookie_string;
				//alert("cookies deleted");
			}
function validateFeedback()
{
	var formName = document.forms["sendfeedback"];
	/*var strName = formName.name.value;
	var strEmail  = formName.email.value;	*/
	var strFeedback = formName.feedback.value;
	
	/*if(strName == "")
	{
		alert("Please enter your name");
		formName.name.value = "";
		formName.name.focus();
		return(false);
	}	
	else if(strEmail== "")
	{
		alert("Please enter your email address");
		formName.email.value = "";
		formName.email.focus();
		return(false);	
	}
	else if(validateEmail(strEmail) == false)
	{
		alert("Enter a proper email address");
		formName.email.focus();
		formName.email.select();		
		return false;
	}*/
	if(strFeedback=="")
	{
		alert("Please enter your Feedback");
		formName.feedback.value = "";
		formName.feedback.focus();
		return(false);	
	}
	else if((document.sendfeedback.feedback.value.indexOf(">") > 0 )||(document.sendfeedback.feedback.value.indexOf("<") > 0 ))
	{
      alert("Html tags are not allowed")
      formName.feedback.focus();
      return false;
    }        
	return true;
}

function validateEmail(src)
{
  var regex = /^[a-zA-Z0-9.\_\-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$/;
  return(regex.test(src));
}

function ValidateReverseLookup()
		{					
			if(document.ReverseLookup.txtsearch.value=="")	
			{
				alert("Please Enter Phone Number");
				document.ReverseLookup.txtsearch.focus();
				return false;
			}
			else if(!IsNumeric(document.ReverseLookup.txtsearch.value))		
			{
				alert("Please Enter Valid Phone Number");
				document.ReverseLookup.txtsearch.value="";
				return false;
			}
						
		}

	function PhoneCheck(phone) 
		{
			if (isNaN(phone))
				return false;
			else
			{
				if (phone.length>7)
					return true;
				else
					return false;
			}	 
		}
		
	function fnloginsubmit()
	{	
		Formlogin.method="post";
		Formlogin.action="/network/signin.aspx?nexturl=" + window.location;			
	}
	
	/*function fnformsubmit()
	{	
		if(trimSpace(document.searchform.txtsearch.value).length == 0)
		{
			alert("Please enter the search text");
			return false;
		}

		searchform.method="get";
		searchform.action="/search.aspx";
		document.searchform.submit();	
	}	*/

	/*function fnformsubmit()
	{	
			if(trimSpace(document.frmSearch.txtsearch.value).length == 0)
			{
				alert("Please enter the search text");
			}
			else if(document.frmSearch.country.selectedIndex == 0)
			{
				alert("Please select the country");
			}				
			else if(document.frmSearch.loc.selectedIndex == 0)
			{
				alert("Please select the city");
			}		
			
		else
		{
			frmSearch.method="get";
			frmSearch.action="/search.aspx";
			document.frmSearch.submit();	
		}
	}*/

function fnformsubmit()
	{	
			if(trimSpace(document.frmSearch.txtsearch.value).length == 0)
			{
				alert("Please enter the search text");
			}
			else if(document.frmSearch.country)
			{
				if(document.frmSearch.country.selectedIndex == 0)
				{
					alert("Please select the country");
				}				
				else if(document.frmSearch.loc.selectedIndex == 0)
				{
					alert("Please select the city");
				}
				else
				{
					frmSearch.method="get";
					frmSearch.action="/search.aspx";
					document.frmSearch.submit();
				}	
			}
			else
			{
				frmSearch.method="get";
				frmSearch.action="/search.aspx";
				document.frmSearch.submit();
			}
	}

	function fnKeyCode()
	{			
		if(event.keyCode==13)		
			document.Business.cmdSend.click();
	}
	
	function loadCategory(tgtControl, selValue)	
	{
		var selIndex = 0;
		tgtControl.options.length = 0;
		tgtControl.options[0] = new Option("Select a Category");		
		for(i=0;i<=category.length - 1;i++)
		{
			
			if(category[i].split("~")[0] == selValue)
			{
				selIndex = i +1 ;
			}
			
			tgtControl.options[i + 1] = new Option(category[i].split("~")[1],category[i].split("~")[0]);
		}
		tgtControl.options[selIndex].selected = true;
		//checkValue(0);
	}
	
	function ParCatIndex(tgtControl, selValue)
	{		
	
		var selIndex = 0;		
		for(i=0;i<=category.length - 1;i++)
		{		
			if(category[i].split("~")[0] == selValue)
			{
				selIndex = i;
			}			
		}
			
		return selIndex +1 ;
	}
	
	function loadSubCategory(tgtControl, indexNo, selValue)	
	{	
		var selIndex = 0;				
		tgtControl.options.length = 0;
		tgtControl.options[0] = new Option("Select a Sub Category");
		if(indexNo > 0)
		{
			for(i=0;i<=subCategory[indexNo].length - 1;i++)
			{
				if(subCategory[indexNo][i][0].split("$")[0] == selValue)
				{
					selIndex = i +1 ;
				}
				
				var strValue = subCategory[indexNo][i];
				tgtControl.options[i + 1] = new Option(subCategory[indexNo][i][0].split("$")[1],subCategory[indexNo][i][0].split("$")[0]);
			}
		}		
		tgtControl.options[selIndex].selected = true;
		
	}
	
	function load3rdCategory(tgtControl,catID,catValue)
	{
	  	var indexNo=0;		  		  				
	  	
		if (catID > 0)
		{					
			switch(catID)			
				{
					case "14":
						indexNo=1; // 14-->Lawyers & Legal Services
						break;
					case "29":
						indexNo=2; // 29	Clinics & Doctors
						break;
					case "43":
						indexNo=3; // 43	Dental
						break;
					case "46":
						indexNo=4; // 46	Hospitals & Medical Centers
						break;
					case "57":
						indexNo=5; // 57	Laboratories
						break;
					case "64":
						indexNo=6; // 64	Home Accessories & Decors
						break;
					case "73":
						indexNo=7; // 73	Essential Services
						break;
					case "77":
						indexNo=8; // 77	Garden  & Lawn
						break;
					case "81":
						indexNo=9; // 81	Home Maintenance & Service
						break;
					case "104":
						indexNo=10; // 104	Colleges & Universities
						break;
					case "110":
						indexNo=11; // 110	Educational Supplies
						break;
					case "115":
						indexNo=12; // 115	Schools
						break;
					case "173":
						indexNo=13; // 173	Games Centers
						break;
					case "201":
						indexNo=14; // 201	Accommodation
						break;
					case "208":
						indexNo=15; // 208	Travel Agents
						break;
					case "260":
						indexNo=16; // 260	Emergency Services
						break;
					case "266":
						indexNo=17; // 266	Funerals & Memorials
						break;
					case "270":
						indexNo=18; // 270	Government Offices
						break;
					case "280":
						indexNo=19; // 280	Utilities
						break;
					case "297":
						indexNo=20; // 297	Beverages
						break;
					case "303":
						indexNo=21; // 303	Restaurant
						break;
					default:
						indexNo=0;
				}			
			if(indexNo > 0)
				{				
					var selIndex="0";
					tgtControl.style.visibility = 'visible';
					document.getElementById("Thirdlvl").style.visibility = 'visible';
					
					tgtControl.options.length = 0;
					tgtControl.options[0] = new Option("Select a 3rd Category");
					
					for(i=0;i<=sub3rdLevel[indexNo].length - 1;i++)
						{							
							if(sub3rdLevel[indexNo][i][0].split("#")[0] == catValue)
								{
									selIndex = i + 1 ;
								}
							
							var strValue = sub3rdLevel[indexNo][i];
							tgtControl.options[i + 1] = new Option(sub3rdLevel[indexNo][i][0].split("#")[1],sub3rdLevel[indexNo][i][0].split("#")[0]);
						}					
					tgtControl.options[selIndex].selected = true;
				
				}
				else
				{
					tgtControl.options.length = 0;
					tgtControl.style.visibility = 'hidden';
					document.getElementById("Thirdlvl").style.visibility = 'hidden';				
				}
		}
	}	
	
	
	function fnFreeBusPhoneValidation()
	{	
	var isNS4 = (navigator.appName=="Netscape")?1:0;
	
	if(!isNS4)
	{
		if(event.keyCode < 45 || event.keyCode > 57) 
			event.returnValue = false;
	}
	else
	{
		if(event.which < 45 || event.which > 57) 
		return false;
	}

	}
	

function fnFreeBusisubmit(phValue)
	{			
		/*if(Trim(phValue)=="")		
		{
			alert("Please Enter Phone Number");
			document.FreeBusiLogin.txtPhNO.value="";									
		}
		else if(!IsNumeric(phValue))		
		{
			alert("Please Enter Valid Phone Number");
			document.FreeBusiLogin.txtPhNO.value="";			
		}
		else
		{*/
			var qsParm = new Array();									
			qsParm['ug'] = '';									
			qs(qsParm);			
			document.getElementById('hidug').value=qsParm['ug'];	
			document.getElementById('hidut').value=qsParm['ut'];				
			FreeBusiLogin.method="get";		
			FreeBusiLogin.action="/FreeBusiExist.aspx";
			document.FreeBusiLogin.submit();	
		//}
	}	
	
function IsNumeric(sText)
{
   var ValidChars = "0123456789.-() ";
   var IsNumber=true;
   var Char;   
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i);       
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   return IsNumber;   
 }



var qsParm = new Array();


function qs(qsParm) 
{				
	var query = window.location.search.substring(1);
	var parms = query.split('&');				
	for (var i=0; i< parms.length; i++)
	{
		var pos = parms[i].indexOf('=');
		if (pos > 0) 
		{
			var key = parms[i].substring(0,pos);
			var val = parms[i].substring(pos+1);
			qsParm[key] = val;
		}
	}
}


// Laxmi code  begin

function fnsearchshow(strRate)
{			
	divCtrl=document.getElementById('searchComment');				
	divCtrl.style.display="";			
	document.getElementById('hidSearchRate').value=strRate	;		
	qsParm['txtsearch'] = '';						
	qs(qsParm);
	document.getElementById('hidSearchkeyword').value=unescape(qsParm['txtsearch']);
	//---To Assign the location
	var queryString =window.location.search.substring(1);
	var params = parseQuery( queryString );
	document.getElementById('hidLocation').value=params['loc'];	
	//document.searchrate.hidLocation.value=params['loc'];
   //---- End-----
	
}



//-------To ParseQuery Begins------------
function parseQuery ( query )
 {
   var Params = new Object ();
   if ( ! query ) return Params; // return empty object
   var Pairs = query.split(/[;&]/);
   for ( var i = 0; i < Pairs.length; i++ )
    {
      var KeyVal = Pairs[i].split('=');
      if ( ! KeyVal || KeyVal.length != 2 ) continue;
      var key = unescape( KeyVal[0] );
      var val = unescape( KeyVal[1] );
      val = val.replace(/\+/g, ' ');
      Params[key] = val;
    }
   return Params;
}

//-------To ParseQuery Ends------------
//<!-- Begin Text Ccounter
	function textCounter(field,cntfield,maxlimit)
	{
			txtshow( field.value.length +"/"+maxlimit );
		if (field.value.length > maxlimit) // if too long...trim it!
			{
			field.value = field.value.substring(0, maxlimit);
			txtshow( field.value.length +"/"+maxlimit );
			}
		else // otherwise, update 'characters left' counter
			{
			cntfield.value = maxlimit - field.value.length;
			}
	}

	maxKeys = 50;
	var IE = (document.all) ? 1 : 0;
	var DOM = 0; 
	if (parseInt(navigator.appVersion) >=5) {DOM=1};

	function txtshow( txt2show )
	 {
		// Detect Browser
		if (DOM)
		 {
			var viewer = document.getElementById("charLength");
			viewer.innerHTML=txt2show;
		 }
		else if(IE)
		 {
			document.all["charLength"].innerHTML=txt2show;
		 }
	 }
//  Text counter End -->


//venkat babu code end


function Trim(TRIM_VALUE){
if(TRIM_VALUE.length < 1){
return"";
}
TRIM_VALUE = RTrim(TRIM_VALUE);
TRIM_VALUE = LTrim(TRIM_VALUE);
if(TRIM_VALUE==""){
return "";
}
else{
return TRIM_VALUE;
}
} //End Function

function RTrim(VALUE){
var w_space = String.fromCharCode(32);
var v_length = VALUE.length;
var strTemp = "";
if(v_length < 0){
return"";
}
var iTemp = v_length -1;

while(iTemp > -1){
if(VALUE.charAt(iTemp) == w_space){
}
else{
strTemp = VALUE.substring(0,iTemp +1);
break;
}
iTemp = iTemp-1;

} //End While
return strTemp;

} //End Function

function LTrim(VALUE){
var w_space = String.fromCharCode(32);
if(v_length < 1){
return"";
}
var v_length = VALUE.length;
var strTemp = "";

var iTemp = 0;

while(iTemp < v_length){
if(VALUE.charAt(iTemp) == w_space){
}
else{
strTemp = VALUE.substring(iTemp,v_length);
break;
}
iTemp = iTemp + 1;
} //End While
return strTemp;
} //End Function


function fnsearchRate()
	{			
		
		var blnSubmit=false;
		
		if(document.searchrate.txtEmail.value=="")
			{
				alert("Email cannot be empty");
				document.searchrate.txtEmail.focus();
				blnSubmit = true;
			}
		else if (!(EmailCheck(document.searchrate.txtEmail.value)))
			{
				alert("Email must be valid format.");
				document.searchrate.txtEmail.focus();
				blnSubmit = true;
			}
		/*else if(document.searchrate.txtMobile.value=="" ||document.searchrate.txtMobile.value=="Enter mobile no.")	
			{
				alert("Please Enter Mobile Number");
				document.searchrate.txtMobile.focus();
				blnSubmit = true;
			}
		else if (!(MobileCheck(document.searchrate.txtMobile.value)))
			{
				alert("Mobile number must be valid number.");
				document.searchrate.txtMobile.focus();
				blnSubmit = true;
			}*/	
			
		
		
		if 	(blnSubmit == false)
		{		
			document.searchrate.method="post";
			document.searchrate.action="/thankyousearchrate.aspx" ;		
			document.searchrate.submit();	
		}
	}	
		
		
//---Set as Your Home Page Begins-----

var detect = navigator.userAgent.toLowerCase();
var OS,browser,version,total,thestring;

function CheckBrowser()
{
	 if (checkIt('msie'))
	 { 
		 var temp;
		 temp = "anchor";
		 tempBrowser = document.getElementById(temp);
		 tempBrowser.style.behavior='url(#default#homepage)';
		 tempBrowser.setHomePage('http://yellowpages.sulekha.com');		 
 	}
	else
	{
		 var temp;
		 temp = "anchor";
		 tempBrowser = document.getElementById(temp);
		 return overlay(tempBrowser, 'subcontent2')
	}
	return false;
}
	
function checkIt(string)
{
	place = detect.indexOf(string) + 1;
	thestring = string;
	return place;
}

function getposOffset(overlay, offsettype)
{
	var totaloffset=(offsettype=="left")? overlay.offsetLeft : overlay.offsetTop;
	var parentEl=overlay.offsetParent;
	while (parentEl!=null)
	{
		totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
		parentEl=parentEl.offsetParent;
	}
	return totaloffset;
}

function overlay(curobj, subobj)
{
	if (document.getElementById)
	{
		var subobj=document.getElementById(subobj)
		subobj.style.left=getposOffset(curobj, "left")+"px"
		subobj.style.top=getposOffset(curobj, "top")+"px"
		subobj.style.display="block"
		return false
	}
	else
		return true
}

function overlayclose(subobj)
{
	document.getElementById(subobj).style.display="none"
}

	
//---Set as Your Home Page Ends-----
	
/*function CaptchaWordCheck(strcaptcha)
{

		document.smsverification.method="post";
		document.smsverification.action="/smsverification.aspx" ;		
		document.smsverification.submit();	
}*/


function fnSmsVerification()
{
	document.smsverification.method="post";
	document.smsverification.action="/smsverification.aspx" ;		
	document.smsverification.submit();	
}

var intkeycount=0;
function fnKeyCount(intmaxlength)
{
	intkeycount=intkeycount+1;
	if (intkeycount <= intmaxlength)
		document.getElementById("keycount").innerText=intkeycount+ "/120";	
}

function textLimit(txtfeedback, intmaxlen) 
{
	if (txtfeedback.value.length > intmaxlen + 1)
	{
		intkeycount=intmaxlength;
		alert('your input has been truncated!');
	}
	if (txtfeedback.value.length > intmaxlen)
	{
		intkeycount=intmaxlength;
		txtfeedback.value = txtfeedback.value.substring(0, intmaxlen);
	}
}

function chrCount(str, e)
{
var x=str.length;
if (x > 0 && x <= 50)
{
document.getElementById('chrleft').innerText = "Characters left = " + (50 - str.length);
document.getElementById('chrleft').textContent = "Characters left = " + (50 - str.length);
}
else if (x > 50)
{
   e.returnValue = false;
   e.cancel = true;
}
}
function chrCountemailbus(str, e)
{
var x=str.length;
if (x > 0 && x <= 255)
{
document.getElementById('chrleft').innerText = "Characters left = " + (255 - str.length);
document.getElementById('chrleft').textContent = "Characters left = " + (255 - str.length);
}
else if (x > 255)
{
   e.returnValue = false;
   e.cancel = true;
}
}
function fnreset()
{
	document.errorreport.butSubmit.disabled=true;
}


function fnCheckTerms()
{
	if(document.errorreport.chkterms.checked)
	{
		document.errorreport.butSubmit.disabled=false;
	}
	else
	{
		document.errorreport.butSubmit.disabled=true;
	}
}

function fnErrorReport()
{
		var blnSubmit=false;					
		var blnChecked=false;
		var strEmail="";

		
		if((!document.errorreport.chkbus.checked)&& (!document.errorreport.chkadd.checked) && (!document.errorreport.chkph.checked) && (!document.errorreport.chkcat.checked) && (!document.errorreport.chkother.checked) )
			{
				alert("Please select any one of the error");				
				blnSubmit = true;
			}			

		if(document.errorreport.chkother.checked && document.errorreport.txtcomments.value=="")
			{
				alert("Please enter the comments");				
				blnSubmit = true;
				ocument.errorreport.txtcomments.focus();	
			}
			
		strEmail = document.errorreport.txtEmail.value;
		if (strEmail!="")
		{
			if (!fnEmailCheck(strEmail))
			{
				alert("Please enter valid Email Id");
				blnSubmit = true;
				document.errorreport.txtEmail.focus();
				return false;
			}
		}

		/*else if(document.errorreport.txtName.value=="")
			{
				alert("Please Enter Name");
				document.errorreport.txtName.focus();
				blnSubmit = true;
			}		
		else if(document.errorreport.txtMobile.value=="" ||document.errorreport.txtMobile.value=="Enter mobile no.")	
			{
				alert("Please Enter Mobile Number");
				document.errorreport.txtMobile.focus();
				blnSubmit = true;
			}
		else if (!(MobileCheck(document.errorreport.txtMobile.value)))
			{
				alert("Mobile number must be valid number.");
				document.errorreport.txtMobile.focus();
				blnSubmit = true;
			}		
		*/
		if 	(blnSubmit == false)
		 {	
			if(strEmail=="")
			{
				var where_to= confirm("Your email id is incomplete. We cannot process the Rs.100 Gift Voucher without your email id. Click <OK> to submit or <Cancel> to edit your information");
				if (where_to== false)
				{
					document.errorreport.txtEmail.focus();
					return false;
				   
				}
			 }
			var qsParm = new Array();									
			qsParm['cid'] = '';						
			qs(qsParm);										
			document.errorreport.method="post";
			document.errorreport.action="thankyouerrorreport.aspx?cid="+qsParm['cid']+ "&na=" +document.errorreport.txtName.value ;		
			document.errorreport.submit();
		 }
}


function fnbusinessRate(strrate)
{		
	var qsParm = new Array();									
	qsParm['cid'] = '';						
	qsParm['loc'] = '';		
	qs(qsParm);	
	document.getElementById('hidbusirate').value=strrate;	
	document.getElementById('hidcity').value=qsParm['loc'];	
	document.getElementById('hidcid').value=qsParm['cid'];			
}

function fnbusinessRateSubmit()
{	
	var qsParm = new Array();
	var url="";	
	var urlpath="";
	var urlp="";								
	qsParm['cid'] = '';						
	qsParm['loc'] = '';		
	qs(qsParm);	
	urlpath=window.location.href.split("/");
	for (i=3;i<urlpath.length-1;i++)
	{
		urlp=urlp+"/"+urlpath[i];
	}
	url=urlp.substring(urlp.indexOf("/")+1,urlp.length);
	document.Businessrate.method="post";
	document.Businessrate.action="thankyoubusinessrate.aspx?cid="+qsParm['cid']+"&url="+url;
	document.Businessrate.submit();
}

function SMSVerificationChangeImage()
	{
		document.smsverification.smsimg.src="/CaptchaWord.aspx";	
	}


	
function CheckCaptcha(strcaptcha)
{
document.smsverification.method="post";
var Url=window.location.toString();
var x = window.location.search;
//var mobileno=Url.substring(Url.indexOf("txtMobileNumber"),Url.length);
//alert(mobileno);
if (x.indexOf("&cap")!=-1)
{
x =x.substring(0,x.indexOf("&cap"));
}
if (x.indexOf("&Error")!=-1)
{
x =x.substring(0,x.indexOf("&Error"));
}
//document.smsverification.action="/smsverification.aspx" + x + "&cap="+strcaptcha;
document.smsverification.action="smsverification.aspx" + x + "&cap="+strcaptcha+"&country=in";
//alert(document.smsverification.action);
document.smsverification.captchastring.value="";		
document.smsverification.submit();	
}
function ClickedEnter(keycd, strcap)
{
	if (keycd == 13)
	{
		CheckCaptcha(strcap);
	}
}
function fnshowphhelp(strStatus)
{
	divCtrl=document.getElementById('phhelp');				
	divCtrl.style.display=strStatus;	
}

function fnFreeBusEmail()
{
	if(document.freebusilist.txtEmail.value=="")
		{
			alert("Email cannot be empty");						
			document.freebusilist.txtEmail.focus();
			return false;
		}
	else if (!(EmailCheck(document.freebusilist.txtEmail.value)))
		{
			alert("Email must be valid format.");
			document.freebusilist.txtEmail.focus();
			return false;
		}
}


function fnFreeMobile()
{
	if(document.freebusilist.txtEmail.value!="" && EmailCheck(document.freebusilist.txtEmail.value) )
	{
	if(document.freebusilist.txtmobile.value=="")	
		{
			alert("Please Enter Mobile Number");
			document.freebusilist.txtmobile.focus();
			return false;
		}
	else if (!(MobileCheck(document.freebusilist.txtmobile.value)))
		{
			alert("Mobile number must be valid number.");
			document.freebusilist.txtmobile.focus();
			return false;
		}			
	}
}


function fnlistBusiness(frmname)
{
	var stroptIndex='';
	var redirectUrl='';		
	
	if(document.getElementById(frmname).optBusiness[0].checked)
		stroptIndex='0';	
	if(document.getElementById(frmname).optBusiness[1].checked)
		stroptIndex='1';	
	
	if (frmname == "listyourpremiumbus")
	{
		if(document.getElementById(frmname).optBusiness[2].checked)
			stroptIndex='2';			
		//if(document.getElementById(frmname).optBusiness[3].checked)
		//	stroptIndex='3'	;
	}	
	
	if(stroptIndex=='')	
		alert('Please select any one of the above');			
	
	var usertype=document.getElementById("hiduser").value;
	var ut="";	
	
	if (usertype=="admin")
		ut="sa"
	else if(usertype="enduser")
		ut="eu"
	
	switch(stroptIndex)
	{
		case "0":
			redirectUrl="/freebusilist.aspx?ut=" + ut;
			break;
		case "1":
			redirectUrl="/freebusilogin.aspx?ut=" + ut;
			break;
		case "2":
			redirectUrl="/freebusilogin.aspx?ug=1"; 
			break;		
	}
	
	if(redirectUrl!='')
		window.location.href=redirectUrl;
}

function fnthankyousponser()
{
	var qsParm = new Array();									
	qsParm['cid'] = '';							
	qs(qsParm);	
	window.location.href="/frmsponser.aspx?cid="+qsParm['cid'] ;
}

function fnsponsercheck()
{
	var intsponser=0;
	if(document.frmsponser.sponser[0].checked)
		intsponser=2;
	if(document.frmsponser.sponser[1].checked)
		intsponser=1;	
	if (intsponser == 0)	
		alert('Please select any one of the above');
	else
		{
			var qsParm = new Array();									
			qsParm['cid'] = '';							
			qs(qsParm);	
			window.location.href="/frmsponser.aspx?cid="+qsParm['cid']+ '&cmd=on' + "&ug=" + intsponser ;
		}
}


function fnBusinessdays(intstatus)
	{  
		ShowDayStr="";
	 	var intIntial=0;
		var blnstatus=true;
		
		document.getElementById('hidbusdayscount').value=intstatus;

		if (intstatus==5)	
		{	
			intIntial=1;
			document.frmpayment.days[0].checked=false;
			document.frmpayment.days[6].checked=false;
		}
			
		if (intstatus==0)
		{
			blnstatus=false;
			intstatus=6;
		}

		var intloop;
		for(intloop=intIntial; intloop <=intstatus ; intloop++)
		{
			document.frmpayment.days[intloop].checked=blnstatus;
			if (blnstatus == true)
				ShowDays(document.frmpayment.days[intloop].value);
			else
			{
				document.getElementById('DaysDiv').innerText="";
				document.getElementById('hidBusDays').value=""	
			}			
			
		}
	}
	
	var ShowDayStr="";
	function ShowDays(strDays)
	{	
		ShowDayStr="";
		for (i=0; i<7; i++)		
			if(document.frmpayment.days[i].checked)
				{					
					strDays= document.frmpayment.days[i].value;
					if (ShowDayStr.length > 0)
						ShowDayStr = ShowDayStr + ', '+  strDays.substring(0,3);
					else
						ShowDayStr = strDays.substring(0,3);
				}
			
		document.getElementById('DaysDiv').innerText=ShowDayStr;			
		document.getElementById('hidBusDays').value=ShowDayStr;			
		
	}
		
function checkGoldSponser()
{
	var qsParm = new Array();
	qsParm['ug'] = '';
	qs(qsParm);
	if (qsParm['ug']=="2") 
		document.getElementById("divphoto").style.visibility="visible";	
}

function photoupload(photo) 
{
  var qsParm = new Array();									
  qsParm['cid'] = '';							  	
  qs(qsParm);  
  tmpphoto = photo;  
  var popupurl= "/uploadphoto.aspx?cid=" + qsParm['cid'];  
  helpwindow = window.open("/uploadphoto.aspx","cities","toolbar=0,locationbar=0;menubar=0,resizable=0,scrollbars=0,width=450,height=150");
  helpwindow.location = popupurl;
}
	
function OnDBSponsorApproval()
{
document.DBSponsorAppTool.method = "get";
document.DBSponsorAppTool.action="/DBSponsorAppTool.aspx";
document.DBSponsorAppTool.submit();	
}

function CallDBSponsorAppToolPage()
{
document.DBSponsoredDateEntry.method = "get";
document.DBSponsoredDateEntry.action="/DBSponsorAppTool.aspx";
document.DBSponsoredDateEntry.submit();	
}

function fnDatevalidation()
{
	
	if (document.frmpayment.fromdate.value.length==0 || document.frmpayment.fromdate.value==null)
	{
		alert("Please select From Date");
		document.frmpayment.fromdate.setfocus
		return;
	}
}
function ypbuyValidate() 
{
	var selvalue="";
	selvalue = document.getElementById('txtexecname').value;
	if (selvalue == '')
	{
		alert("Please Enter Executive Name");
		return false;
	}	
	
	selvalue ="";
	selvalue = document.getElementById('curr').value;
	if (selvalue == '-')
	{
		alert("You need to select a currency type. \n\nKindly select the appropriate currency and proceed");
		return false;
	}	
	
	selvalue="";
	selvalue = document.getElementById('amount').value;
	if(selvalue=="" || selvalue == 0)
	{
		alert("Please Enter Amount");		
		return false;
	}	
}

function CheckMobile(numMobile)
{
var numMobile = trim(numMobile);

if (numMobile.length > 0)
{
  if (!MobileCheck(numMobile))
  {
	document.getElementById('MobileErr').style.border = "#ff0066 1px solid";
	document.getElementById('MobileErr').style.color = "#ff0066";
  document.getElementById('MobileErr').innerText="Please enter a valid mobile number. The mobile number should start with 9 or 09. If your entry starts with 9 it should have 10 digits, if your entry starts with 09 it should have 11 digits.";
  document.getElementById('MobileErr').textContent="Please enter a valid mobile number. The mobile number should start with 9 or 09. If your entry starts with 9 it should have 10 digits, if your entry starts with 09 it should have 11 digits.";
  }
  else
  {
  document.getElementById('MobileErr').style.border = "#ffffff 1px solid";
  document.getElementById('MobileErr').style.color = "#ffffff";
  document.getElementById('MobileErr').innerText="";
  document.getElementById('MobileErr').textContent="";
  }
 }
 else
 {
  	document.getElementById('MobileErr').style.border = "#ff0066 1px solid";
	document.getElementById('MobileErr').style.color = "#ff0066";
document.getElementById('MobileErr').innerText="Please enter a valid mobile number. The mobile number should start with 9 or 09. If your entry starts with 9 it should have 10 digits, if your entry starts with 09 it should have 11 digits.";
document.getElementById('MobileErr').textContent="Please enter a valid mobile number. The mobile number should start with 9 or 09. If your entry starts with 9 it should have 10 digits, if your entry starts with 09 it should have 11 digits.";

  }
}

// This is for smstobusiness US
function CheckMobileUS(numMobile)
{
	var numMobile = trim(numMobile);
	if (numMobile=="")
	{
		document.getElementById('MobileErr').style.border = "#ff0066 1px solid";
		document.getElementById('MobileErr').style.color = "#ff0066";
		document.getElementById('MobileErr').innerText="Please enter a valid mobile number.";
		document.getElementById('MobileErr').textContent="Please enter a valid mobile number.";
	}
	else
	{
		document.getElementById('MobileErr').style.border = "#ffffff 1px solid";
		document.getElementById('MobileErr').style.color = "#ffffff";
		document.getElementById('MobileErr').innerText="";
		document.getElementById('MobileErr').textContent="";
	}
}

// this is for email to business mobile validation
function CheckMobileemailbus(numMobile)
{
var numMobile = trim(numMobile);

  if (!MobileCheckemailbus(numMobile))
  {
	document.getElementById('MobileErr').style.border = "#ff0066 1px solid";
	document.getElementById('MobileErr').style.color = "#ff0066";
	document.getElementById('Radio2').disabled=true;
  document.getElementById('MobileErr').innerText="Please enter a valid mobile number. The mobile number should start with 9 or 09. If your entry starts with 9 it should have 10 digits, if your entry starts with 09 it should have 11 digits.";
  document.getElementById('MobileErr').textContent="Please enter a valid mobile number. The mobile number should start with 9 or 09. If your entry starts with 9 it should have 10 digits, if your entry starts with 09 it should have 11 digits.";
  }
  else
  {
  document.getElementById('MobileErr').style.border = "#ffffff 1px solid";
  document.getElementById('MobileErr').style.color = "#ffffff";
  document.getElementById('MobileErr').innerText="";
  document.getElementById('MobileErr').textContent="";
  
	if(document.getElementById('Text2').value!="")
	{
		document.getElementById('Radio2').disabled=false;
	}
	else
	{
		document.getElementById('Radio2').disabled=true;
	}
		
  }
}
 
function IsAlpha(sText)
{
   var ValidChars = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   var IsAlphab=true;
   var Char;   
   for (i = 0; i < sText.length && IsAlphab == true; i++) 
      { 
      Char = sText.charAt(i);       
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsAlphab = false;
         }
      }
   return IsAlphab;   
 }

// This is for validating name field in email to business
function CheckNameemailbus(strName)
{
var strName = trim(strName);
if (strName.length > 0)
{
	if (!IsAlphaemailbus(strName))
	{
		document.getElementById('NameErr').style.border = "#ff0066 1px solid";
		document.getElementById('NameErr').style.color = "#ff0066";
  		document.getElementById('NameErr').innerText = "Please enter a valid name."
  		document.getElementById('NameErr').textContent = "Please enter a valid name."
	}
	else
	{
		document.getElementById('NameErr').style.border = "#ffffff 1px solid";
		document.getElementById('NameErr').style.color = "#ffffff";
		document.getElementById('NameErr').innerText = "";
		document.getElementById('NameErr').textContent = "";
	}
}
else
{
	document.getElementById('NameErr').style.border = "#ff0066 1px solid";
	document.getElementById('NameErr').style.color = "#ff0066";
	document.getElementById('NameErr').innerText = "Please enter a valid name."
	document.getElementById('NameErr').textContent = "Please enter a valid name."
 
}
}
function CheckNameemailfrnd(strName,fieldname)
{
var strName = trim(strName);
if (strName.length > 0)
{
	if (!IsAlphaemailbus(strName))
	{
		document.getElementById(fieldname).style.border = "#ff0066 1px solid";
		document.getElementById(fieldname).style.color = "#ff0066";
  		document.getElementById(fieldname).innerText = "Please use only alphabets,\" \"(space) and \".\"(dot)."
  		document.getElementById(fieldname).textContent = "Please use only alphabets,\" \"(space) and \".\"(dot)."
	}
	else
	{
		document.getElementById(fieldname).style.border = "#ffffff 1px solid";
		document.getElementById(fieldname).style.color = "#ffffff";
		document.getElementById(fieldname).innerText = "";
		document.getElementById(fieldname).textContent = "";
	}
}
else
{
	document.getElementById(fieldname).style.border = "#ff0066 1px solid";
	document.getElementById(fieldname).style.color = "#ff0066";
	document.getElementById(fieldname).innerText = "Please use only alphabets,\" \"(space) and \".\"(dot)."
	document.getElementById(fieldname).textContent = "Please use only alphabets,\" \"(space) and \".\"(dot)."
 
}
}
function IsAlphaemailbus(sText)
{
   var ValidChars = "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ. ";
   var IsAlphab=true;
   var Char;   
   for (i = 0; i < sText.length && IsAlphab == true; i++) 
      { 
      Char = sText.charAt(i);       
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsAlphab = false;
         }
      }
   return IsAlphab;   
 }

function trim(str)
{
   return str.replace(/^\s*|\s*$/g,"");
}


function ValSendSMSToBus(txt, num)
{
var txt = trim(txt);
var num = trim(num);
var result=false;
	if (txt.length > 0)
	{
		if (IsAlpha(txt) && MobileCheck(num))
		{
		//return true;
		result=true;
		}
		else
		{
		//return false;
		result=false;
		}
	}
   	if (!result)
	{
		alert("Please Enter all mandatory fields");
		result=false;
	}
	else
	{
		result=true;
	}
return result;
}

// This is for sending sms tobusiness Us
function ValSendSMSToBusUS(txt, num)
{
var txt = trim(txt);
var num = trim(num);
var result=false;
	if (txt.length > 0)
	{
		if (IsAlpha(txt) && num!="")
		{
		//return true;
		result=true;
		}
		else
		{
		//return false;
		result=false;
		}
	}
   	if (!result)
	{
		alert("Please Enter all mandatory fields");
		result=false;
	}
	else
	{
		result=true;
	}
return result;
}

// This is for email to business validation
function ValSendEmailToBus(name, email)
{
var name = trim(name);
var email = trim(email);
var result=false;
	if (name.length > 0)
	{
		if (IsAlpha(name) && EmailCheck(email))
		{
		//return true;
		//alert("cond - tr");
		result=true;
		}
		else
		{
		//return false;
		//alert("cond - faslse");
		result=false;
		}
		
		if((document.getElementById('Radio1').checked) || (document.getElementById('Radio2').checked))
		{
			result=true;
		}
		else
		{
			result=false;
		}
	}
	
   	if (!result)
	{
		alert("Please Enter all mandatory fields");
		result=false;
	}
	return result;
}

// This is for email to friend validation
function ValSendemailTofrnd(name,fname,email)
{
var name = trim(name);
var email = trim(email);
var fname = trim(fname);
var result = false;
//alert("hai");
	if (name.length > 0 && fname.length > 0)
	{
		if (IsAlpha(name) && EmailCheck(email) && IsAlpha(fname))
		{
		//return true;
		//alert("cond - tr");
		result=true;
		}
		else
		{
		//return false;
		//alert("cond - faslse");
		result=false;
		}
		
	}
	if (!result)
	{
		alert("Please Enter all mandatory fields");
		result=false;
	}
	return result;
}

function smsbusreset()
{
document.getElementById('chrleft').innerText="Characters left = 50";
document.getElementById('chrleft').textContent="Characters left = 50";
document.smsbus.reset();
}

// this is for email to business
function emailbusreset()
{
document.getElementById('chrleft').innerText="Characters left = 255";
document.getElementById('chrleft').textContent="Characters left = 255";
document.smsbus.reset();
}

function fnSearchCatEmail()
{
	if(document.freebusilist.txtEmail.value=="")
		{
			alert("Email cannot be empty");						
			document.freebusilist.txtEmail.focus();
			return false;
		}
	else if (!(EmailCheck(document.freebusilist.txtEmail.value)))
		{
			alert("Email must be valid format.");
			document.freebusilist.txtEmail.focus();
			return false;
		}
}

//-----------Function for check setHidvalue start------------------
function setHidValue()
{
//alert("hello");
var queryString =window.location.search.substring(1);
var params = parseQuery( queryString );
//alert("i am here" + params['bn'] );
//alert("i am here" + params['cid'] );
document.getElementById('hidbusinessname').value=params['bn'];	
document.getElementById('hidcid').value=params['cid'];	
//alert("i am here" + document.getElementById('hidbusinessname').value );
//alert("i am here" + document.getElementById('hidcid').value );

}

//------------Function for check setHidvalue End------------------

function setHidCidValue()
{
var queryString =window.location.search.substring(1);
var lochref = window.location.href;
if (lochref.indexOf("/smsto")!=-1)
{
   var str = window.location.href.substring(0,lochref.indexOf("/smsto"));
}

var params = parseQuery( queryString );
document.getElementById('hidcid').value=params['cid'];	
document.getElementById('hidUrl').value=str;
}



//-------function for Check category id on Business page Start -------

function businessCheckCID()
{
	//---To Assign the location
	var queryString =window.location.search.substring(1);
	var params = parseQuery( queryString );
	var categoryId = params['cid'];
	if(isNaN(categoryId) || categoryId.length > 8 )	
	{
		window.location="/errorpage.aspx";
	}
	if(categoryId=="")
	{
			window.location="/errorpage.aspx";
	}
	
}
//-------function for Check category id on Business page End -------	

//------ function for checking the Email checkbox in Emailtobusiness page---
function hidemobile()
{	
	document.getElementById('Radio1').checked=true;
	
	if(document.getElementById('Radio2').checked=true && document.getElementById('Text2').value!="")
	{
		document.getElementById('Radio2').disabled=false;
	}
	else
	{
		document.getElementById('Radio2').disabled=true;
	}
	
	if(document.getElementById('Text2').value!="")
	{
			document.getElementById('Radio2').disabled=false;
	}
	else
	{
		document.getElementById('Radio2').disabled=true;
	}
}

// this is validation for advance-search fields
function valadvsearch()
{
	result=true;
	if (document.getElementById('txtBusiName').value=="" && document.getElementById('txtKeyword').value=="" && document.getElementById('txtStreetName').value=="" && document.getElementById('txtPhNumber').value=="" && document.AdvanceSearch.cmbAreaName.value=="" && document.AdvanceSearch.cmbZipName.value=="")
		result=false;
	
	if (!result)
		alert("Please enter your search keyword")
	return result;
}


function trimSpace(x)
{
	var emptySpace = / /g;
	var trimAfter = x.replace(emptySpace, "");
	return trimAfter;
}


/*function chkKeyPress()
{
	if(event.keyCode==13) 

	{
		if(trimSpace(document.searchform.txtsearch.value).length > 0)

		{
			fnformsubmit();
			return false;
		}
		else
		{
			alert("Please enter the search text");
			return event.returnValue= false;
		}
	}
}*/

/*function chkKeyPress(e)
{
	if(window.event) // IE
	{
	  if(e.keyCode==13) 
	  {
		if(trimSpace(document.searchform.txtsearch.value).length > 0)
		{
			fnformsubmit();
			return false;
		}
		else
		{
			alert("Please enter the search text");
			return event.returnValue= false;
		}
      }
    }
	else if(e.which) 
	{	
	  if(e.which==13)
	  {
	 	if(trimSpace(document.searchform.txtsearch.value).length > 0)
		{
			fnformsubmit();
			return false;
		}
		else
		{
			alert("Please enter the search text");
			document.searchform.txtsearch.value="";
			e.preventDefault();			 
		}
   	}
  }
}
*/
function chkKeyPress(e)
{
	if(window.event) // IE
	{
	  if(e.keyCode==13) 
	  {
		if(trimSpace(document.frmSearch.txtsearch.value).length > 0 && document.frmSearch.loc.selectedIndex != 0)
		{
			fnformsubmit();
			return false;
		}
		else
		{
			if(trimSpace(document.frmSearch.txtsearch.value).length == 0)
			{
				alert("Please enter the search text");
			}
			else if(document.frmSearch.country.selectedIndex == 0)
			{
				alert("Please select the country");
			}				
			else if(document.frmSearch.loc.selectedIndex == 0)
			{
				alert("Please select the city");
			}
			return event.returnValue= false;
		}
      }
    }
	else if(e.which) 
	{	
	  if(e.which==13)
	  {	 	
	 	if(trimSpace(document.frmSearch.txtsearch.value).length > 0 && document.frmSearch.loc.selectedIndex != 0)
		{
			fnformsubmit();
			return false;
		}
		else
		{
			if(trimSpace(document.frmSearch.txtsearch.value).length == 0)
			{
				alert("Please enter the search text");
				document.frmSearch.txtsearch.value="";
			}
			else if(document.frmSearch.country.selectedIndex == 0)
			{
				alert("Please select the country");
			}
			else if(document.frmSearch.loc.selectedIndex == 0)
			{
				alert("Please select the city");
			}
			e.preventDefault();			 
		}
   	}
  }
}

function PreSelectVal()
{
	if(document.getElementById("cntname"))
	{
		if(document.getElementById("cntname").value != "")
		{
			fillCountry(document.getElementById("cntname").value);
			//fillcity(document.frmSearch.cntname.value.toLower());			
		}	
	}
//	alert("country selection over");

	fillcity(document.getElementById("cntname").value,document.getElementById("ctyname").value);

	if(document.getElementById("hidarea") && document.getElementById("hidarea").value != "")
	{
		for(i=0;i<document.frmSearch.area.options.length;i++)
		{
			if(document.frmSearch.area.options[i].value.toLowerCase() == document.getElementById("hidarea").value.toLowerCase())
				document.frmSearch.area.options[i].selected = true;		
		}
	}

}

function fillCountry(val)
{
	var idxCounter = 0;
	for(i=0;i<document.frmSearch.country.options.length;i++)
	{
		if(document.frmSearch.country.options[i].value == val.toLowerCase())
		{
			idxCounter = i;
		}
	}	
	document.frmSearch.country.options[idxCounter].selected = true;
}

function filldropdown()
{
var indcitylst=new Array("Ahmedabad","Bangalore","Chennai","Delhi","Hyderabad","Kolkata","Mumbai","Pune");
var uscitylst=new Array("Atlanta","Austin","Bay Area","Boston","Chicago","Dallas","Houston","Los Angeles","Maryland","New Jersey","New York","Philadelphia","Seattle","Toronto","Virginia","Washington Dc");
var countryname=document.getElementById("cntname").value
var cityname=document.getElementById("ctyname").value
var ddcity=document.getElementById("loc")
if(countryname.toLowerCase()=='in')
{
var ddarea=document.getElementById("area")
for (var i=0; i < indcitylst.length;++i)
{
addOption(ddcity, indcitylst[i], indcitylst[i]);
}
if(cityname !='')
{
for (var i=1; i < indcitylst.length;i++)
{
if(indcitylst[i].toLowerCase()==cityname.toLowerCase())
{
ddcity.options[i+1].selected = true;
fillsubarea();
}
}
}
}
else if(countryname.toLowerCase()=='us')
{
for (var i=0; i < uscitylst.length;++i)
{
addOption(ddcity, uscitylst[i], uscitylst[i]);
}
if(cityname !='')
{
for (var i=1; i < uscitylst.length;i++)
{
if(uscitylst[i].toLowerCase()==cityname.toLowerCase())
{
ddcity.options[i+1].selected = true;
}
}
}
}
}


function addOption(selectbox,text,value )
{
var optn = document.createElement("OPTION");
optn.text = text;
optn.value = value;
selectbox.options.add(optn);
}

function fillcity(val, idx)
{
//alert(val);
//alert(idx);
var idxToSelect = -1;
var allCities	= new Array(0);
if(val.toLowerCase() == "in")
{
	allCities = allCities.concat(IndianCitiesArr);
}

if(val.toLowerCase() == "us")
{
	allCities = allCities.concat(UsCitiesArr);
}

document.frmSearch.loc.options.length = 0;
document.frmSearch.loc.options[0]  = new Option("Select city", " ");
//alert(allCities.length);
for(i=0;i<allCities.length;i++)
{
//	alert(allCities[i].toLowerCase());
//	alert(idx.toLowerCase());
 	document.frmSearch.loc.options[i+1] = new Option(allCities[i], allCities[i]);

//	alert("i value " + i)	;
	if(idx != "0" && allCities[i].toLowerCase() == idx.toLowerCase())
	{
		idxToSelect = i;
	}
}

if(idxToSelect > -1)
{
	document.frmSearch.loc.options[idxToSelect + 1].selected = true;
}

if(idxToSelect == -1)
{
document.frmSearch.area.options.length = 0;
document.frmSearch.area.options[0] = new Option("Select Locality", " ");
}
else
{
	fillsubarea();
}

}



function fillsubarea()
{
var indcitylst=new Array("Ahmedabad","Bangalore","Chennai","Delhi","Hyderabad","Kolkata","Mumbai","Pune");
var areaname=new Array("Adalaj,Agol,Ahmedabad G.P.O.,Airport,Amraiwadi,Aslali,Badarkha,Bahiyal,Bapunagar Industrial Estate,Bareja,Barwala Ghelasa,Bavla,Behrampura,Bhadiad,Bhojva,Bodakdev,Cantonment,Chaloda,Chandkheda,Chandlodia,Changodar,Civil Hospital,Dahegam,Detroj,Dhaboda,Dhandhuka,Dholera,Dholka H.O.,Ellis Bridge,Fedra Fertilizemagar,Gandhi Ashram,Gandhi Nagar,Gandhi Nagar C.R.P.F. Camp,Gandhi Nagar G.M.S.,Gandhi Nagar H.O.,Gandhi Nagar Sector 17,Gandhi Nagar Sector 19,Gandhi Nagar Sector 20,Gandhi Nagar Sector 21,Gandhi Nagar Sector 22,Gandhi Nagar Sector 23,Gandhi Nagar Sector 24,Gandhi Nagar Sector 28,Gandhi Nagar Sector 29,Gandhi Nagar Sector 30,Gandhi Nagar Sector 9,Gandhi Nagar T.P.S.,Gandhi Nagar Vidhansabha,Ghatlodia,Girdhar Nagar,Godhavi,Industrial Estate,Isanpur,Jalila,Janta Nagar,Jetalpur,Jholapur,Jivaraj Park,Juhapura,Kalyanpura,Kathwada,Katosan Road,Kauka,Kharna,Khodiyar Nagar,Koth Gangad,Krishna Nagar,Kuber Nagar,Kuha,Lothal Bhurkhi R.S.,Mandal,Maninagar,Memnagar,Nandej,Nandol,Naranpura Vistar,Naroda,Naroda G.I.D.C.,Naroda Industrial Estate,Naroda Road,Narol,Navjivan,Navrangpura H.O.,New High Court Post Office,Odhav,Odhav Industrial Area,Paldi,Polarpur,Polytechnic,Rajpur,Rakhial R.S.,Rakhial Udyog Vistar,Rampura Bhankoda,Ranip,Revdi Bazar H.O.,Sabarmati,Sabarmati Railway Colony,Sahibag,Sajipur Bogha,Salangpur Hanuman,Sanand,Saraspur,Sardar Nagar,Sarkhej,Sevalaya Bharada,Shah Alam Roza,Space Application Centre,Thakkar Bapa Nagar,Thaltej Road,Ujedia,Valad,Valva,Vasistha Nagar,Vastral,Vatva,Vatva Industrial Estate,Viramgam,Virochan Nagar","Adugodi,Agaram,Anekal,Anepalya,Arabic College,Attibele,Banashankari,Banashankari 2nd Stage,Banashankari 3rd Stage,Banaswadi,Bangalore City,Bangalore G.P.O.,Bangalore North Taluk,Bannerghatta,Bannerghatta Road,Basavanagudi,Basaveswara Nagar,Benson Town,Bidadi Industrial Area,Brigade Road,Byatarayanapura,C.V. Raman Nagar,Carmelaram,Chamarajpet,Chickajala,Chickpet,Chikkabanavara,Dasarahalli,Devanahalli,Dharmaram College,Doddaballapur,Doddabommasandra,Doddagubbi,Doddakallasandra,Domlur,Dooravani Nagar,Frazer Town,G.E.F.,G.K.V.K.,Gandhi Nagar,Gavipuram Extension,H.A.L. II Stage,H.K.P. Road,H.M.T.,Hebbal Agricultural Farm,Hejjala,Hesaraghatta,Hesaraghatta Lake,Hosur Road,Huskur Post,Indira Nagar,Industrial Estate,J.C. Nagar,J.P. Nagar,Jalahalli,Jalahalli East,Jalahalli West,Jaya Nagar,Jaya Nagar East,Jaya Nagar South,Jaya Nagar West,Kadugodi,Kengeri,Koramangala,Koramangala,Kothanur,Krishnarajapuram,Kumbalgodu,Madivala,Magadi Road,Mahadevapura,Mahalakshmipuram Layout,Malleswaram,Malleswaram West,Marathahalli Colony,Maruthi Nagar,Maruthiseva Nagar,Mathikere,Mysore Road,Nagarabhavi,Nagasandra,Nandhini Layout,Nayandahalli,Nelamangala,New Tippasandra,Peenya,Peenya S.I.,R.M.V. Extn. 2nd St.,R.T. Nagar,R.V. Niketan,Rajaji Nagar,Rajarajeswari Nagar,Richmond Town,Sadashiva Nagar,Sarjapur,Sarjapur Road,Science Institute,Seshadripuram,Sivanchetty Garden,Srirampuram,St. Thomas Town,Subramanyapura,Thyagaraja Nagar,Tumkur Road,Ulsoor,Varthur,Vasantha Nagar,Venkatagiri Kote,Vijaya Nagar,Vimanapura,Virgo Nagar,Viswa Vidyalaya,Viswaneedam,Vivek Nagar,White Field,Wilson Garden,Yediyur,Yelahanka,Yelahanka Bazar,Yeswanthpur","Adambakkam,Adyar,Alandur,Alwarpet,Alwarthirunagar,Ambattur,Ambattur Industrial Estate,Aminjikarai,Anakaputhur,Anna Nagar,Anna Nagar East,Anna Nagar West Extension,Anna Salai,Anna Salai,Arumbakkam,Ashok Nagar,Avadi,Avadi I.A.F.,Ayanavaram,Ayyappanagar,Besant Nagar,Broadway,C.R.P. Camp Avadi,Chennai High Court Buildings,Chetpet,Chintadripet,Chitlapakkam,Choolai,Choolaimedu,Chromepet,C-In-C Road,College of Engineering,Egmore,Ekkaduthangal,Ennore,Flowers Road,Fort St. George,Gopalapuram,Gowrivakkam,Greams Road,Guindy,I.C.F. Colony,Indian Institute of Technology,Jaffarkhanpet,Jawahar Nagar,K.K. Nagar,Kaladipet,Kamaraj Nagar,Keelkattalai,Kelambakkam,Kellys,Kilpauk,Kodambakkam,Kodungaiyur,Kolathur,Korattur,Korattur R.S.,Korrukupet,Kottivakkam,Kottur,Kovilambakkam,Koyambedu,M.G.R. Naga,M.K.B. Nagar,Madhavaram,Madhavaram Milk Colony,Madipakkam,Manali New Town,Manapakkam,Mandaveli,Mangadu,Mathur,Meenambakkam,Mogappair,Mylapore,Nammalwarpet,Nandambakkam,Nandanam,Nanganallur,Neelangarai,New Washermenpet,Nungambakkam,Old Pallavaram,Old Washermenpet,Otteri,Padi,Palavakkam,Palavanthangal,Palavayal,Pallavaram,Pallikaranai,Pammal,Park Town,Parrys,Pattabiram,Pattalam,Perambur,Perambur Barracks,Periyar Nagar,Perungudi,Ponniammanmedu,Poonamallee,Porur,Pozhichalur,Pudupet,Purasawalkam,Puzhal,R.A. Puram,Raj Bhavan,Redhills,Royapettah,Royapuram,S.I.D.C.O. Estate,Saidapet,Saligramam,Sathyamurthi Nagar,Selaiyur,Shenoy Nagar,Sholinganallur,Siruseri,Solavaram,Sowcarpet,Srinivasa Nagar,St. Thomas Mount,T. Nagar,Tambaram East,Tambaram H.O.,Tambaram I.A.F.,Tambaram Sanatorium,Tambaram West,Teynampet,Tharamani,Thirumullaivoyal,Thiruvanmiyur,Thiruvotriyur,Tirumuzhi,Tiruninravur,Tiruverkadu,Tondiarpet,Triplicane,Vadapalani,Valasaravakkam,Vandalur,Velacheri,Vepery,Villivakkam,Virugambakkam,Vyasarpadi,West Mambalam","A.T. Mills,Adrash Nagar,Af Rajokri,Alipur,Ambedkar Nagar,Ambrohi,Amrit Kaur Market,Anandvas Shakurpur,Anarkali,Andrewsganj,Arjun Garh,Ashok Vihar H.O.,Asian Games Village,Azad Nagar,B.S.F. Camp Tigri,Badarpur,Badarpur,Badli,Bahadurgarh,Bakrola,Bawana,Bhaiparma Nand Nagar,Bhajan Pura,Bhajanpuri,Bharat Nagar,Bijwasan,Brahampuri,Budh Nagar,C.R.P.F. Camp,C.R.P.F. Jharoda Kalan,Chanakyapuri,Chhawla,Civil Lines,D.D.A. Munirka,D.D.A. Salam,D.H.Q.,Dakshimpuri Phase I,Dakshinpuri Phase III,Delhi Cantt,Delhi G.P.O.,District Courts,Dwarka,East Of Kailash,Faridabad,G.T.B. Nagar,G.T.S. Nagar,Gandhi Nagar,Gansehpuri,Gautam Nagar,Ghaziabad,Ghaziabad H.O.,Gobindpura,Gokulpuri,Greater Kailash I,Greater Kailash I,Greater Kailash I,Greater Kailash I,Greater Kailash II,Greater Kailash II,Greater Noida,Gujranwala Nagar Part II,Gulmohar Park,Gurgaon,Gurgaon Road,Haiderpur,Hamdard Nagar,Hari Nagar B Block,Hari Nagar D Block,Harijan Sewak Sangh,Hauz Khas,Hazrat Nizamuddin,Himmatpuri,I.A.R.I.,I.G. Open University,Inderlok,Indraprastha H.O.,Jagjit Nagar,Jahangirpuri Block A,Jahangirpuri Block D,Jahangirpuri Block H,Jamia Nagar,Janakpuri,Jangpura,Jaroda Majra,Jawaharlal Nehru University,Jawalpuri,Jeewan Park,Jharoda Kalan,Jhilmil,Kalkaji,Kalyan Vas,Kalyanpuri,Kanjhawla,Karol Bagh,Khanpur,Khera Kalan,Khichripur,Krishan Nagar Bazar,Krishna Nagar H.O.,Kutubgarh,Lajpat Nagar,Lajpat Rai Chowk,Lawrence Road,Laxmi Nagar,Lekhu Nagar,Lodhi Road H.O.,Madangir,Madipur,Maidens Hotel,Malak Nagar,Malka Ganj,Malviya Nagar,Mangolpuri,Masjidmoth Extension,Maujpur,Mayapuri,Meerut Road,Mehrauli,Model Town,Model Town A Block,Model Town II,Mukherjee Nagar,Multani Dhanda,Multani Mohalla,Munirka,Najafgarh,Nand Nagri,Nangal Rava,Nangli Poona,Nangloi,Nangloi Phase II,Naraina Industrial Estate,Narela,Nehru Nagar,New Delhi H.O.,New Rajinder Nagar,New Subzi Mandi,Nimri,Nirankari Colony,Noida,Okhla Industrial Estate,Onkar Nagar,P.S.B. Paharganj,Paharganj,Palam Enclave,Palam Village,Paschim Puri,Paschim Vihar,Paschim Vihar Block B,Pasonda,Patel Nagar,Patper Ganj,Pitampura,Pitampura,Possangipur,Power House,Punjabi Bagh,Pushpa Bhavan,Qr. Madipur,R.K. Puram,R.K. Puram West,Radhey Puri,Rajinder Nagar,Rajouri Garden,Ram Nagar,Ramesh Nagar H.O.,Rani Bagh,Rashtrapati Bhawan,Ravinder Rangsala,Rhotak Road,Rohini,Rohtak,S.R.T. Nagar,Sadiq Nagar,Safdarjung Enclave,Sahibabad,Sameypur,Sanoth,Sarai Rohilla,Saraswati Vihar,Sarita Vihar,Sarojini Nagar H.O.,Satyawati Nagar,Seelampur,Shaastri Nagar,Shahdara,Shakarpur,Shakur Basti,Shakur Basti R.S.,Shakurpur Block I,Shalimar Bagh,Sonipat,South Extension Part I,South Extension Part II,Srinagar Colony,Sriniwaspuri,Sultanpuri Block B,Sultanpuri Block C,Sultanpuri Block F,Suraj Nagar,Tilak Nagar,Trilokpuri,Tughlakabad,Tughlakabad,Ujawa,Uttam Nagar,Vasant Kunj,Vasant Vihar,Vijay Nagar,Wazirpur Phase III,Yamuna Vihar,Zafrabad","Adarsh Nagar,Amberpet,Ameerpet,Auto Nagar,Bahadurpura,Bahadurpura,Balanagar Township,Balaram,Banjara Hills,Beerappagadda,Begum Bazar,Begumpet,Bolarum,Bowin Palle,Central Secretariat,Central University Campus,Chanda Nagar,Cherlapalli,Chintal,Dilsukh Nagar,Dundigul,E.C.I.L.,Falaknuma,Gachibowli,Gandhi Nagar,Gandhi Nagar,Gandipet,Gazibunda,Golconda,Hakimpet,Himayat Nagar,Hindustan Aeronautics,Humayun Nagar,Hyderabad G.P.O.,I.D.A. Jeedimetla,Ibrahim Bagh Lines,Industrial Estate Moulali,Jai Jawahar Nagar,Jama-I-Osmania,Jambagh,Jeedimetla,Jubilee H.O.,Jubilee Hills,Kachiguda,Kanchanbagh,Kapra,Karwan Sahu,Katedhan Industrial Estate,Katedhanie,Keshogiri,Khairatabad H.O.,Koti,Kukatpally,Kukatpally,Kulsampura,Kulsumpura,Lal Bahadur Nagar,Lallaguda,LIC Post Office,Lingampally,Madhapur,Malakpet Colony,Malkajgiri,Miyapur,Mushirabad,Nacharam,Nallakunta,Nehru Nagar,P & T Colony,Panjagutta,R.R. District,Rail Nilayam,Raj Bhavan,Rajendra Nagar,Ramakrishna Puram,Ramkote,Ramoji Film City,Sahifa,Saidabad,Sainikpet,Sainikpuri,Sanat Nagar Industrial Estate,Sanjeevareddy Nagar,Santhosh Nagar,Saroor Nagar,Secundarabad,Secunderabad H.O.,Secunderabad P.O.,Secunderabad R.S.,Shah Ali Banda,Shivrampally,Sitaphalmandi,Somajiguda,Somajiguda,Srinagar Colony,Trimulcherry H.O.,Vamasthali Puram,Vanasthalipuram,Vengal Rao Nagar,Vijaya Nagar Colony,Vijayanagar Colony,Vikas Nagar,Warasiguda,Yakutpura,Yousufguda,Zamistanpur","Abadalpur,Abhoy Guha Road, Howrah,Agarpara,Alam Bazar,Alipore H.O.,Andul Mauri, Howrah,Ariadaha,B.D. Sopan,Badartala,Badu,Bagh Bazar,Bagha Jatin ,Bagnan, Howrah,Bakultala, Howrah,Bally, Howrah,Ballygunge,Baltikuri, Howrah,Bangur Avenue,Banipur, Howrah,Bank, Howrah,Bansdroni,Bara Nagar,Barabazar H.O.,Barasat,Barisha,Barrackpore,Bartala,Baruipur,Bata Nagar,Bauria, Howrah,Beadon Street,Bediapara,Begri, Howrah,Behala,Belgachia,Belgharia H.O.,Beliaghata H.O.,Belu Bazar, Howrah,Bhatta Nagar, Howrah,Bhawanipore,Bidhan Nagar,Bidhan Nagar I.B. Market,Bidhan Nagar Sai Complex,Bidhangarh,Birati,Boral,Botanical Gardens, Howrah,Bow Bazar,Brace Bridge,Brahmapur,Budge Budge,Buxarah, Howrah,Chandan Pukur,Chengail, Howrah,Chittaranjan Avenue,Circus Avenue,Cossipore,Dakshin Jagatdal,Dakshineswar,Dankuni, Howrah,Das Nagar, Howrah,Delta Mills, Howrah,Deshbandhu Nagar,Dhakuria,Dhapa,Dharmatala,Domjur, Howrah,Dumdum,East Kolkata Township,Entally,Esplanade,Fort Gloster, Howrah,Fort William,G.I.P. Colony, Howrah,Ganga Nagar,Garden Reach,Garia,Ghola Bazar,Ghoshpara, Howrah,Ghughudanga,Ghusuri, Howrah,Gobinda Khatick Road,Golf Green,Haltu,Haridebpur,Harinavi,Hastings,Hatkhola,Howrah H.O,Howrah Loco Depot,Hridaypur,Indian Statistical Institute,Jadavpur University,Jagacha, Howrah,Jodhpur Park,K.G. Bose Sarani,Kalighat,Kalikapur,Kamarhati,Kankurgachi,Kasba,Khardah,Khidderpore,Kodalia,Kolkata Airport,Kolkata G.P.O.,Kona, Howrah,Krishnapur,Lake Gardens,Lake Town,Lala Lajpat Rai Sarani,Laskarpur,Madhyamgram Bazar,Maheshtala,Mahi Nagar,Makardah, Howrah,Mall Road,Michael Nagar,Middleton Row,Motijheel,Nabapally,Naktala,Nandan Nagar,Narkeldanga,Natagarh,Nawpara,Netajigarh, Howrah,New Alipore,New Barrackpore,New Market,Nilganj Bazar,Nimta,Norpara,Panchasayar,Panchla, Howrah,Panchpota,Panihati,Panshila,Park Street H.O.,Parnasri Pally,Paschim Putiary,Prafullakanan,Princep Street,Purba Putiary,Purbachal,Rabindra Nagar,Radhadasi, Howrah,Rahara,Rajarhat,Rajbari Colony,Rajpur,Regent Estate,Regent Park,Sahapur,Salkia, Howrah,Sambay Pallay, Howrah,Sankrail, Howrah,Santoshpur,Santoshpur Avenue,Santragachi, Howrah,Sarani Rarsibagan,Sarat Bose Road,Sarkarpool,Sarsuna,Sech Bhavan,Shibpur, Howrah,Shyam Bazar,Sinthee,Sodepur,South Eastern Railway,Sreebhumi,Subhasgram,Sukchar,Talpukur,Tangra,Thakurpukur,Tiljala,Tollygunge,Ultadanga Main Road,Uluberia, Howrah,V.I.P. Nagar,Vivekananda Pally","A.K. Marg,Aarey Colony,Air Complex,Airoli,Airport,Ambernath,Ambernath South,Andheri East,Andheri West,Antop Hill,Anushakti Nagar,Azad Nagar,B.A.R.C,Balkum,Ballard Pier,Bandra East,Bandra West,Bangur Nagar,Barve Nagar,Bassein Road,Belapur,Bhandup East,Bhandup West,Bhatwadi,Bhavani Shankar Road,Bhayander,Bhayander East,Borivali  West,Borivali East,Borivali H.O.,Chakala,Chembur,Chinch Bunder,Chirner,Church Gate,Colaba,Council Hall,Cumbala Hill,Dadar C.R.,Dahisar,Delisle Road,Deonar,Dharavi,Fort,Ghansoli,Ghatkopar East,Ghatkopar West,Girgaon,Goregaon East,Goregaon West,Govandi,Grant Road,I.I.T. Powai,I.R.L.A.,J.B. Nagar,J.C.I.E. Kamothe,J.K. Gram,Jacob Circle,Jijamata Udyan,Jogeshwari,Jogeshwari West,Juhu,Kalamboli,Kalbadevi,Kalwa,Kalyan,Kandivali,Kandivali East,Khar,Khardi,Kharghar,Khetwadi,Kokan Bhavan,Kokan Bhavan,Kopar Khairane,Kopri Colony,Krishi Bazar,Kurla,Mahim,Malabar Hill,Malad East,Malad West,Mandapeshwar,Mandvi,Manpada,Mantralaya,Marine Lines,Matunga,Mazgaon,Mira,Mira Road,Motilal Nagar,Mulund Colony,Mulund East,Mulund West,Mumbai Central,Mumbai G.P.O.,Mumbra,N.I.T.I.E,Nariman Point,Naupada,Navi Mumbai,Nehru Nagar,Nerul,New Panvel,P.G.M.S. Office,Pant Nagar,Panvel,Parel,Prabhadevi,R.C.F. Chembur,Rajawadi,Rajbhavan,Rasayani,S.E.E.P.Z.,Sahar,Saki Naka,Sandozbaug,Santa Cruz East,Santa Cruz West,Sewree,Shivaji Nagar,Sion,Tagore Nagar,Taloja,Taloja,Tank Road,Tarapur,Thane,Tilak Nagar,Tulsiwadi,Turbhe,Uran,Uttan,Vajreshwari,Vasahat,Vashi,Versova,Vidyanagari,Vikhroli,Vile Parle East,Vile Parle R.S.,Vile Parle West,Wadala,Wagle,Worli","Akurdi,Ala,Alandi Devashi,Ambegaon,Ambegaon Manchar,Anand Nagar,Armament,Arvi,Aundh Camp,Avsari B.K.,Avsari K.N.,Baramati,Bavda,Belha,Belpukur,Bhavani Nagar,Bhigwan,Bhor,Bhosari Industrial Estate,Bhosarigaon,C.M.E.,Chakan,Chas,Chinchwad East,Chinchwad Gaon,Chiplun Bazaar,Dapodi,Daund,Deccan Gymkhana,Dehu,Dehu Road,Dehu Road Cantonment,Dhamni,Dhankawadi,Dighi Camp,Dimbhe Colony,Dunkirk Line,Ex-Servicemen Colony,Fulgaon,Ganesh Khind,Ghadegaon,Hadapsar,Hadapsar I.F.,Haveli Urulikanchan,I.A.F. Station,I.A.T. Pune,I.N.S. Shivaji Lonavala,Indapur,Jejuri,Junnar,Kadus,Kailvaldham,Kalamb,Kamshet,Kasarwadi,Kasba Peth,Katraj,Kedgaon,Khadaki,Khadakwasala,Khadki,Khandala,Khed Shivapur Bang,Kothrud,Lasur Na,Lohgaon,Lonavala,Loni Dhamni,Loni Kalbhor,Madhukar Nagar Potas,Malegaon,Malthan,Manchar,Manjari Farm,Margaon,Market Yard,Model Colony,Mundhri,Mundhwa,N.D.A.,Nasrapur,National Chemical Laboratory,National Institute of Bank Management,Navasahyadri,Nimabalkar,Otur,Pabal,Palasdeo,Pandare,Panshet,Parinche,Parvati,Pashan,Paud,Pavna Nagar,Phurasangi,Pimpri Chinchwad ,Pimpri Colony,Pimpri Penicillin Factory,Pune City H.O.,Pune H.O.,R.P.T.S. Khandala,Rajawadi,Rajgurunagar,Range Hill,Ranjangaon Ganpati,S.P. College,S.R.P.F.,S.S.C. Board,Saswad,Shelgaon,Shinoji,Shiroli B.K.,Shirur,Shivaji Housing Society,Shivajinagar H.O.,Sonai,Supa,Talegaon Dabhade,Talegaon Dhamdere,Taloja,Theur,V.S.E.S. Arvi,Vada,Vadgaon,Vadgaon Block,Varvand,Veer,Velhe,Vithalwadi Road,Wadgaon Budruk,Wagholi,Walchand Nagar,Wanawadi,Warje,Warje Malwadi,Yawat,Yerwada");
var ddcity1=document.getElementById("loc")
var selcity=ddcity1.options[ddcity1.selectedIndex].value;
var ddarea=document.getElementById("area");
var arealength=ddarea.options.length;
ddarea.options.length=0;

var isIndianCity = false;

for (var i=0; i < indcitylst.length;++i)
{
	if(indcitylst[i].toLowerCase()==selcity.toLowerCase())
	{
		isIndianCity = true;
		addOption(ddarea, "All Localities","");
		var subareaname=areaname[i].split(',');
		for (var j=0; j < subareaname.length;++j)
		{
			addOption(ddarea, subareaname[j], subareaname[j]);
		}
	}
}

if(isIndianCity == false)
{
	document.frmSearch.area.options.length = 0;
	document.frmSearch.area.options[0] = new Option("All Localities", "");
}

}

	function ShowMap(lat,lon,bname)
	{
	if (GBrowserIsCompatible())
	{
	    var center = new GLatLng(lat, lon);
	    var map = new GMap2(document.getElementById("maptest"));    
	    map.addControl(new GSmallMapControl());
	    map.addControl(new GMapTypeControl());
	    map.setCenter(center, 15);
	    var marker = new GMarker(center);
	    map.addOverlay(marker);
	    //map.openInfoWindow(map.getCenter(),
              //     document.createTextNode(bname));

		GEvent.addListener(marker, "mouseover", function() {marker.openInfoWindowHtml(bname);});
	
	} 
	}


	function ugtxtsubmit()
	{	
		if(trimSpace(document.userguide.txtName.value).length == 0)
		{
			alert("Please enter your Name");			
			return false;
		}  
		else if(trimSpace(document.userguide.MobileNo.value).length == 0)
		{
			alert("Please enter the Mobile Number");			
			return false;
		}
		else if(!isAlpha(trimSpace(document.userguide.txtName.value)))
		{
			alert("Please enter Alphabets only");			
			return false;
		}
		else if(!MobileCheck(trimSpace(document.userguide.MobileNo.value)))
		{
			alert("Mobile number must be valid number.The mobile number should start with 9 or 09. If your entry starts with 9 your entry should have 10 digits, if your entry starts with 09 it should have 11 digits.");
			return false;					
		}  
		return true;
	}
function isAlpha(str){
  var re = /[^a-zA-Z]/g
  if (re.test(str)) return false;
  return true;
}