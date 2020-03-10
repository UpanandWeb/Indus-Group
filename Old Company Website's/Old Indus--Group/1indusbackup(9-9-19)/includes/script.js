TransMenu.spacerGif = "images/submenu-onn.gif";                    
TransMenu.dingbatOn = "images/submenu-on.gif";           
TransMenu.dingbatOff = "images/submenu-off.gif"; 

function init() {
			if (TransMenu.isSupported()) {
				TransMenu.initialize();
				
				// hook all the highlight swapping of the main toolbar to menu activation/deactivation
				// instead of simple rollover to get the effect where the button stays hightlit until
				// the menu is closed.
				menu1.onactivate = function() { document.getElementById("company").className = "hover"; };
				menu1.ondeactivate = function() { document.getElementById("company").className = ""; };
				
				menu2.onactivate = function() { document.getElementById("cellulose").className = "hover"; };
				menu2.ondeactivate = function() { document.getElementById("cellulose").className = ""; };

				menu3.onactivate = function() { document.getElementById("bio").className = "hover"; };
				menu3.ondeactivate = function() { document.getElementById("bio").className = ""; };

				menu4.onactivate = function() { document.getElementById("news").className = "hover"; };
				menu4.ondeactivate = function() { document.getElementById("news").className = ""; };

				menu5.onactivate = function() { document.getElementById("aboutus").className = "hover"; };
				menu5.ondeactivate = function() { document.getElementById("aboutus").className = ""; };					
			}
		}
		
function winopen()
{
	var w,h;
	if(window.screen)
	{
		w = screen.width;
		h = screen.height;
	}
	winProperties = "width=416,height=214,toolbar=no,location=no,menubar=no,scrollbars=no,resizable=no,status=no";
	newWindow = window.open("","hello",winProperties,'status=no');
	newWindow.moveTo((w-536)/2,(h-420)/2);
	newWindow.location.replace("popup.html");
}
function execFile(invUrl) {
// Create new JS element
	var jsel = document.createElement('SCRIPT');
	jsel.type = 'text/javascript';
	jsel.src = invUrl;
	// Append JS element (therefore executing the 'AJAX' call)
	document.body.appendChild (jsel);
	return true;
}
function centerPoint() {
	var objPanel = document.getElementById("boxHandle");
	var w,h;
	if(window.screen)
	{
		w = screen.width;
		h = screen.height;
	}
	//newWindow.moveTo((w-536)/2,(h-420)/2);
	objPanel.style.left = (w-416)/2;
	objPanel.style.top = h/2 - 235;
	var drag = ToolMan.drag()
	var boxHandle = document.getElementById("boxHandle");
	boxHandle.style.display = "block";
	group = drag.createSimpleGroup(boxHandle, document.getElementById("handle"))
}