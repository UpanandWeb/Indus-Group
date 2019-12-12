	var NoStates = new Array("('Select your State','')");
	var usaStates =  new Array("('Select your State','')","('Alabama','Alabama')","('Alaska','Alaska')","('Arizona','Arizona')","('Arkansas','Arkansas')","('California','California')","('Colorado','Colorado')","('Connecticut','Connecticut')","('Delaware','Delaware')","('District of Columbia','District of Columbia')","('Florida','Florida')","('Georgia','Georgia')","('Hawaii','Hawaii')","('Idaho','Idaho')","('Illinois','Illinois')","('Indiana','Indiana')","('Iowa','Iowa')","('Kansas','Kansas')","('Kentucky','Kentucky')","('Louisiana','Louisiana')","('Maine','Maine')","('Maryland','Maryland')","('Massachusetts','Massachusetts')","('Michigan','Michigan')","('Minnesota','Minnesota')","('Mississippi','Mississippi')","('Missouri','Missouri')","('Montana','Montana')","('Nebraska','Nebraska')","('Nevada','Nevada')","('New Hampshire','New Hampshire')","('New Jersey','New Jersey')","('New Mexico','New Mexico')","('New York','New York')","('North Carolina','North Carolina')","('North Dakota','North Dakota')","('Ohio','Ohio')","('Oklahoma','Oklahoma')","('Oregon','Oregon')","('Pennsylvania','Pennsylvania')","('Rhode Island','Rhode Island')","('South Carolina','South Carolina')",
		  "('South Dakota','South Dakota')","('Tennessee','Tennessee')","('Texas','Texas')","('Utah','Utah')","('Vermont','Vermont')",
		  "('Virginia','Virginia')","('Washington','Washington')","('West Virginia','West Virginia')","('Wisconsin','Wisconsin')","('Wyoming','Wyoming')");
		  
	var indiaStates =  new Array("('Select your State','')","('Andaman & Nicobar','Andaman & Nicobar')",
		"('Andhra Pradesh','Andhra Pradesh')","('Arunachal Pradesh','Arunachal Pradesh')",
		"('Assam','Assam')","('Bihar','Bihar')","('Daman','Daman')","('Delhi','Delhi')",
		"('Diu','Diu')","('Goa','Goa')","('Gujurat','Gujurat')","('Haryana','Haryana')",
		"('Himachal Pradesh','Himachal Pradesh')","('Jammu','Jammu')","('Karnataka','Karnataka')",
		"('Kashmir','Kashmir')","('Kerala','Kerala')","('Lakshadeep','Lakshadeep')",
		"('Madhya Pradesh','Madhya Pradesh')","('Maharashtra','Maharashtra')","('Manipur','Manipur')",
		"('Meghalaya','Meghalaya')","('Mizoram','Mizoram')","('Nagaland','Nagaland')","('Orissa','Orissa')",
		"('Pondicherry','Pondicherry')","('Punjab','Punjab')","('Rajasthan','Rajasthan')",
		"('Sikkim','Sikkim')","('Tamil Nadu','Tamil Nadu')","('Tripura','Tripura')",
		"('Uttar Pradesh','Uttar Pradesh')","('West Bengal','West Bengal')");
		
    var UkStates = new Array("('Select your State','')","('London','London')","('Sweden','Sweden')","('Germany','Germany')","('Amsterdam','Amsterdam')","('Paris','Paris')","('Italy','Italy')");
    
    var australiaStates =  new Array("('Select your State','')","('New South Wales','New South Wales')","('Northern Territory','Northern Territory')","('Queensland','Queensland')","('South Australia','South Australia')","('Tasmania','Tasmania')","('Victoria','Victoria')","('Western Australia','Western Australia')");
    
    var UAEStates = new Array("('Select your State','')","('Jeddah','Jeddah')","('Qatar','Qatar')","('Dubai','Dubai')","('Sharjah','Sharjah')","('Muscat','Muscat')","('Bahrain','Bahrain')");
    
    var RussiaStates =  new Array("('Select your State','')","('Moscow','Moscow')","('St.Petersburg','St.Petersburg')");

    var NZStates= new Array("('Select your State','')","('New Zealand','New Zealand')");
    var Singaporestates = new Array("('Select your State','')","('Singapore','Singapore')");
    var HongkongStates = new Array("('Select your State','')","('Hong Kong','Hong Kong')");
    var PhillipinesStates = new Array("('Select your State','')","('Manila','Manila')");
    var MalaysiaStates = new Array("('Select your State','')","('Kaulalumpur','Kaulalumpur')");
    var PakistanStates = new Array("('Select your State','')","('Islamabad','Islamabad')","('Lahore','Lahore')","('Karachi','Karachi')");
  	var NepalStates = new Array("('Select your State','')","('Kathmandu','Kathmandu')");
  	var BangladeshStates = new Array("('Select your State','')","('Dhaka','Dhaka')");
  	var AfricaStates = new Array("('Select your State','')","('Ethiopia','Ethiopia')","('Tanzania','Tanzania')","('Zimbabwe','Zimbabwe')","('Namibia','Namibia')","('Kenya','Kenya')","('Libya','Libya')","('Morocco','Morocco')");
  	var SouthAmericaStates =  new Array("('Select your State','')","('Chile','Chile')","('Brazil','Brazil')","('Venezuela','Venezuela')");
	var ChinaStates = new Array ("('Select your State','')","('Anhui','Anhui')","('Beijing','Beijing')","('Chongqing','Chongqing')","('Fujian','Fujian')","('Gansu','Gansu')","('Guangdong','Guangdong')","('Guangxi','Guangxi')","('Guizhou','Guizhou')",
		"('Heilongjiang','Heilongjiang')","('Henan','Henan')","('Hong Kong','Hong Kong')","('Hubei','Hubei')","('Hunan','Hunan')","('Inner','Inner')","('Mongolia','Mongolia')","('Jiangsu','Jiangsu')","('Jiangxi','Jiangxi')","('Macao','Macao')",
		"('Ningxia','Ningxia')","('Qinghai','Qinghai')","('Shaanxi','Shaanxi')","('Shandong','Shandong')","('Shanghai','Shanghai')","('Shanxi','Shanxi')","('Sichuan','Sichuan')","('Tibet','Tibet')","('Xinjiang','Xinjiang')","('Yunnan','Yunnan')","('Zhejiang','Zhejiang')");
	//var canadaStates =  new Array("('Select One','Select One')","('Alberta','Alberta')","('British Columbia','British Columbia')","('Labrador','Labrador')","('Manitoba','Manitoba')","('New Brunswick','New Brunswick')","('Newfoundland','Newfoundland')","('Northwest Territories','Northwest Territories')","('Nova Scotia','Nova Scotia')","('Ontario','Ontario')","('Prince Edward Island','Prince Edward Island')","('Quebec','Quebec')","('Saskatchewan','Saskatchewan')","('Yukon','Yukon')");

		function labelfn()
		{
		if (document.regForm.state.value == "<other state>")
			{
				document.regForm.state.value = "";
			}	

		}
