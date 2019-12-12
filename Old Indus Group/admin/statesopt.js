	var NoStates = new Array("('Select Location','Select Location')");
	
	var usaStates =  new Array("('Chantilly, VA','Chantilly, VA')","('Herndon, VA','Herndon, VA')");
		  
	var indiaStates =  new Array("('Hyderabad, AP','Hyderabad, AP')");
		
		
    
	//var canadaStates =  new Array("('Select One','Select One')","('Alberta','Alberta')","('British Columbia','British Columbia')","('Labrador','Labrador')","('Manitoba','Manitoba')","('New Brunswick','New Brunswick')","('Newfoundland','Newfoundland')","('Northwest Territories','Northwest Territories')","('Nova Scotia','Nova Scotia')","('Ontario','Ontario')","('Prince Edward Island','Prince Edward Island')","('Quebec','Quebec')","('Saskatchewan','Saskatchewan')","('Yukon','Yukon')");

		function labelfn()
		{
		if (document.regForm.txtloc.value == "<other state>")
			{
				document.regForm.txtloc.value = "";
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
		//alert(document.getElementById('region').value);
			if (document.getElementById('region').value == "US")
			{
				document.getElementById('txtloc').options.length = 0;
				//document.regForm.txtloc.options.length = 0;
				for (i = 0; i<usaStates.length; i++)
				{
					eval("document.getElementById('txtloc').options["+ i +"] = " + "new Option" +usaStates[i]);	
				}
			}
			else if (document.getElementById('region').value == "India")
			{
				document.getElementById('txtloc').options.length = 0;
				for (i = 0; i<indiaStates.length; i++) 
				{
					eval("document.getElementById('txtloc').options["+ i +"] = " + "new Option" +indiaStates[i]);	
				}
			}
			
			else
			{
			    document.regForm.txtloc.options.length = 0;
			   // addOption(document.regForm.txtloc.,'Select One','Select One');
			    var newOpt = new Option("Select Location","");
                var selLength = document.regForm.txtloc.options.length;
                document.regForm.txtloc.options[selLength] = newOpt;
				document.regForm.txtloc.selectedIndex="0";
				//document.regForm.txtloc.value = "0";
			}
			//alert(document.getElementById('txtloc').value);
			
			
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

function displaytextfn()
{
document.all.displaytextdiv.style.visibility = "visible";
}
function canceltextfn()
{
document.all.displaytextdiv.style.visibility = "hidden";
}

