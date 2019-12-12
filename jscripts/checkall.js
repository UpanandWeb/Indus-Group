    
   function SelectAllCheckboxes(spanChk){

   // Added as ASPX uses SPAN for checkbox
   var oItem = spanChk.children;
   var theBox= (spanChk.type=="checkbox") ? 
        spanChk : spanChk.children.item[0];
   xState=theBox.checked;
   elm=theBox.form.elements;

   for(i=0;i<elm.length;i++)
     if(elm[i].type=="checkbox" && 
              elm[i].id!=theBox.id)
     {
       //elm[i].click();
       if(elm[i].checked!=xState)
         elm[i].click();
       //elm[i].checked=xState;
     }
 }
 


    function SelectAll(involker) {
        // Since ASP.NET checkboxes are really HTML input elements
        //  let's get all the inputs 
        var inputElements = document.getElementsByTagName('input');
        for (var i = 0 ; i < inputElements.length ; i++) {
            var myElement = inputElements[i];
            // Filter through the input types looking for checkboxes
            if (myElement.type === "checkbox") {
               // Use the involker (our calling element) as the reference 
               //  for our checkbox status
                myElement.checked = involker.checked;
            }
        }
    }  