//		function addOption(theSel,theText,theValue)
//        {
//          var newOpt = new Option(theText,theValue);
//          var selLength = theSel.length;
//          theSel.options[selLength] = newOpt;
//        }

		function statepopfn()
		{		
		    if (document.regForm.country.value == "Anywhere")
			{
	
				document.getElementById("state").disabled=true;
				document.getElementById("city").disabled=true;
			}
			
			if (document.regForm.country.value == "1")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<usaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +usaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "2")
			{
				
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<indiaStates.length; i++) 
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +indiaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "3")
			{
				
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<UkStates.length; i++) 
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +UkStates[i]);	
				}
			}
			else if (document.regForm.country.value == "4")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<NepalStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +NepalStates[i]);	
				}
			}
			else if (document.regForm.country.value == "5")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<ChinaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +ChinaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "6")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<australiaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +australiaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "7")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<RussiaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +RussiaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "8")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<NZStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +NZStates[i]);	
				}
			}
			else if (document.regForm.country.value == "9")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<Singaporestates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +Singaporestates[i]);	
				}
			}
			else if (document.regForm.country.value == "10")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<HongkongStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +HongkongStates[i]);	
				}
			}
			else if (document.regForm.country.value == "11")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<PhillipinesStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +PhillipinesStates[i]);	
				}
			}
			else if (document.regForm.country.value == "12")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<MalaysiaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +MalaysiaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "13")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<PakistanStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +PakistanStates[i]);	
				}
			}
			else if (document.regForm.country.value == "14")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<UAEStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +UAEStates[i]);	
				}
			}
			else if (document.regForm.country.value == "15")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<AfricaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +AfricaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "16")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<SouthAmericaStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +SouthAmericaStates[i]);	
				}
			}
			else if (document.regForm.country.value == "17")
			{
				document.getElementById("state").disabled=false;
				document.getElementById("city").disabled=false;
				document.regForm.state.options.length = 0;
				for (i = 0; i<BangladeshStates.length; i++)
				{
					eval("document.regForm.state.options["+ i +"] = " + "new Option" +BangladeshStates[i]);	
				}
			}
			else
			{
			    document.regForm.state.options.length = 0;
			   // addOption(document.regForm.State.,'Select One','Select One');
			    var newOpt = new Option("Select your State","");
                var selLength = document.regForm.state.options.length;
                document.regForm.state.options[selLength] = newOpt;
				document.regForm.state.selectedIndex="0";
				//document.regForm.State.value = "0";
			}
		}





function fnNumbersOnly()
{
	if((window.event.keyCode >= 48) && (window.event.keyCode < 58))
	{
		event.Handle=false;
	}
	else
	{
		event.keyCode=0;
	}
}
function fnOnlyChars()
{
	if(((window.event.keyCode > 96) && (window.event.keyCode <= 122))|| ((window.event.keyCode >64) && (window.event.keyCode <=90)) || (window.event.keyCode == 39))
	{
		event.Handle=false;
	}
	else
	{
		event.keyCode=0;
	}
}
function statechange()
{
    if(document.regForm.state.selectedIndex=="0")
    {
        document.regForm.hidState.value="";
	    alert(document.regForm.hidState.value)
    }
    else
    {
        //alert(document.regForm.State.value)
        document.regForm.hidState.value=document.regForm.state.value;
        alert(document.regForm.hidState.value)
    }
}
function displaytextfn()
{
document.all.displaytextdiv.style.visibility = "visible";
}
function canceltextfn()
{
document.all.displaytextdiv.style.visibility = "hidden";
}


