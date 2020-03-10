.<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sample.aspx.cs" Inherits="Sample"  EnableViewState="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
	p{font-family: sans-serif;font-size: 20px;}
#main-wrapper{ width:1170px; height:auto; margin:0 auto;}	

#main-wrapper h1{text-align:center; color:#15406A;}	
	
</style>
<script src="jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //Disable cut copy paste
        $('body').bind('cut copy paste', function (e) {
            e.preventDefault();
        });

        //Disable mouse right click
        $("body").on("contextmenu", function (e) {
            return false;
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
     <%--      <asp:Label ID="uip" runat="server"></asp:Label>

        <asp:Button ID="ss" runat="server" Text="test" OnClick="ss_Click" />
        <asp:Button ID="Button1" runat="server" Text="test2" OnClick="Button1_Click" />--%>
           <asp:Label ID="lblName" runat="server"></asp:Label>

           <asp:Button ID="ss" runat="server" Text="test" OnClick="btnSubmit_Click"   />

    </form>
</body>
</html>
