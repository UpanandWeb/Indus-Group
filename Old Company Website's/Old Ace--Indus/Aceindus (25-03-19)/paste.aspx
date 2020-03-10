<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="paste.aspx.cs" Inherits="_paste" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.5.js"></script>  

<meta http-equiv="Content-Type" content="text/html"; />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="Css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
      
        
    <table border=0 cellpadding=0 cellspacing=0 style="width: 890px; height: 311px">
    <tr>
    <td align="center" valign="top">
<p>Just paste in your resume into the text box below and then click on submit</p>
        <br />
        <asp:TextBox ID="txtformat" runat="server" TextMode="MultiLine" Height="190px" 
            Width="492px" ></asp:TextBox>
         <br />
                <asp:Button ID="submitbutton" runat="server" Text="Submit" 
            onclick="submitbutton_Click" />
        <br />
   <%--  <asp:Label ID="Label2" runat="server" Text="Label"  align="left" ></asp:Label>--%>

        </td>
             
    </tr>
    </table>
    </div>
    <div id="div1" runat ="server">
    
    
    
    </div>
    </form>
    </body>
</html>
