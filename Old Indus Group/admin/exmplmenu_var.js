
	var NoOffFirstLineMenus=13;			// Number of first level items
	var LowBgColor='#11215f';			// Background color when mouse is not over
var LowSubBgColor='white'; // Background color when mouse is not over on subs
var HighBgColor='#0066CC'; // Background color when mouse is over
var HighSubBgColor='#0066CC'; // Background color when mouse is over on subs
var FontLowColor='white'; // Font color when mouse is not over
var FontSubLowColor='#11215f'; // Font color subs when mouse is not over
var FontHighColor='white'; // Font color when mouse is over
var FontSubHighColor='white'; // Font color subs when mouse is over
var BorderColor='white'; // Border color
var BorderSubColor='white'; 		// Border color for subs
	var BorderWidth=1;				// Border width
	var BorderBtwnElmnts=1;			// Border between elements 1 or 0
	var FontFamily="arial"	// Font family menu items
	var FontSize=4;				// Font size menu items
	var FontBold=1;				// Bold menu items 1 or 0
	var FontItalic=0;				// Italic menu items 1 or 0
	var MenuTextCentered='center';			// Item text position 'left', 'center' or 'right'
	var MenuCentered='left';		// Menu horizontal position 'left', 'center' or 'right'
	var MenuVerticalCentered='top';		// Menu vertical position 'top', 'middle','bottom' or static
	var ChildOverlap=0;				// horizontal overlap child/ parent
	var ChildVerticalOverlap=.2;			// vertical overlap child/ parent
	var StartTop=174;			// Menu offset x coordinate
	var StartLeft=0;			// Menu offset y coordinate
	var VerCorrect=0;				// Multiple frames y correction
	var HorCorrect=0;				// Multiple frames x correction
	var LeftPaddng=3;				// Left padding
	var TopPaddng=2;				// Top padding
	var FirstLineHorizontal=1;			// SET TO 1 FOR HORIZONTAL MENU, 0 FOR VERTICAL
	var MenuFramesVertical=1;			// Frames in cols or rows 1 or 0
	var DissapearDelay=1000;			// delay before menu folds in
	var TakeOverBgColor=1;			// Menu frame takes over background color subitem frame
	var FirstLineFrame='navig';			// Frame where first level appears
	var SecLineFrame='space';			// Frame where sub levels appear
	var DocTargetFrame='space';			// Frame where target documents appear
	var TargetLoc='';				// span id for relative positioning
	var HideTop=0;				// Hide first level when loading new document 1 or 0
	var MenuWrap=1;				// enables/ disables menu wrap 1 or 0
	var RightToLeft=0;				// enables/ disables right to left unfold 1 or 0
	var UnfoldsOnClick=0;			// Level 1 unfolds onclick/ onmouseover
	var WebMasterCheck=0;			// menu tree checking on or off 1 or 0
	var ShowArrow=0;				// Uses arrow gifs when 1
	var KeepHilite=1;				// Keep selected path highligthed
	var Arrws=['tri.gif',5,10,'tridown.gif',10,5,'trileft.gif',5,10];	// Arrow source, width and height

function BeforeStart(){return}
function AfterBuild(){return}
function BeforeFirstOpen(){return}
function AfterCloseAll(){return}


// Menu tree
//	MenuX=new Array(Text to show, Link, background image (optional), number of sub elements, height, width);
//	For rollover images set "Text to show" to:  "rollover:Image1.jpg:Image2.jpg"

Menu1=new Array(" Home","index.html","",0,18,50);

Menu2=new Array(" Training","training.html","",0,18,70);
	

Menu3=new Array(" e-Libraray","","",0,18,70);
	

Menu4=new Array(" Courses","","",3,18,70);
	Menu4_1=new Array("Online Professional Courses","","",11,20,180);
		Menu4_1_1=new Array("Airlines and Travel Management","airlineandtravelmanagement.html","",0,20,250);
		Menu4_1_2=new Array("Air Cargo and Courier Management","aircargo.html","",0,20,250);
		Menu4_1_3=new Array("Call Center Management","callcentermanagement.html","",0,20,150);
		Menu4_1_4=new Array("Customer Relationship Management","crm.html","",0,20,250);
		Menu4_1_5=new Array("Fashion Designing","onlineproffcourses.html","",0,20,150);
		Menu4_1_6=new Array("Fashion Merchandising","dipfashmerch.html","",0,20,150);
		Menu4_1_7=new Array("Hotel Management","hotelmangmnt.html","",0,20,150);
		Menu4_1_8=new Array("Help Desk Management","helpdesk.html","",0,20,150);
		Menu4_1_9=new Array("Interior Designing","interiordesiging.html","",0,20,150);
		Menu4_1_10=new Array("Insurance Management","riskmangmntndinsurance.html","",0,20,150);
		Menu4_1_11=new Array("Media and News Management","massmedianewsmedia.html","",0,20,150);
	Menu4_2=new Array("Online Technical Courses","","",0);
	Menu4_3=new Array("Classroom Technical Courses","","",0);
	

Menu5=new Array(" Certificates","","",0,18,90);

Menu6=new Array(" Schedules","WizardsIndia_Schedule.aspx","",0,18,80);

Menu7=new Array(" e-Learning","","",0,18,90);

Menu8=new Array(" Consulting Services","","",0,18,145);

Menu9=new Array(" Support","support.html","",0,18,75);

Menu10=new Array(" FAQs","","",0,18,60);

Menu11=new Array(" Demo","","",0,18,65);

Menu12=new Array(" Enroll","Wizards_Enroll.aspx","",0,18,55);

Menu13=new Array(" About Us","","",0,18,70);


	