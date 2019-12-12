function dtmnyr(){
var dateNow = new Date();
var months = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
var dayNow = dateNow.getDate();
var monthNow = months[dateNow.getMonth()];
var yearNow = dateNow.getFullYear();
var lc;
var vSelected = "";

//document.writeln('<form name=frm action="#" OnSubmit="return Validate();">');
//document.writeln('<table cellspacing="0" cellpadding="0" border="0"><tr><td>');
document.writeln('<select name="jnydt" class=mdm>');
for (lc = 1; lc <= 31; lc++)
{
	if (lc == dayNow) 
	{
		var vSelected = "selected";
	} else {
		var vSelected = "";
	}
	document.writeln('<option value='+lc+' '+vSelected+' >'+lc+'</option>');
}
document.writeln('</select>');

document.writeln('&nbsp;<select name="mon" class=mdm>');
for (lc = 0; lc <= 11; lc++)
{
	if (months[lc] == monthNow) 
	{
		var vSelected = "selected";
	} else {
	var vSelected = "";
	}
	document.writeln('<option value='+lc+' '+vSelected+' >'+months[lc]+'</option>');
}

document.writeln('</select>');

document.writeln('&nbsp;<select name="yr" class=mdm>');
for (lc = 2002; lc <= 2003; lc++)
{
	if (lc == yearNow) 
	{
		var vSelected = "selected";
	} else {
		var vSelected = "";
	}
	document.writeln('<option value='+lc+' '+vSelected+' >'+lc+'</option>');
}
document.writeln('</select>');
//document.writeln('<input type=submit name=submit value=check>');
//document.writeln('</td></tr></table></form>');

}
