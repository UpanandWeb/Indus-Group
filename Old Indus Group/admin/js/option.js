var work,sele,FindIt,done, k,j;
k=0;
j=0;

function citysel(){
    writeit("<html></html>")

	var nowfind,tc,tfind,s;

	if(document.quicksrch.citylist.options[document.quicksrch.citylist.selectedIndex ].value=="2")
      {
		document.quicksrch.arealist.disabled = true;
	}
	

	if(document.quicksrch.citylist.options[document.quicksrch.citylist.selectedIndex ].value=="3")
      {
		document.quicksrch.arealist.disabled = true;
	}



	tc=document.quicksrch.citylist.options[document.quicksrch.citylist.selectedIndex ].value;
	if ( tc=="0")
	{ 
	FindIt=/\d/ ; 
	}
	if ( tc=="1")	{ FindIt=/;01/g ; }
//	if ( tc=="2")	{FindIt=/;02/g ; }
	
	var rps=/\//g;
	tfind=document.quicksrch.srchtype.value;
	nowfind=eval("/^"+tfind.replace(rps,'\\/').toUpperCase()+"/");
	if (document.all){
		if(what=="a"){
		var s="<select size='4' name='select' style='background-color:#ffffff; position: absolute; left:"+IEputx+"; top:"+IEputy+"' onclick='sele=this.options[this.selectedIndex ].text;putit();'>";}
		else 
{	
var s="<select size='4' name='select' style='background-color:#ffffff; ' onclick='sele=this.options[this.selectedIndex ].text;putit();'>";}
	}else
	{
		 s="<html><body><form name='a2'><select size='4' name='select' style='bgcolor: #ffffff'>";
	}
	for (i=0; i< allcat.length;i++){
	     var aa= allcat[i][0].match(FindIt);
		if  (allcat[i][0].match(FindIt) != null)
			{
			if(allcat[i][1].match(nowfind) !=null)
			{
			s+="<option >";
			s+=allcat[i][1];
			s+="</option>";
			j++
			k=i;
			}
		}
	}
	nowfind="";
	//	alert(j);
		if (document.all){
			s+=" </select>";
		}else{	s+=" </select></form></body></html>";}

	if(j>0)
	{
	writeit(s);
	document.quicksrch.Submit.value="Find";
	//onit(true);
	}else{
	s="";
	writeit(s);
	document.quicksrch.Submit.value="No Such Classification";
	//onit(false);
	}
	j=0;
	s="";



	
}

function onit(stat)
{
	if (stat)
	{
		document.quicksrch.Submit.disabled = false;
	}
	else 
	{
		document.quicksrch.Submit.disabled = true;
	}
}                         

function putit()
{
quicksrch.srchtype.value=sele;
s="";
writeit(s);
onit(true);
}



function writeit(g)
{
	if (document.all){
	  listc.innerHTML= g
	} else {
	document.layers["listc"].document.write("<html><form></form></html>");
	document.layers["listc"].document.close();
	document.layers["listc"].document.write(g);
	document.layers["listc"].document.close();
	document.listc.top=NSputx;
	document.listc.left=NSputy;
	}
}

function doit()
{
	citysel();
	snh(true)
}

function w1()
{
	window.clearTimeout(work);
	if((document.quicksrch.srchtype.value!='') && (document.quicksrch.citylist.value!='0'))
	{
		work=window.setTimeout('doit()',200);
	}else{
		snh(false);
		onit(false);
	}
	
}

function snh(sh)
{
	if(sh)
	{
		if(document.all)
		{
			listc.style.visibility = 'visible'
		}else{
			document.layers["listc"].visibility ='show'
		}
	}else{
		if(document.all)
		{
			listc.style.visibility = 'hidden'
		}else{
			document.layers["listc"].visibility ='hidden'
		}
	}
}