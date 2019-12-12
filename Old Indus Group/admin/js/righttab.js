function sign()
{
var x=document.astro.stars.options[document.astro.stars.selectedIndex];
if (x.value!="")
{
surl="sign.asp?sign=" + x.value;
window.open(surl, "mywindow","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=280,left=200,top=10")
}
}

document.write('<center><table width=170 border=0 cellpadding=2 cellspacing=1 bgcolor=#FFFF66>');
document.write('<tr bgcolor=#FFFF66><td><b><font face=verdana size=2 color=#000000><img src=images/utilites.gif width=150 height=20></font></b></td></tr>');
document.write('<tr><td><b><font face=verdana size=2 color=#0000CC><a href=emglines.htm><img src=images/emglin.gif width=150 height=20 border=0></a></font></b></td></tr>');
document.write('<tr><td><b><font color=#0000CC face=verdana size=2><a href=shopping.htm><img src=images/shoppin.gif width=150 height=20 border=0></a></font></b></td></tr>');
document.write('<tr><td><b><font color=#0000CC face=verdana size=2><a href=traintiming.htm><img src=images/traintimings.gif width=150 height=20 border=0></a></font></b></td></tr>');
document.write('<tr><td><b><font color=#0000CC face=verdana size=2><a href=stdisd.htm><img src=images/stdisd.gif width=150 height=20 border=0></a></font></b></td></tr>');
document.write('<tr><td height=19><b><font color=#0000CC face=verdana size=2><a href=entmnt.htm><img src=images/entertainment.gif width=150 height=20 border=0></a></font></b></td></tr>');
document.write('<tr><td><b><font face=verdana size=2 color=#0000CC>&nbsp;</font></b></td></tr>');
document.write('</table></center>');

